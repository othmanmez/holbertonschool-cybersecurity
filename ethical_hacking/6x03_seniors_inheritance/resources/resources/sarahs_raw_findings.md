# Sarah Chen — Raw Technical Pentest Findings

**Client:** MediPath Diagnostics  
**Engagement reference:** VS-MPD-26-041  
**Technical testing window:** 04–12 June 2026  
**Author:** Sarah Chen, Senior Security Consultant  
**Status:** Raw technical draft — client translation and final calibration pending  
**Scope:** MediPath production-equivalent staging environment and approved integration endpoints  
**Out of scope:** Destructive testing, denial-of-service testing, social engineering, production patient records, and third-party laboratory infrastructure

> Handwritten note transcribed from the paper dossier:  
> _"I didn't have time to finalize. The technical report is complete but the client translation work is undone. Be careful on F-04 and F-07, I had doubts about the scoring. Good luck."_

## Methodology

Testing combined authenticated web and API assessment, authorization-boundary review, integration-path review, configuration inspection supplied by MediPath, and limited validation using synthetic patient and laboratory accounts. All identifiers below refer to synthetic records created for the engagement.

The ratings below are Sarah's **base CVSS v3.1 assessments**. They have not yet been recalibrated against MediPath's environmental context, compensating controls, HDS renewal posture, operational dependencies, or health-data sensitivity.

---

## F-01 — Cross-laboratory access to diagnostic result records

- **Sarah's base score:** 8.1 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:N`
- **Affected component:** Results API, `GET /api/v2/results/{result_id}`
- **Observed role:** Laboratory operator
- **Technical description:** The API checks that the requester is authenticated but does not consistently verify that the requested result belongs to the requester's laboratory tenant. A user from the synthetic Rivière laboratory account retrieved a result created under the synthetic Monts laboratory account by substituting the result identifier.
- **Proof summary:** Two synthetic result records were requested. The in-tenant record returned `200`, and the cross-tenant record also returned `200` with patient identity, test name, collection time, and result status.
- **Current remediation note:** Enforce tenant ownership at the data-access layer and add negative authorization tests.
- **Evidence:** `resources/evidence/F-01_cross_tenant_result.png`
- **Open client-translation questions:** Result records contain regulated health data. The final severity should consider the number of laboratories, the sensitivity of returned fields, existing anomaly detection, and the likelihood of identifier discovery.

---

## F-02 — Stored active content in laboratory-to-support notes

- **Sarah's base score:** 6.1 Medium
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N`
- **Affected component:** Laboratory case notes rendered in the internal support portal
- **Observed role:** Laboratory operator; support analyst as the viewing user
- **Technical description:** The laboratory note field accepts markup that is rendered without complete output encoding in the support portal. The test marker executed when a support analyst opened the synthetic case.
- **Proof summary:** A harmless marker changed the page title and made a same-origin request to the analyst profile endpoint. No credential material was retained.
- **Current remediation note:** Apply contextual output encoding, sanitize legacy rich-text content, and move the Content Security Policy from report-only to enforcement after compatibility testing.
- **Evidence:** `resources/evidence/F-02_stored_content.png`
- **Open client-translation questions:** Support access is limited by MFA and managed workstations, but support analysts can access multiple laboratory tenants. Consider the support portal's privilege level and the role of browser controls.

---

## F-03 — Long-lived integration token has cross-tenant privileges

- **Sarah's base score:** 8.8 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H`
- **Affected component:** Hospital Integration Gateway
- **Observed identity:** Synthetic hospital connector service token
- **Technical description:** A connector token issued for one hospital integration remained valid for 180 days and carried a broad `integration:all` scope. The token was accepted by routes unrelated to its assigned hospital and could request result-export and sample-status functions across synthetic tenants.
- **Proof summary:** The synthetic Saint-Pierre connector token successfully invoked an endpoint assigned to the Val-de-Saône connector profile.
- **Current remediation note:** Replace broad scopes with per-connector audience and tenant claims, shorten token lifetime, and centralize revocation.
- **Evidence:** `resources/evidence/F-03_integration_token_scope.png`
- **Open client-translation questions:** Determine which compensating network controls restrict token use, whether rotation is enforced operationally, and whether authorization state is shared with administrative sessions.

---

## F-04 — Certificate validation disabled in a connector worker

- **Sarah's base score:** 8.2 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:L`
- **Affected component:** Legacy hospital connector worker
- **Technical description:** The worker configuration contains `verify_peer=false` for the upstream hospital endpoint. On isolated reading, this permits the worker to accept an untrusted upstream certificate.
- **Proof summary:** Configuration review confirmed the flag. Direct interception was not attempted because the Rules of Engagement prohibited interference with the managed connectivity layer.
- **Current remediation note:** Enable peer validation in the worker and confirm certificate-chain compatibility.
- **Evidence:** `resources/evidence/F-04_tls_validation.png`
- **Why Sarah marked doubt:** The client context notes that the worker does not connect directly to the public network. All connector traffic passes through a managed private egress gateway that establishes mutual TLS, validates the upstream certificate, and restricts destinations. It is unclear whether the worker-level weakness represents a high live risk, a defense-in-depth gap, or both.
- **Open client-translation questions:** Validate the actual traffic path, gateway enforcement, bypass possibilities, monitoring, and the consequence if the gateway control fails.

---

## F-05 — Sample-status webhook accepts unsigned events

- **Sarah's base score:** 7.5 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N`
- **Affected component:** Partner sample-status webhook
- **Technical description:** The webhook accepts status updates without a cryptographic message signature. Source IP allowlisting is present, but the application does not independently authenticate the message body or bind the event to a partner identity.
- **Proof summary:** From the approved partner test range, a synthetic sample was moved from `received` to `validated` using a modified request body.
- **Current remediation note:** Require signed events with replay protection, partner-specific keys, timestamp validation, and strict state-transition rules.
- **Evidence:** `resources/evidence/F-05_unsigned_webhook.png`
- **Open client-translation questions:** Assess the operational effect of false sample states, whether downstream result-release or export workflows trust the status, and the strength of the network allowlist.

---

## F-06 — Diagnostic export packages retained beyond the documented period

- **Sarah's base score:** 6.5 Medium
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N`
- **Affected component:** Patient and laboratory export service
- **Technical description:** Export packages are documented as expiring after 24 hours, but sampled synthetic exports remained retrievable for 30 days through their signed links. The storage object is encrypted, but the application continues to generate valid access links during the extended period.
- **Proof summary:** A test export created 29 days earlier remained downloadable by the authorized test account.
- **Current remediation note:** Align object and link expiry with the approved retention period and verify deletion through automated controls.
- **Evidence:** `resources/evidence/F-06_export_retention.png`
- **Open client-translation questions:** Consider volume, health-data sensitivity, storage access logging, DPO-approved retention policy, and whether the mismatch affects HDS or RGPD accountability.

---

## F-07 — Bulk patient export available to Support Manager role

- **Sarah's base score:** 9.1 Critical
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`
- **Affected component:** Support Operations bulk export workflow
- **Technical description:** A Support Manager can initiate a bulk patient export covering multiple laboratories. The endpoint returns a high-volume package containing identity, prescription, sample, and result information.
- **Proof summary:** The function was exercised with the engagement's approved Support Manager test role and generated a synthetic multi-laboratory export.
- **Current remediation note in Sarah's draft:** Restrict the endpoint to the DPO or remove it from Support Operations.
- **Evidence:** `resources/evidence/F-07_bulk_export.png`
- **Why Sarah marked doubt:** The client context states that this is an approved emergency and regulatory-response workflow. Production use requires a DPO-approved ticket, WebAuthn step-up authentication, dual approval from the Support Operations Manager and DPO delegate, encryption to a case-specific key, seven-day expiry, and immutable audit logging. The engagement test role was temporarily pre-approved to exercise the control.
- **Open client-translation questions:** Confirm whether every production path enforces the approvals, whether a ticket identifier is mandatory, and whether the observed behavior is intended functionality rather than a live finding.

---

## F-08 — Password-recovery flow reveals account existence

- **Sarah's base score:** 5.3 Medium
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N`
- **Affected component:** Laboratory user password recovery
- **Technical description:** The response differs for registered and unregistered email addresses, and rate limiting is applied by source address rather than by account identifier.
- **Proof summary:** Synthetic registered accounts received a `reset_requested` response while unknown addresses received `account_not_found`.
- **Current remediation note:** Return a uniform response and add account-aware throttling and monitoring.
- **Evidence:** `resources/evidence/F-08_account_enumeration.png`
- **Open client-translation questions:** Evaluate the practical sensitivity of laboratory-user identities, SSO coverage, MFA adoption, monitoring, and the role this information could play in targeted support or identity attacks.

---

## F-09 — Administrative privileges remain active after role downgrade

- **Sarah's base score:** 7.2 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:H/I:H/A:N`
- **Affected component:** Administrative session and authorization cache
- **Technical description:** When an administrator is downgraded to a read-only role, an existing session can retain write privileges until the distributed authorization cache expires. The observed window was approximately 27 minutes.
- **Proof summary:** The downgraded synthetic administrator continued to edit a connector profile in the existing session, while a new session correctly received read-only access.
- **Current remediation note:** Trigger session and token revocation on role change and reduce reliance on time-based cache expiry.
- **Evidence:** `resources/evidence/F-09_stale_admin_session.png`
- **Open client-translation questions:** Determine whether this shares the same identity-governance root cause as F-03, the frequency of privileged role changes, and whether privileged actions are separately approved or monitored.

---

## F-10 — Internal analytics service trusts a caller-supplied laboratory header

- **Sarah's base score:** 8.0 High
- **CVSS v3.1 vector:** `CVSS:3.1/AV:A/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N`
- **Affected component:** Internal analytics query service
- **Technical description:** The analytics service trusts the `X-Lab-ID` header inserted by the API gateway. The service is also reachable from the application network, where a caller can supply the header directly.
- **Proof summary:** From the approved application test host, changing the header returned aggregate diagnostic activity for a different synthetic laboratory.
- **Current remediation note:** Authenticate service-to-service calls, derive tenant identity from verified claims, and block direct network paths that bypass the gateway.
- **Evidence:** `resources/evidence/F-10_trusted_tenant_header.png`
- **Open client-translation questions:** Assess which service identities can reach the analytics endpoint, whether F-03's broad connector token can enter this path, and whether analytics identifiers help locate result objects affected by F-01.

---

## Generic remediation list from the raw draft

1. Apply consistent tenant-level authorization.
2. Implement contextual output encoding.
3. Reduce token privileges and lifetime.
4. Enable certificate verification.
5. Sign webhook messages.
6. Enforce documented export retention.
7. Restrict bulk export capability.
8. Normalize password-recovery responses.
9. Revoke sessions on role change.
10. Authenticate internal service calls.

> **Draft status reminder:** The technical evidence above is complete enough for professional review, but the finding set has not yet been environmentally recalibrated, triaged, consolidated, connected into attack chains, quantified in euros, assigned to owners, or rewritten for the MediPath audit committee.

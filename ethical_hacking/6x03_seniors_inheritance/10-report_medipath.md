# Penetration Test Report, MediPath Diagnostics

**Engagement reference:** VS-MPD-26-041  
**Reporting period:** 04–12 June 2026  
**Prepared by:** [Your Name], Junior Consultant, Vanguard Security  
**Distribution:** MediPath audit committee

## 1. Executive Summary

MediPath’s engagement reviewed the controls and trust boundaries around its diagnostic platform, with a focus on risks that could affect patient data, laboratory confidence, and the HDS renewal process. The review identified a small number of issues that matter materially in a healthcare context, even when the underlying technical details are not visible to the board. The most important finding is not a single weakness in isolation, but the way several issues combine to create a credible path for data exposure and workflow disruption across laboratory boundaries.

The committee should take four decisions immediately. First, approve an immediate remediation plan for the tenant-boundary and identity-control issues, with a likely cost of EUR 1.4 million to EUR 9.5 million for the most serious exposure scenario and a central estimate of EUR 4.8 million. Second, authorize the identity lifecycle work for service tokens and administrator access, with likely impact of EUR 1.1 million to EUR 7.2 million and a central estimate of EUR 3.2 million. Third, approve the workflow-integrity and partner-signing measures to protect result delivery and sample-state accuracy, with a likely exposure of EUR 450,000 to EUR 2.8 million and a central estimate of EUR 1.1 million. Fourth, direct the DPO and compliance team to confirm retention and accountability controls, with a likely exposure of EUR 350,000 to EUR 2.1 million and a central estimate of EUR 0.9 million.

The most serious chain of issues could create a multi-laboratory health-data event and materially weaken the renewal narrative at a time when MediPath is preparing for HDS review. The modeled impact of that combined scenario is EUR 4.5 million to EUR 18 million, with a central estimate of EUR 9.6 million. A second chain combining workflow manipulation and tenant-boundary exposure could create a similar order of impact, estimated at EUR 3.8 million to EUR 15.5 million, with a central estimate of EUR 8.1 million.

The residual risk after remediation remains manageable only if actions are taken in the next eight weeks and supported by clear ownership across engineering, governance, and compliance. The company should not treat these findings as a technical nuisance. They sit directly on the lines that matter to patient trust, laboratory retention, and the renewal of its healthcare certification. The appropriate response is decisive remediation, tight governance, and a disciplined sequence of work before the audit committee meets.

## 2. Engagement Scope and Methodology

This engagement was carried out under the MediPath production-equivalent staging environment and approved integration endpoints, with the objective of validating the platform’s security posture and its readiness for HDS renewal. The raw technical work inherited from Sarah Chen was used as the evidence foundation for the review. That work was then translated into client-ready language, corrected where the environmental context materially changed the interpretation, and consolidated where multiple findings shared the same root cause.

The methodology followed a structured approach: evidence review, client-context validation, environmental CVSS recalibration, root-cause and attack-chain evaluation, business-impact quantification, and prioritisation by accountable owner. Testing was limited to approved staging and integration paths, and destructive or denial-of-service activities were outside scope. The review also distinguishes between intended and controlled operational functions and live control weaknesses, so that the final report does not overstate the risk profile of the platform.

## 3. Findings Synthesis

### Finding F-01/F-10, Severity Critical
- Technical description: A tenant-boundary weakness exists in both the results API and the analytics service. In the results service, a result identifier can be substituted across laboratories; in the analytics service, a caller-supplied laboratory header can influence the tenant context without a verified independent check. The issue is not limited to one record or one service; it affects the core assumption that laboratory data remains isolated.
- Environmental CVSS justification: The base score was recalibrated upward to a critical environmental rating because MediPath processes regulated health data and the affected functions sit at the center of diagnostic delivery and operational reporting. The control environment reduces the risk to some extent, but it does not remove the core flaw that tenant identity is not independently verified.
- Quantified business impact in euros: EUR 1,400,000 to EUR 9,500,000, central estimate EUR 4,800,000.
- Attack chain context: This finding is the key data-exposure pivot in Chain 1. It converts a token or session issue into a cross-laboratory exposure and makes the impact materially broader than the isolated finding suggests.
- Remediation and ownership: Head of Platform Engineering with support from the Data Platform Lead and Technical Director; immediate remediation with strict tenant validation, service-identity controls, and audit validation before release.

### Finding F-03/F-09, Severity Critical
- Technical description: The platform demonstrates both broad service-token scope and stale administrative privilege after a role change. Together these weaknesses indicate a broader problem with lifecycle control over credentials and session validity.
- Environmental CVSS justification: This finding was treated as a critical environmental issue because the affected trust material is used across hospital integrations and internal administrative functions in a regulated clinical workflow. The client’s compensating controls reduce likelihood but do not eliminate lingering trust or privilege drift.
- Quantified business impact in euros: EUR 1,100,000 to EUR 7,200,000, central estimate EUR 3,200,000.
- Attack chain context: This finding is the precondition for both attack chains. A malicious actor using a stale admin session or over-broad connector token gains access to the internal trust boundary before the tenant-boundary weakness is engaged.
- Remediation and ownership: Identity and Access Management Lead with Technical Director and Head of Platform Engineering; immediate remediation, token review, session invalidation, and validation of privileged role-change handling.

### Finding F-05, Severity High
- Technical description: The sample-status webhook accepts partner events without a cryptographic signature and therefore permits the modification of workflow state if message integrity is not enforced.
- Environmental CVSS justification: The issue was increased slightly in environmental terms because diagnostic workflow integrity is highly material, and even a small manipulation can affect the treatment pathway or downstream processing. The private integration network and allowlist reduce risk, but they do not replace signed messages and strict state validation.
- Quantified business impact in euros: EUR 450,000 to EUR 2,800,000, central estimate EUR 1,100,000.
- Attack chain context: This function is the stepping-stone that turns a stale token or session into manipulation of the workflow layer before the tenant-boundary issue is used for data exposure.
- Remediation and ownership: Integration Engineering Lead with Site Reliability Engineering Lead and Product Owner, Diagnostic Workflow; immediate rollout of partner signing and state-transition enforcement.

### Finding F-06, Severity High
- Technical description: Export packages remain retrievable beyond their documented expiry period, creating a retention-control gap in a health-data environment.
- Environmental CVSS justification: The issue was elevated because export retention is directly connected to HDS audit readiness and RGPD accountability. In a regulated healthcare platform, retention mismatches create both privacy and governance concern even when encryption remains in place.
- Quantified business impact in euros: EUR 350,000 to EUR 2,100,000, central estimate EUR 900,000.
- Attack chain context: This issue is not part of the principal attack chain but it increases the regulatory and audit exposure when a data-access event occurs.
- Remediation and ownership: DPO with Compliance and HDS Manager and Data Platform Lead; quarterly remediation and evidence update, with final policy alignment and deletion verification.

### Finding F-02, Severity Medium
- Technical description: Stored content in the support portal is rendered without complete output protection, creating a risk of injected content in internal workflows.
- Environmental CVSS justification: The issue was downgraded slightly after considering the support portal’s MFA and managed-workstation controls. It remains relevant, but the operational exposure is lower than a generic public-facing issue would suggest.
- Quantified business impact in euros: EUR 180,000 to EUR 1,200,000, central estimate EUR 520,000.
- Attack chain context: This item is not a principal driver of the attack chains, but it reinforces the need for tighter content-handling and internal trust protection.
- Remediation and ownership: Support Operations Manager with Technical Director and Head of Platform Engineering; quarterly remediation and browser and content-control hardening.

### Finding F-08, Severity Medium
- Technical description: The account-recovery process reveals account existence and applies rate limiting by source address rather than by account identifier.
- Environmental CVSS justification: This issue was reduced in environmental terms because most user access is protected by SSO and MFA, and the direct operational impact is narrower than a generic identity issue. It is still worthy of remediation because account discovery can support targeted attacks.
- Quantified business impact in euros: EUR 120,000 to EUR 800,000, central estimate EUR 350,000.
- Attack chain context: This is a supporting issue rather than a root cause for the major chains, but it can increase the effectiveness of targeted social engineering or account attacks.
- Remediation and ownership: Identity and Access Management Lead with CISO; quarterly improvement in normalization and monitoring of account-recovery responses.

### Attack Chain 1: Cross-tenant data exposure
- Technical description: The chain moves from identity and session drift to tenant-boundary failure in the results and analytics services, yielding a potential multi-laboratory data exposure across regulated health data.
- Environmental CVSS context: This chain is treated as a combined risk whose impact exceeds the sum of separate findings because it materially increases both reachability and consequence.
- Quantified business impact in euros: EUR 4,500,000 to EUR 18,000,000, central estimate EUR 9,600,000.
- Remediation and ownership: CISO with Head of Platform Engineering, IAM Lead, and DPO; immediate action and executive governance review before the audit committee.

### Attack Chain 2: Workflow manipulation and data exposure
- Technical description: This chain combines identity drift with a false-status injection and tenant-boundary weakness, turning a workflow-integrity issue into a confidentiality and trust event across the platform.
- Environmental CVSS context: The combined impact is higher than a single workflow or single data-access issue because it can affect both patient-path integrity and laboratory confidence.
- Quantified business impact in euros: EUR 3,800,000 to EUR 15,500,000, central estimate EUR 8,100,000.
- Remediation and ownership: CISO with Product Owner, Diagnostic Workflow, Head of Platform Engineering, and IAM Lead; immediate action and governance review before the audit committee.

## 4. Addendum: Retired and Merged Findings

### Retired findings
- F-04: The connector worker configuration with peer validation disabled was identified in the raw technical draft, but the MediPath context shows that the worker does not reach the public network directly and is instead protected by a managed private integration network and mTLS gateway. In the live architecture, this is a defense-in-depth weakness rather than a primary exploitable path and is therefore retired from the final finding set.
- F-07: The bulk-export workflow is an approved DPO-controlled emergency and regulatory-response function with WebAuthn step-up, dual approval, case-specific encryption, seven-day expiry, and immutable audit logging. The observed test role was explicitly authorized for the exercise, so the issue does not constitute an unauthorized or uncontrolled access path and is retired from the retained findings.

### Merged findings
- F-01 and F-10 were merged as F-01/F-10 because both represent tenant-boundary failure at the service layer; the root cause is the reliance on caller-supplied or insufficiently revalidated tenant identity.
- F-03 and F-09 were merged as F-03/F-09 because both reflect identity and authorization lifecycle drift, where trust material or administrative access persists beyond the intended scope.

### Correction note
- Where scoring or classification differed materially from the raw draft, the final report notes the correction transparently. The score changes are not dismissive corrections; they reflect the actual MediPath operating context, HDS obligations, and the compensating controls already present for certain functions.

## 5. Strategic Recommendations

### Short-term actions (within twelve days)
1. Freeze and rotate all broad tokens and stale admin sessions affecting hospital integrations and administrative access. Owner: Identity and Access Management Lead.
2. Enforce independent tenant validation in the results API and analytics service. Owner: Head of Platform Engineering and Data Platform Lead.
3. Require signed partner events and stricter workflow-state validation for sample-status updates. Owner: Integration Engineering Lead and Product Owner, Diagnostic Workflow.
4. Confirm and document retention controls and export expiry for patient data. Owner: DPO and Compliance and HDS Manager.

### Medium-term actions (quarterly)
1. Rebuild service-to-service trust assumptions so tenant identity is derived from verified claims, not caller-supplied metadata.
2. Rework admin session lifecycle management and role-change revocation with time-based and event-driven invalidation.
3. Review support portal content controls and monitor internal trust boundaries for cross-tenant anomalies.
4. Complete targeted monitoring and rate-limiting improvements for account-recovery and support workflows.

### Governance-level actions
1. Place the protection of patient-data trust and HDS renewal evidence on the risk register at the board level.
2. Require a documented decision path for any emergency or regulatory workflow that accesses patient data across laboratories.
3. Ensure all remediation owners have named responsibilities with measurable delivery deadlines and review checkpoints.

## 6. Limitations and Uncertainty

This report is limited to the MediPath production-equivalent staging environment and approved integration paths described in the engagement scope. It does not cover production patient data, destructive testing, denial-of-service testing, or third-party laboratory infrastructure outside the Med ipath-controlled model. The business-impact estimates are modeled ranges using the engagement’s operating metrics, not precise predicted losses. The report therefore presents a defensible range with stated assumptions rather than a false precision that would be difficult to defend in an audit or regulator-facing conversation.

## 7. Appendices

- A. Detailed finding tables and retained-item matrix.
- B. CVSS environmental calculations and calibration notes.
- C. Attack-chain diagrams in text format.
- D. Glossary for non-technical readers.

### Appendix D: Glossary for non-technical readers
- Tenant: a logical boundary used to separate one laboratory’s data from another’s.
- Workflow integrity: assurance that sample and result states are accurate and not altered without valid authorization.
- Trust boundary: the place where one system decides whether to trust another or a caller’s claim.
- Retention control: the process that ensures health-data exports and records are kept only for the approved period.
- DPO: Data Protection Officer, responsible for privacy accountability and regulatory interpretation.
- HDS: the French healthcare data security certification framework affecting MediPath’s regulated environment.

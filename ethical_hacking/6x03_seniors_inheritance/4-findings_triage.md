# Findings Triage and Consolidation

## Retired Findings

### Retired finding F-04
The connector worker configuration with `verify_peer=false` was recorded as a technical weakness, but the MediPath client-context dossier shows that the worker does not connect directly to the public network and instead traverses a managed private integration network with a dedicated mTLS gateway that validates upstream certificates and restricts destinations. In the live environment, the worker-level flag is therefore best treated as a defense-in-depth configuration issue rather than a directly exploitable production gap, and it is not retained as a primary finding for the audit-committee report.

### Retired finding F-07
The bulk-export workflow is an approved, DPO-controlled emergency and regulatory-response function with WebAuthn step-up, dual approval, a case-specific encryption key, seven-day expiry, and immutable audit logging, as documented in the client context. The observed activity was exercised under a test role that was specifically authorized for the engagement and is therefore not representative of an unauthorized or uncontrolled access path; this is better described as a control-compliance question than as a live vulnerability, and it is retired from the retained finding set.

## Merged Findings

### Merger F-01 and F-10 as F-01/F-10
The shared root cause is tenant-boundary trust failure at the service layer: the results API and the analytics service both accept or derive tenant identity in a way that is not independently reconstructed from an authenticated, verified source. In F-01, the results endpoint fails to consistently bind a result identifier to the requester's laboratory tenant; in F-10, the analytics service trusts a caller-supplied laboratory header instead of deriving the tenant from a verified gateway or service identity. Both manifestations represent the same underlying design weakness in multi-tenant authorization and data isolation, and the combined issue is materially more serious than either one reviewed in isolation because it exposes both result records and aggregate activity data across laboratory boundaries.

### Merger F-03 and F-09 as F-03/F-09
The shared root cause is identity and authorization lifecycle drift: a trusted service or administrator session retains effective write access beyond the intended authorization state because the system relies on over-broad tokens or time-based cache expiry instead of immediate revocation. In F-03, the connector token remained valid with broad `integration:all` scope beyond the assigned hospital and laboratory relationship; in F-09, an administrator's existing session kept write privileges after a role downgrade until the authorization cache expired. Both are manifestations of weak lifecycle control over trust material and session state, and together they indicate a broader privilege-management problem affecting both service identities and human administrative access.

## Consolidated Retained List

| Finding | Final severity | Carried to Task 6 |
| --- | --- | --- |
| F-01/F-10 | Critical | Yes |
| F-03/F-09 | Critical | Yes |
| F-02 | Medium | Yes |
| F-05 | High | Yes |
| F-06 | High | Yes |
| F-08 | Medium | Yes |

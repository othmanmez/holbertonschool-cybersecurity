# MediPath Compensating Controls

| Control | Coverage | Relevant findings | Limitations / verification needs |
| --- | --- | --- | --- |
| CDN and managed WAF | Public web and API traffic | F-01, F-02, F-08 | Does not replace application authorization or output encoding |
| MFA for internal users | Support and administrative users | F-02, F-07, F-09 | Reduces account misuse; does not prevent same-origin abuse or stale authorization |
| Managed workstations | Support and admin teams | F-02, F-07, F-09 | Browser and endpoint controls reduce exposure but do not remove application flaws |
| Private integration network | Hospital connector traffic | F-03, F-04, F-05 | Limits network reachability; token scope and message authenticity still matter |
| Managed mTLS gateway | Validates upstream certificates and restricts destinations | F-04 | Confirm no bypass route and verify monitoring and fail-closed behavior |
| Source IP allowlist | Partner webhook traffic | F-05 | Network identity is not equivalent to signed message integrity |
| Object-storage encryption | Export packages | F-06, F-07 | Does not correct excessive retention or inappropriate authorization |
| Export approval workflow | DPO ticket, WebAuthn step-up, dual approval, case key, seven-day expiry | F-07 | Confirm all production paths enforce mandatory ticket and dual approval |
| Central SIEM | Authentication, export, admin, and gateway logs | All | Detection quality depends on alert rules and tenant-context integrity |
| SSO and MFA for 82% of laboratory users | Laboratory user access | F-01, F-08 | Remaining local accounts and account enumeration still require treatment |
| Authorization cache | Improves performance for admin and service paths | F-03, F-09 | Current invalidation is time-based and may indicate a shared lifecycle-control gap |
| Quarterly access review | Privileged and support roles | F-07, F-09 | Periodic review does not provide immediate revocation |

## Control-evaluation rule

A compensating control can reduce likelihood or impact only when its coverage, enforcement, ownership, and bypass resistance are evidenced. Do not downgrade a finding solely because a control is mentioned.

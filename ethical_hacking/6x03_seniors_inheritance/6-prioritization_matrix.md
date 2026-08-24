# Risk Prioritization Matrix

| Item | Priority | Owner | Timeline | Cost | Dependencies |
| --- | --- | --- | --- | --- | --- |
| F-01/F-10 | P1 | Head of Platform Engineering | immediate | high | Requires tenant-isolation enforcement in the results API and analytics service; dependent on identity and access review by the IAM Lead before final production rollout. |
| F-03/F-09 | P1 | Identity and Access Management Lead | immediate | high | Requires immediate token and session revocation design, then validation through the Technical Director and Platform Engineering for safe rollout. |
| Chain 1 | P1 | CISO | immediate | high | Depends on completion of the F-03/F-09 and F-01/F-10 remediation work; governance and regulatory notification review also required before closure. |
| Chain 2 | P1 | CISO | immediate | high | Depends on the identity lifecycle remediation and workflow integrity fixes led by the IAM Lead, Platform Engineering, and Product Owner, Diagnostic Workflow; governance review required before closure. |
| F-05 | P2 | Integration Engineering Lead | immediate | medium | Requires partner key and signature design coordination with the Integration Engineering Lead and the Site Reliability Engineering Lead before partner rollout. |
| F-06 | P2 | DPO | quarterly | medium | Depends on retention-policy and storage-control cleanup from Data Platform and Platform Engineering; DPO approval required to confirm revised retention and deletion controls. |
| F-02 | P2 | Support Operations Manager | quarterly | medium | Requires application-layer validation and browser compatibility review with the Technical Director and Platform Engineering before rollout. |
| F-08 | P3 | Identity and Access Management Lead | quarterly | low | Depends on rate-limiting and account-response normalization work, with validation by the CISO for production monitoring and operational tuning. |

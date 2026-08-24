# MediPath Asset Criticality and Regulatory Map

## Regulatory frame

- Personal health data is treated as a special category of personal data under RGPD Article 9.
- MediPath's French hosting and operational model is within the scope of its HDS certification obligations.
- The DPO owns privacy interpretation and notification analysis.
- The Compliance and HDS Manager owns certification evidence and audit coordination.
- The CISO and Technical Director own security-risk treatment and technical remediation evidence.

## Asset criticality

| Asset or process | Confidentiality | Integrity | Availability | Regulatory / business significance |
| --- | --- | --- | --- | --- |
| Diagnostic result records | Very high | Very high | High | Health data; direct patient and laboratory trust |
| Sample-status workflow | High | Very high | Very high | Incorrect status can disrupt or misrepresent the diagnostic pathway |
| Hospital connector credentials | Very high | Very high | High | Trusted integration boundary across institutions |
| Bulk export workflow | Very high | High | Medium | High-volume health-data processing; DPO-controlled purpose |
| Support portal | High | High | Medium | Cross-tenant operational access |
| Administrative console | Very high | Very high | High | Controls platform configuration and trust relationships |
| Analytics service | Medium/high | High | Medium | Cross-laboratory confidentiality and governance concern |
| Audit and approval logs | High | Very high | High | Required for accountability, incident analysis, and certification evidence |

## Client interpretation notes

- A health-data confidentiality issue may carry greater environmental impact than its generic base score suggests.
- A workflow-integrity issue can affect laboratory operations even if no data is stolen.
- A documented, DPO-authorized workflow with enforced approvals should not be mislabeled as unauthorized access.
- Certification and regulatory impact must be explained carefully; a finding does not automatically prove a sanction or certification suspension.

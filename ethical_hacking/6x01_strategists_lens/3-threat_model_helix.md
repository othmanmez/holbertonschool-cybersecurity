## Framework Declaration
MITRE ATT&CK

## Rationale
MITRE ATT&CK is the correct framework for Helix because the BSI threat note is the governing operational document andit explicitly names the adversary clusters and the techniques the product must resist. The business context document connects those adversary requirements to the BSI contract and the DGA commercial negotiation, making the assessment contractually consequential rather than simply architectural. The product architecture diagram shows a multi-tenant European-sovereign cloud environment with client isolation requirements, which is precisely the environment where ATT&CK mappings and lateral-movement paths matter. The RoE and stakeholder materials also make clear that the report is intended for CISO, BSI, DGA, and NATO-facing reviewers, so a common attacker-language model is the most defensible and reviewable way to represent resilience claims.

## Framework Selection Feedback
MITRE ATT&CK is particularly valuable for Helix because it translates the contractual adversary requirement into a structured, auditable map of tactics and techniques that BSI and DGA reviewers can evaluate directly. The trade-off is that ATT&CK is strongest for attacker behavior and less effective for broader business or governance framing, so the team must still connect the technical findings back to contract value, customer risk, and cyber-resilience implications.

## Threat Model
### Scope and adversary profiles
- In scope: Helix’s multi-tenant SaaS platform, per-client isolation controls, cloud control plane, tenant data paths, identity and access management, CI/CD and workload deployment, and European-sovereign hosting services.
- Out of scope: individual stakeholder profiling, non-technical personnel characteristics, and any assets not part of the operational SaaS environment described in the architecture and RoE.
- Named adversary clusters from contract excerpts:
  - State-aligned cluster commonly attributed to Russia, with strategic intelligence and cyber-espionage objectives against defense-adjacent technology and supply chains.
  - Opportunistic financially motivated cluster active against European defense suppliers, with a preference for credential theft, ransomware, extortion, and operational disruption.

### ATT&CK mapping to Helix assets and risks
| Adversary cluster | ATT&CK tactic | Technique | Asset / component | Why it matters for Helix |
| --- | --- | --- | --- | --- |
| Russian state-aligned cluster | Reconnaissance | T1592.003: Gather Victim Org Information: Digital Certificates / T1589.001: Gather Victim Identity Information: Credentials | Public-facing platform metadata, tenant metadata, identity providers | Defense-sector suppliers are valuable targets for collection of relationships, trust anchors, and account architecture details. |
| Russian state-aligned cluster | Initial Access | T1078: Valid Accounts / T1566: Phishing | IAM, SSO, admin consoles, email, partner integrations | A single valid credential can bypass multi-tenant isolation assumptions and enable tenant pivoting or platform reconnaissance. |
| Russian state-aligned cluster | Persistence | T1098: Account Manipulation / T1133: External Remote Services | IAM, federated access, admin accounts, bastion infrastructure | Long-lived persistence in privileged identities is especially dangerous in a regulated, contract-driven environment. |
| Russian state-aligned cluster | Privilege Escalation | T1078.004: Cloud Accounts / T1548.001: Setuid and Setgid Binary (if applicable in workloads) | Cloud control plane, workload identities, automation | Tenant isolation is only relevant if the control plane and workload identities are not abused to cross trust boundaries. |
| Russian state-aligned cluster | Defense Evasion | T1036: Masquerading / T1562: Impair Defenses | Logging pipelines, security tooling, identity and networking controls | Evasion of monitoring is a major issue when the product is being evaluated for resilience under a BSI contract. |
| Russian state-aligned cluster | Lateral Movement | T1210: Exploitation of Remote Services / T1021: Remote Services | Network segmentation, bastion hosts, management plane, tenant communication paths | Multi-tenant isolation depends on strict path control across trust domains and service boundaries. |
| Russian state-aligned cluster | Collection | T1005: Data from Local System / T1119: Automated Collection | Tenant data stores, application logs, analytics outputs | Defense-sector customers are likely to hold sensitive operational and technical data that would be highly valuable to a strategic adversary. |
| Financially motivated cluster | Initial Access | T1566: Phishing / T1189: Drive-by Compromise | End-user access, admin laptops, partner channels | Opportunistic clusters often gain access through less secure paths and then leverage stolen credentials or malicious email. |
| Financially motivated cluster | Credential Access | T1552: Unsecured Credentials / T1555: Credentials from Password Stores | CI/CD secrets, cloud credentials, local developer tooling | A breach of developer or mail access can quickly collapse service trust in a software platform. |
| Financially motivated cluster | Exfiltration | T1041: Exfiltration Over C2 Channel / T1567: Exfiltration to Cloud Storage | Application data, export pipelines, cloud storage | The most damaging outcome may be rapid exfiltration of sensitive technical data or customer records. |
| Financially motivated cluster | Impact | T1486: Data Encrypted for Impact / T1490: Inhibit System Recovery | Production services, backups, recovery mechanisms | Operational disruption can destroy commercial value even without strategic exfiltration. |
| Common control-plane risk | Discovery | T1083: File and Directory Discovery / T1069: Permission Groups Discovery | Tenant boundaries, internal services, configuration stores | Discovery is how attackers validate isolation assumptions before they move laterally or exfiltrate data. |

### Emerging TTP annotation
- Emerging, not yet published in standard ATT&CK matrices: Custom-Helix-01 — “Trust-bundle spoofing for sovereign cloud federation.” This refers to adversary attempts to impersonate trusted service or certificate material across a federated European-sovereign platform, undermining trust channelling between regions and tenant workload clusters. This annotation is intentionally marked as emerging because the BSI note explicitly identifies it as outside the standard published matrices.

### Critical system assertions
- Tenant isolation is not a product feature if it depends on a single identity provider or a single shared control plane.
- Multi-tenant SaaS, especially in defense-adjacent use cases, is at highest risk when discovery and persistence precede lateral movement within the same sovereign infrastructure boundary.
- A BSI-relevant resilience claim must address both the strategic cluster and the financially-motivated cluster, because the same infrastructure may be exploited for different ends: intelligence and extortion.

## Identified Findings
1. High — The multi-tenant control plane and identity architecture do not yet provide enough evidence of tenant isolation under realistic state-aligned intrusion scenarios. This is contractually important because the BSI and DGA review will evaluate whether Helix can withstand the named Russian-aligned cluster without breaching client separation or trust boundaries.
2. High — The environment is exposed to credential-based entry and privilege escalation paths that are directly consistent with the documented ATT&CK techniques used by both named adversary clusters. These are high-risk because they can enable persistent access with limited noise and can be used before any major external indicator is visible to the defenders.
3. Medium — The emerging trust-bundle spoofing TTP represents a material resilience gap because it sits outside the normal published ATT&CK matrix and therefore may not be covered by standard detection logic or reviewed controls. This is significant in a sovereign European infrastructure model where trust establishment across workloads and tenants is a primary security assumption.

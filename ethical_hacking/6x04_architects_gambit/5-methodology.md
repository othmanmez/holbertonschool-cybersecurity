# Methodology, Nordstrøm Power Group

## PTES phases: full / abbreviated / extended

### Fully deployed
- Preliminary Interactions and Scoping
- Intelligence Gathering and Threat Modelling
- Vulnerability Analysis
- Reporting

These phases are fully deployed because the engagement is not a generic technical check; it is a board-facing strategic security review for a multi-jurisdictional energy group. The early phases define the commercial and technical architecture of the engagement, and the reporting phase must support a board decision within a 90-day window and a multi-subsidiary regulatory context.

### Abbreviated
- Social Engineering
- Exploitation
- Post-Exploitation

These are abbreviated or intentionally constrained because Nordstrøm is an energy group with critical operational dependencies and a mixed IT/OT environment. The client is not asking for broad offensive testing; it is asking for a strategic health check and a defensible roadmap. We will not perform broad exploitation or lifecycle abuse testing beyond the agreed perimeter, and we will not extend into destructive or operationally risky actions in live process environments. This is a prudent adaptation and a commercial necessity.

### Extended
- Technical Architecture Review
- Asset Inventory and Dependency Mapping
- Identity and Remote Access Review
- Governance and Compliance Mapping
- OT-adjacent risk assessment

These are extended because Nordstrøm’s value lies in the control seams across the group: offshore gas, hydro and wind, trading and infrastructure, and the mid-integration German acquisition. The client’s board deadline, NIS2 exposure, and the cross-subsidiary complexity mean the engagement must prioritise architecture, trust boundaries, control ownership, and dependency maps much more than a generic PTES checklist would.

## Complementary frameworks and where they apply

### OWASP for web and API surfaces
OWASP is used where Nordstrøm exposes business-facing applications, portal logic, partner flows, and operational support systems. This is particularly relevant for the cross-border support systems, trading-support tooling, and the newly integrated German subsidiary’s web-facing administration and identity pathways.

### MITRE ATT&CK for IT
MITRE ATT&CK for IT is used across corporate IT, identity systems, remote access, third-party access, SaaS integrations, and operational support environments. It is particularly relevant to Nordstrøm’s privileged access, contractor access, federation, and service-account drift risks, which are especially significant in a group with multiple subsidiaries and a recent M&A integration.

### ATT&CK for ICS
ATT&CK for ICS is used for OT-adjacent environments in Norway, the Netherlands, Denmark, and Sweden, where process reliability and operational continuity are business-critical. This is not a full OT red-team; it is a targeted industrial control risk model applied to remote access, maintenance links, telemetry flows, and process-support dependencies that could materially affect production or service continuity.

### NIST SP 800-53 Rev. 5
NIST 800-53 is used where governance, control mapping, and board defensibility matter. It helps translate Nordstrøm’s NIS2 obligations and sectoral risk into familiar control domains such as access control, incident response, backup, boundary protection, and security assessment. This is especially useful for the German acquisition, because a recent integration often creates fragmented evidence and inconsistent control baselines that a board will ask to reconcile.

## Per-adaptation justification (tied to a Nordstrøm specific)

### 1. Preliminary Interactions and Scoping — full
This phase is full because the brief is intentionally broad and the client is still determining what it needs. The fact that Nordstrøm is a group of five subsidiaries with different regulatory, sectoral and operational realities means early scoping cannot be a formality; it is the mechanism that prevents an oversized, underpriced engagement. The board deadline and retainer signal mean we must qualify the scope before quoting, particularly around Germany’s acquisition and the risk of scope creep into OT systems with unclear boundaries.

### 2. Intelligence Gathering and Threat Modelling — full
This phase is full because the threat picture changes materially by subsidiary. The Norway offshore gas assets are exposed to operational disruption and remote maintenance compromise; Denmark’s offshore wind and trading interfaces have both operational and commercial sensitivity; the Netherlands’ gas and hydrogen infrastructure makes process manipulation and flow integrity especially material; Sweden’s hydro and wind functions expose generation and balancing risk; and Germany’s integrating solar utility creates a transition risk shaped by temporary trust relationships and incomplete control maturity. A generic threat model would fail here because the per-subsidiary threat surfaces are different by design.

### 3. Active and Passive Reconnaissance — abbreviated
This is abbreviated to keep the engagement within defined boundaries and avoid overreaching into the live process domain. Nordstrøm’s energy estate is not a normal SaaS environment, and broad mapping of OT and process systems would exceed the commercial and operational envelope of a first-phase health check. The adaptation is specific: we validate only the known critical dependency paths identified during strategic scoping, rather than enumerating the entire physical and digital estate indiscriminately.

### 4. Vulnerability Analysis — full
This is full because the client needs evidence-based risk, not just strategic language. We apply vulnerability analysis to the agreed perimeter and to the critical trust boundaries identified by the strategic baseline. In practice, this means reviewing the external exposure, identity layers, and remote-admin pathways relevant to each subsidiary specifically, while keeping the process disciplined enough to fit a 90-day board cycle.

### 5. Social Engineering — abbreviated
This is abbreviated because the client’s highest-risk concerns are operational continuity, remote access, third-party trust, and identity drift, not necessarily broad phishing lures across the workforce. In a multi-subsidiary energy hold, the more material concerns are contractor access, federated authentication, and lifecycle drift in privileged access. Broad social engineering is a poor use of the client’s budget unless a specific business reason emerges.

### 6. Exploitation — abbreviated
This is abbreviated for the same reason as the OT boundaries: Nordstrøm’s sectors are operationally sensitive. We do not need to prove “could break everything” in live production systems; we need to establish whether the paths of concern are real, exploitable within the approved environment, and material to the board’s decisions. The German integration case is a good example: the value is in testing the trust seam and the new access model, not in broad exploitation of every inherited system.

### 7. Post-Exploitation — abbreviated
This is abbreviated because the engagement is scoped to strategic and board-level evidence, not to prolonged adversary emulation. The main concern is whether privileged access, trust boundaries, and business continuity dependencies can be abused to move from one domain to a more sensitive one. We want to know if the risk is real and material, not whether a red team can maintain persistence in a live energy process environment for a prolonged period.

### 8. Reporting — full
This phase is full because the deliverable must be board-usable, not simply technically rich. Nordstrøm is under time pressure and the board needs an actionable story tied to NIS2, vendor and contractor complexity, the German integration state, and the holding’s multidisciplinary risk profile. The reporting format must therefore bridge technical findings, governance implications, and recommended sequencing.

### 9. OT-specific adaptation with ATT&CK for ICS — extended
The extended OT focus is justified by the Norwegian offshore gas and Dutch infrastructure assets. These sectors are not merely “IT with a different label”; they combine remote operation, telemetry, and process integrity with significant safety and continuity risk. ATT&CK for ICS adds the correct lens when evaluating remote-maintenance access, process-data integrity, control system dependencies, and the risk of manipulation without overt IT compromise.

### 10. IT-specific adaptation with MITRE ATT&CK — extended
The extended IT focus is justified by the group’s need to review identity, remote access, third-party trust, and administrative drift across five subsidiaries. The German acquisition is the clearest example: a recent integration creates temporary trust links, orphaned accounts, and inconsistent identity controls. ATT&CK for IT provides the right vocabulary for evaluating how low-level access or identity drift could become a group-level breach or operational disruption.

### 11. Governance and control mapping with NIST 800-53 — extended
This is extended because Nordstrøm is preparing a three-year strategic plan for a board, and the board will ask how the risk relates to formal governance, continuity, and regulatory readiness. NIST 800-53 translates the client’s risk into familiar, auditable control categories and helps distinguish between a tactical technical issue and a governance issue that needs a different remediation pathway. This is particularly valuable in the German integration case, where evidence quality and control baseline maturity may not yet be consistent across systems.

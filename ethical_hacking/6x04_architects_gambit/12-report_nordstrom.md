# Engagement Report, Nordstrøm Power Group
For: Elin Solberg (CISO) and the Nordstrøm board

## 1. Executive summary (no jargon)

Nordstrøm is exposed to a real strategic cyber risk, not because the group is weak in one place only, but because it is structurally diverse: five jurisdictions, multiple energy sub-sectors, and a recent German acquisition that is still integrating. The strongest signal from the Phase 1 and Phase 2 evidence is that the group’s most material exposure sits at the boundary between identity, remote access, and operational support, not at the public internet alone.

In practical terms, the risk is not “we have one vulnerable system.” It is “we have several control seams where a low-impact public-facing service can move into a more sensitive operational or administrative context.” This matters because Nordstrøm’s business depends on continuity, trust, and regulatory credibility across essential and important entities. The risk is therefore not limited to one site or one country; it is a group-level risk with country-specific variations.

The evidence gathered during the reconstructed Phase 1 and Phase 2 work showed that the public surface is manageable and not broadly exposed in the sense of direct SCADA access, but it is not clean. The external perimeter did reveal support and partner-facing paths, identity handling weaknesses, and a boundary-confusion issue on a higher-value in-scope asset. That issue was validated on a controlled test asset and showed the ability to reach a more sensitive application context than the original interface should have permitted. While the issue did not expose live process control in a destructive or operationally dangerous way, it demonstrated a material integrity and trust problem that is highly relevant to a board plan and a cyber strategy for the next three years.

The practical board message is clear: Nordstrøm should not treat this as an isolated technical issue. It is an organisational and governance problem with technical expression. The recommended response is a phased strategic remediation plan, focused first on identity, remote access, support boundaries, and the German integration seam, before wider OT deep-dives and more expensive infrastructure work begin.

## 2. Context and methodology

This engagement was designed as a phased strategic review within a 90-day board planning window. The work began with a group-level strategic baseline and threat framing, followed by a controlled, in-scope validation of the public-facing and support surfaces. The methodology was intentionally adapted from PTES but not used as a template. The public surface was reviewed, the critical attack paths were mapped, and the work moved toward a higher-value in-scope asset only after the relevant perimeter had been defined.

The methodology deployed a hybrid model: PTES for the engagement lifecycle, MITRE ATT&CK and ATT&CK for ICS for technical adversary mapping, OWASP where web and application-facing controls were relevant, and NIST SP 800-53 to support control and governance mapping where board and regulatory interpretation mattered. This was necessary because Nordstrøm’s risk profile is not uniform across the group: offshore gas, renewable generation, infrastructure, and trading support all carry different operational pressures and regulatory meanings.

The reconstructed evidence trail showed the following progression:
- Phase 1: public-surface review, asset and dependency mapping, and a controlled foothold on a lower-risk peripheral asset
- Phase 2: targeted escalation on a higher-value support and identity boundary, where proof validated a trust-boundary weakness relevant to strategic planning
- Deferred scope: wider OT exploitation, broad process-system testing, destructive validation, and open-ended service enumeration beyond the agreed perimeter

## 3. Threat profile synthesis (post-execution)

The post-execution threat synthesis confirms that Nordstrøm’s exposure sits at the intersection of energy-sector operational criticality, cross-border governance complexity, and incomplete integration maturity in Germany.

### Group-level pattern
At group level, the most material threat actors are:
- state-aligned or infrastructure-focused actors with interest in energy dependencies;
- extortion-oriented ransomware groups targeting business continuity and operational trust;
- insider or third-party abuse through privileged access, remote support, and contractor pathways;
- supply-chain or partner-compromise actors, especially where integration or trust relationships are changing.

The group’s strategic risk is not a single control failure. It is the combination of several high-risk seams: remote access, administrative trust, supplier dependency, and transitional control maturity during the German acquisition. That pattern lowers the threshold for adversary success because the attacker needs only the weakest trust boundary or the least-regulated identity path to start moving toward a more meaningful target.

### Country-specific readout
- Norway: offshore gas and remote operations present the highest operational-continuity risk. Exposure is driven by remote maintenance flows and trust in operational support paths.
- Sweden: hydro and wind sectors are less obviously exposed to direct process compromise than Norway or the Netherlands, but they remain exposed through generation telemetry, commercial balancing systems, and vendor integrations.
- Denmark: offshore wind and trading-support systems create a dual exposure between operations and market integrity. The key issue is that the attack surface is both operational and commercial.
- Netherlands: gas and hydrogen infrastructure create the highest process-safety and service-continuity risk. A compromise there would be a governance issue as much as a security issue.
- Germany: the acquisition creates the most acute integration risk. Legacy and acquired environments are still being aligned, which creates transient trust boundaries and identity drift that an attacker can exploit before governance catches up.

## 4. Scope delivered and deferred

### Delivered
- Group-level strategic baseline and risk framing
- Public-surface reconnaissance and targeted attack-surface review
- Asset and dependency mapping across the group
- Controlled foothold validation on a lower-risk peripheral service
- Targeted escalation on a higher-value support and trust-boundary asset
- Board-ready synthesis of strategic risk and governance implications

### Deferred
- Broad OT testing or live process-system validation
- Destructive or disruptive exploitation against production operations
- Full enumeration of every legacy and local environment across all subsidiaries
- Deep exploitation of the German acquisition without independent validation of the inherited boundary conditions
- Full physical or engineering review of operational infrastructure outside the agreed digital perimeter

This deferral was an architect decision, not a limitation of the evidence. The risk was concentrated in the trust and access boundary, and the testing was designed to validate that path rather than to escalate into operationally risky territory.

## 5. Findings by subsidiary and IT/OT (environmental CVSS, prioritised)

### Priority summary
| Priority | Subsidiary / domain | Area | Environmental CVSS | Rationale |
| --- | --- | --- | --- | --- |
| P1 | Germany (integration) | IT / identity and trust boundary | 9.3 | Incomplete integration creates unstable trust paths and privilege drift. High likelihood of successful lateral progression. |
| P1 | Netherlands | OT-adjacent / infrastructure | 9.1 | Process and infrastructure sensitivity combined with remote-support dependencies heighten consequence. |
| P1 | Norway | OT-adjacent / offshore support | 8.9 | Operational continuity and remote maintenance exposure make the risk material even without direct process compromise. |
| P2 | Denmark | IT / trading support and offshore operations | 8.4 | Business and operational consequences are significant; commercial and technical sensitivity are both high. |
| P2 | Sweden | IT / generation and vendor support | 7.8 | Material but less urgent than the highest-risk process-adjacent domains. |

### Findings by subsidiary

#### Norway — Offshore gas
- Finding: weak trust-boundary validation between peripheral support and higher-value operational support assets.
- Domain: OT-adjacent and IT support boundary.
- Environmental CVSS: 8.9 (High to Critical depending on operational dependency and remote-support intensity).
- Priority: P1.
- Business implication: a compromise of the support boundary could affect continuity, operational confidence, and regulatory evidence of control.

#### Sweden — Hydro and wind
- Finding: external service and vendor dependencies create a manageable but real path for identity or credential abuse.
- Domain: IT and operational support.
- Environmental CVSS: 7.8.
- Priority: P2.
- Business implication: impact is serious but mainly operational and governance-driven rather than immediate process disruption.

#### Denmark — Offshore wind and trading support
- Finding: trading and operational support surfaces are connected to more sensitive operating data than the public surface suggests.
- Domain: IT and OT-adjacent.
- Environmental CVSS: 8.4.
- Priority: P2.
- Business implication: could affect both commercial confidence and operational integrity.

#### Netherlands — Gas and hydrogen infrastructure
- Finding: process-support trust boundaries and remote-access profile are more sensitive than a generic utility review would suggest.
- Domain: OT-adjacent and infrastructure support.
- Environmental CVSS: 9.1.
- Priority: P1.
- Business implication: consequence is high because the domain sits close to essential service continuity and infrastructure safety.

#### Germany — New acquisition / integration
- Finding: transitional identity, access, and trust boundaries remain unstable during integration.
- Domain: IT and integration seam.
- Environmental CVSS: 9.3.
- Priority: P1.
- Business implication: this is the most urgent organisational risk because it combines incomplete control alignment with a recent acquisition and cross-border governance complexity.

## 6. Strategic-plan recommendations (country-specific NIS2)

The recommendations below are designed as inputs to Elin’s three-year plan and are framed for governance use, not only vulnerability remediation.

1. Prioritise identity and trust-boundary hardening across the group
   - Treat this as a group-level programme, not a local IT fix.
   - Apply especially to Germany and the support-to-operational boundaries in Norway and the Netherlands.
   - NIS2 relevance: this supports risk management, incident readiness, and control documentation for entities in essential or important roles.

2. Separate operational support, partner access, and admin flows by design
   - Do not let partner support or administrative interfaces reach operationally sensitive data without strict independent validation.
   - NIS2 relevance: reduces the chance of service-continuity and governance failure across essential entities.

3. Stabilise the German integration plan with explicit governance checkpoints
   - Require clear identity ownership, integration validation, and evidence of control reconciliation before adding new trust links.
   - NIS2 relevance: Germany’s acquisition context creates a fresh regulatory and operational risk profile that must be managed in real time.

4. Create a cross-subsidiary OT-adjacent risk review programme
   - Norway and the Netherlands should be treated as priority domains for deeper review of remote maintenance and process-support trust boundaries.
   - Denmark and Sweden should be integrated into a scaled framework for generation and market-support dependencies.

5. Build a board-ready assurance pack
   - Maintain a consistent evidence set across entities to support NIS2, continuity review, and internal governance decisions.
   - This is essential when the board asks how the company is proving control maturity over time.

## 7. Engagement continuation proposal

### Phase 3 — OT deep-dive
Objective: validate the highest-risk OT-adjacent dependencies in Norway, the Netherlands, and Denmark, building on the evidence from the public and support-surface review.

Scope: remote-maintenance review, process-support trust boundaries, privileged access to OT-adjacent paths, and control integrity evidence.

Suggested value: EUR 280,000–360,000 depending on the number of confirmed critical interfaces and the level of engineering support required.

### Phase 4 — German subsidiary integration review
Objective: stabilise the German acquisition security posture and validate the integration boundary before full expansion of the strategic plan.

Scope: identity, trust boundary, vendor links, inherited system review, and targeted evidence validation of the integration seam.

Suggested value: EUR 200,000–250,000.

### Retainer proposal
If the initial engagement lands successfully, a strategic retainer of EUR 150,000–250,000 per quarter is appropriate to provide ongoing board-level advisory support, annual risk refresh, and regulatory alignment across all five subsidiaries. This retainer would not replace technical assurance work; it would support the governance, prioritisation, and executive review needed for a multi-jurisdictional energy enterprise.

## 8. Limitations and uncertainty

This report should be read as a strategic, board-facing assessment based on a controlled and bounded evidence set, not as a full operational or engineering certification. The work did not include destructive testing, broad OT exploitation, or live process-system manipulation. The value of the evidence is that it confirms the existence of a meaningful trust and identity problem on the tested geometry, but it does not claim to cover every operational path or every inherited system in the group.

The main uncertainty is not whether the risk exists; it is the exact size and distribution of the exposure across every local deployment, vendor integration, and inherited system. That is why the recommendation is phased and strategic. Nordstrøm should not overstate the current maturity of the estate or underestimate the importance of the German integration seam. The prudent position is to treat this as a governance and control-seam problem that has become visible in the technical evidence.

## 9. Appendices

### Appendix A — detailed findings by asset class
- Public-facing surface and partner-support exposure
- Identity and remote-access trust boundary issues
- Operational support and OT-adjacent path risk
- German acquisition and integration risk

### Appendix B — threat profile details
- Threat actor-to-asset mapping by subsidiary
- Technique relevance using ATT&CK and ATT&CK for ICS
- Rationale for country-specific priorities

### Appendix C — methodology adaptations applied
- PTES phased to value not breadth
- ATT&CK and ICS mapping applied to OT-adjacent concerns
- OWASP used for web and application trust boundaries
- NIST 800-53 used for board and NIS2 governance framing

### Appendix D — Phase 1 and Phase 2 evidence summary
- public-surface reconnaissance results
- low-risk peripheral foothold observed under controlled conditions
- higher-value asset boundary validation and proof of trust confusion
- cleanup and restoration verification

This report provides the CISO and the board with a strategic view of the risk and a reasoned plan for action. The main point is not to alarm the organisation; it is to give Nordstrøm the evidence needed to act before the risk becomes a governance or operational problem at scale.

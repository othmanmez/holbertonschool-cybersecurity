# Scope Architecture, Nordstrøm Power Group

## In scope / Out of scope (per subsidiary, IT and OT)

### Group-level in scope
- Group cyber governance, regulatory mapping, and risk ownership across the five subsidiaries
- Cross-entity review of identity, remote access, supplier and contractor access, and critical dependency paths
- Board-ready strategic assessment of the holding, with emphasis on decision-critical risk concentrations
- Technical validation of agreed enterprise and subsidiary attack surfaces, limited to in-scope systems and evidence sources
- Risk and control review of OT-adjacent systems where they materially affect business continuity, safety, or critical service delivery
- Review of the recent German acquisition integration state and the risk introduced by transitional controls
- Production of a phased remediation roadmap tied to NIS2-driven and board-level governance decisions

### Group-level out of scope
- Full OT red-team or physical sabotage testing beyond the defined perimeter and approved systems
- Deep technical exploitation of live industrial control, process, or safety systems not expressly approved
- Full-country-specific legal advice or external regulator representation
- The design, implementation, or warranty of new control systems or remediation projects
- Continuous monitoring deployment, SOC build-out, or organisational redesign beyond the assessment and roadmap
- Broad public-sector or tax authority compliance benchmarking outside the sectors and holdings relevant to Nordstrøm

### Norway (offshore gas) — in scope
- Offshore production support environment, operator interfaces, remote access paths, and critical process-support systems
- Asset inventory and segmentation review for critical process and remote-monitoring components
- Identity and contractor access review for offshore support and engineering teams
- OT/IT integration dependency analysis, with special attention to remote maintenance and telemetry paths

### Norway — out of scope
- Direct field operations, vessel safety systems, or physical inspections of offshore infrastructure
- Live exploitation of real process control or safety-critical equipment outside the agreed test perimeter

### Sweden (hydro and wind) — in scope
- Renewable generation and operational support systems, telemetry and control interfaces, and business continuity dependencies
- Review of grid and market-facing platforms where availability and operational trust are materially exposed
- Identity, remote support, and vendor access controls for generation assets and their support environment

### Sweden — out of scope
- Detailed power-market or trading-engine code review unrelated to cyber risk and control posture
- Full physical asset or turbine inspection beyond the agreed digital and operational-support environment

### Denmark (offshore wind and trading) — in scope
- Offshore wind operational systems, production and scheduling interfaces, and trading-support infrastructure
- Cross-boundary review of operational data feeds feeding commercial and market-facing platforms
- Analysis of remote access and service-provider dependencies for offshore generation and market support systems

### Denmark — out of scope
- Full historical transaction audit or trading model validation unrelated to cyber exposure
- Deep penetration of market infrastructure outside the defined Nordstrøm perimeter

### Netherlands (gas and hydrogen infrastructure) — in scope
- Gas and hydrogen infrastructure governance, network access models, and critical operating support systems
- Review of identity and privileged access to engineering, maintenance, and remote infrastructure functions
- IT/OT dependency mapping for process, telemetry, and safety-adjacent control flows

### Netherlands — out of scope
- Real-world process-control manipulation or safety-system testing
- Full physical pipeline or infrastructure assessment beyond the digital and operational-support scope

### Germany (recently acquired solar utility) — in scope
- Review of the newly integrated environment, identity federation, privileged access, and asset inventory gaps
- Assessment of acquisition-phase security controls, data flows, and transition risks at the boundary between legacy and acquired systems
- Independent validation of the post-acquisition control baseline and high-risk integration seams

### Germany — out of scope
- Full legacy-system rehabilitation or redesign beyond the assessment and roadmap need
- Detailed source-code review of commercial or proprietary software outside the in-scope network and application surfaces

## Phase 1 — Strategic baseline and risk framing
- Perimeter | Group-level governance, major subsidiary risk taxonomy, core dependency map, regulatory context, German integration risk, board decision drivers
- Methodology depth | Executive and strategic review; threat model synthesis; existing controls and governance review; targeted interviews; limited evidence review; risk ranking by consequence and likelihood
- Deliverable | Baseline risk register, strategic threat profile, engagement scoping memo, key questions for subsidiary validation, initial board-ready findings
- Duration | 3 weeks
- Consultant-days | 30–35 days
- Commercial rationale: why this phase, this point, this cost, this client | This is the phase that prevents the engagement from becoming a generic “we do everything” exercise. The client’s board deadline is 90 days, and the true commercial value at this stage is not finding every bug; it is establishing a defensible strategic frame, identifying the highest-value risk concentrations, and preventing scope drift across five subsidiaries. This phase is deliberately compact and strategic, because Nordstrøm is still scoping what it needs, and the cost is set to gain board trust while preserving the right to deepen scope only where evidence justifies it. The German acquisition and the cross-border NIS2 context make the brief more complex than a single-country utility review, so a group baseline is the right first investment before any technical testing expands. It is a premium-priced phase because it creates the architecture needed for all later work, but it is deliberately not an exhaustive technical assessment.

## Phase 2 — Perimeter validation and technical evidence collection
- Perimeter | Selected critical systems and interfaces across the five subsidiaries, prioritised by business impact, regulatory significance, and group dependency exposure; Germany treated as a separate validation track because of ongoing integration
- Methodology depth | PTES-aligned reconnaissance, asset inventory validation, architecture review, external exposure review, identity and access review, remote-access mapping, and limited technical validation on agreed test surfaces
- Deliverable | Validated attack-surface map, critical asset register, likely exposure paths, evidence-backed priority list, risk concentration and dependency narrative for the board and technical stakeholders
- Duration | 5 weeks
- Consultant-days | 70–85 days
- Commercial rationale: why this phase, this point, this cost, this client | This is the first value-bearing technical phase, because it converts strategic concerns into evidence. We do not “test everything” in a holding company spanning energy assets and jurisdictions; we validate the paths that matter most to the board and to operational continuity. The client is right to care about the German integration seam, offshore remote access, and identity drift because these concentrate risk more than generic asset counts. The cost is justified by the mix of technical validation, evidence quality, and cross-entity coordination required to make the findings credible in a board setting. It is a technical phase but still disciplined: we validate agreed surfaces, not the entire operational environment, and we preserve the architecture posture by refusing to open a broad OT scope without evidence that the business case supports it.

## Phase 3 — Targeted deep dive on priority subsidiaries and critical domains
- Perimeter | Norway offshore gas and Netherlands infrastructure as the highest operational consequence domains; Denmark trading-support surfaces; Sweden generation support and vendor links; Germany targeted review of integration seams and elevated trust relationships
- Methodology depth | Deeper technical validation of high-risk paths identified in Phase 2, targeted control testing, privileged access review, OT-adjacent dependency review, segmentation validation, and supplier trust assessment where relevant
- Deliverable | Subsidiary-specific risk assessments, priority findings with technical and commercial context, recommended remediation sequencing, and a defensible set of board-ready decision points
- Duration | 6 weeks
- Consultant-days | 90–110 days
- Commercial rationale: why this phase, this point, this cost, this client | This is the phase that turns a general holding-level health check into a decision-grade risk narrative for the board and the CISO. It is placed after the group baseline and perimeter validation because the client should not pay for deep drilling into every subsidiary before it knows which domains are material. The additional cost is justified by the need for country-specific nuance, sector-specific dependency mapping, and technical validation of the few systems that can actually move the risk needle. In a multi-jurisdictional energy holding, the value is not equal across subsidiaries: the offshore gas, infrastructure, and integration-boundary assets justify far deeper work than generic enterprise platforms do. This phase is therefore the commercial “pay for precision” stage.

## Phase 4 — Roadmap, governance, and executive package
- Perimeter | Full remediation roadmap, governance model, board narrative, regulatory and NIS2 alignment, control sequencing, and execution plan across the subsidiaries
- Methodology depth | Strategic synthesis of all evidence, remediation prioritisation, governance structure recommendations, control ownership mapping, and decision support for the board and executive committee
- Deliverable | Three-year strategic plan support package, remediation programme, board-ready executive summary, risk ownership matrix, and phased implementation plan
- Duration | 3 weeks
- Consultant-days | 25–30 days
- Commercial rationale: why this phase, this point, this cost, this client | This final phase is the professional bridge from test findings to business decision. It is not a fifth “do more testing” phase; it is the point at which we turn evidence into a plan the client can actually fund, govern, and defend. For Nordstrøm, the real value is in sequencing changes across a complex holding without over-focusing on one subsidiary or underestimating the German integration risk. The cost is moderate because the client is buying synthesis, prioritisation, and a board-grade translation layer, not additional testing for its own sake. This is exactly the phase that gives the CISO a credible strategic plan and gives Vanguard a defensible commercial position: we are not selling a broad undefined exercise, we are selling a phased architecture that matches the client’s risk surface and decision timetable.

## Deliberate exclusions and deferrals
- No active OT exploitation beyond the approved, highest-risk and lowest-impact test surfaces
- No broad forensic review of every vendor, contractor or legacy subsystem across the group at the start of the engagement
- No commitment to a full asset-by-asset testing programme before the strategic baseline and risk concentration map are validated
- No assumption that Germany, Denmark, or any other subsidiary requires equal effort without evidence and regulatory context
- No completion of a formal risk decision or control design package on systems still in acquisition or migration without a defined evidence boundary and clear governance of prior-audit dependency

These exclusions are intentional: they protect the commercial value of the engagement, keep the scope contractable, and ensure the client receives the strategic and technical output it actually needs within 90 days, without overreaching into areas that would create unpriced scope expansion or ambiguity.

# 6x01 Strategists Lens

This folder contains the three strategic threat-modeling and reporting engagements completed for the Vanguard Security training track.

## Engagement 1: Meridian Federal Bank
- Framework: STRIDE
- Deliverables:
  - `1-threat_model_meridian.md`
  - `1-report_meridian.md`
- Focus: hybrid migration risk during a six-week dual-running window between legacy mainframe and AWS/on-prem architecture.
- Key themes: trust boundaries, shared identities, integration tampering, and banking operational risk under SOX/GLBA/OCC obligations.

## Engagement 2: Sundara Lifestyle
- Framework: PASTA
- Deliverables:
  - `2-threat_model_sundara.md`
  - `2-report_sundara.md`
- Focus: EU expansion risk, board-level launch decision, and cross-border customer data exposure under PDPA and GDPR.
- Key themes: loyalty-account compromise, payment abuse, geolocation/privacy risk, third-party exposure, and the decision to delay launch if the data model is not hardened.

## Engagement 3: Helix Aerospace Systems
- Framework: MITRE ATT&CK
- Deliverables:
  - `3-threat_model_helix.md`
  - `3-report_helix.md`
- Focus: contractual cyber resilience against named adversary clusters in a sovereign, multi-tenant defense-adjacent SaaS environment.
- Key themes: multi-tenant isolation, identity abuse, cloud control-plane risk, adversary technique mapping, and emerging TTP annotation.

## Overall objective
The work demonstrates the disciplined use of different threat-modeling frameworks depending on the client context, regulatory environment, audience, and decision being supported.

## Notes
- Meridian is a technical architecture risk review.
- Sundara is a board-level decision support exercise.
- Helix is a contract-driven resilience review for BSI/DGA stakeholders.

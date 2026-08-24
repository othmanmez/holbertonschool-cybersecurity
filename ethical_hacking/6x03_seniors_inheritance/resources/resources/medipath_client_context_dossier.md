# MediPath Client Context Dossier

This dossier is the client-context layer Sarah assembled but did not integrate into the raw technical report. Use it together with `sarahs_raw_findings.md`.

## Dossier contents

1. [Architecture overview](medipath_architecture_overview.md)
2. [Organization chart and stakeholder responsibilities](medipath_organization_chart.md)
3. [Asset criticality and regulatory map](medipath_regulatory_map.md)
4. [Compensating controls and control ownership](medipath_compensating_controls.md)
5. [Business and operational metrics](medipath_business_metrics.md)
6. [Evidence index](evidence_index.md)

## Client profile summary

MediPath Diagnostics is a Lyon-based diagnostic pathway SaaS provider operating in France, Belgium, and the Netherlands. The platform serves 400 medical-analysis laboratories and supports prescription intake, sample tracking, result delivery, and hospital-system integrations.

The company is HDS-certified and is preparing for a renewal audit. The platform processes personal health data and therefore treats confidentiality, integrity, traceability, retention, and service continuity as audit-committee concerns rather than purely technical concerns.

## Engagement interpretation rules

- Sarah's scores are inherited **base CVSS v3.1 scores**, not final environmental decisions.
- Compensating controls may reduce practical exposure but do not automatically erase a weakness.
- Health-data sensitivity, diagnostic workflow integrity, and regulatory accountability may increase environmental severity.
- Intended, authorized functionality should not remain a live finding when the control design and enforcement are adequately evidenced.
- Findings with a shared root cause may be consolidated, but each original manifestation must remain traceable.
- Client metrics are fictional engagement data supplied for this training project and may be used as stated assumptions in business-impact models.

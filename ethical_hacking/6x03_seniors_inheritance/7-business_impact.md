# Business Impact Quantification

## Item: F-01/F-10
- Range: EUR 1,400,000 to EUR 9,500,000 (central estimate EUR 4,800,000)
- Reasoning: The primary drivers are healthcare-data confidentiality exposure across tenant boundaries, the need to notify regulators and affected laboratories, and reputational loss from a multi-laboratory data-access issue in a regulated environment. Additional exposure comes from service disruption and customer churn if laboratories lose confidence in MediPath's tenant isolation and result-delivery integrity, especially as the platform serves 400 laboratories and operates in a renewal cycle with HDS scrutiny.
- Assumptions:
  - 5 to 20 laboratories are materially affected, depending on how quickly tenant boundaries are confirmed to fail.
  - 10,000 to 75,000 patient records are at issue in the plausible scenario for cross-laboratory disclosure.
  - Regulatory response includes DPO review, data-subject notifications, and technical investigation costs of EUR 150,000 to EUR 400,000.
  - Customer churn assumption: 0.5% to 2% laboratory churn over the following 12 months, equivalent to EUR 156,000 to EUR 624,000 in recurring revenue.
  - Operational disruption assumption: 24 to 96 hours of elevated support, manual reconciliation, and executive incident handling, with service-credit or productivity impact of EUR 100,000 to EUR 600,000.

## Item: F-03/F-09
- Range: EUR 1,100,000 to EUR 7,200,000 (central estimate EUR 3,200,000)
- Reasoning: The cost drivers are privileged access misuse, integration trust abuse, and administrative session persistence, which can create both confidentiality and integrity harm without needing a public exploit. In a healthcare SaaS, the response burden includes identity review, token rotation, incident investigation, and the risk of delayed or manipulated result workflows across partner integrations.
- Assumptions:
  - The issue is treated as a single high-severity identity and authorization failure affecting a major integration boundary or administrative plane, not a complete platform outage.
  - One to three hospital integrations or administrative sessions are materially affected; downstream impact is limited to a subset of partner workflows rather than all 400 laboratories.
  - Direct incident-response and forensic costs are EUR 200,000 to EUR 500,000.
  - Regulatory and contractual exposure is moderate rather than full-scope platform compromise, with a plausible total scenario of EUR 250,000 to EUR 800,000 in legal and compliance work.
  - Customer confidence and labor-intensive remediation are assumed to create EUR 500,000 to EUR 2,000,000 in indirect business cost over the remediation and renewal window.

## Item: F-05
- Range: EUR 450,000 to EUR 2,800,000 (central estimate EUR 1,100,000)
- Reasoning: The principal business consequence is laboratory workflow integrity loss, where falsified sample-status events can mislead downstream processing, result release, or operational teams. The regulatory and reputational impact is lower than direct patient-data exposure, but the financial loss rises if false states create a backlog or lead to manual rework and customer complaints across the workflow network.
- Assumptions:
  - Only a subset of partner integrations is affected, and no widespread patient-data disclosure occurs.
  - 1 to 8 hours of operational disruption for the most impacted laboratories, with manual validation and support costs of EUR 100,000 to EUR 500,000.
  - 0.1% to 0.5% laboratory churn or service-damage risk is assumed, equivalent to EUR 31,000 to EUR 156,000 in annual recurring revenue.
  - Compliance and remediation costs are EUR 150,000 to EUR 400,000.

## Item: F-06
- Range: EUR 350,000 to EUR 2,100,000 (central estimate EUR 900,000)
- Reasoning: This is predominantly a retention and accountability issue for regulated health data, with the strongest cost drivers being DPO review, certification evidence work, and the risk of delay or defect in the HDS renewal pack. The operational cost is moderate unless the retention mismatch affects a large export volume; the main business risk is audit and governance perception rather than a direct service outage.
- Assumptions:
  - The volume of affected exports is limited to a subset of active packages or historical retrieval windows, rather than the full platform population.
  - Remediation and audit-readiness work costs EUR 100,000 to EUR 350,000.
  - Notification and legal review costs are EUR 80,000 to EUR 250,000.
  - Reputational and renewal-strategy impact is assumed to be moderate, with a business cost of EUR 150,000 to EUR 600,000.

## Item: F-02
- Range: EUR 180,000 to EUR 1,200,000 (central estimate EUR 520,000)
- Reasoning: The main cost is the potential for support-portal abuse by a privileged internal user to inject or alter content in a cross-tenant workflow. The issue is less severe than a result-data or access-control failure, but it still creates risk for support workflow integrity, internal trust, and administrative control over multi-laboratory operations.
- Assumptions:
  - Exploitation is limited to internal support personnel and managed workstations, with no public exploit path.
  - Direct remediation and browser hardening costs are EUR 60,000 to EUR 200,000.
  - Operational response and support retraining costs are EUR 50,000 to EUR 180,000.
  - Reputational and assurance impact is limited but non-zero, with estimated downstream cost of EUR 70,000 to EUR 400,000.

## Item: F-08
- Range: EUR 120,000 to EUR 800,000 (central estimate EUR 350,000)
- Reasoning: This issue creates account-discovery and targeted phishing or identity-attack opportunities, but the effect is reduced by the use of SSO and MFA for most laboratory users. It remains relevant because account discovery is a precursor to higher-impact attacks and because the healthcare context makes targeted identity abuse more consequential than a generic account-enumeration issue.
- Assumptions:
  - Most user accounts are covered by SSO and MFA, so the issue is concentrated in a subset of local or support-style accounts.
  - No widespread account takeover occurs; the exposure is primarily targeting and reconnaissance.
  - Costs are concentrated in monitoring, rate limiting, and user awareness work, with EUR 40,000 to EUR 150,000 in direct controls and EUR 80,000 to EUR 300,000 in indirect operational and reputational adjustment.

## Item: Chain 1
- Range: EUR 4,500,000 to EUR 18,000,000 (central estimate EUR 9,600,000)
- Reasoning: This chain combines broad identity drift with tenant-boundary failure and turns a technical authorization problem into a plausible multi-laboratory health-data exposure. The cost drivers include regulatory response, data-subject notification, customer churn from affected laboratories, board-level governance attention, and the risk that the HDS renewal evidence is materially weakened during an active compliance cycle.
- Assumptions:
  - 10% to 30% of laboratories are materially affected in a realistic operational scenario, depending on tenant-visibility and token reachability.
  - 50,000 to 250,000 patient records are affected across the impacted laboratories; this is large enough to trigger serious DPO and legal review.
  - The upper bound is shaped by the RGPD sanctions ceiling of up to 4% of global annual revenue, which is EUR 1.248 million, but the practical range also includes recovery, service-credit, reputation, and churn costs that move the total above the sanction ceiling.
  - Business disruption and manual reconciliations are assumed to last 3 to 10 days, with direct operational costs of EUR 800,000 to EUR 3,000,000.

## Item: Chain 2
- Range: EUR 3,800,000 to EUR 15,500,000 (central estimate EUR 8,100,000)
- Reasoning: This chain is particularly damaging because it combines workflow manipulation with cross-tenant data exposure, creating both diagnostic integrity risk and confidentiality risk. The business impact is not limited to a simple breach count; it includes the possibility of false sample statuses, delayed or incorrect result release, customer trust damage, and regulatory scrutiny around both data processing and operational continuity.
- Assumptions:
  - A subset of partner integrations and high-importance workflow lanes are affected, but not necessarily every laboratory.
  - 5% to 15% of laboratory customers are assumed to experience operational friction or require manual escalation during the containment period.
  - The range includes forensic response, partner and customer communications, workflow correction costs, and a moderate but material reputational hit tied to medical-pathway trust.
  - The upper bound is not a legal maximum but reflects the combined effect of operational disruption, customer retention risk, and compliance expenditure during a high-stakes HDS cycle.

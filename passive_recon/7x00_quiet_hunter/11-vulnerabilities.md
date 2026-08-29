# Vulnerabilities Identified — Helix Maritime Insurance

This section synthesises the passive findings from Tasks 1 through 10 into a focused set of OSINT-exploitable vulnerabilities. Each item below is grounded only in findings already documented in the Movement 1 notes and cross-checked against corroborating evidence. The value of the analysis is not the volume of evidence; it is the way the evidence reveals recurring weaknesses in Helix's public posture and operational discipline.

## Vulnerability 1: Exposed corporate identity and staff naming pattern enable targeted spear-phishing
- Description: The company exposes a clear internal naming convention and senior leadership identities through PDF metadata, job-posting attribution, and employee-profile triangulation. This allows an attacker to infer the corporate email format and target specific executives or technical leaders with highly tailored phishing lures. A regulated financial-services organisation with a strong executive footprint is especially exposed to this form of pretexting.
- Source findings: `3-pdf_metadata_notes.md` Finding 1, `7-jobs_notes.md` Finding 3, `9-employee_notes.md` Finding 1
- Risk level: high. Rationale: the combination of executive identification, employee-role validation, and an extractable corporate email pattern creates a credible and scalable phishing path against senior staff. In a financial-services environment, this can materially accelerate credential compromise or fraud.
- Exploitation potential: social engineering

## Vulnerability 2: Forgotten staging and legacy infrastructure reveal an unmanaged public DNS perimeter
- Description: Passive DNS and certificate records expose staging and legacy subdomains that were left publicly discoverable. Such names often reveal test environments, internal routing logic, historical applications, and operational drift. Even if not directly accessible to an attacker, they provide valuable intelligence for follow-on phishing, brand impersonation, and attack-surface mapping.
- Source findings: `1-dns_notes.md` Finding 1, `1-dns_notes.md` Finding 2
- Risk level: medium. Rationale: the findings are not direct exploitation paths by themselves, but they reveal an operational weakness in DNS hygiene. For an attacker, these records are useful recon primers and can support social engineering, lookalike domains, and discovery of internal naming schemes.
- Exploitation potential: technical

## Vulnerability 3: Internal developer and framework identifiers leak operational context to external observers
- Description: Public source code, developer profile cross-references, and technical job postings disclose both the framework type and the developer identities associated with internal tooling. This leaks the internal stack and provides a catalogue of likely entry points for technical targeting, especially against developers and platform administrators. A public code footprint can also reveal internal package naming, architecture assumptions, and project ownership.
- Source findings: `2-source_code_notes.md` Finding 2, `2-source_code_notes.md` Finding 3, `7-jobs_notes.md` Finding 2, `9-employee_notes.md` Finding 2, `10-stack_notes.md` Finding 1
- Risk level: high. Rationale: the combination of exposed internal API references, framework versioning, and developer identity links allows a threat actor to tailor technical reconnaissance or social engineering against the most relevant technical personnel. The risk is amplified by the fact that Helix is a regulated insurance and brokerage organisation with a relatively discoverable technical footprint.
- Exploitation potential: supply chain and technical

## Vulnerability 4: Historical archive data proves the organisation removed or changed senior and partner information without cleaning the public record
- Description: Archived pages show executive and partner details that are no longer reflected on the current site. This indicates weak governance over public-facing historical records and may expose former decision-makers, old partner relationships, or previously active business structures. These changes are useful to attackers seeking continuity of people, process, and organisational authority across time.
- Source findings: `4-web_archive_notes.md` Finding 1, `4-web_archive_notes.md` Finding 2, `4-web_archive_notes.md` Finding 3
- Risk level: medium. Rationale: this risk is more about continuity and organisational intelligence than direct exploitation. However, it supports historical profiling, social engineering, and threat pretexting against former or disconnected staff who were part of internal structures no longer publicly active.
- Exploitation potential: social engineering

## Vulnerability 5: Public mail infrastructure and telecom metadata reveal corporate communication pathways and operational routines
- Description: The passive DNS and email metadata indicate a Microsoft 365-hosted mail environment and support the inference of networked business communications. Combined with the staff email patterns and direct phone data, this allows an attacker to model the communication surface of Helix with enough detail to craft realistic operational lures or impersonation attempts against employees and customers.
- Source findings: `1-dns_notes.md` Finding 3, `1-dns_notes.md` Finding 4, `3-pdf_metadata_notes.md` Finding 1, `9-employee_notes.md` Finding 3, `10-stack_notes.md` Finding 2
- Risk level: high. Rationale: the combination of identifiable email infrastructure, direct phone numbers, and staff role data creates a persuasive contact surface for impersonation, business-email compromise, or service impersonation campaigns. This is especially dangerous in a sector that relies heavily on relationship trust.
- Exploitation potential: social engineering and internal access

## Vulnerability 6: Public social media and gallery content leak roadmap information and internal project names
- Description: Helix's social and gallery content reveal future-facing project names, roadmap entries, and internal initiative details that should not be casually public. Exposed project names like upcoming integration or claims-pilot work give adversaries insight into the organisation's planned operations, dependencies, and areas of focus. This is a useful precursor for tailored social engineering and supply-chain targeting.
- Source findings: `8-social_notes.md` Finding 2, `8-social_notes.md` Finding 3
- Risk level: medium. Rationale: the information is operationally sensitive but not necessarily directly exploitable without further effort. It still gives an attacker a clearer understanding of Helix's next-stage priorities and reveals where vulnerability windows may emerge.
- Exploitation potential: supply chain and technical

## Vulnerability 7: Internal tool naming and operational context can be weaponised for impersonation and insider-style targeting
- Description: Publicly available interviews, press references, and job postings mention internal tools such as QuoteFlow and a broader internal underwriting stack. This gives an attacker a vocabulary of internal systems, operational workflows, and terminology that can be used in convincing impersonation or pretexting. The threat is amplified when combined with identified personnel and email patterns.
- Source findings: `5-press_notes.md` Finding 1, `7-jobs_notes.md` Finding 1, `7-jobs_notes.md` Finding 2, `9-employee_notes.md` Finding 2
- Risk level: medium. Rationale: the weakness is not a direct technical flaw in Helix's infrastructure; it is the exposure of operational language and internal systems. This materially improves attacker credibility in impersonation narratives and increases the chances of social-engineering success.
- Exploitation potential: social engineering and internal access

## Summary assessment
The strongest vulnerabilities are not isolated exposures but chains of evidence. The recurring pattern is clear: Helix leaks staff identity, operational language, internal governance signals, and business workflow context across multiple passive sources. Each individual finding, taken alone, is modest. Taken together, they support a coherent picture of an organisation where identity, routing, and operational context can be inferred with enough confidence to launch highly tailored attacks. This is exactly the kind of OSINT weakness that defenders should mitigate early because it exposes the organisation to social-engineering and reconnaissance pathways that are inexpensive for attackers and difficult for defenders to prevent only at the technical layer.

# OSINT Intelligence Report — Helix Maritime Insurance
Prepared by: Junior OSINT Analyst, Vanguard Security
For: Marcus Bauer, Lead Red Teamer, Vanguard Security
Date: 2026-08-29
Classification: Internal — Vanguard Red Team Only

## 1. Executive summary

Helix Maritime Insurance presents a compact but exploitable public footprint. The organisation's highest-value intelligence is not found in a single source but in the repeated convergence of identity, role, relationship, and technical-stack signals across passive sources. The strongest strategic finding is that Helix leaks enough operational context to support targeted social-engineering and partner impersonation at scale, while also exposing a manageable technical footprint that can be used to prioritise follow-on engagement planning.

The most important signal is the combination of staff-name patterns, leadership identification, PDF metadata, corporate mail routing, and public event references. Together, these create a credible targeting surface for executive phishing and impersonation against a regulated insurance broker environment. A second cluster of issues is rooted in the technical perimeter: staging and legacy subdomains, internal API references, and a public Drupal version signal all indicate controlled but imperfect hygiene around public-facing systems. Finally, public social and archived content reveal business continuity information, historical relationships, and currently unannounced operational plans that are valuable to an attacker seeking to impersonate a trusted project or partner.

From a red-team perspective, the recommended operating posture is to prioritise identity-driven attack paths over purely technical exploitation. The public DNS, document, social, and registry surfaces already provide enough validated information to target executive and technical personas with high credibility. The red team should proceed with plan development and scenario design against executive phishing, partner spoofing, and internal-technology targeting rather than assuming a significant exposed technical infrastructure attack surface.

## 2. Synthesized corporate profile

### 2.1 Organizational structure

Observed signals show Helix as a mid-size marine insurance broker headquartered in Rotterdam, with a strong leadership footprint and a visible operating relationship to the Dutch and Lloyd's market environment. The company is structured around a combination of executive leadership, underwriting and technical operations, and a visibly growing Singapore presence. Registry and role signals align around the headquarters at Wilhelminakade 1, Rotterdam, and the company appears to maintain a relationship with an active Lloyd's ecosystem and an Asia-Pacific expansion focus.

The strongest organisational signals are:
- the registry record confirming the legal headquarters and corporate identity (`6-registry_notes.md` Finding 1 and 2);
- leadership and technical-role attribution across employee and careers sources (`7-jobs_notes.md` Finding 3, `9-employee_notes.md` Finding 1 and 2);
- public statements and social signals indicating a relatively centralised internal communications model (`5-press_notes.md` Finding 1, `8-social_notes.md` Finding 1 and 2).

### 2.2 Technical surface

Helix's public technical surface is modest but not dull. The most meaningful signals are:
- a staged or forgotten public subdomain and a legacy expired certificate (`1-dns_notes.md` Finding 1 and 2);
- public static and metadata signals revealing the corporate site framework as Drupal 9.4.8 (`2-source_code_notes.md` Finding 3, `10-stack_notes.md` Finding 1);
- an exposed API path in public JavaScript (`2-source_code_notes.md` Finding 2);
- mail routing consistent with Microsoft 365-hosted infrastructure (`1-dns_notes.md` Finding 3 and 4, `10-stack_notes.md` Finding 2);
- a repeated technical stack fingerprint across job postings indicating Python-heavy internal development and the use of business-platform tooling such as Salesforce Financial Services Cloud (`7-jobs_notes.md` Finding 1 and 2).

This combination supports a coherent but not deeply exotic stack: a public web presence built on Drupal; employee communications delivered through a Microsoft-hosted mail system; internal tooling and underwriting operations centred on a business platform and Python-driven internal tooling; and a technical team visible in job adverts and public source references.

### 2.3 Social footprint

The social and public communications footprint is materially more operationally useful than the marketing footprint. Public press and conference materials reference internal tools, future events, and technology partners, while social posts reveal a community-management style and potentially sensitive project information. The social layer includes:
- internal-tool naming in press (`5-press_notes.md` Finding 1);
- event and office-opening announcements prior to public corporate publication (`8-social_notes.md` Finding 2);
- an inadvertently exposed whiteboard with roadmap references (`8-social_notes.md` Finding 3);
- employee and partner matter related to public contact details and communications channels (`9-employee_notes.md` Finding 3, `7-jobs_notes.md` Finding 1).

The social footprint is a richer source of operational leverage than the corporate website alone because it reveals the vocabulary of the business, the internal project names, and the human layer behind the organisation.

## 3. Vulnerabilities identified

The Movement 1 findings support the following vulnerabilities, validated and synthesized from Task 11.

### 3.1 Exposed corporate identity and staff naming pattern enable targeted spear-phishing
- Description: The corporate email pattern and leadership identities are discoverable through PDF metadata, job postings, and employee profiles.
- Source findings: `3-pdf_metadata_notes.md` Finding 1; `7-jobs_notes.md` Finding 3; `9-employee_notes.md` Finding 1.
- Risk: high. Rationale: a financial-services target with a public executive footprint is highly vulnerable to email-based impersonation.
- Exploitation potential: social engineering.

### 3.2 Forgotten staging and legacy infrastructure reveal unmanaged DNS perimeter
- Description: Staging and legacy subdomains remain visible in passive DNS and CT records.
- Source findings: `1-dns_notes.md` Finding 1 and 2.
- Risk: medium. Rationale: not directly exploitable by itself, but useful for impersonation and attack-surface mapping.
- Exploitation potential: technical.

### 3.3 Internal developer and framework identifiers reveal operational context
- Description: Exposed API references, framework versioning, and developer identities reveal the internal stack and technical ownership.
- Source findings: `2-source_code_notes.md` Finding 2 and 3; `7-jobs_notes.md` Finding 2; `9-employee_notes.md` Finding 2; `10-stack_notes.md` Finding 1.
- Risk: high. Rationale: the technical stack and internal ownership are now public enough to support targeted technical outreach.
- Exploitation potential: supply chain and technical.

### 3.4 Historical archive data shows organisational drift and removed relationships
- Description: Archived pages disclose removed executives and strategic partners.
- Source findings: `4-web_archive_notes.md` Finding 1, 2, 3.
- Risk: medium. Rationale: useful for social engineering and historical continuity mapping.
- Exploitation potential: social engineering.

### 3.5 Public mail infrastructure and direct phone data enable realistic trust abuse
- Description: Mail infrastructure, employee phones, and office identity signals provide a realistic contact surface for impersonation.
- Source findings: `1-dns_notes.md` Finding 3 and 4; `3-pdf_metadata_notes.md` Finding 1; `9-employee_notes.md` Finding 3; `10-stack_notes.md` Finding 2.
- Risk: high. Rationale: a direct contact channel plus role and mail structure significantly increases impersonation success.
- Exploitation potential: social engineering and internal access.

### 3.6 Social content leaks project names and roadmap details
- Description: Public gallery and social posts reveal project and operational roadmap details not meant to be public.
- Source findings: `8-social_notes.md` Finding 2 and 3.
- Risk: medium. Rationale: operational context is exposed, making future targeting more efficient.
- Exploitation potential: supply chain and technical.

### 3.7 Internal tool naming and operational vocabulary increase attacker credibility
- Description: Tools such as QuoteFlow and internal underwriting language are exposed in press and job postings.
- Source findings: `5-press_notes.md` Finding 1; `7-jobs_notes.md` Finding 1 and 2; `9-employee_notes.md` Finding 2.
- Risk: medium. Rationale: operational terms improve spear-phishing or impersonation quality without a direct technical compromise.
- Exploitation potential: social engineering and internal access.

## 4. Attack vectors recommended

The following vectors are the recommended attack paths for a red-team operational phase. They are grounded in Tasks 11 and 12 and each traces back to validated Movement 1 findings.

### 4.1 Executive spear-phishing and business-email compromise via trusted relationship context
- Entry point: the executive email surface and relationship context.
- Exploitation scenario: The attacker models the company email structure, identifies executive roles, and uses marketing, social, and conference references to design a realistic message from a trusted party. Message content references Helix's current initiatives, event participation, or a likely third-party relationship. This is especially effective because the organisation's public record already exposes partner, event, and staff context.
- OSINT prerequisites: `3-pdf_metadata_notes.md` Finding 1; `7-jobs_notes.md` Finding 3; `9-employee_notes.md` Finding 1; `8-social_notes.md` Finding 2; `5-press_notes.md` Finding 3.
- Probable business impact: compromise of executive credentials, direct financial fraud, or information theft with severe commercial impact.

### 4.2 Brand impersonation and lookalike-domain campaign using DNS and legacy naming patterns
- Entry point: forgotten staging or legacy subdomains plus naming conventions.
- Exploitation scenario: The attacker uses discovered staging/legacy names to build a realistic lookalike environment that mirrors internal naming or service workflows. This can be used for phishing, secure-submission impersonation, or partner-facing trust abuse. Because the public record also offers partner names and event context, the attacker can match the lookalike domain to a communication theme that feels legitimate.
- OSINT prerequisites: `1-dns_notes.md` Finding 1 and 2; `5-press_notes.md` Finding 3; `8-social_notes.md` Finding 2.
- Probable business impact: harvesting credentials, stealing client information, or undermining trust around Helix's operational and commercial communications.

### 4.3 Developer-targeted technical outreach using framework and public repo intelligence
- Entry point: internal API references and developer identities.
- Exploitation scenario: The attacker builds a technical pretext around the internal framework, job-posting stack requirements, and public repository references. This makes the outreach more credible to developers and technical staff than generic phishing. Because the public source also reveals internal tool names and platform requirements, the attacker can use operational terminology that would not be obvious to a non-technical recipient.
- OSINT prerequisites: `2-source_code_notes.md` Finding 2 and 3; `7-jobs_notes.md` Finding 2; `9-employee_notes.md` Finding 2; `10-stack_notes.md` Finding 1.
- Probable business impact: system access compromise through credential theft, malware delivery, or technical trust abuse.

### 4.4 Partner impersonation using historical and current relationship metadata
- Entry point: partner and conference ecosystem information.
- Exploitation scenario: The attacker uses the current partner list, the archived partner record, and social event announcements to pose as an existing ecosystem participant or conference organiser. This tactic is effective because it is grounded in the same public relationships Helix itself advertises to customers and staff.
- OSINT prerequisites: `4-web_archive_notes.md` Finding 2; `5-press_notes.md` Finding 3; `8-social_notes.md` Finding 2; `7-jobs_notes.md` Finding 1.
- Probable business impact: compromised vendor workflows, fraudulent procurement or project engagement, and theft of operational or financial information.

### 4.5 Employee and client impersonation via contact and social surface exploitation
- Entry point: direct phone numbers and public identity names.
- Exploitation scenario: The attacker uses direct phone numbers, community-manager attribution, and internal tool naming to pose as a trusted employee or service representative. This is especially useful in a broker environment where inter-personal trust and rapid decision-making are critical operational factors.
- OSINT prerequisites: `9-employee_notes.md` Finding 3; `8-social_notes.md` Finding 1; `7-jobs_notes.md` Finding 1 and 3; `5-press_notes.md` Finding 1.
- Probable business impact: fraud, data leakage, or operational disruption through impersonation at the human layer.

## 5. Targeting recommendations for the red team

### 5.1 Prioritized personas

1. Senior executive cluster: CFO, CISO/Security leadership, and board-facing operations staff. Rationale: these are the most likely to be targeted by executive email impersonation and they hold the highest-value access decisions.
2. Technical and platform staff: backend developers, platform operations, and internal tool administrators. Rationale: public stack intelligence and repository history make this group especially susceptible to technical pretexting.
3. Partner-facing or marketing staff: community manager, customer-facing staff, and sales/marketing personnel. Rationale: direct phone and public communication pathways make them convenient targets for spoofing and impersonation.

### 5.2 Prioritized vectors

1. Executive spear-phishing and business-email compromise.
2. Partner and event impersonation.
3. Developer-targeted technical outreach using internal stack and repository intelligence.
4. DNS/brand impersonation around staging and legacy naming drift.

### 5.3 Indicators of red-team readiness

The red team should be ready to plan a phase-two engagement when it can demonstrate:
- confirmed executive and technical target identities from passive sources;
- route-level or contact-level trust abuse opportunities;
- internal tool and platform vocabulary derived from public-facing evidence;
- event or partner context that supports plausible social-engineering campaigns;
- a clear distinction between current-state facts and historical artefacts.

The operational value of this OSINT package is that it reduces ambiguity before the engagement begins. The red team should not seek more breadth at this stage; it should focus on the highest-confidence social-engineering pathways and the most operationally relevant technical attack vectors.

## Appendix A: Source documentation

This appendix indexes accepted findings to the specific source notes files, lab source URLs, and corroborating sources used in the report. Historical sources are explicitly labelled as such. All entries below are confined to the fictional lab environment and are based on validated Movement 1 findings.

### A.1 DNS and subdomain findings
- `1-dns_notes.md` Finding 1 — Staging subdomain
  * Value: `staging.helix-maritime.example`
  * Source: `http://[PROVIDED_IP]/dns-intelligence/certificates`
  * Source date: certificate log entry / passive CT log record
  * Corroborating source: `1-dns_notes.md` Finding 2
- `1-dns_notes.md` Finding 2 — Legacy subdomain with expired SSL
  * Value: `legacy-portal.helix-maritime.example`
  * Source: `http://[PROVIDED_IP]/dns-intelligence/history`
  * Source date: historical DNS / expired certificate record
  * Corroborating source: `1-dns_notes.md` Finding 1
- `1-dns_notes.md` Finding 3 — Mail server IP
  * Value: `198.51.100.42`
  * Source: `http://[PROVIDED_IP]/dns-intelligence/history`
  * Source date: historical MX record reconstruction
  * Corroborating source: `10-stack_notes.md` Finding 2
- `1-dns_notes.md` Finding 4 — TXT record / provider indicator
  * Value: `v=spf1 include:_spf.helix-mail.example ~all`
  * Source: `http://[PROVIDED_IP]/dns-intelligence`
  * Source date: passive DNS record set
  * Corroborating source: `10-stack_notes.md` Finding 2

### A.2 Source code and web stack findings
- `2-source_code_notes.md` Finding 1 — Developer identifier in HTML comment
  * Value: `<!-- dev: j.vermeulen -->`
  * Source: `http://[PROVIDED_IP]/company/about`
  * Source date: HTML page response body
  * Corroborating source: internal staff attribution in later employee sources
- `2-source_code_notes.md` Finding 2 — Internal API endpoint
  * Value: `/api/v2/internal/quote-engine`
  * Source: `http://[PROVIDED_IP]/assets/app.bundle.js`
  * Source date: public JavaScript asset
  * Corroborating source: `7-jobs_notes.md` Finding 1 and 2
- `2-source_code_notes.md` Finding 3 — CMS exact version
  * Value: `Drupal 9.4.8`
  * Source: `http://[PROVIDED_IP]/`
  * Source date: page response header / meta tag
  * Corroborating source: `10-stack_notes.md` Finding 1

### A.3 PDF metadata findings
- `3-pdf_metadata_notes.md` Finding 1 — Creator email
  * Value: `m.devries@helix-maritime.example`
  * Source: `http://[PROVIDED_IP]/documents`
  * Source date: public PDF retrieval date
  * Corroborating source: `9-employee_notes.md` Finding 1
- `3-pdf_metadata_notes.md` Finding 2 — Internal employee name
  * Value: `Janneke Bakker`
  * Source: `http://[PROVIDED_IP]/documents`
  * Source date: public PDF metadata extraction
  * Corroborating source: `9-employee_notes.md` Finding 3
- `3-pdf_metadata_notes.md` Finding 3 — Internal tool or template
  * Value: `Helix-Brochure-Template-v2.indd`
  * Source: `http://[PROVIDED_IP]/documents`
  * Source date: PDF metadata extraction
  * Corroborating source: `5-press_notes.md` Finding 1
- `3-pdf_metadata_notes.md` Finding 4 — Original file path
  * Value: `C:\Users\j.bakker\Documents\Helix\Internal\Drafts\quarterly-q3.docx`
  * Source: `http://[PROVIDED_IP]/documents`
  * Source date: document properties / metadata
  * Corroborating source: `9-employee_notes.md` Finding 4

### A.4 Historical footprint findings
- `4-web_archive_notes.md` Finding 1 — Departed executive
  * Value: `Pieter van Houten, former CTO`
  * Source: `http://[PROVIDED_IP]/archive/2023/10/15/company/team`
  * Snapshot date: 2023-10-15
  * Corroborating source: current site comparison at `http://[PROVIDED_IP]/company/team`
- `4-web_archive_notes.md` Finding 2 — Removed strategic partner
  * Value: `Rotterdam Maritime Risk Partners`
  * Source: `http://[PROVIDED_IP]/archive/2023/06/12/company/partners`
  * Snapshot date: 2023-06-12
  * Corroborating source: current site comparison at `http://[PROVIDED_IP]/company/partners`
- `4-web_archive_notes.md` Finding 3 — Previous office address
  * Value: `Boompjes 270, 3011 XZ Rotterdam`
  * Source: `http://[PROVIDED_IP]/archive/2022/03/01/company/contact`
  * Snapshot date: 2022-03-01
  * Corroborating source: current site comparison at `http://[PROVIDED_IP]/company/contact`

### A.5 Press and public-communications findings
- `5-press_notes.md` Finding 1 — Internal tool named in interview
  * Value: `QuoteFlow (Helix proprietary underwriting tool)`
  * Source: `http://[PROVIDED_IP]/press/insurance-day-quoteflow-interview`
  * Source date: 2024-09-12
  * Corroborating source: `7-jobs_notes.md` Finding 1 and 2
- `5-press_notes.md` Finding 2 — Minor IT incident in communiqué
  * Value: `Email outage Q2 2024, attributed to provider migration`
  * Source: `http://[PROVIDED_IP]/press/q2-2024-communique`
  * Source date: 2024-07-08
  * Corroborating source: internal communications and operational context
- `5-press_notes.md` Finding 3 — Primary technology partner
  * Value: `NovaTech Insurance Platform`
  * Source: `http://[PROVIDED_IP]/press/lloyds-innovation-forum-2024`
  * Source date: 2024-06-20
  * Corroborating source: `8-social_notes.md` Finding 2

### A.6 Registry findings
- `6-registry_notes.md` Finding 1 — Registered headquarters address
  * Value: `Wilhelminakade 1, 3072 AP Rotterdam`
  * Source: `http://[PROVIDED_IP]/registry/helix-maritime-insurance`
  * Source date: 2024-01-15
  * Corroborating source: `9-employee_notes.md` Finding 4
- `6-registry_notes.md` Finding 2 — KvK registration number
  * Value: `24398476`
  * Source: `http://[PROVIDED_IP]/registry/helix-maritime-insurance`
  * Source date: 2024-01-15
  * Corroborating source: registry record and authority structure
- `6-registry_notes.md` Finding 3 — Share capital and founding date
  * Value: `€2,500,000 share capital; founded 2003-04-15`
  * Source: `http://[PROVIDED_IP]/registry/helix-maritime-insurance`
  * Source date: 2024-01-15
  * Corroborating source: company legal profile and historical corporate references

### A.7 Career and technology-stack findings
- `7-jobs_notes.md` Finding 1 — Internal CRM tool
  * Value: `Salesforce Financial Services Cloud`
  * Source: `http://[PROVIDED_IP]/careers/senior-underwriter`
  * Source date: role posting date
  * Corroborating source: `http://[PROVIDED_IP]/careers/portfolio-manager`
- `7-jobs_notes.md` Finding 2 — Primary programming language
  * Value: `Python`
  * Source: `http://[PROVIDED_IP]/careers/backend-developer`
  * Source date: posting date
  * Corroborating source: multiple technical postings in the careers portal
- `7-jobs_notes.md` Finding 3 — Hiring manager
  * Value: `Sander de Boer, Head of Technical Operations`
  * Source: `http://[PROVIDED_IP]/careers/backend-developer`
  * Source date: posting date
  * Corroborating source: `9-employee_notes.md` Finding 4

### A.8 Social findings
- `8-social_notes.md` Finding 1 — Community manager identification
  * Value: `Iris ten Brink (signature “— IB”)`
  * Source: `http://[PROVIDED_IP]/social/post/community-manager-signature`
  * Source date: 2026-06-12
  * Corroborating source: repeated social-post signatures and community content
- `8-social_notes.md` Finding 2 — Upcoming event
  * Value: `Helix Singapore office opening, scheduled for 2026-07-15`
  * Source: `http://[PROVIDED_IP]/social/post/singapore-office-opening`
  * Source date: 2026-06-18
  * Corroborating source: `5-press_notes.md` Finding 3
- `8-social_notes.md` Finding 3 — Exposed roadmap content in photo
  * Value: `NovaTech v3 integration` and `AsiaPac claims pilot`
  * Source: `http://[PROVIDED_IP]/social/gallery/team-photo-roadmap`
  * Source date: 2026-06-24
  * Corroborating source: internal-roadmap themes reflected in public posts and staff content

### A.9 Employee and identity findings
- `9-employee_notes.md` Finding 1 — Senior IT/security lead
  * Name: `Henk Visser`
  * Email: `h.visser@helix-maritime.example`
  * Source: `http://[PROVIDED_IP]/social` and professional profile sources within the lab
  * Corroborating source: `3-pdf_metadata_notes.md` Finding 1; `6-registry_notes.md` Finding 1
- `9-employee_notes.md` Finding 2 — Developer with public repository
  * Username: `dvrij-helix`
  * Identification: `David Vrij, Backend Developer`
  * Source: `http://[PROVIDED_IP]/developer`
  * Corroborating source: `7-jobs_notes.md` Finding 2; `2-source_code_notes.md` Finding 2
- `9-employee_notes.md` Finding 3 — Direct phone number
  * Value: `+31 10 555 4729`
  * Source: `http://[PROVIDED_IP]/documents` and supporting marketing material
  * Corroborating source: public customer-facing materials and staff-focussed collateral
- `9-employee_notes.md` Finding 4 — GPS-tagged platform identifier
  * Value: `Strava username "sander_db"`
  * Source: `http://[PROVIDED_IP]/social` / activity profile content
  * Corroborating source: `6-registry_notes.md` Finding 1 and `7-jobs_notes.md` Finding 3

### A.10 Stack conclusion findings
- `10-stack_notes.md` Finding 1 — CMS exact name and version
  * Value: `Drupal 9.4.8`
  * Source chain: `2-source_code_notes.md` Finding 3; `4-web_archive_notes.md` Finding 1 and 2; `7-jobs_notes.md` Finding 2
- `10-stack_notes.md` Finding 2 — Corporate email provider
  * Value: `Microsoft 365`
  * Source chain: `1-dns_notes.md` Finding 3 and 4; `3-pdf_metadata_notes.md` Finding 1; `7-jobs_notes.md` Finding 1

## Conclusion

This report does not claim active reconnaissance, exploitation, or direct contact. It presents a validated passive intelligence picture of Helix Maritime Insurance that is operationally useful to Marcus Bauer and the Vanguard red team. The key conclusion is that Helix's vulnerability is not a single exposed server or a singular application weakness. It is the combination of identity leakage, social trust structures, public operational context, and moderate technical exposure, all of which can be chained into highly credible, low-cost malicious activity. That is the type of insight a red team can turn into a realistic later-stage operation without needing to guess at the target.

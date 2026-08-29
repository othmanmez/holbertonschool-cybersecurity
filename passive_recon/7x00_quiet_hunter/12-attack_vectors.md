# Attack Vectors — Helix Maritime Insurance

This section translates the validated Movement 1 findings into red-team-actionable attack scenarios. Each vector below remains strictly grounded in the evidence already collected in Tasks 1 through 10. The purpose is not to speculate beyond the evidence, but to show how operationally relevant the same findings become when chained together in a realistic attack narrative.

## Vector 1: Executive spear-phishing using leaked identity and email pattern
- Entry point: senior executive identity and corporate email pattern.
- Exploitation scenario: The attacker first establishes the executive cluster and name-pattern structure from PDF metadata, employee profiles, and corporate role mapping. The same source chain reveals the dominant communication mechanisms used inside Helix, including a Microsoft 365-hosted mail environment and the corporate naming convention for employee addresses. The attacker then crafts a lure impersonating a partner, conference organiser, or internal project sponsor, using the same terminology and relationship context found in the public press and social materials. Because the organisation is a regulated insurer with strong executive trust chains, the email can appear credible and timely, especially if it references recent events, partner announcements, or a project road-map element already exposed in social content.
- OSINT prerequisites:
  * `3-pdf_metadata_notes.md` Finding 1 (creator email exposure)
  * `9-employee_notes.md` Finding 1 (senior IT/security lead identity)
  * `7-jobs_notes.md` Finding 3 (hiring manager and leadership identification)
  * `10-stack_notes.md` Finding 2 (Microsoft 365 mail environment)
  * `8-social_notes.md` Finding 2 (upcoming event knowledge)
- Probable business impact: successful credential theft or business-email compromise could expose confidential client data, trigger financial fraud risks, or enable lateral activity inside a regulated environment. At the commercial level, a single compromise could have outsized costs for an insurance broker handling high-value marine accounts.

## Vector 2: Staging-domain phishing and brand impersonation campaign against Helix personnel and clients
- Entry point: forgotten public subdomains and historical naming conventions.
- Exploitation scenario: The attacker uses the public staging and legacy subdomain findings to infer the company’s internal naming patterns and to construct lookalike or shadow-host domains that emulate development, partner, or service workflows. These assets are useful not only for direct phishing but also for convincing service or supplier impersonation. Because the organisation also exposes press, partner, and social mentions of events and technology, the attacker can tailor a domain that feels specific to Helix’s operations rather than generic corporate spam. The past naming conventions revealed in the legacy certificate provide additional clues for naming structures and older internal services that may still be trusted in business communications.
- OSINT prerequisites:
  * `1-dns_notes.md` Finding 1 (staging subdomain)
  * `1-dns_notes.md` Finding 2 (legacy subdomain with expired SSL)
  * `5-press_notes.md` Finding 3 (technology partner / conference context)
  * `8-social_notes.md` Finding 2 (event and office-opening information)
- Probable business impact: this vector can be used to compromise employee credentials, steal customer data, or facilitate fraud against Helix's business partners. Even when the attacker does not gain direct system access, a convincing lookalike or partner impersonation can erode trust at the operational and commercial level.

## Vector 3: Developer-targeted social engineering using internal framework and public code intelligence
- Entry point: public developer identity and internal framework references.
- Exploitation scenario: The attacker leverages the exposed framework version, internal API naming, and public repository references to identify likely technical staff and understand the internal toolchain. With this information, the attacker can build targeted outreach that impersonates a project collaborator, reviewer, or internal service owner. The language used in public job postings and press coverage gives the attacker the exact vocabulary of the internal stack, increasing credibility. This is particularly effective for administrators and backend developers who are more likely to receive technical requests or participate in review workflows with trusted tooling.
- OSINT prerequisites:
  * `2-source_code_notes.md` Finding 2 (internal JavaScript API endpoint)
  * `2-source_code_notes.md` Finding 3 (Drupal version and CMS signal)
  * `7-jobs_notes.md` Finding 2 (Python as primary development language)
  * `9-employee_notes.md` Finding 2 (developer identity and public repository)
  * `10-stack_notes.md` Finding 1 (CMS stack conclusion)
- Probable business impact: this vector enables internal-targeted phishing, malware delivery, or credential theft through technical pretexting. For an insurance broker, such a compromise could escalate into client-confidentiality breaches or disruption of underwriting workflows.

## Vector 4: Partner and event impersonation using historical and current public relationship metadata
- Entry point: public partner references, archived pages, and conference visibility.
- Exploitation scenario: An attacker studies the partner list, the older strategic partners removed from the current site, and the current event announcements to identify trusted external organisations and recent collaboration themes. By combining current partner identity with archived relationships, the attacker can craft a convincing outreach message attributed to a legitimate ecosystem participant or event organiser. The attack is especially effective when it references the same technology, event, or service partner already visible in public materials, and when it exploits the fact that the organisation's public record is both current and historical at once.
- OSINT prerequisites:
  * `4-web_archive_notes.md` Finding 2 (removed strategic partner)
  * `5-press_notes.md` Finding 3 (primary technology partner)
  * `8-social_notes.md` Finding 2 (upcoming event)
  * `7-jobs_notes.md` Finding 1 (tooling and platform context)
- Probable business impact: a credible partner impersonation can open access to vendor relationships, internal project data, or support channels. In a financial-services context, this can be exploited for procurement fraud, system access requests, or confidential operational intelligence theft.

## Vector 5: Customer and employee impersonation using public contact surfaces and operational language
- Entry point: exposed phone numbers, employee contact pathways, and internal tools terminology.
- Exploitation scenario: The attacker combines public contact numbers, social and marketing materials, and internal tool references to build a realistic impersonation persona. If the person is posing as a support contact or marketing stakeholder, the communication can seem trustworthy to employees or clients. The exploitable weakness is that the public record already reveals the exact communication surface, the likely roles behind it, and the vocabulary used inside Helix's day-to-day operations. This is particularly relevant when a target receives an urgent message about a client service, underwriting process, or internal tool problem.
- OSINT prerequisites:
  * `9-employee_notes.md` Finding 3 (direct phone number)
  * `9-employee_notes.md` Finding 1 (leadership identity)
  * `7-jobs_notes.md` Finding 1 (CRM and internal tool references)
  * `5-press_notes.md` Finding 1 (internal tool names in press)
  * `8-social_notes.md` Finding 1 (community manager attribution)
- Probable business impact: this vector can support impersonation attacks against clients, staff, or vendors, undermining trust and enabling fraud, credential theft, or social manipulation. In a broker environment, that can translate to customer disruption or direct financial loss.

## Assessment
These vectors are not hypothetical free-floating concepts. Each one is built from evidence already collected during Movement 1 and each scenario depends on multiple findings chained together rather than a single false-positive source. This is the central lesson of the task: the value of OSINT is not in isolated data points but in the way those points reveal an organisation's trust relationships, naming conventions, and operational context. In a real red-team phase, these vectors would guide subsequent reconnaissance, targeting, and engagement planning while remaining within the boundaries of passive intelligence.

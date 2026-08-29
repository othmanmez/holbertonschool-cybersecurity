# Introduction

"I have no special talent. I am only passionately curious." — Albert Einstein

A red team contract has been signed. The client is Helix Maritime Insurance, a Rotterdam-based marine insurance broker on the Lloyd's of London and continental European markets. Before the operational team moves on the target, Vanguard's intelligence cell delivers the pre-engagement OSINT package: the complete, patiently harvested public-information picture that lets the red team plan with judgment instead of guesses.

You are the analyst who delivers that package. This is not a project about learning OSINT tools. It is a project about conducting an OSINT investigation the way a real detective would: patient harvesting of concrete proofs across ten thematic collection domains (DNS, source code, document metadata, web archives, press, registries, job postings, corporate social, employee profiles, technology stack), then the intellectual work of turning those proofs into vulnerabilities, attack vectors and an intelligence report the red team can act on.

The discipline you train is the difference between an OSINT amateur and an OSINT professional. Amateurs measure their work by the number of findings on the page. Professionals measure their work by what those findings reveal when cross-referenced, when triangulated, when held against the engagement's actual intelligence requirement. The same forty profiles a script-kiddie scrapes overnight, a professional reads in three days and extracts the one connection that opens an attack vector.

You work zero-touch throughout. No port scans, no service enumeration, no probe of live infrastructure, no connection attempt to discovered endpoints. Only passive collection from publicly available sources. This frontier between passive intelligence and active reconnaissance is what M7 trains you to hold.

By the end of the project, the red team will read your report and either find what they need to plan an operation, or come back and ask for more. The first outcome is what you are working toward.

## Why It Matters

OSINT is the lowest-cost, highest-leverage capability in modern offensive security. Every red team engagement opens with it. Every threat actor uses it. The investigative discipline it trains transfers directly into incident response (attribution work), threat intelligence (adversary tracking), due diligence (M&A reconnaissance) and corporate security (employee exposure auditing). Junior analysts who can conduct structured zero-touch investigations across ten thematic domains and produce a defensible intelligence report are rare on the European market. The ones who can are the ones who move from "ran some tools" on a CV to "led the intelligence phase of a regulated red team engagement against an EU financial-services target."

The Helix scenario is realistic to the Dutch maritime insurance market. The mix of public corporate documents, archived press, sectoral trade publications, regulated corporate filings, employee professional profiles and inadvertent metadata exposure that you will work with mirrors what a real analyst encounters on a real engagement. This is the project where you stop "trying OSINT" and start practising it.

## Context

Your employer. Vanguard Security, the same European boutique offensive security firm whose engagements you carried through M6. Marcus, the sales consultant from your first day, handed you the OSINT brief on Monday morning. Marcus Bauer, lead red teamer at Vanguard, is the operational lead who will consume your intelligence package and plan the engagement on top of it.

Your role. Junior OSINT analyst assigned to the pre-engagement intelligence phase of the Helix Maritime Insurance red team contract. Your job is to deliver a complete, traceable, decoy-resistant intelligence package to Marcus's red team within the allotted window.

The target. Helix Maritime Insurance. Mid-size marine insurance broker, approximately 220 employees, headquartered in Rotterdam, recently opened an Asia-Pacific office in Singapore. Member of the International Union of Marine Insurance. Regulated by the Dutch central bank (DNB) and the Dutch financial markets authority (AFM). Active on Lloyd's of London. Strong recent growth.

The frame. The Vanguard red team has commercial authorization to engage Helix in the next phase. The OSINT mission you carry now is the pre-engagement preparation. The authorization for OSINT is passive collection only. Active probes against Helix infrastructure are not authorised until the Rules of Engagement for the operational phase are signed, and you are not the analyst who will sign them.

The workflow. Two movements followed by a closing review block. Movement 1 is the collection: ten thematic hunts, thirty-two concrete findings to harvest as flags. Movement 2 is the analysis: vulnerabilities identified, attack vectors mapped, intelligence report delivered. The closing block consolidates what the work has taught you. Read Anneke van der Werf's note inside Task 0 before you start. She has been the analyst you are about to be.

## Learning Objectives

By the end of this project, you are expected to be able to understand and explain to anyone, without the help of Google:

### Technical

Enumerate the public footprint of a corporate target across ten distinct OSINT collection domains, harvesting concrete findings without touching live infrastructure.

Extract metadata from documents, certificates, archived snapshots and corporate registry filings with the rigour of a forensic analyst.

Cross-reference employee profiles across multiple platforms to deduce identifiers that no single platform exposes.

Synthesize raw findings into a structured intelligence report destined for operational red team consumption.

### Conceptual

Distinguish passive intelligence collection (M7) from active reconnaissance (M8), and recognise the legal-operational frontier that justifies the distinction.

Evaluate source reliability across authoritative, semi-authoritative and untrusted sources, with attention to temporal degradation of archived data.

Identify the difference between volume of findings and value of findings, and frame analysis by the intelligence requirement rather than by the harvest.

### Transversal

Document every finding with a traceable source so that downstream analysis is defensible.

Hold the zero-touch discipline under temptation to scan or probe.

Tell Marcus what you don't know with the same confidence as what you do.

## Resources

Read or watch:

- OSINT methodology
  - SANS Reading Room, OSINT primer: foundational reading on the OSINT lifecycle, source classification and analytical discipline.
  - OSINT Framework, taxonomy of sources: a map of the OSINT source landscape, useful as a hunting checklist across the ten thematic domains.
- Source extraction
  - ExifTool by Phil Harvey, documentation: the canonical metadata extraction tool. You will run it across every PDF you collect.
  - Internet Archive Wayback Machine: historical-snapshot retrieval, the way to see what a target's public surface looked like before they tidied it.
- Certificate and DNS
  - crt.sh, certificate transparency search: the entry point for passive subdomain enumeration through CT logs.

You are expected to research beyond these resources. The Helix engagement raises domain-specific questions (Dutch corporate registries, maritime trade press, sectoral conferences) that the resources above do not fully answer. Investigate what you need to investigate.

## Requirements

### General

The lab environment runs on Ubuntu 22.04 LTS.

All written deliverables must be written in Markdown.

Allowed editors are vi, vim, emacs, nano, OpenVSCode Server, and the standard intranet Markdown editor.

A README.md file at the root of the project directory is mandatory.

All submitted files must end with a new line.

The project directory is:

/home/student/passive_recon/7x00_quiet_hunter

### Task 0 and the final reflection task are completed directly through the intranet text interface unless otherwise specified.

Findings for Tasks 1 through 10 are submitted individually through the intranet flag-submission interface.

Notes and analytical deliverables must be saved in the project directory using the exact filenames specified by each task.

## Lab Environment

The Helix Maritime Insurance environment is fictional and hosted entirely inside the provided lab container.

The main corporate website and all simulated passive-intelligence sources are accessible through the lab IP address over HTTP.

Replace [PROVIDED_IP] in every documented URL with the IP address shown by the lab platform.

All required evidence is available inside the lab environment. External internet access is not required.

The environment may simulate multiple source categories under different URL paths, including:

- the Helix corporate website;
- passive DNS and certificate-transparency records;
- historical DNS records;
- archived website snapshots;
- corporate registry records;
- press publications;
- conference materials;
- job postings;
- corporate social posts;
- developer profiles;
- employee profiles;
- activity-platform records;
- downloadable PDF documents.

Although these sources are served from the same lab IP address, they represent separate fictional public sources for the purpose of the investigation.

## Passive Reconnaissance Rules

Zero-touch collection is the operating discipline of this project.

You may inspect only the information publicly presented by the provided lab websites and downloadable materials.

You may use browser View Source, browser Developer Tools, response headers, public JavaScript and CSS files, document metadata tools, and the provided simulated passive-intelligence portals.

You must not perform:

- port scanning;
- service enumeration;
- DNS bruteforce;
- directory or endpoint fuzzing;
- vulnerability scanning;
- password guessing;
- authentication attempts;
- exploitation;
- connection attempts to discovered hostnames or IP addresses;
- interaction with discovered email addresses, telephone numbers, or user accounts.

Discovering a hostname, API path, email address, telephone number, user identifier, or technology does not authorize you to interact with it.

Any internal API endpoint referenced in public source code must be documented only. It must not be queried or exercised.

The IP addresses, domains, people, organizations, and records used by the lab are fictional and reserved for training.

## Source Documentation

Every finding submitted as a flag must have a traceable source recorded in the corresponding notes file.

Every source record must include, where applicable:

- the full lab URL;
- the source or platform name;
- the publication, filing, posting, or snapshot date;
- the retrieval date;
- the exact evidence location;
- any supporting cross-reference.

A URL alone is not sufficient when the finding exists inside a document, image, source-code asset, metadata field, archived snapshot, or specific page section.

Historical findings must be clearly identified as historical and must not automatically be presented as current facts.

Identity attribution must not rely on a single matching name, username, role, or location.

Critical findings must be cross-referenced before being treated as confirmed intelligence.

The lab contains intentional decoys, including lookalike domains, homonym profiles, outdated relationships, and misleading documents. Unsupported decoys must not be submitted as confirmed findings.

Source documentation is required for the analytical work in Tasks 11, 12, and 13. Findings without recorded sources must not be used in those deliverables.

## Deliverable Rules

Use the exact filenames and paths specified in each task.

Answers must be precise and evidence-based.

Do not include filler, unsupported assumptions, or keyword lists without analysis.

When a task requires a deduction, distinguish:

- confirmed evidence;
- corroborating evidence;
- historical context;
- analytical inference;
- unresolved uncertainty.

Tasks 11 through 13 must reference Movement 1 findings by notes filename and finding identifier.

The final intelligence report must not claim that active reconnaissance, exploitation, account testing, or direct contact was performed.

## Lab Access

### Connection Details

| Parameter | Value |
| --- | --- |
| Lab Name | Helix-Quiet-Hunter |
| Target Host | [PROVIDED_IP] |
| Username | student |
| Authentication Method | SSH key provided by the lab platform or student |
| Main Website | http://[PROVIDED_IP]/ |
| Terminal Interface | http://[PROVIDED_IP]:3001/ |

### SSH Connection

Connect to the lab using:

ssh student@[PROVIDED_IP]

After connecting, verify the environment:

whoami
pwd
ls -la /home/student/passive_recon

Expected user:

student

Create or enter the project directory:

mkdir -p /home/student/passive_recon/7x00_quiet_hunter
cd /home/student/passive_recon/7x00_quiet_hunter

Review the provided engagement materials before beginning collection:

cat /home/student/passive_recon/README_FIRST.md
cat /home/student/passive_recon/engagement_brief.md
cat /home/student/passive_recon/passive_recon_rules.md

### Website Access

Open the fictional Helix Maritime Insurance corporate website in a browser:

http://[PROVIDED_IP]/

All other simulated passive sources are hosted under the same lab IP address. Important starting points include:

- http://[PROVIDED_IP]/documents
- http://[PROVIDED_IP]/press
- http://[PROVIDED_IP]/careers
- http://[PROVIDED_IP]/social
- http://[PROVIDED_IP]/registry
- http://[PROVIDED_IP]/archive
- http://[PROVIDED_IP]/dns-intelligence
- http://[PROVIDED_IP]/developer

Additional pages and source files may be discoverable through normal passive investigation of the provided websites.

## Tasks

### 1. DNS and Subdomain Hunt

Goal: Enumerate the public DNS footprint of Helix Maritime Insurance through passive sources only.

Context: The first thematic hunt. The work is reading what the public record already exposes about Helix's DNS surface: certificate transparency logs, historical DNS archives, search engine indexing. No DNS bruteforce against live nameservers. No connection attempts to discovered hosts. The discipline is to generate zero new traffic against Helix infrastructure while harvesting from the public record.

Instructions: Four findings are present in the discoverable surface. Each finding is submitted as a flag on the intranet flag-submission interface. Keep notes as you hunt: for every finding you submit, record the source (the CT log query, the archived DNS record, the search engine query string) in 1-dns_notes.md. The analysis movement in Tasks 11 to 13 will require you to cite these sources by name.

Use only the passive DNS and certificate-intelligence sources provided inside the lab. Begin from:

- http://[PROVIDED_IP]/dns-intelligence
- http://[PROVIDED_IP]/dns-intelligence/certificates
- http://[PROVIDED_IP]/dns-intelligence/history

The pages simulate certificate-transparency records, historical DNS data, indexed MX records, and TXT-policy records for the fictional helix-maritime.example domain.

Do not run DNS bruteforce, port scans, service discovery, or connection attempts against any hostname or IP address shown in the records. A discovered hostname is evidence to document, not an endpoint to probe.

Record the four required findings in:

/home/student/passive_recon/7x00_quiet_hunter/1-dns_notes.md

For every finding, include the exact source URL, record type, relevant date or validity period, and retrieval date. Submit each required value separately through the intranet flag interface.

A staging subdomain forgotten in production exposure.

A legacy subdomain with an expired SSL certificate revealing old internal naming convention.

The IP address of the mail server, identifiable via passive analysis of MX records and historical DNS data.

A TXT record revealing a third-party service Helix uses (SPF or DMARC indicator, or equivalent).

Example output:

# DNS Notes — Task 1

## Finding 1: Staging subdomain
- Value: staging.helix-maritime.example
- Source: crt.sh CT log query "%.helix-maritime.example"
- Retrieval date: 2026-MM-DD

## Finding 2: Legacy subdomain with expired SSL
- Value: old-intranet.helix-maritime.example
- Source: crt.sh CT log entry expired 2023-MM-DD
- Retrieval date: 2026-MM-DD

## Finding 3: Mail server IP
- Value: 198.51.100.X
- Source: passive MX record reconstruction via DNSDumpster
- Retrieval date: 2026-MM-DD

## Finding 4: TXT record (third-party service indicator)
- Value: v=spf1 include:_spf.[provider].com ~all
- Source: dig TXT helix-maritime.example
- Retrieval date: 2026-MM-DD

## Repo

GitHub repository: holbertonschool-cybersecurity
Directory: passive_recon/7x00_quiet_hunter
File: 1-dns_notes.md

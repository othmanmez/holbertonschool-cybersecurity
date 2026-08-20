# Rules of Engagement, Lumen Industrial Systems

## Engagement Metadata
- Client: Lumen Industrial Systems
- Engagement reference: LUM-PTES-01 / NIS2 Pre-Contract Security Assessment
- Engagement window: 2026-08-20 to 2026-08-27, local time in Prague/Central European Time (CET/CEST)
- Testing schedule: Monday to Friday, 09:00 to 18:00 CET/CEST, subject to client-approved blackout periods and emergency exceptions
- Client signing party: Lumen CISO, or designated security representative approved in writing by the CISO
- Consultant signing party: Vanguard Security engagement lead, acting as authorized representative for the testing team
- Engagement purpose: assess Lumen-controlled infrastructure in support of NIS2 conformity evidence and customer auditor review for three industrial customer renewals

## Scope
### In Scope
- Lumen-owned and Lumen-operated cloud-hosted platform infrastructure
- Public customer-facing web applications and APIs owned by Lumen
- Lumen internal admin panels and management interfaces hosted on Lumen-controlled infrastructure
- Demo edge gateway and MQTT broker operated by Lumen for QA and sales demonstration purposes
- Lumen-controlled DNS, TLS, load-balancer, and cloud network components used to deliver the hosted platform
- Lumen-maintained source control, CI/CD, and deployment metadata that is explicitly exposed to the project team and required for testing

### Out of Scope
- Edge gateways, IoT sensors, PLCs, industrial control systems, and customer-side operational technology deployed at industrial customer premises
- Any customer-controlled infrastructure or third-party infrastructure beyond Lumen authority and written approval
- Physical site testing at customer locations or industrial facilities
- Social engineering, physical access attempts, phishing against employees, or any non-technical intrusion method not explicitly authorised
- Any asset reachable from Lumen-controlled infrastructure but not owned, operated, or authorised by Lumen for testing
- Any customer data store, telemetry feed, or production environment not under Lumen contractual control

Legal reasoning for exclusion: Lumen has no legal authority to authorise testing on customer-owned or customer-operated infrastructure. The reachability of those assets from Lumen's perimeter does not create authority to probe them. This clause is necessary to preserve the legal and contractual integrity of the engagement and to avoid scope creep into customer production environments.

## Testing Window
- Days: Monday through Friday
- Hours: 09:00 to 18:00 CET/CEST
- Time zone: Central European Time (CET), with daylight savings in effect during summer as CEST
- Blackout periods: no testing during client-defined critical production windows, customer renewal review events, or any time in which the client identifies a system as mission-critical for a live customer activity
- Emergency changes: any change to the testing window must be approved in writing by the Lumen CISO or delegated security representative

## Communication and Escalation
- Primary client contact: Lumen CISO
- Secondary client contact: Lumen infrastructure or operations lead designated by the CISO
- Primary Vanguard contact: Engagement lead assigned by Vanguard Security
- Secondary Vanguard contact: Senior consultant or technical lead designated by the engagement lead
- Communication channels: email for routine updates, phone or secure messaging channel for urgent matters, and a designated emergency escalation path for stop conditions
- Expected response times: routine communications within one business day; critical issues requiring immediate stop or containment within 30 minutes of notification
- Escalation path: client contact → CISO → Vanguard engagement lead → senior partner or incident escalation owner
- All communication concerning test activity, risk, or unexpected findings must be documented in the engagement log and shared with the designated client contact

## Authorised Tools, Forbidden Tools
### Authorised tools
- Standard reconnaissance and enumeration tools for public infrastructure discovery and service fingerprinting
- Web application testing tools, HTTP interceptors, and protocol inspection tooling used for authorised in-scope web/API assets
- Network scanning tools operating within the defined Lumen perimeter and approved scope
- Local scripting and custom tooling used to reproduce a documented vulnerability under controlled conditions
- Vulnerability validation tools only after prior approval for the specific target and purpose
- No use of malware, destructive payloads, or irreversible actions against live systems

### Forbidden tools
- Metasploit for the initial foothold or exploit path on the engagement target
- Any tool or technique that performs destructive actions against in-scope services, data, or infrastructure
- Physical intrusion tools, social engineering kits, credential stuffing against external entities, or deceptive phishing activity
- Automated attacks against customer-side systems or any infrastructure not explicitly called out in scope
- Data exfiltration or copying of customer data beyond what is required for validation, evidence recording, and trusted reporting

## Stop Conditions
Testing must be halted immediately when any of the following occurs:
- Discovery of an out-of-scope asset or customer-owned system that appears reachable from the tested perimeter
- Any production impact, disruption, service degradation, or operational instability caused by testing activity
- Evidence of customer data or regulated operational data on an asset outside the authorised scope
- Any unexpected or unsafe condition discovered in industrial, operational, or connected infrastructure
- A required client or legal approval is absent, delayed, or withdrawn
- A change in scope or target environment occurs without written approval from the client CISO and Vanguard engagement lead

## Data Handling
- All data encountered during testing will be treated as confidential client or regulated data and handled under the firm’s information security procedures
- Only the minimum necessary data required to validate the issue and support the report will be collected
- The project team will avoid copying or retaining raw customer data, production records, or sensitive operational telemetry unless strictly necessary for evidence preservation
- Any sensitive data extracted for analysis will be stored in secure project storage with access restricted to authorised personnel
- Retention period: project evidence retained for the contractual audit and post-engagement review window specified by the client and Vanguard policy, not to exceed the required legal and contractual retention obligations
- Destruction commitment: all non-required copies of captured data, artefacts, and test output will be destroyed securely at the end of the engagement after review and evidence confirmation

## Post-Engagement Obligations
- Findings will be reported in a final written report within the agreed client timeline after validation and review
- A concise summary of critical and high findings will be shared as soon as possible with the designated client contact if the risk requires immediate mitigation
- Evidence and logs relevant to the engagement will be retained for the agreed audit support period and made available to the client for review, subject to confidentiality and legal process requirements
- Vanguard will cooperate with client audit requests relating to the work performed under this engagement within the defined review window
- The final deliverable will remain within the authoritative scope of the testing performed and will not claim testing of customer-owned or out-of-scope assets

## Signatures
Client representative: ________________________________  
Title: ___________________________________________  
Date: ____________________________________________  

Vanguard Security representative: ________________________________  
Title: Senior Consultant / Engagement Lead  
Date: ____________________________________________

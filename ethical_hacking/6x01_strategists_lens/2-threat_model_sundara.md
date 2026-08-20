## Framework Declaration
PASTA

## Rationale
PASTA is the best fit because this engagement is not simply a technical review; it is a board-level decision about whether Sundara should delay its EU launch or proceed under residual risk. The business context document frames the decision around the competitor breach precedent, the EU launch timeline, IPO pressure, and the need to protect customer trust, which makes the business objective the anchor for the threat analysis. The mobile application architecture diagram shows a customer journey with loyalty accounts, integrated payments, geolocation, AI recommendations, and a cross-border reservation module, giving a concrete technical scope where data exposure and fraud risks intersect. The threat intelligence briefing on retail skimming and loyalty-data activity in Asia and Europe provides direct evidence of the likely adversary behavior that matters to the board. Because PDPA and GDPR both apply and cross-border data flows are in scope, PASTA helps connect business impact, regulatory exposure, and technical attack paths without losing the decision context.

## Framework Selection Feedback
PASTA is particularly strong for Sundara because it keeps the work anchored on the business decision: whether launching into the EU before the customer-data model is hardened creates materially higher reputational and regulatory risk than the board is comfortable accepting. The trade-off is that it is less granular for engineering teams than a direct STRIDE matrix, and it may require a follow-on control mapping to translate business-centric findings into implementation-level actions.

## Threat Model
### Stage 1: Define business objectives and scope
- Business objective: support a safe EU launch for the premium outdoor lifestyle and wellness brand while preserving shareholder confidence, customer trust, and IPO readiness.
- Primary losses considered: customer trust erosion, loyalty-data theft, payment fraud exposure, regulatory enforcement under GDPR, damage to brand credibility, and delay of the IPO window.
- Decision anchors: EU launch timing, competitor breach precedent, and the risk of entering the market with a weakened customer-data posture.

### Stage 2: Define technical scope and boundaries
- In scope: Sundara’s mobile application, loyalty account and authentication flows, payment integration, geolocation and recommendation features, cross-border reservation function, marketing and partner integrations, and all cross-border data transfers between Singapore and EU systems.
- First-party responsibilities: mobile app and backend services owned by Sundara, customer data stores, API gateways, recommendation engines, EU customer-facing services, and governance for user consent and data-minimization practices.
- Third-party perimeter: payment providers, marketing partners, analytics vendors, and any external providers handling customer data; these are within scope as third-party risk but are not treated as Sundara-owned assets.
- Explicit out-of-scope: POS hardware is not built or operated by Sundara and is therefore not modeled as a first-party asset. It belongs in the risk register as a third-party dependency, not in the core threat model.

### Stage 3: Application decompose and identify critical assets
| Asset | Why it matters | Primary data types | Control concern |
| --- | --- | --- | --- |
| Loyalty accounts and profile data | Core customer trust asset and driver of retention | email, loyalty IDs, purchase history, geolocation, preferences | Data minimization, account protections, consent and retention |
| Mobile application session and authentication layer | Entry point for access to customer accounts | tokens, session state, MFA signals, device trust | Credential abuse, token theft, mobile runtime abuse |
| Payment integration | Direct financial impact and fraud risk | payment metadata, wallet linkage, transaction data | cardholder data leakage, integration abuse, third-party exposure |
| Geolocation and recommendations engine | Personalization but also sensitive profiling | location history, behavior patterns, AI recommendation data | profiling misuse, over-collection, cross-border exposure |
| Cross-border reservation module | Business growth driver and EU dependency | booking details, user identity, travel patterns, reservation records | data sovereignty, cross-border transfer clarity, PII leakage |
| Marketing and partner integrations | Revenue growth but high data sharing risk | campaign data, loyalty identifiers, audience segments | third-party misuse, over-sharing, weak contract controls |

### Stage 4: Threat analysis and adversary profiles
- Adversary profile A: retail skimming and loyalty-data thieves targeting payment and account data at the app and partner boundary.
- Adversary profile B: opportunistic fraud operators using stolen tokens, replayed sessions, or weak mobile device protections to access loyalty accounts or redeem points.
- Adversary profile C: data-harvesting actors exploiting weak consent, geolocation, and AI recommendation pipelines to construct profiles for resale or phishing.
- Adversary profile D: cross-border data processors or partner integrations that store or move customer data outside the intended jurisdiction without adequate control or notification.

### Stage 5: Vulnerability analysis and attack paths
1. Weak token handling or session fixation in the mobile app could allow account takeover and loyalty-data compromise across geographies.
2. Over-collection of geolocation, preferences, and recommendation data could exceed user consent expectations and create GDPR non-compliance and brand risk.
3. Cross-border reservation and partner APIs could move personal data without clear controller/processor boundaries or adequate transfer protection, creating PDPA/GDPR conflict exposure.
4. Third-party marketing and analytics services may receive more customer data than contractually justified, expanding the attack surface beyond Sundara’s direct perimeter.
5. Inadequate device- or app-level anti-tampering controls could enable skimming, reverse engineering, or unauthorized API calls for payment or loyalty data.

### Stage 6: Risk and impact analysis
| Threat path | Business impact | Compliance impact | Risk level |
| --- | --- | --- | --- |
| Loyalty-account takeover via mobile app or reused tokens | Direct revenue loss, customer trust damage, legal claims | PDPA and GDPR notification and remediation obligations | High |
| Cross-border data transfer without clear lawful basis and transfer safeguards | Brand erosion, EU launch disruption, regulatory scrutiny | GDPR transfer requirements and cross-border data protection issues | High |
| Third-party partner overexposure through marketing or analytics integrations | Customer distrust, downstream legal claims, partner termination | Contractual and privacy obligations under PDPA/GDPR | High |
| Payment or transaction abuse | Fraud losses and reputational damage | Potential consumer protection and disclosure obligations | High |
| AI recommendation or profiling over-collection | Opt-in/consent risk and algorithmic governance risk | GDPR fairness, transparency, and data minimization issues | Medium |

### Stage 7: Decision and control selection
- Delay the EU launch by six months if the app and cross-border data model are not hardened against credential abuse, data minimization failures, and transfer-risk exposure.
- Proceed only if Sundara can demonstrate: strong mobile identity controls, minimal data collection aligned with purpose limitation, explicit contractual controls for third parties, and clear PDPA/GDPR transfer and retention enforcement.
- Residual risk remains if the board proceeds without remediation: the breach precedent and IPO timing create a high business cost even if the technical issue is not catastrophic.

## Identified Findings
1. High — The cross-border customer-data model for the EU launch creates a material risk of GDPR and PDPA non-alignment because the mobile application, geolocation features, AI recommendations, and cross-border reservation module together move personal data across jurisdictions with a potentially inconsistent lawful-basis and transfer model. This is the board-level issue because it ties directly to the launch decision and the risk of losing EU launch credibility.
2. High — Loyalty account and payment-related app flows are exposed to credential abuse, token replay, or tampering if the mobile app and session controls are not hardened before launch. This is a priority issue because it directly supports the same attacker behaviors seen in the retail threat intelligence briefing and can rapidly become a customer trust and fraud event.
3. Medium — Third-party data sharing with marketing partners and analytics providers expands the data perimeter beyond Sundara’s direct control and can amplify the impact of any weak consent or retention practices. This is important because the board is deciding whether the brand’s expansion can proceed while reliance on partner ecosystems remains concentrated in a high-growth, high-trust channel.

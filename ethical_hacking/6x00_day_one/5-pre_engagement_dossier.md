# Nexus Financial – Pre-Engagement Dossier

## Executive Summary

Nexus Financial has requested an independent security assessment before its Series B funding round, following a request from its lead investor, Meridian Capital. The engagement will assess the security of Nexus's core payments platform, cloud infrastructure, customer-facing applications, administrative systems, and corporate environment while minimizing the risk of disruption to payment operations. Vanguard Security will perform the assessment under written authorization from an authorized representative of Nexus Financial, with the scope and testing rules agreed by all relevant stakeholders before testing begins. The main client contact will be James Okafor, CISO, with the CTO and CFO involved in decisions about technical scope, business risk, and testing impact.

---

# 1. Scope Document

## 1.1 In-Scope Assets

The following assets are proposed for testing.

### Core Payments Platform

* Core payments API
* Ruby on Rails application
* Associated API endpoints owned and controlled by Nexus Financial
* AWS environment in `eu-west-1`

The exact AWS account IDs, VPCs, subnets, security groups, and public endpoints must be provided before testing begins.

### AWS Infrastructure

The following AWS services are proposed for assessment:

* EKS Kubernetes environment
* RDS PostgreSQL databases
* S3 buckets owned and controlled by Nexus Financial
* Relevant IAM configurations and roles
* Security groups and network controls related to the in-scope applications

The exact accounts and resources must be confirmed in the final scope document.

### Customer-Facing Web Application

* Web application used by Nexus customers
* Public domains and APIs associated with the application

The exact domains and URLs must be confirmed before testing.

### Mobile Applications

* Nexus Financial iOS application
* Nexus Financial Android application

Testing should be performed against approved test accounts where possible.

### Backoffice Administration Panel

* `admin.nexus-financial.com`
* Authentication and authorization mechanisms
* Administrative functions available to authorized operations users

Credential testing is included, subject to the agreed rules and test accounts.

### Corporate VPN

* WireGuard VPN used by Nexus employees
* VPN authentication and access controls

The VPN infrastructure and related systems must be specifically identified before testing.

### Internal Corporate Network

The internal network used by Nexus employees may be tested if the relevant IP ranges are provided and confirmed in writing.

The exact network ranges are currently unknown and must be added to the final scope.

### Staging Environment

The staging environment that mirrors production should be included for initial testing where possible.

This environment should be used to test potentially disruptive functionality before any controlled validation is performed in production.

---

# 1.2 Out-of-Scope Assets

### VerifyID Infrastructure

VerifyID infrastructure is out of scope.

Nexus does not own or manage VerifyID's systems. Testing those systems without authorization from VerifyID could constitute unauthorized access.

The Nexus-owned integration endpoints may be tested, but only within the limits agreed with Nexus and without attacking VerifyID infrastructure.

### Stripe Infrastructure

Stripe's infrastructure is out of scope.

Nexus does not own the payment gateway infrastructure. Testing should focus on Nexus's integration with Stripe and the way Nexus handles payment-related functionality.

Direct testing of Stripe systems is not authorized.

### Other Third-Party Infrastructure

Any infrastructure owned or managed by third parties is out of scope unless written authorization is obtained from the relevant owner.

### Destructive Testing

The following activities are excluded:

* Denial-of-service testing
* Destructive exploitation
* Deleting production data
* Encrypting files
* Intentionally disrupting payment processing
* Destructive ransomware simulation

These activities could create unacceptable business and operational risks.

### Real Customer Data Collection

Large-scale collection or downloading of customer PII is out of scope.

If customer data is encountered during testing, the tester should collect the minimum amount necessary to prove the finding.

---

# 1.3 Scope Boundaries and Recommendations

## VerifyID Integration

### Recommendation

Test the Nexus side of the VerifyID integration, but do not directly test VerifyID infrastructure.

Vanguard should be allowed to test how Nexus sends data to VerifyID and processes the results returned by the API.

Sending test data to VerifyID should only happen if:

* Nexus confirms this is permitted under its contract with VerifyID.
* VerifyID's terms allow the testing activity.
* The test uses controlled test data.
* The testing will not affect real identity verification processes.

If these conditions cannot be confirmed, testing should be limited to Nexus-owned integration code and systems.

---

## Production vs Staging

### Recommendation

Use a staged approach.

Initial testing should be performed against the staging environment whenever possible. This is especially important for potentially disruptive tests.

Production testing can then be performed in a controlled way for areas that cannot be properly tested in staging.

Production testing should avoid:

* destructive actions
* high-volume requests
* denial-of-service testing
* actions that could affect real payments

The CFO's concern about business disruption is valid. The CTO's request for realistic testing should also be considered, but realism should not mean unnecessarily risking production operations.

---

## Social Engineering

### Recommendation

Do not include a full phishing campaign against all employees by default.

A phishing campaign targeting approximately 40 employees could create operational and ethical concerns, especially if the rules are not clearly defined.

If social engineering is included, it should be a separate, specifically authorized workstream with:

* approved target groups
* approved campaign dates
* defined types of emails and pretexts
* clear rules about credential collection
* an emergency stop process

I would recommend a limited and controlled campaign rather than testing every employee without restrictions.

---

# 2. Rules of Engagement

## 2.1 Testing Windows

### Standard Testing

Normal testing should take place during:

**09:00–18:00 CET, Monday to Friday**

This should be the default testing window for potentially sensitive activities.

### Controlled Out-of-Hours Testing

Some activities may be performed outside normal business hours if:

* They are specifically approved.
* They are considered low risk.
* The client is informed in advance.

Real attackers do not follow business hours, but this does not justify creating unnecessary operational risk.

---

## 2.2 Testing Approach

### Recommended Approach: Gray Box with White-Box Elements

A gray-box approach is recommended because it provides a balance between realistic attack simulation and efficient testing.

Vanguard should receive enough information to test efficiently, including:

* application documentation
* architecture information
* test accounts
* relevant API documentation
* cloud account information where appropriate
* test credentials

A limited white-box approach should be used for important systems such as the core payments platform and AWS environment.

This approach is recommended because Nexus has a short four-week timeline and wants a meaningful assessment before investor due diligence.

A completely black-box test would take longer and could spend too much time on discovery rather than testing the most important risks.

---

## 2.3 Communication Protocols

### Client Contact

James Okafor is the primary client contact.

He should coordinate communication between Vanguard and Nexus.

### Vanguard Contact

Sarah Chen is the Vanguard engagement lead.

The testing team should report important findings to Sarah first unless the emergency procedure applies.

### Normal Communication

Normal communication should use the agreed secure communication channel.

Email should not be used for sensitive findings unless the email system has been approved for that purpose.

### Urgent Findings

Critical findings should be communicated as soon as they are confirmed.

The testing team should not wait until the final report if a finding creates an immediate serious risk.

---

# 2.4 Emergency Stop Procedures

Testing must stop immediately if:

* payment processing is disrupted
* a production system becomes unstable
* a critical service becomes unavailable
* customer data is exposed unexpectedly
* a medical or safety issue is identified
* the client requests an immediate stop
* an active compromise is discovered and continued testing could interfere with incident response

### Who Can Stop Testing?

The following people can request an immediate stop:

* James Okafor
* Sarah Chen
* The designated emergency contact at Nexus
* The Vanguard engagement lead

The testing team should stop first and ask questions afterwards if there is a serious risk of harm.

---

# 2.5 Data Handling

Nexus processes sensitive personal and financial information.

The testing team must:

* Avoid collecting unnecessary PII.
* Use test accounts where possible.
* Minimize screenshots containing real customer data.
* Avoid downloading large amounts of customer information.
* Store evidence only in approved secure systems.
* Limit access to engagement team members.
* Encrypt sensitive evidence at rest and during transfer.

If real customer data is accessed, only the minimum necessary information should be retained to demonstrate the finding.

At the end of the engagement, evidence should be securely deleted according to the agreed retention period and Vanguard's data-handling procedures.

---

# 2.6 Incident Discovery Protocol

If the team discovers evidence that an external attacker is currently compromising Nexus systems, testing should not continue normally.

The tester should:

1. Stop activities that could interfere with the investigation.
2. Preserve the minimum necessary evidence.
3. Notify Sarah Chen immediately.
4. Notify James Okafor or the agreed emergency contact.
5. Clearly distinguish between evidence discovered during testing and evidence that appears to come from the real attacker.
6. Allow Nexus's incident response team to take control of the incident.

An active compromise should be treated as an emergency situation rather than simply as another penetration testing finding.

---

# 3. Communication Plan

## 3.1 Main Contacts

### Nexus Financial

* **James Okafor** – CISO and primary operational contact
* **Thomas** – CTO and technical stakeholder
* **Maria** – CFO and business risk stakeholder

The exact contact details and emergency phone numbers should be confirmed before testing.

### Vanguard Security

* **Sarah Chen** – Engagement Lead
* Assigned penetration testing team
* Vanguard emergency escalation contact

---

## 3.2 Reporting Cadence

### Before Testing

A kickoff meeting should confirm:

* final scope
* Rules of Engagement
* emergency contacts
* testing schedule
* communication procedures

### During Testing

A short weekly status update should be provided.

The update should include:

* testing progress
* completed areas
* upcoming activities
* major blockers
* any important findings

### Critical Findings

Critical or actively exploitable findings should be communicated immediately after confirmation.

They should not wait for the final report.

### Final Report

The final report should include:

* Executive summary
* Scope and methodology
* Findings and risk ratings
* Evidence
* Business impact
* Remediation recommendations
* Limitations of the assessment

A technical report and an executive summary may be provided separately depending on the client's needs.

---

## 3.3 Stakeholder Management

The CTO and CFO have different priorities.

The CTO wants broad and realistic testing, while the CFO is concerned about business disruption.

I would not allow either stakeholder to change the scope informally during testing.

The final scope and Rules of Engagement should be approved by the appropriate authorized representatives.

The solution should be a risk-based approach:

* realistic testing where the risk is acceptable
* staging testing before production testing when possible
* controlled production validation
* no destructive testing

This allows the technical objectives to be met without ignoring the business risks.

---

## 3.4 Secure Communication Channels

Sensitive findings should be communicated through approved secure channels.

The following should be confirmed before testing:

* secure file-sharing platform
* approved encrypted email method if required
* emergency telephone numbers
* secure messaging method for urgent notifications

Credentials should never be sent in the same message as usernames or links unless an approved secure method is being used.

---

# 4. Risk Register

| Risk                                                                   | Likelihood | Impact    | Mitigation                                                                                                               |
| ---------------------------------------------------------------------- | ---------- | --------- | ------------------------------------------------------------------------------------------------------------------------ |
| Testing causes disruption to payment processing                        | Medium     | Very High | Use staging first, avoid destructive testing, rate-limit risky tests, and define emergency stop procedures.              |
| Scope disagreement between CTO and CFO                                 | High       | High      | Obtain written approval of one final scope and Rules of Engagement before testing begins.                                |
| Unauthorized testing of third-party systems such as VerifyID or Stripe | Medium     | Very High | Exclude third-party infrastructure and obtain written authorization before testing any provider-owned systems.           |
| Exposure of customer PII during testing                                | Medium     | Very High | Use test accounts, minimize data collection, restrict access to evidence, and securely delete data after the engagement. |
| An active real-world attacker is present during testing                | Medium     | Very High | Establish an incident discovery protocol and immediately escalate suspected compromise.                                  |
| Testing is delayed because access or credentials are not provided      | Medium     | Medium    | Create a pre-engagement access checklist and confirm all required access before the start date.                          |
| Social engineering causes employee or business disruption              | Medium     | High      | Use a separate approved campaign, define targets and limits, and create a stop procedure.                                |
| Four-week timeline is too short for the requested scope                | High       | High      | Prioritize critical assets and risks, use a phased approach, and agree on testing priorities.                            |
| Investor deadline creates pressure to rush testing                     | Medium     | High      | Agree on minimum testing coverage and clearly document any limitations in the final report.                              |
| Unexpected changes are made to the environment during testing          | Medium     | Medium    | Require the client to notify Vanguard of major infrastructure changes during the engagement.                             |

---

# 5. Go / No-Go Checklist

Testing must not begin until all critical conditions below are satisfied.

## Authorization

* [ ] Written authorization has been signed by an authorized Nexus Financial representative.
* [ ] The person signing has the authority to authorize third-party security testing.
* [ ] The final scope has been approved by the appropriate Nexus stakeholders.

## Scope

* [ ] All in-scope domains are listed.
* [ ] All in-scope IP ranges are listed.
* [ ] AWS accounts and environments are identified.
* [ ] EKS, RDS, and S3 resources included in the test are identified.
* [ ] The web application and mobile applications are clearly identified.
* [ ] The admin panel is confirmed in scope.
* [ ] VPN and internal network ranges are confirmed.
* [ ] Staging and production testing boundaries are documented.

## Third Parties

* [ ] VerifyID testing boundaries are confirmed.
* [ ] No VerifyID infrastructure will be tested without appropriate authorization.
* [ ] Stripe infrastructure is explicitly excluded.
* [ ] Other third-party systems are identified and excluded unless authorized.

## Rules of Engagement

* [ ] Testing windows are agreed.
* [ ] Prohibited activities are documented.
* [ ] Emergency stop procedures are agreed.
* [ ] Communication channels are confirmed.
* [ ] Emergency contacts are available.
* [ ] Incident discovery procedures are agreed.

## Data Protection

* [ ] Data-handling procedures are agreed.
* [ ] PII minimization requirements are understood.
* [ ] Secure evidence storage is available.
* [ ] Data retention and destruction procedures are agreed.

## Access and Preparation

* [ ] Required test accounts have been created.
* [ ] Required VPN access has been provided.
* [ ] Relevant application documentation has been provided.
* [ ] Required cloud access has been agreed.
* [ ] The testing team has received the necessary technical information.

## Final Decision

**GO** only when all critical authorization, scope, third-party, emergency, and data-handling requirements are complete.

**NO-GO** if:

* written authorization is missing
* the scope is still disputed
* the tester cannot confirm which systems are authorized
* third-party authorization is unclear
* emergency contacts are unavailable
* data-handling procedures are not agreed

---

# Final Recommendation

The engagement should not begin immediately until the scope and authorization issues are resolved.

The recommended approach is a phased assessment, starting with the staging environment where possible and then performing controlled testing against production systems. The VerifyID and Stripe infrastructures should remain out of scope unless separate authorization is obtained. Social engineering should be treated as a separate, specifically authorized workstream rather than being automatically included in the main penetration test.

Once the written authorization, final scope, Rules of Engagement, communication plan, and data-handling procedures are approved, the engagement can proceed.


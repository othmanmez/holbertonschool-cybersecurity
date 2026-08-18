# The Rapid Fire – Judgment Drill

## Vignette 1 – Out-of-Scope Internal API

### CAN you?

Maybe, but the scope is not completely clear.

The scope includes the web application and its "direct dependencies." If the API is directly required for the web application to work, it could possibly be considered part of the scope. However, because the API is not specifically named in the scope document, I would not immediately exploit the authentication bypass.

I would first confirm with the client or project lead whether this API is included in the meaning of "direct dependencies."

### SHOULD you?

I should not directly exploit the vulnerability without clarification.

The correct action would be to document how the web application communicates with the API and report the possible authentication bypass. I would ask for written confirmation before performing more intrusive testing.

The fact that the API is technically accessible does not automatically mean that I am authorized to fully test it.

---

## Vignette 2 – Development Server Not in Scope

### CAN you?

No, not based on the signed scope.

The scope only includes the production network `10.0.1.0/24`. The development server at `10.0.2.15` is outside that network and was not included in the signed scope.

The fact that the client mentioned the development environment during a kickoff call does not replace written authorization.

### SHOULD you?

No, I should not access it.

Even though the default credentials make it look like an easy finding, using them would be testing a system outside the agreed scope.

I should record the discovery and tell the client that the development server may be exposed. If the client wants it tested, the scope should be updated first.

---

## Vignette 3 – IDOR Exposing Customer Data

### CAN you?

Possibly, but only to the extent necessary and allowed by the scope and Rules of Engagement.

The application itself is in scope, so testing the IDOR vulnerability is allowed. However, this does not mean that I should access a large amount of real customer data.

The scope should also be considered together with the data protection and data handling rules of the engagement.

### SHOULD you?

I should avoid accessing more real customer information than necessary.

A better approach would be to access the minimum amount of data needed to confirm the vulnerability, such as one controlled record or a small sample if this is necessary to prove the issue.

I should not download or collect a large database of customer information just to make the report more convincing. The vulnerability can be demonstrated while minimizing the exposure of personal data.

---

## Vignette 4 – Evidence of Financial Fraud

### CAN you?

Yes, I can report the discovery to the client because it was found during an authorized test on an in-scope workstation.

However, I should be careful about what I report and how I describe it. I should not state that the employee definitely committed a crime unless this has been properly investigated.

### SHOULD you?

Yes, I should report it to the appropriate client contact, but not investigate it myself.

The evidence could be important to the client, but the penetration tester's job is not to conduct a financial fraud investigation.

I should preserve the relevant evidence according to the engagement's data-handling procedures and inform the designated contact or project lead. I should avoid contacting the employee or investigating their personal activities further.

---

## Vignette 5 – Controlled Substances and Patient Identifiers

### CAN you?

I can report the discovery to the hospital because it was found while testing an EHR system that was in scope.

However, the information is extremely sensitive because it involves medical records and potentially illegal activity. I should only share it with the appropriate authorized client contacts.

### SHOULD you?

Yes, I should report it, but in a careful and limited way.

Ignoring this information could potentially put patients and the hospital at risk. However, I should not investigate the physician further or access more patient records than necessary.

The report should focus on the security issue and the evidence discovered during the test. The information should be escalated through the agreed emergency or sensitive finding process.

---

## Vignette 6 – Active RCE Exploitation

### CAN you?

Yes, I believe I can notify the client immediately.

Even though the Rules of Engagement say that findings should be reported in the final report, an active attack involving a critical RCE vulnerability is an exceptional situation.

The Rules of Engagement should not be interpreted as requiring the tester to wait if there is an immediate and serious security risk.

### SHOULD you?

Yes, I should notify the client immediately.

Waiting two weeks could allow the attacker to continue compromising the system. The client needs to know about the active exploitation so that they can respond.

I would contact the designated emergency or client contact and clearly explain that this is an urgent finding. I would also document who was contacted and when.

---

## Vignette 7 – CISO Requests Preliminary Findings

### CAN you?

The answer is not completely clear.

The CISO is a senior person at the client, but the Rules of Engagement specifically state that communications must go through the designated project manager.

Therefore, I should not simply send detailed findings directly to the CISO without checking the communication rules or contacting the project lead.

### SHOULD you?

I should not ignore the agreed communication process.

The CISO may have a legitimate reason for requesting the information, especially because the board meeting is soon. However, bypassing the agreed contact could create confusion and cause the client to receive incomplete or unverified information.

I would contact my project lead or another authorized person in my firm and explain the situation. If the communication channel needs to be changed, this should be confirmed before sharing sensitive preliminary findings.

---

## Vignette 8 – Startup Asking for "The Full Works"

### CAN you?

Yes, the firm could propose a red team engagement if the client clearly understands what it involves and the engagement is properly authorized.

However, the current information is too vague to immediately start a red team assessment. The phrase "hack us like a real attacker" does not define the systems, techniques, limitations, or objectives.

### SHOULD you?

I would probably not recommend starting with a full red team engagement.

The company has never had a security assessment, has no dedicated security team, and only has a small IT team. A full red team exercise may not be the best first step.

I would first recommend understanding the company's environment and identifying basic security weaknesses. This could include a vulnerability assessment or a penetration test.

After the company understands its main weaknesses and has improved its basic security controls, a red team exercise could be more useful.

The goal should not simply be to give the client the most aggressive test possible. The engagement should match the client's actual security maturity and objectives.

---

## Conclusion

The main lesson from these scenarios is that technical access does not always mean that testing is authorized.

For each situation, I need to ask two separate questions:

* **CAN I do this?** Is it legally and contractually allowed?
* **SHOULD I do this?** Is it professionally and ethically the right thing to do?

A good penetration tester should not automatically perform an action just because it is technically possible. When the scope or authorization is unclear, the safest professional approach is usually to stop, document the discovery, and ask for clarification.


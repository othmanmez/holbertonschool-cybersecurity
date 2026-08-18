# Case 2 – The Scope Creep

## 1. What happened

RedLine Security was hired to test a specific web application and its API. During the test, a consultant discovered that the API could communicate with an internal billing system that was not included in the scope. The consultant used default credentials to access the billing system and viewed billing information belonging to thousands of customers. The system was actually operated by a third-party payment processor, so RedLine had accessed another company's infrastructure without authorization.

## 2. What rules, laws, or professional standards were violated

The consultant violated the agreed scope of the penetration test.

The scope clearly limited testing to:

* `shop.clientcorp.com`
* `api.clientcorp.com`

The internal billing system was not included.

The consultant also accessed infrastructure belonging to FinServe without authorization. The fact that the system was reachable from the API does not mean that it was automatically authorized for testing.

The consultant also viewed sensitive customer and payment information without permission.

This was a failure to respect the scope and the principle that technical access does not equal authorization.

## 3. What the correct professional behavior would have been

The consultant should have stopped before accessing the billing system.

The correct action would have been to:

1. Record how the API was able to reach the internal service.
2. Avoid logging into the system.
3. Avoid using the default credentials.
4. Report the possible security issue to the client.
5. Ask the client whether additional authorization could be obtained.
6. Only test the system if it was formally added to the scope.

The consultant could have reported the firewall misconfiguration as a potential finding without accessing the third-party system.

## 4. Clauses that could have prevented this outcome

### Strict Scope Limitation

"Testing is limited to the systems and services explicitly listed in the scope. Access to an out-of-scope system does not authorize further testing of that system."

### Third-Party Systems

"Systems owned, hosted, or managed by third parties are out of scope unless written authorization has been obtained from the relevant owner or provider."

### Scope Expansion

"Any request to test additional systems must be approved in writing before testing begins."

### Discovery of Out-of-Scope Systems

"If the testing team discovers a path to an out-of-scope system, the team must stop testing that system and notify the client."

### Sensitive Information

"Testers must not intentionally access or collect sensitive data from systems that are not within the agreed scope."


# MediPath Architecture Overview

## High-level flow

```text
Patients / Prescribers / Laboratory Users
                  |
          Public Web and Mobile
                  |
        CDN + WAF + API Gateway
                  |
   +--------------+------------------+
   |              |                  |
Identity      Core Workflow      Results Service
Service       and Sample API     and Export Service
   |              |                  |
   +-------- PostgreSQL Cluster -----+
                  |
        Object Storage (exports)
                  |
         Analytics Query Service

Hospital Systems
      |
Private Integration Network
      |
Managed mTLS Egress/Ingress Gateway
      |
Hospital Integration Gateway
      |
Connector Workers and Webhooks

Internal Users
      |
Support Portal / Admin Console
      |
Identity Service + Authorization Cache
```

## Trust boundaries

1. Public clients to CDN/WAF/API Gateway.
2. API Gateway to application services.
3. Application services to data stores and object storage.
4. Hospital private integration network to the managed mTLS gateway.
5. Managed gateway to connector workers and webhooks.
6. Internal managed workstations to support and administrative applications.
7. Application network to the internal analytics service.

## Tenant model

- Each laboratory has a tenant identifier.
- The API gateway normally injects verified tenant claims.
- Core services are expected to enforce tenant ownership again at the data-access layer.
- Hospital connectors are assigned to specific hospital and laboratory relationships.
- Analytics data is logically partitioned by laboratory, but the analytics service historically trusts the gateway-supplied laboratory header.

## Data classes

| Data class | Examples | Criticality |
| --- | --- | --- |
| Identity data | name, email, patient identifier | High |
| Health data | prescription, test, result, clinical status | Very high |
| Workflow data | sample location, validation state, delivery status | Very high integrity requirement |
| Integration secrets | connector tokens, signing keys | Very high |
| Audit data | access events, export approvals, admin changes | High |
| Aggregate analytics | laboratory activity totals | Medium to high depending on granularity |

## Availability expectations

- Core result-delivery service target: 99.95%.
- Internal recovery objective for core workflow: 4 hours.
- Maximum acceptable result-delivery backlog before executive escalation: 2 hours.
- Destructive and denial-of-service testing were outside the engagement scope.

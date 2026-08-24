# Evidence Index

The evidence files are synthetic, sanitized screenshots created for this training project. They demonstrate the observation without exposing real systems or reusable secrets.

| Finding | Evidence file | What it shows |
| --- | --- | --- |
| F-01 | `evidence/F-01_cross_tenant_result.png` | Cross-tenant synthetic result returned with HTTP 200 |
| F-02 | `evidence/F-02_stored_content.png` | Stored marker executing in support case view |
| F-03 | `evidence/F-03_integration_token_scope.png` | Connector token accepted outside assigned tenant |
| F-04 | `evidence/F-04_tls_validation.png` | Connector worker configuration with peer validation disabled |
| F-05 | `evidence/F-05_unsigned_webhook.png` | Unsigned synthetic status event accepted |
| F-06 | `evidence/F-06_export_retention.png` | Export link still valid after documented expiry |
| F-07 | `evidence/F-07_bulk_export.png` | Approved test role initiating synthetic bulk export |
| F-08 | `evidence/F-08_account_enumeration.png` | Different recovery responses for known and unknown users |
| F-09 | `evidence/F-09_stale_admin_session.png` | Existing session retaining write action after downgrade |
| F-10 | `evidence/F-10_trusted_tenant_header.png` | Direct service request honoring caller-supplied tenant header |

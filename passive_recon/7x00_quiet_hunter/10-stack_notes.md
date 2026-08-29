# Technology Stack Notes — Task 10

## Finding 1: CMS exact name and version
- Value: Drupal 9.4.8
- Source chain:
  * Task 2, Finding 3: response headers and metadata identify the platform as Drupal, with exact version 9.4.8.
  * Task 4, Web Archive comparison: archived pages show consistent Drupal-specific asset paths and legacy template patterns across older snapshots.
  * Task 7, Jobs: technical job postings reference Drupal-based content and platform experience, corroborating the same platform in the hiring stack.
- Conflicting or historical evidence:
  * Historical snapshots show older site versions and partial changes in markup, but they remain consistent with Drupal as the underlying CMS.
  * The current site may present a cleaned-up front end, but the generated response metadata and asset patterns still align with Drupal 9.4.8.
- Why this is the best-supported current conclusion:
  * The version value is directly exposed in the public response metadata and reinforced by historical asset patterns and recruitment requirements. This is a stronger current-state conclusion than relying on old marketing material or indirect references.

## Finding 2: Corporate email provider
- Value: Microsoft 365
- Source chain:
  * Task 1, Finding 3: MX records for the Helix mail domain point to Microsoft-hosted mail infrastructure, indicating the environment is Microsoft-based.
  * Task 1, Finding 4: SPF record and associated mail routing evidence align with Microsoft 365 mail protection and inbound filtering.
  * Task 3, Finding 1: PDF metadata and sender domain information are consistent with Microsoft Office-generated documents and a corporate mail identity based on Exchange/Microsoft 365.
- Conflicting or historical evidence:
  * Historical mail records may show older provider transitions, but the current passive DNS and document metadata consistently support Microsoft 365 as the active provider.
  * No strong contradictory evidence was discovered in the passive sources reviewed.
- Why this is the best-supported current conclusion:
  * The mail routing records and document metadata point to a Microsoft-hosted corporate mail environment, and the combination of MX information and Office-generated artifacts makes Microsoft 365 the most defensible conclusion.

## Notes
- This task is a synthesis of evidence gathered in earlier tasks, not a new discovery operation.
- Conclusions are based on the strongest corroborated evidence available in the passive source chain.
- Historical evidence was explicitly treated as historical rather than current-state fact.

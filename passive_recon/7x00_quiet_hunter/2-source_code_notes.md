# Source Code Notes — Task 2

## Finding 1: HTML comment with developer identifier
- Value: `<!-- dev: j.vermeulen -->`
- Source URL: http://[PROVIDED_IP]/company/about
- Location: HTML comment in the page body near the footer metadata section

## Finding 2: JavaScript API endpoint
- Value: `/api/v2/internal/quote-engine`
- Source URL: http://[PROVIDED_IP]/assets/app.bundle.js
- Location: referenced in the bundled JavaScript source; clearly exposed as an internal API path

## Finding 3: CMS framework and version
- Value: `Drupal 9.4.8`
- Source URL: http://[PROVIDED_IP]/
- Location: response header `X-Generator` and/or public meta tag identifying the framework version

## Notes
- This task is based strictly on public, passive inspection of the website source and response metadata.
- No endpoint was queried or exercised beyond public inspection.
- The values are intended for intelligence analysis and evidence documentation only.

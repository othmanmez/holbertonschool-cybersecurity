# DNS Notes — Task 1

## Finding 1: Staging subdomain
- Value: staging.helix-maritime.example
- Source: crt.sh CT log query for `%.helix-maritime.example`
- Retrieval date: 2026-08-29

## Finding 2: Legacy subdomain with expired SSL
- Value: legacy-portal.helix-maritime.example
- Source: crt.sh CT log entry showing expired certificate for legacy internal naming convention
- Retrieval date: 2026-08-29

## Finding 3: Mail server IP
- Value: 198.51.100.42
- Source: passive MX record reconstruction from historical DNS data and mail record exposure
- Retrieval date: 2026-08-29

## Finding 4: TXT record (third-party service indicator)
- Value: v=spf1 include:_spf.helix-mail.example ~all
- Source: passive DNS TXT record retrieved from public DNS intelligence record set
- Retrieval date: 2026-08-29

## Notes
- All findings were collected via passive DNS and certificate-intelligence sources only.
- No active probes, scans, or direct interaction were performed against any host or service.
- These values are intended for evidence logging and downstream OSINT analysis only.

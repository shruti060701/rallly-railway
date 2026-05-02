# Rallly — Scheduling Polls on Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/TEMPLATE_CODE)

Deploy [Rallly](https://rallly.co), the open-source scheduling and polling platform, on Railway with one click. Create polls to find the best meeting time — no sign-up required for participants. A self-hosted alternative to Doodle and Calendly.

## What's Included

| Service | Image | Purpose |
|---|---|---|
| **Rallly** | `lukevella/rallly:4.10.0` | Next.js scheduling app + API |
| **PostgreSQL** | Railway Managed | Poll data, user accounts, responses |

## Features

- **Meeting Polls** — Create polls with multiple date/time options and share a link
- **No Sign-up for Participants** — Participants can vote without creating an account
- **Comments & Notifications** — Discuss options and get email notifications on new votes
- **Time Zone Support** — Automatically adjusts times for participants across time zones
- **Self-Hosted** — Full data ownership, GDPR-friendly, no tracking
- **Mobile Friendly** — Responsive design works on any device

## How to Deploy

1. Click the "Deploy on Railway" button above
2. Railway provisions Rallly + PostgreSQL automatically
3. Open the generated URL and create your first poll

## Environment Variables

| Variable | Description |
|---|---|
| `DATABASE_URL` | PostgreSQL connection (auto-configured) |
| `SECRET_PASSWORD` | Session encryption key (auto-generated, 32+ chars) |
| `NEXT_PUBLIC_BASE_URL` | Public URL (auto-configured) |
| `SUPPORT_EMAIL` | Contact email shown to users (optional) |
| `SMTP_HOST` | Email server for notifications (optional) |
| `SMTP_PORT` | Email server port (optional) |
| `SMTP_USER` | Email username (optional) |
| `SMTP_PWD` | Email password (optional) |

## Estimated Cost

~$5/month on Railway (Rallly + PostgreSQL). Stays flat regardless of poll count.

## Notes

- **Email is optional** — Rallly works without SMTP configured, but participants won't receive email notifications
- **Upgrades** — Update the image tag in the Dockerfile to upgrade Rallly

## License

Rallly is licensed under [AGPL-3.0](https://github.com/lukevella/rallly/blob/main/LICENSE).

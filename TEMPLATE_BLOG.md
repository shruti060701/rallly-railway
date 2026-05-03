# Deploy and Host Rallly-self-hosted on Railway

Rallly is an open-source scheduling tool that kills the "when works for everyone?" email chain. Create a poll with date options, share a link, and participants vote on their availability — no account needed. It's a self-hosted alternative to Doodle and Calendly, built with Next.js and Prisma.

## About Hosting Rallly-self-hosted

Doodle Pro costs $6.95/user/month. Calendly starts at $10/seat/month. For a 10-person team, that's $70-100/month just to schedule meetings. Self-hosting Rallly on Railway costs ~$5/month total — unlimited polls, unlimited participants, zero per-seat fees. This template deploys Rallly with a managed PostgreSQL database, auto-generated session encryption, and a public HTTPS domain. Railway handles SSL and container restarts automatically. Your participants' names, emails, and availability data stay on your infrastructure — which matters if you're scheduling under GDPR or working with sensitive client contacts. Deploy in under two minutes, create your first poll in three clicks.

## Common Use Cases

- **Sprint planning across time zones** — Product managers can create a poll with proposed sprint planning slots and share it with a distributed team. Everyone votes from their own time zone — Rallly auto-adjusts the display. No more "wait, is that 3pm your time or mine?"
- **User research recruitment** — Share a single poll link with 15-20 research participants instead of sending individual calendar invites. You'll collect all availability in hours instead of a week of back-and-forth emails
- **Client meeting scheduling** — Freelancers and agencies send clients a clean branded link to pick meeting times. Clients don't need to create accounts, download apps, or share their full calendar. Just click, vote, done
- **Team offsite and event planning** — Organizing a team dinner, workshop, or offsite? Create a poll with 4-5 date options and let the group decide. Comments on each option let people explain constraints ("I can do the 15th but only after 2pm")
- **Recurring standup optimization** — When team members change or shift to new time zones, drop a quick Rallly poll to find the new best time. Takes 30 seconds to create, saves a 15-minute "can we reschedule standup?" meeting

## Dependencies for Rallly-self-hosted Hosting

- **PostgreSQL** — Stores polls, participant responses, user accounts, comments, and scheduled events. Railway provisions and manages this automatically with persistent storage and daily backups
- **SMTP Server (optional)** — Needed only for email notifications when someone votes or comments. Rallly works completely without it — participants just won't get email updates. Add Resend, Brevo, or Mailgun credentials later if you want notifications

### Deployment Dependencies

- [Rallly Self-Hosting Docs](https://support.rallly.co/self-hosting/introduction)
- [Rallly Docker Hub Image](https://hub.docker.com/r/lukevella/rallly)
- [Rallly Self-Hosted GitHub Repository](https://github.com/lukevella/rallly-selfhosted)
- [Rallly Configuration Reference](https://support.rallly.co/self-hosting/configuration)
- [Rallly Main GitHub Repository](https://github.com/lukevella/rallly)

### Implementation Details

This template runs the official `lukevella/rallly:4.10.0` image with PostgreSQL auto-wired through Railway's template variable references:

```
DATABASE_URL=${{Postgres.DATABASE_URL}}
SECRET_PASSWORD=${{secret(32)}}
NEXT_PUBLIC_BASE_URL=https://${{rallly.RAILWAY_PUBLIC_DOMAIN}}
SUPPORT_EMAIL=noreply@yourdomain.com
```

The `SECRET_PASSWORD` gets auto-generated at deploy time — it encrypts all user sessions. The base URL points to your Railway domain automatically, so poll sharing links work the moment you deploy. SMTP is optional. To enable email notifications later, add `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, and `SMTP_PWD` in Railway's Variables tab. Resend (free, 3,000 emails/month) is the easiest provider to set up.

## Why Deploy Rallly-self-hosted on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Rallly-self-hosted on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.

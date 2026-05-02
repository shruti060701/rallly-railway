# Deploy and Host Rallly-self-hosted on Railway

Rallly is an open-source scheduling and polling platform that eliminates the back-and-forth of finding meeting times. Create a poll, share a link, and let participants vote on their availability — no sign-up required. A self-hosted, privacy-first alternative to Doodle and Calendly.

## About Hosting Rallly-self-hosted

Self-hosting Rallly gives you complete ownership of your scheduling data — participant names, email addresses, and availability responses stay on your own infrastructure. This Railway template deploys Rallly with a managed PostgreSQL database, auto-generated encryption keys, and a public HTTPS domain. Railway handles SSL, networking, and container orchestration so you can focus on scheduling. Unlike Doodle Pro ($6.95/user/month) or Calendly ($10/seat/month), self-hosting Rallly on Railway costs a flat ~$5/month with unlimited polls, unlimited participants, and no per-seat pricing.

## Common Use Cases

- **Team Standup & Sprint Planning** — Product managers can create recurring polls to find the best standup or sprint planning time across distributed teams, without the endless Slack threads
- **User Research Scheduling** — Share a poll link with research participants to find available slots, collecting availability from 10+ people in minutes instead of days of email chains
- **Event & Workshop Coordination** — Organize team offsite dates, workshop sessions, or community meetups by letting all participants vote on preferred dates with time zone auto-detection
- **Client Meeting Scheduling** — Freelancers and agencies can send clients a clean poll link to pick meeting slots, without exposing their full calendar or requiring clients to create an account
- **Cross-Timezone Collaboration** — Remote teams spanning multiple time zones can use Rallly to visually see overlapping availability, making it easy to find the one slot that works for everyone

## Dependencies for Rallly-self-hosted Hosting

- **PostgreSQL** — Stores poll data, participant responses, user accounts, and comments. Railway provisions and manages this automatically with persistent storage.
- **SMTP Server (optional)** — Required only if you want email notifications when participants vote. Rallly works fully without email configured.

### Deployment Dependencies

- [Rallly Official Documentation](https://support.rallly.co/self-hosting/introduction)
- [Rallly Docker Hub Image](https://hub.docker.com/r/lukevella/rallly)
- [Rallly Self-Hosted GitHub Repository](https://github.com/lukevella/rallly-selfhosted)
- [Rallly Main GitHub Repository](https://github.com/lukevella/rallly)

### Implementation Details

This template uses the official `lukevella/rallly:4.10.0` Docker image with PostgreSQL configured via Railway's managed database service. Key environment variables are auto-wired using Railway's template variable references:

```
DATABASE_URL=${{Postgres.DATABASE_URL}}
SECRET_PASSWORD=${{secret(32)}}
NEXT_PUBLIC_BASE_URL=https://${{rallly.RAILWAY_PUBLIC_DOMAIN}}
```

The `SECRET_PASSWORD` is auto-generated at deploy time using Railway's `secret()` function, ensuring user sessions are securely encrypted. The base URL is automatically set to the public Railway domain so poll sharing links work immediately. SMTP configuration is optional — add `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, and `SMTP_PWD` in Railway's Variables tab to enable email notifications.

## Why Deploy Rallly-self-hosted on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Rallly-self-hosted on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.

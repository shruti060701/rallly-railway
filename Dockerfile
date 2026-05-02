FROM lukevella/rallly:4.10.0

# Railway volumes mount as root
USER root

ENV PORT=3000
ENV NODE_ENV=production

EXPOSE 3000

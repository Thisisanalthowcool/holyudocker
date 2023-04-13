FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="npm install --production"
EXPOSE 8080/tcp

LABEL maintainer="TitaniumNetwork"
LABEL summary="Holy Unblocker image"
LABEL description="An Holy Unblocker image, ready to be used in production."

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]
RUN $NPM_BUILD

COPY . .

ENTRYPOINT [ "node" ]
CMD ["scripts/start.js"]
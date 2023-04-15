FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="npm install --omit=dev"
EXPOSE 80/tcp

LABEL maintainer="TitaniumNetwork"
LABEL summary="Holy Unblocker image"
LABEL description="An Holy Unblocker image, ready to be used."

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]
RUN $NPM_BUILD

COPY . .

ENTRYPOINT [ "node" ]
CMD ["scripts/start.js"]

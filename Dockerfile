FROM node:alpine3.14 AS development

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk add git

RUN npm install glob rimraf

RUN npm install --only=development

COPY . .

RUN npm run build

FROM node:alpine3.14 as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ARG GITHUB_CLIENT_ID_ARG
ARG GITHUB_SECRET_ARG
ENV GITHUB_CLIENT_ID=$GITHUB_CLIENT_ID_ARG
ENV GITHUB_SECRET=$GITHUB_SECRET_ARG

WORKDIR /usr/src/app

RUN apk add git
COPY package*.json ./

RUN npm install --only=production

COPY . .

COPY --from=development /usr/src/app/dist ./dist

CMD ["node", "dist/main"]
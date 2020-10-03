FROM node:8-alpine AS builder

RUN apk update && apk add git

WORKDIR /home/pangalink

COPY package.json ./

RUN npm install

FROM node:8-alpine AS deployer

MAINTAINER Lauri Elias <lauri.elias@indoorsman.ee>

RUN apk --no-cache add openssl

WORKDIR /home/pangalink

COPY --from=builder /home/pangalink/node_modules ./node_modules

COPY index.js server.js LICENSE package.json indexes.json ./

COPY routes ./routes

COPY lib ./lib

COPY config ./config

COPY docs ./docs

COPY www ./www

EXPOSE 3480

CMD ["node", "index.js"]
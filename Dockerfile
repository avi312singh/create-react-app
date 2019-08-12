# Only instruction done before a FROM
ARG CODE_VERSION=latest
# Install Node
FROM ubuntu:${CODE_VERSION}
USER root
WORKDIR /home/app
COPY ./package.json /home/app/package.json
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install

# Start with FROM command for dockerfile base image
FROM node:${CODE_VERSION}

WORKDIR /

COPY src ./src
COPY package.json ./
COPY public ./public

RUN echo 'installing dependicies'
RUN npm install && npm install serve -g
RUN echo 'installed dependicies'

RUN echo 'creating production build'
RUN npm run build
RUN echo 'created production build'

COPY build ./build

EXPOSE 5003

RUN echo 'building done'

CMD serve -s build -l 5003
# Only instruction done before a FROM
ARG CODE_VERSION=latest
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
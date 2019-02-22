FROM node:8.0.0


ENV NODE_ENV="production"

WORKDIR /tmp

COPY package.json /tmp/
COPY package-lock.json /tmp/
RUN npm install

WORKDIR /opt/app
COPY . .
RUN cp -a /tmp/node_modules /opt/app


ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

CMD ["node", "server.js"]

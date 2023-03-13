FROM node:16

ENV NODE_ENV=production

ENV ACTUAL_SERVER_FILES=/data/server-files
ENV ACTUAL_USER_FILES=/data/user-files
ENV ACTUAL_SIMPLEFIN_FILES=/data/simplefin-files

WORKDIR /simplefin

COPY ./server/yarn.lock ./
COPY ./server/package.json ./
RUN yarn install

COPY ./server .

EXPOSE 8080

CMD ["node", "./src/index.js"]

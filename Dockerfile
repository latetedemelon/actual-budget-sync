FROM node:16

ENV NODE_ENV=production
ENV ACTUALDBPATH=/server-files
ENV ACTUALUSERPATH=/user-files
ENV SYNCDATAPATH=/syncdata

WORKDIR /app
RUN mkdir /app/server-files
RUN mkdir /app/user-files
RUN mkdir /app/sync-data

COPY ./server/yarn.lock ./
COPY ./server/package.json ./
RUN yarn install

COPY ./server ./app

EXPOSE 8080

CMD ["node", "./src/index.js"]

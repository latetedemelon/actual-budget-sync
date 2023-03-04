FROM node:16

ENV NODE_ENV=production
ENV BUDGETDATA=/app/server-files
ENV USERDATA=/app/user-files
ENV SYNCDATA=/app/sync-data

WORKDIR /app
RUN mkdir /app/server-files
RUN mkdir /app/user-files
RUN mkdir /app/sync-data

COPY ./server/yarn.lock /app/yarn.lock
COPY ./server/package.json /app/package.json
RUN yarn install

COPY ./server/ ./app/

EXPOSE 8080

CMD ["node", "./src/index.js"]

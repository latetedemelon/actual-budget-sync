FROM node:16

ENV NODE_ENV=production
ENV BUDGETDATA=/app/server-files
ENV USERDATA=/app/user-files
ENV SYNCDATA=/app/sync-data

WORKDIR /app

COPY ./server/yarn.lock ./
COPY ./server/package.json ./
RUN yarn install

COPY ./server .

EXPOSE 8080

CMD ["node", "./src/index.js"]

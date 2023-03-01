FROM node:16

ENV NODE_ENV=production
ENV ACTUALDBPATH=/server-files
ENV ACTUALUSERPATH=/user-files
ENV SYNCDATAPATH=/syncdata

RUN mkdir /actualdata
RUN mkdir /actualdata/server-files
RUN mkdir /actualdata/user-files
RUN mkdir /syncdata
RUN mkdir /server

WORKDIR /server

COPY ./server/yarn.lock ./
COPY ./server/package.json ./
RUN yarn install

COPY ./server .

EXPOSE 8080

CMD ["node", "./src/index.js"]

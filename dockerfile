FROM node:lts-alpine

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 4321

CMD npm run start

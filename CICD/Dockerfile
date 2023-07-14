FROM node:14-alpine as test

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:14-alpine

WORKDIR /app

COPY --from=test /app ./

RUN npm install --only=production

CMD ["npm", "start"]

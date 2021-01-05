FROM node:15.5.0-alpine3.10

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./

RUN yarn
RUN yarn global add react-scripts@latest

COPY . ./

CMD ["yarn", "start"]

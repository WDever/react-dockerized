# Build Process

FROM node:15.5.0-alpine3.10 as build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY package.json ./

RUN yarn
RUN yarn global add react-scripts

COPY . ./

RUN yarn build

# Deploy process

FROM nginx:latest

# --from=build는 위의 FROM node:15.~~as build를 명시한 것 
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

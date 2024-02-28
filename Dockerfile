FROM node as builder

WORKDIR /app

COPY . /app

RUN npm install

RUN npm run build

FROM nginx

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
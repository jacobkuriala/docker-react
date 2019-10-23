FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm run build
COPY ./ ./

FROM nginx
COPY --from=builder /app/build/ usr/share/nginx/html

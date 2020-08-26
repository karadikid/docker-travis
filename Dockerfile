# Builder Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Run Phase - FROM keyword signifies new Phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

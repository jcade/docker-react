FROM node:10-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
#Adding a note here 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
FROM node:alpine as builder
#Setup working directory
WORKDIR /home/app1
#Copy necessary build files
COPY package.json ./
# Download and install a dependency
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/app1/build /usr/share/nginx/html

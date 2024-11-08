FROM node:20.16.0-alpine3.20
EXPOSE 8080
ENV DB_HOST="mysql"
RUN useradd expense
RUN mkdir /app
WORKDIR /app
COPY *.json .
COPY *.js .
RUN npm install
CMD ["node", "index.js"]


#before changes
# FROM node:20
# EXPOSE 8080
# ENV DB_HOST="mysql"
# RUN useradd expense
# RUN mkdir /app
# WORKDIR /app
# COPY *.json .
# COPY *.js .
# RUN npm install
# CMD ["node", "index.js"]
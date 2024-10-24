FROM node:20
ENV DB_HOST="mysql"
RUN useradd expense
RUN mkdir /app
WORKDIR /app
COPY *.json .
COPY *.js .
RUN npm install

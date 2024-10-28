FROM node:20
EXPOSE 8080
ENV DB_HOST="localhost"
RUN useradd expense
RUN mkdir /app
WORKDIR /app
COPY *.json .
COPY *.js .
RUN npm install
CMD ["node", "index.js"]

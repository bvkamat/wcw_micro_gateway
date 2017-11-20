FROM node
EXPOSE 3306 3406
COPY . /app
WORKDIR /app
CMD ["node", "app.js"]

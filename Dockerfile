FROM node
EXPOSE 3306
COPY . /app
WORKDIR /app
CMD ["node", "app.js"]

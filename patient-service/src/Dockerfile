FROM node:18-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .

#RUN if [ -f package.json ]; then npm install; fi

EXPOSE 3000
CMD ["node", "src/index.js"]

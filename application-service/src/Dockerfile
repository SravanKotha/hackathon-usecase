FROM node:18-alpine

WORKDIR /app
COPY . .

# If the service has no package.json, skip npm install
RUN if [ -f package.json ]; then npm install; fi

EXPOSE 3001
CMD ["node", "src/index.js"]
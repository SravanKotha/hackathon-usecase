FROM node:18-alpine

WORKDIR /app

# Copy source code first
COPY . .

# Initialize Node project if package.json does not exist
RUN if [ ! -f package.json ]; then \
      npm init -y; \
    fi

# Install dependencies only if package.json exists
RUN npm install --omit=dev || true

EXPOSE 3001

CMD ["node", "src/index.js"]

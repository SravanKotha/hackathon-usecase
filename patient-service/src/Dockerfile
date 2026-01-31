# -----------------------------
# Stage 1: Generate + Install
# -----------------------------
FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

# Generate package.json if missing
RUN if [ ! -f package.json ]; then \
      npm init -y; \
    fi

RUN npm install --omit=dev


# -----------------------------
# Stage 2: Runtime
# -----------------------------
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./
COPY --from=builder /app/src ./src

EXPOSE 3000
CMD ["node", "src/index.js"]

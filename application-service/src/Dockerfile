# ---------- Stage 1: Build ----------
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

# installs deps (needs package-lock.json)
RUN npm ci --omit=dev

COPY src ./src


# ---------- Stage 2: Runtime ----------
FROM node:18-alpine

WORKDIR /app

# copy only what's required to run
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src

ENV NODE_ENV=production
EXPOSE 3000

CMD ["node", "src/index.js"]

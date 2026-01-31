# -----------------------------
# Stage 1: Dependency Install
# -----------------------------
FROM node:18-alpine AS deps

WORKDIR /app

# Copy dependency manifests
COPY package.json package-lock.json ./

# Fail fast if package.json is missing
RUN test -f package.json

# Install production dependencies
RUN npm ci --omit=dev


# -----------------------------
# Stage 2: Runtime
# -----------------------------
FROM node:18-alpine

WORKDIR /app

# Copy node_modules from deps stage
COPY --from=deps /app/node_modules ./node_modules

# Copy application source
COPY src ./src
COPY package.json ./

# Security: non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["node", "src/index.js"]

# Stage 1: build
FROM node:current-alpine AS builder

WORKDIR /app

# Copy files and install dependencies 
COPY package*.json ./
RUN npm ci --omit=dev #similar to npm install --production, ci stands for clean install

COPY . .

# Stage 2: runtime
FROM node:current-alpine 

WORKDIR /app

# Copy only production files from builder
COPY --from=builder /app .

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 8080
CMD ["node", "server.js"]


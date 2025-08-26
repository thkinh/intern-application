FROM node:18.20-alpine

WORKDIR /app

#copy files and install dependencies
COPY package*.json ./
RUN npm install --production

COPY . .

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 8080
CMD ["node", "server.js"]


# Use lightweight Node image (Base environment)
FROM node:18-alpine

# Create working directory (Where app runs)
WORKDIR /app

# Copy dependency files (Faster dependency caching)
COPY package*.json ./

# Install only production dependencies (Install only the dependencies your app needs to run)
RUN npm install --production

# Copy application files (codes)
COPY . .

# Expose application port
EXPOSE 3000

# Start application (server)
CMD ["node", "app.js"]

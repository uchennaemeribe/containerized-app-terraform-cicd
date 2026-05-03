# =========================================
# 🐳 Base Image (Base environment)
# =========================================
FROM node:18-alpine

# =========================================
# 📁 Set Working Directory (Where app runs)
# =========================================
WORKDIR /app

# =========================================
# 📦 Copy Dependencies (Faster dependency caching)
# =========================================
COPY package*.json ./

# =========================================
# ⚙️ Install Production Dependencies (Install only the dependencies your app needs to run)
# =========================================
RUN npm install --production

# =========================================
# 📂 Copy Application Source Code
# =========================================
COPY . .

# =========================================
# 🌐 Expose Application Port
# =========================================
EXPOSE 3000

# =========================================
# ▶️ Start Application (Server)
# =========================================
CMD ["node", "app.js"]
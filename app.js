// =========================================
// 🚀 Import Dependencies
// =========================================
const express = require('express');
const app = express();

// =========================================
// ⚙️ Application Configuration
// =========================================
const PORT = 3000;

// =========================================
// 🌐 Root Endpoint
// =========================================
app.get('/', (req, res) => {
  res.send('🚀 CI/CD Pipeline Working Successfully!');
});

// =========================================
// ❤️ Health Check Endpoint
// =========================================
app.get('/health', (req, res) => {
  res.json({ status: "OK" });
});

// =========================================
// ▶️ Start Server
// =========================================
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
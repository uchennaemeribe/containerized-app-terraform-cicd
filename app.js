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
  res.send('🚀 Dynamic Infrastructure Recovery Pipeline Active!');
});
// =========================================
// ❤️ Health Check Endpoint
// =========================================
app.get('/health', (req, res) => {
  res.json({
    status: "OK",
    recovery_mode: "ENABLED"
  });
});
// =========================================
// ▶️ Start Server
// =========================================
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
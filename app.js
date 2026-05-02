const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;

/* Root Endpoint */
app.get('/', (req, res) => {
  res.send('Container Deployment Successful!');
});

/* Health Check Endpoint (CRITICAL FOR CI/CD) */
app.get('/health', (req, res) => {
  res.status(200).json({
    status: "OK",
    uptime: process.uptime(),
    timestamp: new Date()
  });
});

/* Start Server */
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

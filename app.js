const express = require('express');

const app = express();

const PORT = 3000;

app.get('/', (req, res) => {
  res.send('🚀 Enterprise Dynamic Infrastructure Recovery Pipeline Active!');
});

app.get('/health', (req, res) => {
  res.json({
    status: "OK",
    recovery_mode: "ENABLED"
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
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

  res.send(`
    <html>
      <head>
        <title>Enterprise CI/CD Recovery Pipeline</title>

        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #0f172a;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
          }

          .container {
            max-width: 800px;
            padding: 40px;
          }

          h1 {
            color: #38bdf8;
            font-size: 2.5rem;
          }

          p {
            font-size: 1.2rem;
            line-height: 1.8;
          }

          .status {
            margin-top: 30px;
            padding: 15px;
            background-color: #1e293b;
            border-radius: 10px;
          }

          .highlight {
            color: #22c55e;
            font-weight: bold;
          }
        </style>
      </head>

      <body>

        <div class="container">

          <h1>
            🚀 Enterprise CI/CD Recovery Pipeline Active Designed By Group 4 and Inspired By Mrs Mary Ajayi
          </h1>

          <p>
            Stable Infrastructure + Application-Level Deployment
          </p>

          <div class="status">

            <p>
              ✅ Infrastructure Status:
              <span class="highlight">STABLE</span>
            </p>

            <p>
              ✅ Deployment Strategy:
              <span class="highlight">ENTERPRISE CI/CD</span>
            </p>

            <p>
              ✅ Downtime Strategy:
              <span class="highlight">MINIMAL</span>
            </p>

            <p>
              ✅ Domain:
              <span class="highlight">
                https://auemeribetech.com.ng
              </span>
            </p>

          </div>

        </div>

      </body>
    </html>
  `);

});

// =========================================
// ❤️ Health Check Endpoint
// =========================================
app.get('/health', (req, res) => {

  res.json({
    status: "OK",
    deployment: "PRODUCTION",
    infrastructure: "STABLE",
    architecture: "ENTERPRISE_CICD",
    domain: "https://auemeribetech.com.ng"
  });

});

// =========================================
// ▶️ Start Server
// =========================================
app.listen(PORT, () => {

  console.log(`
=========================================
🚀 ENTERPRISE CI/CD PIPELINE ACTIVE
=========================================
Application Running on Port ${PORT}
=========================================
`);

});
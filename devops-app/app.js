const http = require('http');

const server = http.createServer((req, res) => {
  res.write("Welcome to DevOps Capstone Project that was Prepared by Anthony Uchenna Emeribe");
  res.end();
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});

const http = require('http');
// const port = process.env.PORT || 3000;
const HOST = '0.0.0.0';
const PORT = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'Hello Node!\n'
  res.end(msg);
});

// server.listen(port, () => {
//   console.log(`Server running on http://localhost:${port}/`);
// });

server.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
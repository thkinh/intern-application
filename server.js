// server.js
const express = require('express');
require('dotenv').config(); 

const app = express();

app.get('/', (req, res) => {
  res.json({ status: 'ok' });
});

const PORT = process.env.PORT;
app.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});

module.exports = app;

// Tiny Express app — responds "Hello CI/CD" on /.
// This is the thing the pipeline will test, build and deploy.
// Port 3000 must match the Dockerfile EXPOSE and the .woodpecker.yml deploy step.
const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (_req, res) => {
  res.send('Hello CI/CD');
});

app.listen(PORT, () => {
  console.log(`App running on http://localhost:${PORT}`);
});

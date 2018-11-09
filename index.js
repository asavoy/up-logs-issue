const express = require("express");

const { PORT = 3000 } = process.env;

const app = express();

app.get("/", (req, res) => {
  console.log(JSON.stringify({ level: "info", message: "test" }));
  res.send(`{"success":true}`);
});

app.listen(PORT, () => {
  console.log("listening on %s", PORT);
});


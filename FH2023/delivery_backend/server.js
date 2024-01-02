const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
const logger = require("morgan");
const cors = require("cors");

/*
Rota yolu tanımlamaları
*/

const usersRoutes = require("./routes/userRoutes");

const port = process.env.PORT || 3000;

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());

app.disable("x-powered-by");

app.set("port", port);

/*
Rota Çağrıları
*/

usersRoutes(app);

server.listen(3000, "192.168.0.13" || "localhost", () => {
  console.log("NodeJs application " + port + "Started on port 3000");
});

app.get("/", (req, res) => {
  res.send("Hello World! Backend is running");
});

app.get("/test", (req, res) => {
  res.send("Hello World! Rota Test");
});

//ERROR HANDLING

app.use((req, res, next) => {
  const err = new Error("Not Found");
  err.status = 404;
  res.json(err);
});

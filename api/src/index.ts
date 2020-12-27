import bodyParser from "body-parser";
import dotenv from "dotenv";
dotenv.config();

import express, { Request, Response } from "express";
import { useRoutes } from "./routes";

const PORT = process.env.PORT || 8091;

const app = express();

app.use(bodyParser.json());

useRoutes(app);

app.get("/", (req: Request, res: Response) => {
  res.json({ ok: "ok" });
});

app.listen(PORT, () => console.log(`App running on ${PORT}`));

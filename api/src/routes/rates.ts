import { Router } from "express";
import { rateController } from "../controllers/rates";

const rateRouter = Router();

rateRouter.post("/", rateController.insertRate);

export { rateRouter };

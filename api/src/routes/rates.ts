import { Router } from "express";
import { rateController } from "../controllers/rates";

const rateRouter = Router();

rateRouter.post("/", rateController.insertRate);
rateRouter.get("/", rateController.findAllRate);
rateRouter.delete("/:id", rateController.deleteRate);

export { rateRouter };

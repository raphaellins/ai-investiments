import { Application } from "express";

import Router from "express";
import { rateRouter } from "./rates";

export const useRoutes = (app: Application) => {
  const apiRouter = Router();

  apiRouter.use("/rates", rateRouter);

  app.use("/api/v1", apiRouter);
};

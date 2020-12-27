import { Request, Response } from "express";
import { Rate, rateModel } from "../models/Rates";
import { badRequest, internalServerError } from "../services/utils";

const insertRate = (req: Request, res: Response) => {
  {
    const rate = req.body;

    if (!rate) {
      return badRequest(res, "Invalid Rates");
    }

    if (!(parseFloat(rate.value) > 0)) {
      return badRequest(res, "Invalid Rate Value");
    }
  }

  const rate = req.body as Rate;

  console.log(rate);

  rateModel
    .insertRate(rate)
    .then((id) => {
      res.json({ id });
    })
    .catch((err) => {
      internalServerError(res, err);
    });
};

export const rateController = {
  insertRate,
};

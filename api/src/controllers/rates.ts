import { Request, Response } from "express";
import { Rate, rateModel } from "../models/Rates";
import { badRequest, internalServerError } from "../services/utils";

const insertRate = (req: Request, res: Response) => {
  const rate: Rate = req.body;

  if (!rate) {
    return badRequest(res, "Invalid Rates");
  }

  if (!(parseFloat(rate.value) > 0)) {
    return badRequest(res, "Invalid Rate Value");
  }

  if (!rate.log) {
    return badRequest(res, "Invalid log");
  }

  console.log("Rate to record:", rate);

  rateModel
    .insertRate(rate)
    .then((id) => {
      res.json({ id });
    })
    .catch((err) => {
      internalServerError(res, err);
    });
};

const findAllRate = (req: Request, res: Response) => {
  rateModel
    .findAllRates()
    .then((rates: Rate[]) => {
      res.json(rates);
    })
    .catch((err) => {
      internalServerError(res, err);
    });
};

const deleteRate = (req: Request, res: Response) => {
  const id: string = req.params.id;

  if (!id) {
    badRequest(res, "Inform the resource (id)");
  }

  rateModel.deleteRate(Number(id));

  res.json({
    result: "Deleted",
  });
};

export const rateController = {
  insertRate,
  findAllRate,
  deleteRate,
};

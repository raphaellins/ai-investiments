import { Request, Response } from "express";
import { Rate, rateModel } from "../models/Rates";
import { badRequest, internalServerError } from "../services/utils";

const insertRate = (req: Request, res: Response) => {
  const rate: Rate = req.body;

  if (!rate) {
    return badRequest(res, "Invalid Rates");
  }

  if (
    !isValidValue(rate.open) ||
    !isValidValue(rate.high) ||
    !isValidValue(rate.low) ||
    !isValidValue(rate.close) ||
    !isValidValue(rate.tickVolume) ||
    !isValidValue(rate.spread) ||
    !isValidValue(rate.realVolume)
  ) {
    return badRequest(res, `Invalid Resource ${rate}`);
  }

  if (!rate.log) {
    return badRequest(res, "Invalid log");
  }

  if (!rate.time) {
    return badRequest(res, "Invalid time");
  }

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

const isValidValue = (value: number): boolean => {
  return value != null && parseFloat(value.toString()) > 0;
};

export const rateController = {
  insertRate,
  findAllRate,
  deleteRate,
};

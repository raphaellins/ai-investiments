import { dbQuery } from "../services/database";

export type Rate = {
  log: string;
  open: number;
  high: number;
  low: number;
  close: number;
  tickVolume: number;
  spread: number;
  realVolume: number;
  time: string;
};

const insertRate = async (rate: Rate) => {
  await dbQuery(
    `INSERT INTO rates (log, open, high, low, close, tick_volume, spread, real_volume, time) VALUES (?,?)`,
    [
      rate.log,
      rate.open,
      rate.high,
      rate.low,
      rate.close,
      rate.tickVolume,
      rate.spread,
      rate.realVolume,
      rate.time,
    ]
  );

  let rates = await dbQuery(
    `SELECT seq FROM sqlite_sequence WHERE name = 'rates'`
  );

  return rates[0].seq as number | undefined;
};

const findAllRates = async (): Promise<Rate[]> => {
  const rates: Rate[] = await dbQuery(`SELECT * from rates`);

  return rates;
};

const deleteRate = async (id: number) => {
  await dbQuery(`DELETE FROM rates WHERE id=${id}`);
};

export const rateModel = {
  insertRate,
  findAllRates,
  deleteRate,
};

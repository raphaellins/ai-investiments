import { dbQuery } from "../services/database";

export type Rate = {
  value: number;
  log: string;
};

const insertRate = async (rate: Rate) => {
  await dbQuery(`INSERT INTO rates (value, log) VALUES (?,?)`, [
    rate.value,
    rate.log,
  ]);

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

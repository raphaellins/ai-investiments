import { dbQuery } from "../services/database";

export type Rate = {
  value: number;
};

const insertRate = async (rate: Rate) => {
  // await dbQuery(`CREATE TABLE rates (
  //   id INTEGER PRIMARY KEY,
  //   value REAL
  // );`);

  await dbQuery(`INSERT INTO rates (value) VALUES (?)`, [rate.value]);

  let rates = await dbQuery(
    `SELECT id FROM sqlite_sequence WHERE name = 'rates'`
  );

  return rates[0].id as number | undefined;
};

export const rateModel = {
  insertRate,
};

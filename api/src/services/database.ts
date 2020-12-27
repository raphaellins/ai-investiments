import sqlite3 from "sqlite3";

const DATABASE_FILE = process.env.DATABASE_FILE;

if (!DATABASE_FILE) {
  throw new Error("DATABASE NOT FOUND");
}

export const openConnection = () => {
  let database = new sqlite3.Database(DATABASE_FILE);
  return database;
};

export const dbQuery = (query: string, params?: any[]): Promise<any[]> => {
  let database = openConnection();
  console.log(database);
  return new Promise<any[]>((resolve, reject) => {
    database.all(query, params, (err, rows) => {
      if (err) {
        reject(err);
      } else {
        resolve(rows);
      }
    });
  }).finally(() => {
    database.close();
  });
};

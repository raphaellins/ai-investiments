import sqlite3 from "sqlite3";

const DATABASE_FILE = process.env.DATABASE_FILE;

if (!DATABASE_FILE) {
  throw new Error("DATABASE NOT FOUND");
}

export const openConnection = () => {
  let database = new sqlite3.Database("./main.db", (err) => {
    if (err) {
      return console.error("Error on open database: ", err.message);
    }
    console.log(`Connected to the ${DATABASE_FILE} SQlite database.`);
  });
  return database;
};

export const dbQuery = (query: string, params?: any[]): Promise<any[]> => {
  let database = openConnection();

  return new Promise<any[]>((resolve, reject) => {
    database.all(query, params, (err, rows) => {
      console.log(query, params, err);
      if (err) {
        reject(err);
        console.log(err);
      } else {
        resolve(rows);
      }
    });
  }).finally(() => {
    database.close();
  });
};

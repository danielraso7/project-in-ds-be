import pool from "./db.js";

export const getKlimaticketInfo = async () => {
  const [rows] = await pool.query("call getKlimaticketInfo()");

  return rows[0][0];
};

export const updateKlimaticketTypeProc = async (special) => {
  const [result] = await pool.query("call updateKlimaticketType(?)", [
    special === "true" ? 1 : 0,
  ]);

  return result[0][0];
};

export const getDashboardInfo = async () => {
  const [rows] = await pool.query("call getDashboardInfo()");

  return rows[0][0];
};

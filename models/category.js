import pool from "./db.js";

export const getCategories = async () => {
  const [rows] = await pool.query("call getCategories()");

  return rows[0];
};

export const addCategory = async (newCategory) => {
  const [result] = await pool.query("call addCategory(?, ?)", [
    newCategory.label,
    newCategory.color,
  ]);

  return result[0][0];
};

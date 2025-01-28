import pool from "./db.js";

export const getFriends = async () => {
  const [rows] = await pool.query("call getFriends()");

  return rows[0];
};

export const addFriend = async (newFriend) => {
  const [result] = await pool.query("call addFriend(?)", [newFriend.username]);

  return result[0][0]; // {message: 'OK}
};

export const deleteFriend = async (id) => {
  const [result] = await pool.query("call deleteFriend(?)", [id]);

  return result[0][0];
};

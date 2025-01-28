import pool from "./db.js";

export const getTrips = async () => {
  const [rows] = await pool.query("call getTrips()");

  return rows[0];
};

export const addTrip = async (newTrip) => {
  if (newTrip.duration === "") {
    newTrip.duration = null;
  }
  if (newTrip.price === "") {
    newTrip.price = null;
  }
  const [result] = await pool.query(
    "call addTrip(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      newTrip.date,
      newTrip.fromStation,
      newTrip.toStation,
      JSON.stringify(newTrip.stops),
      newTrip.description,
      newTrip.duration,
      newTrip.distance,
      newTrip.price,
      newTrip.selectedCategory,
      JSON.stringify(newTrip.selectedFriends),
    ]
  );

  return result[0][0]; // {message: 'OK}
};

export const deleteTrip = async (id) => {
  const [result] = await pool.query("call deleteTrip(?)", [id]);

  return result[0][0];
};

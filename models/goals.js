import pool from "./db.js";

export const getGoals = async () => {
  const [rows] = await pool.query("call getGoals()");

  return rows[0];
};

export const addGoal = async (newGoal) => {
  const [result] = await pool.query(
    "call addGoal(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      newGoal.goalType,
      newGoal.startDate,
      newGoal.endDate,
      JSON.stringify(newGoal.selectedFriends),
      newGoal.selectedCategory,
      newGoal.isPercentage,
      newGoal.coverNumber,
      newGoal.coverObject,
      newGoal.countNumber,
      newGoal.countObject,
      newGoal.federalState,
      newGoal.price,
      newGoal.predefinedGoal,
    ]
  );

  return result[0][0];
};

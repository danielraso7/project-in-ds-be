import { getGoals, addGoal } from "../models/goals.js";

export const fetchGoals = async (req, res) => {
  const goals = await getGoals();

  res.status(200).json(goals);
};

export const createGoal = async (req, res) => {
  const newGoal = req.body;

  const result = await addGoal(newGoal);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

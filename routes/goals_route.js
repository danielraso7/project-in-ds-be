import express from "express";
import { fetchGoals, createGoal } from "../controllers/goals_controller.js";

const router = express.Router();

router.get("/", fetchGoals);

router.post("/", createGoal);

export default router;

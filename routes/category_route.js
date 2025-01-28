import express from "express";
import {
  fetchCategories,
  createCategory,
} from "../controllers/category_controller.js";

const router = express.Router();

router.get("/", fetchCategories);

router.post("/", createCategory);

export default router;

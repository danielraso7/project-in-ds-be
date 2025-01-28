import { getCategories, addCategory } from "../models/category.js";

export const fetchCategories = async (req, res) => {
  const categories = await getCategories();

  res.status(200).json(categories);
};

export const createCategory = async (req, res) => {
  const newCategory = req.body;

  const result = await addCategory(newCategory);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

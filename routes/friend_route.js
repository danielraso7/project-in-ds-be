import express from "express";
import {
  fetchFriends,
  addFriendByUsername,
  deleteFriendById,
} from "../controllers/friend_controller.js";

const router = express.Router();

router.get("/", fetchFriends);

router.post("/", addFriendByUsername);

router.delete("/:id", deleteFriendById);

export default router;

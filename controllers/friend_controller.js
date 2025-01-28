import { getFriends, addFriend, deleteFriend } from "../models/friend.js";

export const fetchFriends = async (req, res) => {
  const friends = await getFriends();

  res.status(200).json(friends);
};

export const addFriendByUsername = async (req, res) => {
  const newFriend = req.body;

  const result = await addFriend(newFriend);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

export const deleteFriendById = async (req, res) => {
  const { id } = req.params;

  const result = await deleteFriend(id);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

import { getTrips, addTrip, deleteTrip } from "../models/trips.js";

export const fetchTrips = async (req, res) => {
  const trips = await getTrips();

  res.status(200).json(trips);
};

export const createTrip = async (req, res) => {
  const newTrip = req.body;

  const result = await addTrip(newTrip);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

export const deleteTripById = async (req, res) => {
  const { id } = req.params;

  const result = await deleteTrip(id);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

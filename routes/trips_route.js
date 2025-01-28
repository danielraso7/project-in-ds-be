import express from "express";
import {
  fetchTrips,
  createTrip,
  deleteTripById,
} from "../controllers/trips_controller.js";

const router = express.Router();

router.get("/", fetchTrips);

router.post("/", createTrip);

router.delete("/:id", deleteTripById);

export default router;

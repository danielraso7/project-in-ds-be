import express from "express";
import {
  fetchKlimaticketInfo,
  updateKlimaticketType,
  fetchDashboardInfo,
} from "../controllers/profile_controller.js";

const router = express.Router();

router.get("/klimaticket", fetchKlimaticketInfo);

router.put("/klimaticket/:special", updateKlimaticketType);

router.get("/dashboard", fetchDashboardInfo);

export default router;

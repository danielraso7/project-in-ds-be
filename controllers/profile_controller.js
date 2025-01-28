import {
  getKlimaticketInfo,
  getDashboardInfo,
  updateKlimaticketTypeProc,
} from "../models/profile.js";

export const fetchKlimaticketInfo = async (req, res) => {
  const info = await getKlimaticketInfo();

  res.status(200).json(info);
};

export const fetchDashboardInfo = async (req, res) => {
  const info = await getDashboardInfo();

  res.status(200).json(info);
};

export const updateKlimaticketType = async (req, res) => {
  const { special } = req.params;

  const result = await updateKlimaticketTypeProc(special);

  let statusCode;
  if (result.message === "OK") {
    statusCode = 201;
  } else {
    statusCode = 400;
    console.log(result.message);
  }

  res.status(statusCode).json(result);
};

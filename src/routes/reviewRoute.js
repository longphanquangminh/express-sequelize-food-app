import express from "express";
import { getRateByRestaurant, getRateByUser, postRate } from "../controllers/reviewController.js";

const reviewRoute = express.Router();

reviewRoute.get("/restaurants/:res_id", getRateByRestaurant);

reviewRoute.get("/users/:user_id", getRateByUser);

reviewRoute.post("/", postRate);

export default reviewRoute;

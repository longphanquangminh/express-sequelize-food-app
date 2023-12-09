import express from "express";
import likeRoute from "./likeRoute.js";
import reviewRoute from "./reviewRoute.js";
import orderRoute from "./orderRoute.js";

const rootRoute = express.Router();

rootRoute.use("/like", likeRoute);
rootRoute.use("/review", reviewRoute);
rootRoute.use("/order", orderRoute);

export default rootRoute;

import express from "express";
import swaggerUi from "swagger-ui-express";
import swaggerDocument from "../../Cyber.postman_collection.json" assert { type: "json" };
import likeRoute from "./likeRoute.js";
import reviewRoute from "./reviewRoute.js";
import orderRoute from "./orderRoute.js";

const rootRoute = express.Router();

rootRoute.use("/like", likeRoute);
rootRoute.use("/review", reviewRoute);
rootRoute.use("/order", orderRoute);

rootRoute.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

export default rootRoute;

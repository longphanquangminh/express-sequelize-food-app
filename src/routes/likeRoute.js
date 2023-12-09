import express from "express";
import { getLikeByRestaurant, getLikeByUser, postLike, unLike } from "../controllers/likeController.js";

const likeRoute = express.Router();

likeRoute.get("/restaurants/:res_id", getLikeByRestaurant);

likeRoute.get("/users/:user_id", getLikeByUser);

likeRoute.post("/", postLike);

likeRoute.delete("/", unLike);

export default likeRoute;

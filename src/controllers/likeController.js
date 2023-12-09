import { responseData } from "../config/Response.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

export const getLikeByRestaurant = async (req, res) => {
  try {
    const { res_id } = req.params;
    const restaurant = await model.restaurants.findOne({ where: { res_id } });
    if (!restaurant) {
      responseData(res, "Nhà hàng không tồn tại", "", 404);
      return;
    }

    const data = await model.like_res.findAll({
      where: { res_id },
      include: ["re", "user"],
    });

    responseData(res, "Thành công", data, 200);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi: " + error.message, "", 500);
  }
};

export const getLikeByUser = async (req, res) => {
  try {
    const { user_id } = req.params;
    const user = await model.users.findOne({ where: { user_id } });
    if (!user) {
      responseData(res, "Người dùng không tồn tại", "", 404);
      return;
    }

    const data = await model.like_res.findAll({
      where: { user_id },
      include: ["re", "user"],
    });

    responseData(res, "Thành công", data, 200);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi: " + error.message, "", 500);
  }
};

export const postLike = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    const user = await model.users.findOne({ where: { user_id } });
    if (!user) {
      responseData(res, "Người dùng không tồn tại", "", 404);
      return;
    }
    const restaurant = await model.restaurants.findOne({ where: { res_id } });
    if (!restaurant) {
      responseData(res, "Nhà hàng không tồn tại", "", 404);
      return;
    }
    const checkUserLiked = await model.like_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    if (checkUserLiked) {
      responseData(res, "Người dùng này đã like nhà hàng!", "", 400);
      return;
    }

    const newData = {
      user_id,
      res_id,
      date_like: new Date(),
    };

    await model.like_res.create(newData);

    responseData(res, "Like thành công", "", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

export const unLike = async (req, res) => {
  try {
    const { user_id, res_id } = req.body;
    const user = await model.users.findOne({ where: { user_id } });
    if (!user) {
      responseData(res, "Người dùng không tồn tại", "", 404);
      return;
    }
    const restaurant = await model.restaurants.findOne({ where: { res_id } });
    if (!restaurant) {
      responseData(res, "Nhà hàng không tồn tại", "", 404);
      return;
    }
    const checkUserLiked = await model.like_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    if (!checkUserLiked) {
      responseData(res, "Người dùng này chưa like nhà hàng!", "", 400);
      return;
    }

    await model.like_res.destroy({ where: { user_id, res_id } });

    responseData(res, "Unlike thành công", "", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

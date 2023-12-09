import { responseData } from "../config/Response.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

export const getRateByRestaurant = async (req, res) => {
  try {
    const { res_id } = req.params;
    const restaurant = await model.restaurants.findOne({ where: { res_id } });
    if (!restaurant) {
      responseData(res, "Nhà hàng không tồn tại", "", 404);
      return;
    }

    const data = await model.rate_res.findAll({
      where: { res_id },
      include: ["re", "user"],
    });

    responseData(res, "Thành công", data, 200);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi: " + error.message, "", 500);
  }
};

export const getRateByUser = async (req, res) => {
  try {
    const { user_id } = req.params;
    const user = await model.users.findOne({ where: { user_id } });
    if (!user) {
      responseData(res, "Người dùng không tồn tại", "", 404);
      return;
    }

    const data = await model.rate_res.findAll({
      where: { user_id },
      include: ["re", "user"],
    });

    responseData(res, "Thành công", data, 200);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi: " + error.message, "", 500);
  }
};

export const postRate = async (req, res) => {
  try {
    const { user_id, res_id, amount } = req.body;
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
    const checkUserRated = await model.rate_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    if (checkUserRated) {
      responseData(res, "Người dùng này đã rate nhà hàng!", "", 400);
      return;
    }

    if (amount < 0 || amount > 5) {
      responseData(res, "Rating phải từ 0 đến 5", "", 400);
      return;
    }

    const newData = {
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    };

    await model.rate_res.create(newData);

    responseData(res, "Rate thành công", "", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

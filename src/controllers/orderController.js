import { responseData } from "../config/Response.js";
import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

export const postOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;
    const user = await model.users.findOne({ where: { user_id } });
    if (!user) {
      responseData(res, "Người dùng không tồn tại", "", 404);
      return;
    }
    const food = await model.foods.findOne({ where: { food_id } });
    if (!food) {
      responseData(res, "Món ăn không tồn tại", "", 404);
      return;
    }

    if (amount <= 0) {
      responseData(res, "Số lượng thức ăn phải lớn hơn 0", "", 400);
      return;
    }

    if (code == "") {
      responseData(res, "Code không được bỏ trống!", "", 400);
      return;
    }

    const newData = {
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    };

    await model.orders.create(newData);

    responseData(res, "Đặt món ăn thành công!", "", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

const Base = require("./base.js");
const jwt = think.service("jwt");

module.exports = class extends Base {
  async listAction() {
    const data = this.get();
    const token = this.header("authorization");
    const res = await jwt.validate(token);

    if (!res) return this.fail(0, "请先登录");

    if (typeof +data.pageNum === "number") {
      // 获取userId
      const user = await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
        })
        .field({
          "ss_user.id": "userId",
        })
        .find();

      // 获取服务订单list
      if (user.userId) {
        const list = await think
          .model("order_lookafter")
          .join("ss_hospital on ss_hospital.id=ss_order_lookafter.hospital_id")
          .join(
            "ss_lookafter_project on ss_lookafter_project.id=ss_order_lookafter.project_id"
          )
          .join(
            "ss_lookafter_project_type on ss_lookafter_project_type.id=ss_lookafter_project.type_id"
          )
          .join("ss_nurse on ss_nurse.id=ss_order_lookafter.nurse_id")
          .join("ss_disease on ss_disease.id=ss_order_lookafter.disease_id")
          .join(
            "ss_order_lookafter_status on ss_order_lookafter_status.id=ss_order_lookafter.status_id"
          )
          .where({
            "ss_order_lookafter.user_id": user.userId,
            "ss_lookafter_project.status": 0,
          })
          .field({
            "ss_order_lookafter.id": "id",
            "ss_hospital.name": "hospital_name",
            "ss_order_lookafter.no": "no",
            "ss_lookafter_project.name": "project_name",
            "ss_lookafter_project_type.name": "type",
            "ss_lookafter_project.introduce": "introduce",
            "ss_lookafter_project.appointment_desc": "appointment_desc",
            "ss_lookafter_project.fee_desc": "fee_desc",
            "ss_lookafter_project.out_fee": "out_fee",
            "ss_lookafter_project.technology_fee": "technology_fee",
            "ss_lookafter_project.consumable_fee": "consumable_fee",
            "ss_lookafter_project.total_money": "total_money",
            "ss_nurse.name": "nurse_name",
            "ss_nurse.avatar": "nurse_avatar",
            "ss_nurse.sex": "nurse_sex",
            "ss_nurse.zcnm": "nurse_zcnm",
            "ss_nurse.special": "nurse_special",
            "ss_order_lookafter_status.id": "id",
            "ss_order_lookafter_status.name": "name",
          })
          .limit(+data.pageNum * 10, 10)
          .select();
        return this.success(list);
      }
    }
    return this.fail(0, "出现了不可预料的问题");
  }

  async paymentAction() {
    const data = this.post();
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    const successList = [];

    if (!res) return this.fail(0, "请先登录");

    if (typeof data.orderIds === "string") {
      const ids = data.orderIds.split(",");
      let isIds = true;

      // 校验id是否被修改：1. 重合 2. 非数字 3. 为空
      const setIds = [...new Set(ids)];
      if (ids.toString() !== setIds.toString()) isIds = false;
      ids.forEach((val) => {
        if (isNaN(+val) || val === "") isIds = false;
      });
      if (!isIds) return this.fail("lookafter_id错误");

      for (let i = 0; i < ids.length; i++) {
        const isValid = await think
          .model("order_lookafter")
          .where({
            id: ids[i],
            status_id: 1,
          })
          .update({
            status_id: 2,
          });
        if (isValid) {
          successList.push(ids[i]);
        }
      }
      return this.success(successList, "支付成功的订单号");
    }
    this.fail(1, "出问题了");
  }
};

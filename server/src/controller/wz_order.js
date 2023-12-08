const Base = require("./base.js");
const jwt = think.service("jwt");

module.exports = class extends Base {
  async listAction() {
    const data = this.get();
    const token = this.header("authorization");
    const res = await jwt.validate(token);

    if (!res) return this.fail(0, "请先登录");

    if (typeof +data.pageNum === "number") {
      // 先拿userid
      const user = await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
        })
        .field({
          "ss_user.id": "userId",
        })
        .find();

      // 用userid分页查
      if (user.userId) {
        const list = await think
          .model("order_wz")
          .join("ss_disease on ss_disease.id=ss_order_wz.disease_id")
          .join(
            "ss_order_wz_status on ss_order_wz_status.id=ss_order_wz.status_id"
          )
          .join("ss_doctor on ss_doctor.id=ss_order_wz.doctor_id")
          .join("ss_hospital on ss_hospital.id=ss_order_wz.hospital_id")
          .join(
            "ss_hospital_department on ss_hospital_department.hospital_id=ss_hospital.id"
          )
          .where({
            "ss_order_wz.user_id": user.userId,
          })
          .field({
            "ss_order_wz.id": "id",
            "ss_disease.name": "disease_name",
            "ss_order_wz.no": "no",
            "ss_order_wz.transaction_no": "transaction_no",
            "ss_hospital.name": "hospital_name",
            "ss_hospital_department.name": "department_name",
            "ss_doctor.name": "doctor_name",
            "ss_order_wz_status.name": "status",
            "ss_order_wz.logistics_no": "logistics_no",
            "ss_order_wz.remark": "remark",
            "ss_order_wz.money": "money",
            "ss_order_wz.add_time": "wz_time",
          })
          .limit(+data.pageNum * 10, 10)
          .select();
        return this.success(list);
      }
      return this.fail(0, "出现了不可预料的问题");
    }
  }

  // status_id: 1(未支付) 2(已支付)
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
      if (!isIds) return this.fail("wz_id错误");

      for (let i = 0; i < ids.length; i++) {
        const isValid = await think
          .model("order_wz")
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

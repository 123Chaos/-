const Base = require("./base.js");
const jwt = think.service("jwt");

module.exports = class extends Base {
  async listAction() {
    const data = this.get();
    const token = this.header("authorization");
    const res = await jwt.validate(token);

    if (!res) return this.fail(0, "请先登录");
    if (typeof +data.pageNum === "number") {
      // 获取服务项目list
      const list = await think
        .model("lookafter_project")
        .join("ss_hospital on ss_hospital.id=ss_lookafter_project.hospital_id")
        .join(
          "ss_lookafter_project_type on ss_lookafter_project_type.id=ss_lookafter_project.type_id"
        )
        .limit(+data.pageNum * 10, 10)
        .field({
          "ss_hospital.id": "hospital_id",
          "ss_hospital.name": "hospital_name",
          "ss_lookafter_project.name": "project_name",
          "ss_lookafter_project_type.name": "type",
          "ss_lookafter_project.introduce": "introduce",
          "ss_lookafter_project.appointment_desc": "appointment_desc",
          "ss_lookafter_project.fee_desc": "fee_desc",
          "ss_lookafter_project.out_fee": "out_fee",
          "ss_lookafter_project.technology_fee": "technology_fee",
          "ss_lookafter_project.consumable_fee": "consumable_fee",
          "ss_lookafter_project.total_money": "total_money",
        })
        .where({
          "ss_lookafter_project.status": 0, // 0. 启用 1. 禁用
        })
        .select();

      return this.success(list);
    }
    return this.fail("出现了未知错误");
  }

  async detailAction() {
    const data = this.get();
    const token = this.header("authorization");
    const res = await jwt.validate(token);

    if (!res) return this.fail(0, "请先登录");

    if (data.project_id) {
      const list = await think
        .model("lookafter_project")
        .join("ss_hospital on ss_hospital.id=ss_lookafter_project.hospital_id")
        .join(
          "ss_lookafter_project_type on ss_lookafter_project_type.id=ss_lookafter_project.type_id"
        )
        .field({
          "ss_hospital.id": "hospital_id",
          "ss_hospital.name": "hospital_name",
          "ss_lookafter_project.name": "project_name",
          "ss_lookafter_project_type.name": "type",
          "ss_lookafter_project.introduce": "introduce",
          "ss_lookafter_project.appointment_desc": "appointment_desc",
          "ss_lookafter_project.fee_desc": "fee_desc",
          "ss_lookafter_project.out_fee": "out_fee",
          "ss_lookafter_project.technology_fee": "technology_fee",
          "ss_lookafter_project.consumable_fee": "consumable_fee",
          "ss_lookafter_project.total_money": "total_money",
        })
        .where({
          "ss_lookafter_project.status": 0, // 0. 启用 1. 禁用
          "ss_lookafter_project.id": data.project_id,
        })
        .find();
      return this.success(list);
    }
    return this.fail("出现了未知错误");
  }
  
  async orderAction() {
    const data = this.post();
    const token = this.header("authorization");
    const res = await jwt.validate(token);

    if (!res) return this.fail(0, "请先登录");
    if (data.order) data.order = JSON.parse(data.order);
    if (Object.prototype.toString.call(data.order) === "[object Object]") {
      const orderId = await think.model("order_lookafter").add({
        hospital_id: data.order.hospital_id || "",
        no: data.order.no || "",
        project_id: data.order.project_id || "",
        yy_date: Date.now().toString(),
        yy_time: Date.now().toString(),
        disease_desc: data.order.disease_desc || "",
        nurse_id: data.order.nurse_id || "",
        user_id: data.order.user_id || "",
        disease_id: data.order.user_id || "",
        linkman: data.order.linkman || "",
        linkphone: data.order.linkphone || "",
        address: data.order.address || "",
        remark: data.order.remark || "",
        money: data.order.money || "",
        pay_money: data.order.pay_money || "",
        transaction_no: data.order.transaction_no || "",
        status_id: data.order.status_id || "",
      });
      return this.success("添加成功", orderId);
    }
    return this.fail();
  }
};

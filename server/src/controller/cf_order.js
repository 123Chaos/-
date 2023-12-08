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
        
      // 获取diseaseIds
      if (user.userId) {
        const diseaseIds = await think
          .model("disease")
          .where({
            user_id: user.userId,
          })
          .field({
            "ss_disease.id": "id",
          })
          .select();
          
          const Ids = []
          for(const i of diseaseIds) {
            Ids.push(i.id)
          }
        // 获取处方单list
        const list = await think
          .model("disease_cf")
          .join("ss_disease on ss_disease.id=ss_disease_cf.disease_id")
          .join("ss_doctor on ss_doctor.id=ss_disease_cf.doctor_id")
          .join("ss_disease_wz on ss_disease_wz.id=ss_disease_cf.wz_id")
          .join(
            "ss_disease_cf_medicine on ss_disease_cf_medicine.cf_id=ss_disease_cf.id"
          )
          .join(
            "ss_medicine on ss_medicine.id=ss_disease_cf_medicine.medicine_id"
          )
          .where({'ss_disease.id':['IN', Ids]})
          .limit(+data.pageNum * 10, 10)
          .field({
            "ss_disease.name": "disease_name",
            "ss_doctor.name": "doctor_name",
            "ss_disease_wz.add_time": "wz_time",
            "ss_disease_cf.complain": "complain",
            "ss_disease_cf.case_history": "case_history",
            "ss_disease_cf.sensitive_history": "sensitive_history",
            "ss_disease_cf.diagnosis": "diagnosis",
            "ss_disease_cf.days": "days",
            // 替换成数组
            "ss_disease_cf_medicine.medicine_name": "medicine_name",
            "ss_disease_cf_medicine.medicine_specifications":
              "medicine_specifications",
            "ss_disease_cf_medicine.medicine_use": "medicine_use",
            "ss_disease_cf_medicine.medicine_type": "medicine_type", // 1 西药 2 中成药
            "ss_disease_cf_medicine.dosage": "dosage",
            "ss_disease_cf_medicine.frequency": "frequency",
            "ss_disease_cf_medicine.count": "count",
            "ss_disease_cf_medicine.price": "price",
            "ss_disease_cf_medicine.all_money": "all_money",
          })
          .select()
        return this.success(list);
      }
    }
    return this.fail("出现了未知错误");
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

const Base = require("./base.js");
const jwt = think.service("jwt");

module.exports = class extends Base {
  async listAction() {
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    if (!res) return this.fail(0, "请先登录");
    const data = this.get();

    if (data.disease_id) {
      return this.listbyidAction(data.disease_id, token);
    }

    const user = await think
      .model("user")
      .where({
        phone: jwt.parseToken(token).phone,
      })
      .field({
        "ss_user.id": "userId",
      })
      .find();

    if (user.userId) {
      if (data.profileList) return this.profileListAction(user.userId);
      const list = await think
        .model("disease")
        .join(
          "ss_disease_cardtype on ss_disease_cardtype.id=ss_disease.cardType_id"
        )
        .join("ss_nationality on ss_nationality.id=ss_disease.nationality_id")
        .join("ss_marriage on ss_marriage.id=ss_disease.marriage_id")
        .join("ss_job_state on ss_job_state.id=ss_disease.job_state_id")
        .join("ss_medical_pay on ss_medical_pay.id=ss_disease.medical_pay_id")
        .where({
          user_id: user.userId,
          default: 1,
          state: 2,
        })
        .field({
          "ss_disease.id": "id",
          "ss_marriage.name": "marriage_name",
          "ss_nationality.name": "nationality_name",
          "ss_disease_cardtype.name": "cardtype_name",
          "ss_disease.name": "name",
          "ss_disease.avatar": "avatar",
          "ss_disease.sex": "sex",
          "ss_disease.birthday": "age",
          "ss_disease.id_no": "id_no",
          "ss_medical_pay.name": "medical_pay_name",
        })
        .find();
      return this.success(list, "返回了默认档案");
    }
    return this.fail("出现了未知错误");
  }

  async updateAction() {
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    const data = this.post();

    if (!res) return this.fail(0, "请先登录");

    if (data.disease_id) {
      // 将该user_id下的其他default切换为0
      const user = await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
          status: 0,
        })
        .field({
          "ss_user.id": "userId",
        })
        .find();
      if (!user.userId) {
        return this.fail("该账号未启用");
      }

      try {
        // 先将当前默认disease_id置0
        think
          .model("disease")
          .where({
            default: 1,
            user_id: user.userId,
          })
          .update({
            default: 0,
          });
        // 再将传过来的disease_id置1
        think
          .model("disease")
          .where({
            id: data.disease_id,
            user_id: user.userId,
          })
          .update({
            default: 1,
          });
        return this.success(data.disease_id, "默认档案设置成功");
      } catch (e) {
        return this.fail(e);
      }
    }
  }

  async deleteAction() {
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    const data = this.post();

    if (!res) return this.fail(0, "请先登录");

    if (data.disease_id) {
      // 将该user_id下的其他default切换为0
      const user = await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
          status: 0,
        })
        .field({
          "ss_user.id": "userId",
        })
        .find();
      if (!user.userId) {
        return this.fail("该账号未启用");
      }

      try {
        const isValid = await think
          .model("disease")
          .where({
            user_id: user.userId,
            id: data.disease_id,
          })
          .delete();
        if (isValid) return this.success("删除成功");
      } catch (e) {
        return this.fail(e);
      }
    }
    return this.fail("删除失败");
  }

  async listbyidAction(disease_id, token) {
    const user = await think
      .model("user")
      .where({
        phone: jwt.parseToken(token).phone,
      })
      .field({
        "ss_user.id": "userId",
      })
      .find();

    if (user.userId) {
      const list = await think
        .model("disease")
        .join(
          "ss_disease_cardtype on ss_disease_cardtype.id=ss_disease.cardType_id"
        )
        .join("ss_nationality on ss_nationality.id=ss_disease.nationality_id")
        .join("ss_marriage on ss_marriage.id=ss_disease.marriage_id")
        .join("ss_job_state on ss_job_state.id=ss_disease.job_state_id")
        .join("ss_medical_pay on ss_medical_pay.id=ss_disease.medical_pay_id")
        .where({
          user_id: user.userId,
          "ss_disease.id": disease_id,
          state: 2,
        })
        .field({
          "ss_disease.id": "id",
          "ss_job_state.name": "state_name",
          "ss_marriage.name": "marriage_name",
          "ss_nationality.name": "nationality_name",
          "ss_disease_cardtype.name": "cardtype_name",
          "ss_disease.name": "name",
          "ss_disease.avatar": "avatar",
          "ss_disease.sex": "sex",
          "ss_disease.birthday": "birthday",
          "ss_disease.address": "address",
          "ss_disease.id_no": "id_no",
          "ss_medical_pay.name": "medical_pay_name",
        })
        .find();
      return this.success(list, "查询成功");
    }

    return this.fail("出现了未知错误");
  }

  async profileListAction(user_id) {
    if (user_id) {
      const list = await think
        .model("disease")
        .where({
          user_id: user_id,
          state: 1,
        })
        .field({
          "ss_disease.id": "id",
          "ss_disease.name": "name",
          "ss_disease.sex": "sex",
          "ss_disease.birthday": "birthday",
          "ss_disease.default": "default",
        })
        .select();
      return this.success(list);
    }
    return this.fail();
  }
};

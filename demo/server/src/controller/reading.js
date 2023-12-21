const Base = require("./base.js");

module.exports = class extends Base {
  async listAction() {
    const data = this.get();
    if(data.banner==='1') {
      return this.bannerAction()
    }
    if (data.pageNum && typeof +data.pageNum === "number") {
      try {
        const list = await think
          .model("health_education")
          .where({ status: 1 })
          .join("ss_hospital on ss_health_education.hospital_id=ss_hospital.id")
          .join(
            "ss_health_education_type on ss_health_education.type_id=ss_health_education_type.id"
          )
          .field({
            "ss_health_education.id": "id",
            "ss_health_education.logo": "logo",
            "ss_health_education.title": "title",
          })
          .limit(+data.pageNum * 10, 10)
          .select();
        return this.success(list);
      } catch (e) {
        return this.fail(e);
      }
    }
    return this.fail(1, "参数有误");
  }

  async bannerAction() {
    try {
      const list = await think
        .model("health_education")
        .join("ss_hospital on ss_health_education.hospital_id=ss_hospital.id")
        .join(
          "ss_health_education_type on ss_health_education.type_id=ss_health_education_type.id"
        )
        .field({
          "ss_health_education.id": "id",
          "ss_health_education.logo": "logo",
          "ss_health_education.title": "title",
        })
        .limit(0, 4)
        .select();
      return this.success(list);
    } catch (e) {
      return this.fail(e);
    }
  }

  async detailAction() {
    const data = this.get();
    if (typeof +data.pageNum === "number") {
      try {
        const list = await think
          .model("health_education")
          .join("ss_hospital on ss_health_education.hospital_id=ss_hospital.id")
          .join(
            "ss_health_education_type on ss_health_education.type_id=ss_health_education_type.id"
          )
          .where(`ss_health_education.id=${+data.id}`)
          .field({
            "ss_health_education.id": "id",
            "ss_hospital.name": "hospital_name",
            "ss_health_education.video_url": "url",
            "ss_health_education_type.name": "type",
            "ss_health_education.title": "title",
            "ss_health_education.update_time": "update_time",
            "ss_health_education.describe": "describe",
          })
          .find();
        return this.success(list);
      } catch (e) {
        return this.fail(e);
      }
    }
    return this.fail(1);
  }
};

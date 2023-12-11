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
                .model("hospital")
                .limit(+data.pageNum * 10, 10)
                .field({
                    "ss_hospital.id": "hospital_id",
                    "ss_hospital.name": "hospital_name",
                    "ss_hospital.logo": "logo",
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

        if (data.hospital_id) {
            const list = await think
                .model("hospital")
                .field({
                    "ss_hospital.id": "hospital_id",
                    "ss_hospital.name": "hospital_name",
                    "ss_hospital.address": "address",
                    "ss_hospital.logo": "logo",
                    "ss_hospital.img": "img",
                    "ss_hospital.longitude": "longitude",
                    "ss_hospital.latitude": "latitude",
                    "ss_hospital.contacts": "contacts",
                    "ss_hospital.contacts_phone": "contacts_phone",
                })
                .where({
                    "ss_hospital.id": data.hospital_id,
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

        return this.success("申请成功");
    }
};

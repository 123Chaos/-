const Base = require("./base.js");
const jwt = think.service("jwt");

module.exports = class extends Base {
  async loginAction() {
    // 如果用户已经有token
    const token = this.header("authorization");
    if (token) {
      const res = await jwt.validate(token);
      if (res) return this.success(token);
      return this.fail(1, "登陆失败");
    }
    // 如果用户没有token
    const data = this.post();
    if (data.password && data.phone) {
      const isValid = await think
        .model("user")
        .where({
          phone: data.phone,
          password: think.md5(data.password),
        })
        .find();
      if (!think.isEmpty(isValid)) {
        this.header("authorization", jwt.sign_generateToken(data));
        return this.success(jwt.sign_generateToken(data));
      }
      return this.registerAction(data);
    }
    // 如果表单字段不对
    return this.fail(1, "参数格式有误");
  }

  async registerAction(data) {
    try {
      await think.model("user").add({
        name: "新用户",
        phone: data.phone,
        password: think.md5(data.password),
        status: 0,
        add_time: think.datetime(new Date().getTime(), "YYYY-MM-DD HH:mm:ss"),
        update_time: think.datetime(
          new Date().getTime(),
          "YYYY-MM-DD HH:mm:ss"
        ),
      });
    } catch (e) {
      return this.fail(1, "手机号已被注册");
    }
    this.header(
      "authorization",
      jwt.sign_generateToken({ phone: data.phone, password: data.password })
    );
    return this.success();
  }

  async resetAction() {
    const data = this.post();
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    if (data.newPassword && res) {
      await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
        })
        .update({
          password: think.md5(data.newPassword),
          update_time: think.datetime(
            new Date().getTime(),
            "YYYY-MM-DD HH:mm:ss"
          ),
        });
      return this.success("修改成功");
    }
    return this.fail(1, "修改失败");
  }

  async updateAction() {
    // { newName }
    const data = this.post();
    const token = this.header("authorization");
    const res = await jwt.validate(token);
    if (data.newName && res) {
      await think
        .model("user")
        .where({
          phone: jwt.parseToken(token).phone,
        })
        .update({
          name: data.newName,
          update_time: think.datetime(
            new Date().getTime(),
            "YYYY-MM-DD HH:mm:ss"
          ),
        });
      return this.success(0, "修改成功");
    }
    return this.fail(1, "修改失败");
  }
};

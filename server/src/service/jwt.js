const jwt = require("jsonwebtoken");
const secret = "SYSU-jwt-secret";
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6IjE4NTgyOTUzNzQ3IiwicGFzc3dvcmQiOiIxMjM0NTY3OCIsImlhdCI6MTcwMDUzNTcyMn0.oeGufaV-W4cbVJ184uuI8LUQSr7SNgsbDdXMSmrZFsM
module.exports = class extends think.Service {
    init() {
        super.init();
    }

    sign_generateToken(data) {
        // 生成的token
        return jwt.sign(data, secret);
    }

    parseToken(token) {
        try {
            return jwt.verify(token, secret);
        } catch (err) {
            return { is_err: 1 };
        }
    }

    async validate(token) {
        if (!token) return false
        const pToken = this.parseToken(token)
        if (pToken.phone && pToken.password) {

            const isValid = await think
                .model("user")
                .where({
                    phone: pToken.phone,
                    password: think.md5(pToken.password),
                })
                .find();
            if (!think.isEmpty(isValid)) {
                return true
            }
            return false
        }
        return false
    }
};

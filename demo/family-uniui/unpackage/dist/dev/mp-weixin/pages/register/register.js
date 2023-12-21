"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "register",
  setup(__props) {
    const countDown = common_vendor.ref("获取验证码");
    const form = common_vendor.ref({
      phoneNumber: "",
      vCode: "",
      password: ""
    });
    const countDownBtn = common_vendor.ref();
    const phonePattern = /^1[34578]\d{9}$/;
    const passwordPattern = /^[0-9]{6,18}$/;
    function jump() {
      if (validate(form)) {
        common_vendor.index.setStorage({
          key: "token",
          data: "token"
        });
        common_vendor.index.navigateBack({ delta: 1 });
      }
    }
    function validate(form2) {
      if (!phonePattern.test(form2.value.phoneNumber)) {
        common_vendor.index.showToast({
          title: "手机号格式错误",
          duration: 1e3,
          icon: "error"
        });
        return false;
      }
      if (!passwordPattern.test(form2.value.password)) {
        common_vendor.index.showToast({
          title: "密码必须是6~18位之间的数字",
          duration: 1e3,
          icon: "error"
        });
        return false;
      }
      return true;
    }
    function getCode() {
      if (form.value.vCode) {
        countDownBtn.value.disabled = true;
      }
      form.value.vCode = Math.floor(Math.random() * 1e6).toString().padEnd(6, "7");
      common_vendor.index.showToast({
        title: "验证码发送成功",
        duration: 1e3
      });
    }
    return (_ctx, _cache) => {
      return {
        a: form.value.phoneNumber,
        b: common_vendor.o(($event) => form.value.phoneNumber = $event.detail.value),
        c: form.value.vCode,
        d: common_vendor.o(($event) => form.value.vCode = $event.detail.value),
        e: common_vendor.t(countDown.value),
        f: common_vendor.o(getCode),
        g: form.value.password,
        h: common_vendor.o(($event) => form.value.password = $event.detail.value),
        i: common_vendor.o(jump)
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/register/register.vue"]]);
wx.createPage(MiniProgramPage);

"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_easyinput2 = common_vendor.resolveComponent("uni-easyinput");
  const _easycom_uni_section2 = common_vendor.resolveComponent("uni-section");
  (_easycom_uni_easyinput2 + _easycom_uni_section2)();
}
const _easycom_uni_easyinput = () => "../../uni_modules/uni-easyinput/components/uni-easyinput/uni-easyinput.js";
const _easycom_uni_section = () => "../../uni_modules/uni-section/components/uni-section/uni-section.js";
if (!Math) {
  (_easycom_uni_easyinput + _easycom_uni_section)();
}
const _sfc_main = {
  __name: "edit",
  setup(__props) {
    const op = common_vendor.ref("1");
    const form = common_vendor.ref({
      oldPassword: "",
      vCode: "",
      newPassword: "",
      newName: ""
    });
    const input = {
      color: "#2979FF"
    };
    const codeStatus = common_vendor.ref("发送验证码");
    function getCode() {
      form.value.vCode = Math.floor(Math.random() * 1e6).toString().padEnd(6, "7");
      codeStatus.value = "重新发送";
    }
    function jump(id) {
      common_vendor.index.navigateTo({ url: "/pages/manage/manage" });
    }
    common_vendor.onLoad((e) => {
      console.log(e);
      op.value = e.op;
    });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: op.value === "1"
      }, op.value === "1" ? {
        b: common_vendor.o(($event) => form.value.oldPassword = $event),
        c: common_vendor.p({
          styles: input,
          trim: "all",
          placeholder: "请输入原密码",
          type: "password",
          modelValue: form.value.oldPassword
        }),
        d: common_vendor.p({
          title: "原密码",
          type: "line"
        }),
        e: common_vendor.t(codeStatus.value),
        f: common_vendor.o(getCode),
        g: common_vendor.o(($event) => form.value.vCode = $event),
        h: common_vendor.p({
          styles: input,
          trim: "all",
          placeholder: "请输入验证码.",
          z: true,
          modelValue: form.value.vCode
        }),
        i: common_vendor.p({
          title: "验证码",
          type: "line"
        }),
        j: common_vendor.o(($event) => form.value.newPassword = $event),
        k: common_vendor.p({
          styles: input,
          trim: "all",
          placeholder: "请输入新密码",
          type: "password",
          modelValue: form.value.newPassword
        }),
        l: common_vendor.p({
          title: "新密码",
          type: "line"
        }),
        m: common_vendor.o(($event) => jump())
      } : {}, {
        n: op.value === "3"
      }, op.value === "3" ? {
        o: common_vendor.o(($event) => form.value.newName = $event),
        p: common_vendor.p({
          styles: input,
          trim: "all",
          placeholder: "请输入新名称",
          modelValue: form.value.newName
        }),
        q: common_vendor.p({
          title: "新名称",
          type: "line"
        }),
        r: common_vendor.o(($event) => jump())
      } : {});
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/edit/edit.vue"]]);
wx.createPage(MiniProgramPage);

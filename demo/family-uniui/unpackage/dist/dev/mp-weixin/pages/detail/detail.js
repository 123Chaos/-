"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_nav_bar2 = common_vendor.resolveComponent("uni-nav-bar");
  _easycom_uni_nav_bar2();
}
const _easycom_uni_nav_bar = () => "../../uni_modules/uni-nav-bar/components/uni-nav-bar/uni-nav-bar.js";
if (!Math) {
  _easycom_uni_nav_bar();
}
const _sfc_main = {
  __name: "detail",
  setup(__props) {
    const id = common_vendor.ref(0);
    const list = common_vendor.ref({
      id: "1",
      title: "多睡觉有助于放松身心————是真的吗？？？？？",
      writer: "广东省第二人民医院.",
      time: "2023-10-28 15:46",
      passage: "http://120.79.246.16:8080//static/test.mp4",
      pType: "mp4"
    });
    function jump(id2) {
      if (id2 === 0) {
        common_vendor.index.navigateBack(1);
      }
    }
    common_vendor.onLoad((e) => {
      id.value = e.id;
    });
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.o(($event) => jump(0)),
        b: common_vendor.p({
          fixed: true,
          ["background-color"]: "rgba(#000,0)",
          ["status-bar"]: true,
          ["left-icon"]: "left",
          ["left-text"]: "返回"
        }),
        c: common_vendor.t(list.value.title),
        d: common_vendor.t(list.value.writer),
        e: common_vendor.t(list.value.time),
        f: list.value.pType === "mp4"
      }, list.value.pType === "mp4" ? {
        g: list.value.passage
      } : {});
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/detail/detail.vue"]]);
wx.createPage(MiniProgramPage);

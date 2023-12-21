"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_segmented_control2 = common_vendor.resolveComponent("uni-segmented-control");
  _easycom_uni_segmented_control2();
}
const _easycom_uni_segmented_control = () => "../../uni_modules/uni-segmented-control/components/uni-segmented-control/uni-segmented-control.js";
if (!Math) {
  _easycom_uni_segmented_control();
}
const _sfc_main = {
  __name: "orders",
  setup(__props) {
    const current = common_vendor.ref(0);
    const items = common_vendor.ref(["全部", "待支付", "已取消", "已支付", "已退款"]);
    const activeColor = common_vendor.ref("#dd524d");
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.o(_ctx.onClickItem),
        b: common_vendor.p({
          current: current.value,
          values: items.value,
          ["style-type"]: "text",
          ["active-color"]: activeColor.value
        }),
        c: current.value === 0
      }, current.value === 0 ? {} : {}, {
        d: current.value === 1
      }, current.value === 1 ? {} : {}, {
        e: current.value === 2
      }, current.value === 2 ? {} : {});
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/orders/orders.vue"]]);
wx.createPage(MiniProgramPage);

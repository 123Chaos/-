"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "itemdetail",
  setup(__props) {
    const uid = common_vendor.ref("");
    common_vendor.onLoad((e) => {
      uid.value = e.uid;
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.t(uid.value)
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/itemdetail/itemdetail.vue"]]);
wx.createPage(MiniProgramPage);

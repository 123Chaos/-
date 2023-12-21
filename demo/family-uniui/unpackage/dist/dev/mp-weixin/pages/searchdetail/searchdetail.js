"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "searchdetail",
  setup(__props) {
    const keyword = common_vendor.ref("");
    common_vendor.onLoad((e) => {
      keyword.value = e.keyword;
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.t(keyword.value)
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/searchdetail/searchdetail.vue"]]);
wx.createPage(MiniProgramPage);

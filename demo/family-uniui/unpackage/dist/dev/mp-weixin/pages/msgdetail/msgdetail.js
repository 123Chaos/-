"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "msgdetail",
  setup(__props) {
    const msgs = common_vendor.ref({
      mid: "-1",
      content: "这是一条处方通知哈哈哈哈哈这是一条处方通知哈哈哈哈哈这是一条处方通知哈哈哈哈哈"
    });
    function init(e) {
      msgs.value.mid = e.mid;
    }
    common_vendor.onLoad((e) => {
      init(e);
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.t(msgs.value.mid),
        b: common_vendor.t(msgs.value.content)
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/msgdetail/msgdetail.vue"]]);
wx.createPage(MiniProgramPage);

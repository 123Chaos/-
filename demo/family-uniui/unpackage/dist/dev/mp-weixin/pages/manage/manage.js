"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_icons2 = common_vendor.resolveComponent("uni-icons");
  const _easycom_uni_card2 = common_vendor.resolveComponent("uni-card");
  (_easycom_uni_icons2 + _easycom_uni_card2)();
}
const _easycom_uni_icons = () => "../../uni_modules/uni-icons/components/uni-icons/uni-icons.js";
const _easycom_uni_card = () => "../../uni_modules/uni-card/components/uni-card/uni-card.js";
if (!Math) {
  (_easycom_uni_icons + _easycom_uni_card)();
}
const _sfc_main = {
  __name: "manage",
  setup(__props) {
    function jump(id) {
      if (id === 4) {
        common_vendor.index.removeStorage({
          key: "token",
          success: function() {
          },
          faile: function() {
          },
          complete: (complete) => {
            common_vendor.index.switchTab({ url: "/pages/index/index" });
          }
        });
      } else if (id === 2)
        ;
      else {
        common_vendor.index.navigateTo({ url: `/pages/edit/edit?op=${id}` });
      }
    }
    common_vendor.onLoad((e) => {
      console.log(e);
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          type: "right",
          size: "20"
        }),
        b: common_vendor.o(($event) => jump(1)),
        c: common_vendor.p({
          ["is-shadow"]: "true",
          ["is-full"]: true
        }),
        d: common_vendor.p({
          type: "right",
          size: "20"
        }),
        e: common_vendor.o(($event) => jump(2)),
        f: common_vendor.p({
          ["is-shadow"]: "true",
          ["is-full"]: true
        }),
        g: common_vendor.p({
          type: "right",
          size: "20"
        }),
        h: common_vendor.o(($event) => jump(3)),
        i: common_vendor.p({
          ["is-shadow"]: "true",
          ["is-full"]: true
        }),
        j: common_vendor.o(($event) => jump(4))
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/manage/manage.vue"]]);
wx.createPage(MiniProgramPage);

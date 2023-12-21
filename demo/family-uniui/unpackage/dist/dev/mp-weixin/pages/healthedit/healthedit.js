"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_tag2 = common_vendor.resolveComponent("uni-tag");
  _easycom_uni_tag2();
}
const _easycom_uni_tag = () => "../../uni_modules/uni-tag/components/uni-tag/uni-tag.js";
if (!Math) {
  _easycom_uni_tag();
}
const _sfc_main = {
  __name: "healthedit",
  setup(__props) {
    const list = common_vendor.ref([
      {
        uuid: "114514",
        uname: "Ming",
        sex: "0",
        age: "21",
        default: "1"
      },
      {
        uuid: "1818910",
        uname: "P",
        sex: "1",
        age: "20",
        default: "0"
      }
    ]);
    function opHandler(opId, index) {
      if (opId === 1) {
        list.value.splice(index, 1);
      }
      if (opId === 2) {
        list.value.forEach((val) => {
          if (val.uuid === index) {
            val.default = "1";
          } else {
            val.default = "0";
          }
        });
      }
      if (opId === 3) {
        common_vendor.index.navigateTo({ url: "/pages/healthdetail/healthdetail" });
      }
    }
    return (_ctx, _cache) => {
      return {
        a: common_vendor.f(list.value, (item, index, i0) => {
          return common_vendor.e({
            a: common_vendor.t(item.uname),
            b: common_vendor.t(item.sex === "0" ? "男" : "女"),
            c: common_vendor.t(`${item.age}岁`),
            d: common_vendor.o(($event) => opHandler(1, index), item.uuid),
            e: common_vendor.o(($event) => opHandler(2, item.uuid), item.uuid),
            f: item.default === "1"
          }, item.default === "1" ? {
            g: "a98cb298-0-" + i0,
            h: common_vendor.p({
              text: "默认",
              type: "primary"
            })
          } : {}, {
            i: item.uuid
          });
        }),
        b: common_vendor.o(($event) => opHandler(3))
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/healthedit/healthedit.vue"]]);
wx.createPage(MiniProgramPage);

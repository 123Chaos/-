"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_icons2 = common_vendor.resolveComponent("uni-icons");
  const _easycom_uni_nav_bar2 = common_vendor.resolveComponent("uni-nav-bar");
  const _easycom_uni_section2 = common_vendor.resolveComponent("uni-section");
  const _easycom_uni_tag2 = common_vendor.resolveComponent("uni-tag");
  (_easycom_uni_icons2 + _easycom_uni_nav_bar2 + _easycom_uni_section2 + _easycom_uni_tag2)();
}
const _easycom_uni_icons = () => "../../uni_modules/uni-icons/components/uni-icons/uni-icons.js";
const _easycom_uni_nav_bar = () => "../../uni_modules/uni-nav-bar/components/uni-nav-bar/uni-nav-bar.js";
const _easycom_uni_section = () => "../../uni_modules/uni-section/components/uni-section/uni-section.js";
const _easycom_uni_tag = () => "../../uni_modules/uni-tag/components/uni-tag/uni-tag.js";
if (!Math) {
  (_easycom_uni_icons + _easycom_uni_nav_bar + _easycom_uni_section + _easycom_uni_tag)();
}
const _sfc_main = {
  __name: "search",
  setup(__props) {
    const keyword = common_vendor.ref("");
    const history = common_vendor.ref({
      key: "history",
      value: []
    });
    function jump(id, item) {
      if (id === 1) {
        common_vendor.index.navigateBack({
          delta: 1
        });
      }
      if (id === 2) {
        if (item)
          keyword.value = item;
        if (Array.isArray(history.value.value)) {
          const length = history.value.value.length;
          for (let i = 0; i < length; i++) {
            if (keyword.value === history.value.value[i]) {
              history.value.value.splice(i, 1);
              history.value.value.unshift(keyword.value);
              break;
            }
            if (i === length - 1)
              history.value.value.push(keyword.value);
          }
        } else {
          history.value.value = [keyword.value];
        }
        common_vendor.index.navigateTo({
          url: `/pages/searchdetail/searchdetail?keyword=${keyword.value}`
        });
        common_vendor.index.setStorage({
          key: "history",
          data: JSON.stringify([...new Set(history.value.value)])
        });
      }
    }
    function historyHandler() {
      common_vendor.index.removeStorage({
        key: "history",
        success: () => {
          history.value.value = [];
        }
      });
    }
    function init() {
      common_vendor.index.getStorage({
        key: "history",
        success: (res) => {
          history.value.value = JSON.parse(res.data).value;
        }
      });
    }
    common_vendor.onLoad(() => {
      init();
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.p({
          type: "search",
          size: "18",
          color: "#999"
        }),
        b: keyword.value,
        c: common_vendor.o(($event) => keyword.value = $event.detail.value),
        d: common_vendor.o(($event) => jump(2)),
        e: common_vendor.o(($event) => jump(1)),
        f: common_vendor.p({
          ["left-icon"]: "left",
          fixed: "true",
          ["status-bar"]: true
        }),
        g: common_vendor.o(historyHandler),
        h: common_vendor.p({
          type: "trash",
          size: "24"
        }),
        i: common_vendor.p({
          title: "搜索历史"
        }),
        j: common_vendor.f(history.value.value, (item, k0, i0) => {
          return {
            a: common_vendor.o(($event) => jump(2, item)),
            b: "68fb01f4-4-" + i0,
            c: common_vendor.p({
              inverted: true,
              text: item,
              ["custom-style"]: "background-color:#eee;color:#000;border:none;"
            })
          };
        })
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/search/search.vue"]]);
wx.createPage(MiniProgramPage);

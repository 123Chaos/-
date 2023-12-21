"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "market",
  setup(__props) {
    const list = common_vendor.ref([
      {
        uid: "799510721",
        title: "猫咪 | 究极生物 | 可爱",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      },
      {
        uid: "799510722",
        title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      },
      {
        uid: "799510722",
        title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      },
      {
        uid: "799510722",
        title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      },
      {
        uid: "799510722",
        title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      },
      {
        uid: "799510722",
        title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
        count: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        price: "9999"
      }
    ]);
    const keyword = common_vendor.ref("");
    function jump(id, uid) {
      if (id === 1) {
        common_vendor.index.navigateTo({
          url: `/pages/searchdetail/searchdetail?keyword=${keyword.value}`
        });
      }
      if (id === 2) {
        common_vendor.index.navigateTo({
          url: `/pages/itemdetail/itemdetail?uid=${uid}`
        });
      }
    }
    return (_ctx, _cache) => {
      return {
        a: keyword.value,
        b: common_vendor.o(($event) => keyword.value = $event.detail.value),
        c: common_vendor.f(list.value, (item, k0, i0) => {
          return {
            a: item.url,
            b: common_vendor.t(item.title),
            c: common_vendor.t(item.price),
            d: common_vendor.t(item.count),
            e: item.uid,
            f: common_vendor.o(($event) => jump(2, item.uid), item.uid)
          };
        })
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/market/market.vue"]]);
wx.createPage(MiniProgramPage);

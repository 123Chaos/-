"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "index",
  setup(__props) {
    const banners = common_vendor.ref([
      { id: "1", url: "/static/index/banner1.png" },
      { id: "2", url: "/static/index/banner2.png" },
      { id: "3", url: "/static/index/banner1.png" }
    ]);
    const services = common_vendor.ref([
      { sid: "1", url: "/static/index/inquiry.png", sname: "线上问诊" },
      { sid: "2", url: "/static/index/lookafter.png", sname: "看护服务" },
      { sid: "4", url: "/static/index/market.png", sname: "护理超市" },
      { sid: "3", url: "/static/index/inhospital.png", sname: "住院服务" }
    ]);
    const list = common_vendor.ref([
      {
        id: "1",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        title: "《预防高血压三件法宝》"
      },
      {
        id: "2",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        title: "冬季养生讲堂科普，为您讲解冬季如何养生"
      },
      {
        id: "3",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        title: "冬季养生讲堂科普，为您讲解冬季如何养生冬季养生讲堂科普，为您讲解冬季如何养生"
      }
    ]);
    function serviceHandler(sid) {
      if (sid === "1") {
        common_vendor.index.navigateTo({ url: "/pages/inquiry/inquiry" });
      }
      if (sid === "2") {
        common_vendor.index.navigateTo({ url: "/pages/lookafter/lookafter" });
      }
      if (sid === "3") {
        common_vendor.index.navigateTo({ url: "/pages/inhospital/inhospital" });
      }
      if (sid === "4") {
        common_vendor.index.navigateTo({ url: "/pages/market/market" });
      }
      if (sid === "5") {
        common_vendor.index.navigateTo({ url: "/pages/other/other" });
      }
    }
    function jump(id, pid) {
      if (id === 1) {
        common_vendor.index.navigateTo({ url: "/pages/message/message" });
      }
      if (id === 2) {
        common_vendor.index.navigateTo({ url: "/pages/search/search" });
      }
      if (id === 3) {
        if (pid)
          common_vendor.index.navigateTo({ url: `/pages/detail/detail?id=${pid}` });
        else
          common_vendor.index.switchTab({ url: `/pages/popularizing/popularizing` });
      }
    }
    common_vendor.onLoad((e) => {
    });
    const dbclick = common_vendor.ref(false);
    function refresh() {
      common_vendor.index.showLoading({
        title: "加载中...",
        mask: true
      });
      setTimeout(() => {
        common_vendor.index.hideLoading();
      }, 1e3);
    }
    common_vendor.onTabItemTap((e) => {
      if (dbclick.value) {
        refresh();
        console.log(e);
      }
      dbclick.value = true;
      setTimeout(() => {
        dbclick.value = false;
      }, 200);
    });
    return (_ctx, _cache) => {
      return {
        a: common_vendor.o(($event) => jump(1)),
        b: common_vendor.o(($event) => jump(2)),
        c: common_vendor.f(banners.value, (banner, k0, i0) => {
          return {
            a: banner.url,
            b: banner.id
          };
        }),
        d: common_vendor.f(services.value, (service, k0, i0) => {
          return {
            a: service.url,
            b: common_vendor.t(service.sname),
            c: service.sid,
            d: common_vendor.o(($event) => serviceHandler(service.sid), service.sid)
          };
        }),
        e: common_vendor.o(($event) => jump(3)),
        f: common_vendor.f(list.value, (item, k0, i0) => {
          return {
            a: item.url,
            b: common_vendor.t(item.title),
            c: common_vendor.o(($event) => jump(3, item.id), item.id),
            d: item.id
          };
        })
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/index/index.vue"]]);
wx.createPage(MiniProgramPage);

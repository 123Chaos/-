"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "popularizing",
  setup(__props) {
    const list = common_vendor.ref([
      {
        id: "1",
        title: "多睡觉有助于放松身心——",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        loved: false
      },
      {
        id: "2",
        title: "你知道吗？身体会有这些奇妙的现象！",
        url: "http://120.79.246.16:8080//static/hospital.png",
        loved: false
      },
      {
        id: "3",
        title: "因为熬夜，某男子竟然掉光了头发！",
        url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
        loved: false
      }
    ]);
    function operation(id, index) {
      if (id === 0) {
        common_vendor.index.showToast({
          title: "分享成功",
          icon: "none"
        });
      } else {
        list.value[index].loved = !list.value[index].loved;
      }
    }
    function jump(id) {
      if (id === 1) {
        common_vendor.index.navigateTo({ url: "/pages/message/message" });
      }
      if (id === 2) {
        common_vendor.index.navigateTo({ url: "/pages/search/search" });
      }
      if (id === 3) {
        common_vendor.index.navigateTo({ url: "/pages/find/find" });
      }
      if (id === 4) {
        common_vendor.index.navigateTo({ url: `/pages/detail/detail?id=${id}` });
      }
    }
    function refresh() {
      common_vendor.index.showLoading({
        title: "加载中...",
        mask: true
      });
      setTimeout(() => {
        common_vendor.index.hideLoading();
      }, 1e3);
    }
    const dbclick = common_vendor.ref(false);
    common_vendor.onTabItemTap((e) => {
      if (dbclick.value) {
        refresh();
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
        c: common_vendor.f(list.value, (item, index, i0) => {
          return common_vendor.e({
            a: item.url,
            b: common_vendor.t(item.title),
            c: common_vendor.o(($event) => jump(4), item.id),
            d: common_vendor.o(($event) => operation(0), item.id),
            e: !item.loved
          }, !item.loved ? {
            f: common_vendor.o(($event) => operation(1, index), item.id)
          } : {}, {
            g: item.loved
          }, item.loved ? {
            h: common_vendor.o(($event) => operation(1, index), item.id)
          } : {}, {
            i: item.id
          });
        })
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/popularizing/popularizing.vue"]]);
wx.createPage(MiniProgramPage);

"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "my",
  setup(__props) {
    const user = common_vendor.ref({
      avatar: "http://120.79.246.16:8080//static/avatar.gif",
      uname: "阮哥"
    });
    const list = common_vendor.ref([
      {
        sid: "1",
        url: "/static/my/record.png",
        sname: "就诊记录"
      },
      {
        sid: "2",
        url: "/static/my/doc.png",
        sname: "我的医生"
      },
      {
        sid: "3",
        url: "/static/my/pre.png",
        sname: "我的处方"
      },
      {
        sid: "4",
        url: "/static/my/order.png",
        sname: "订单与缴费"
      }
    ]);
    const about = common_vendor.ref({
      url: "/static/my/about.png",
      content: "关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们"
    });
    function jump(id) {
      if (id === 1) {
        common_vendor.index.navigateTo({
          url: "/pages/manage/manage"
        });
      }
    }
    function serviceHandler(sid) {
      if (sid === "1") {
        common_vendor.index.navigateTo({
          url: "/pages/record/record"
        });
      }
      if (sid === "2") {
        common_vendor.index.navigateTo({
          url: "/pages/mydoc/mydoc"
        });
      }
      if (sid === "3") {
        common_vendor.index.navigateTo({
          url: "/pages/mypre/mypre"
        });
      }
      if (sid === "4") {
        common_vendor.index.navigateTo({
          url: "/pages/orders/orders"
        });
      }
    }
    return (_ctx, _cache) => {
      return {
        a: user.value.avatar,
        b: common_vendor.t(user.value.uname),
        c: common_vendor.o(($event) => jump(1)),
        d: common_vendor.f(list.value, (item, index, i0) => {
          return {
            a: item.url,
            b: common_vendor.t(item.sname),
            c: common_vendor.o(($event) => serviceHandler(item.sid))
          };
        }),
        e: about.value.url,
        f: common_vendor.t(about.value.content)
      };
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/my/my.vue"]]);
wx.createPage(MiniProgramPage);

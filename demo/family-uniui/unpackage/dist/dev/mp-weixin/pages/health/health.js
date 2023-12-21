"use strict";
const common_vendor = require("../../common/vendor.js");
const _sfc_main = {
  __name: "health",
  setup(__props) {
    const form = common_vendor.ref({
      uname: "Ming",
      sex: "0",
      age: 21,
      avatar: "/static/health/avatar.png",
      info: {
        id: "******************",
        phoneNumber: "18582953747",
        cid: "114514",
        cname: "中山大学"
      },
      history: {
        personal: "否",
        family: "否",
        allergic: "无"
      },
      inhospital: true
    });
    function jump(id) {
      if (id === 1) {
        common_vendor.index.navigateTo({ url: "/pages/message/message" });
      }
      if (id === 2) {
        common_vendor.index.navigateTo({ url: "/pages/search/search" });
      }
      if (id === 3) {
        common_vendor.index.navigateTo({ url: "/pages/hospitaldetail/hospitaldetail" });
      }
      if (id === 4) {
        common_vendor.index.navigateTo({ url: "/pages/healthedit/healthedit" });
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
      return common_vendor.e({
        a: common_vendor.o(($event) => jump(1)),
        b: common_vendor.o(($event) => jump(2)),
        c: form.value.avatar,
        d: common_vendor.t(form.value.uname),
        e: form.value.inhospital
      }, form.value.inhospital ? {
        f: common_vendor.o(($event) => jump(3))
      } : {}, {
        g: !form.value.inhospital
      }, !form.value.inhospital ? {} : {}, {
        h: common_vendor.t(form.value.uname),
        i: common_vendor.t(form.value.info.id),
        j: common_vendor.t(form.value.sex === "0" ? "男" : "女"),
        k: common_vendor.t(form.value.phoneNumber),
        l: common_vendor.t(form.value.info.cid),
        m: common_vendor.t(form.value.info.cname),
        n: common_vendor.t(form.value.history.personal),
        o: common_vendor.t(form.value.history.family),
        p: common_vendor.t(form.value.history.allergic),
        q: common_vendor.o(($event) => jump(4))
      });
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/health/health.vue"]]);
wx.createPage(MiniProgramPage);

"use strict";
const common_vendor = require("../../common/vendor.js");
if (!Array) {
  const _easycom_uni_segmented_control2 = common_vendor.resolveComponent("uni-segmented-control");
  const _easycom_uni_list_chat2 = common_vendor.resolveComponent("uni-list-chat");
  const _easycom_uni_swipe_action_item2 = common_vendor.resolveComponent("uni-swipe-action-item");
  const _easycom_uni_swipe_action2 = common_vendor.resolveComponent("uni-swipe-action");
  const _easycom_uni_section2 = common_vendor.resolveComponent("uni-section");
  (_easycom_uni_segmented_control2 + _easycom_uni_list_chat2 + _easycom_uni_swipe_action_item2 + _easycom_uni_swipe_action2 + _easycom_uni_section2)();
}
const _easycom_uni_segmented_control = () => "../../uni_modules/uni-segmented-control/components/uni-segmented-control/uni-segmented-control.js";
const _easycom_uni_list_chat = () => "../../uni_modules/uni-list/components/uni-list-chat/uni-list-chat.js";
const _easycom_uni_swipe_action_item = () => "../../uni_modules/uni-swipe-action/components/uni-swipe-action-item/uni-swipe-action-item.js";
const _easycom_uni_swipe_action = () => "../../uni_modules/uni-swipe-action/components/uni-swipe-action/uni-swipe-action.js";
const _easycom_uni_section = () => "../../uni_modules/uni-section/components/uni-section/uni-section.js";
if (!Math) {
  (_easycom_uni_segmented_control + _easycom_uni_list_chat + _easycom_uni_swipe_action_item + _easycom_uni_swipe_action + _easycom_uni_section)();
}
const _sfc_main = {
  __name: "message",
  setup(__props) {
    const current = common_vendor.ref(0);
    const items = common_vendor.ref(["服务提醒", "病房预警", "系统消息"]);
    const msg_priscription = common_vendor.ref([
      {
        mid: "p1",
        title: "处方通知1",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条处方通知",
        time: "2023-10-26 20:20",
        badgeText: "dot"
      },
      {
        mid: "p2",
        title: "处方通知2",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条处方通知",
        time: "2023-10-26 20:21",
        badgeText: "dot"
      },
      {
        mid: "p3",
        title: "处方通知3",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条处方通知",
        time: "2023-10-27 11:20",
        badgeText: "dot"
      },
      {
        mid: "p4",
        title: "处方通知4",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条处方通知",
        time: "2023-10-29 21:20",
        badgeText: "dot"
      }
    ]);
    const msg_service = common_vendor.ref([
      {
        mid: "s1",
        title: "服务通知1",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条服务通知",
        time: "2023-10-26 20:20",
        badgeText: "dot"
      },
      {
        mid: "s2",
        title: "服务通知2",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条服务通知",
        time: "2023-10-26 20:21",
        badgeText: "dot"
      }
    ]);
    const options2 = common_vendor.ref([
      {
        text: "删除",
        style: {
          backgroundColor: "#F56C6C"
        }
      }
    ]);
    const msg_warning = common_vendor.ref([
      {
        mid: "w1",
        title: "病房预警1",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条病房预警",
        time: "2023-10-26 20:20",
        badgeText: "dot"
      }
    ]);
    const msg_system = common_vendor.ref([
      {
        mid: "y1",
        title: "系统消息1",
        avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
        note: "这是一条系统消息",
        time: "2023-10-26 20:20",
        badgeText: "dot"
      }
    ]);
    function operation(e, index, id) {
      if (current.value === 0 && e.index === 0) {
        if (id === 0)
          msg_priscription.value.splice(index, 1);
        else
          msg_service.value.splice(index, 1);
      } else if (current.value === 1 && e.index === 0) {
        msg_warning.value.splice(index, 1);
      } else {
        msg_system.value.splice(index, 1);
      }
      common_vendor.index.showToast({
        title: `删除成功`,
        icon: "none"
      });
    }
    function onClickItem(e) {
      if (current.value !== e.currentIndex) {
        current.value = e.currentIndex;
      }
    }
    function jump(id, ...args) {
      if (id === 1) {
        const index = args[0];
        const mid = args[1];
        common_vendor.index.navigateTo({ url: `/pages/msgdetail/msgdetail?mid=${mid}` });
        if (mid && mid[0] === "p") {
          msg_priscription.value[index].badgeText = "";
        }
        if (mid && mid[0] === "s") {
          msg_service.value[index].badgeText = "";
        }
        if (mid && mid[0] === "w") {
          msg_warning.value[index].badgeText = "";
        }
        if (mid && mid[0] === "y") {
          msg_system.value[index].badgeText = "";
        }
      }
    }
    return (_ctx, _cache) => {
      return common_vendor.e({
        a: common_vendor.o(onClickItem),
        b: common_vendor.p({
          current: current.value,
          values: items.value,
          ["style-type"]: "text",
          ["active-color"]: "#1f6764"
        }),
        c: current.value === 0
      }, current.value === 0 ? common_vendor.e({
        d: msg_priscription.value.length
      }, msg_priscription.value.length ? {
        e: common_vendor.f(msg_priscription.value, (item, index, i0) => {
          return {
            a: common_vendor.o(($event) => jump(1, index, item.mid), item.mid),
            b: "0d9bf678-4-" + i0 + "," + ("0d9bf678-3-" + i0),
            c: common_vendor.p({
              title: item.title,
              avatar: item.avatar,
              note: item.note,
              time: item.time,
              ["badge-positon"]: "right",
              ["badge-text"]: item.badgeText,
              clickable: "true"
            }),
            d: common_vendor.o(($event) => operation($event, index, 0), item.mid),
            e: "0d9bf678-3-" + i0 + "," + ("0d9bf678-2-" + i0),
            f: "0d9bf678-2-" + i0 + ",0d9bf678-1",
            g: item.mid
          };
        }),
        f: common_vendor.p({
          ["right-options"]: options2.value
        }),
        g: common_vendor.p({
          title: "处方通知",
          type: "line"
        })
      } : {}, {
        h: msg_service.value.length
      }, msg_service.value.length ? {
        i: common_vendor.f(msg_service.value, (item, index, i0) => {
          return {
            a: common_vendor.o(($event) => jump(1, index, item.mid), item.mid),
            b: "0d9bf678-8-" + i0 + "," + ("0d9bf678-7-" + i0),
            c: common_vendor.p({
              title: item.title,
              avatar: item.avatar,
              note: item.note,
              time: item.time,
              ["badge-positon"]: "right",
              ["badge-text"]: item.badgeText,
              clickable: "true"
            }),
            d: common_vendor.o(($event) => operation($event, index, 1), item.mid),
            e: "0d9bf678-7-" + i0 + "," + ("0d9bf678-6-" + i0),
            f: "0d9bf678-6-" + i0 + ",0d9bf678-5",
            g: item.mid
          };
        }),
        j: common_vendor.p({
          ["right-options"]: options2.value
        }),
        k: common_vendor.p({
          title: "服务通知",
          type: "line"
        })
      } : {}, {
        l: !(msg_priscription.value.length || msg_service.value.length)
      }, !(msg_priscription.value.length || msg_service.value.length) ? {} : {}) : {}, {
        m: current.value === 1
      }, current.value === 1 ? common_vendor.e({
        n: common_vendor.f(msg_warning.value, (item, index, i0) => {
          return {
            a: common_vendor.o(($event) => jump(1, index, item.mid), item.mid),
            b: "0d9bf678-11-" + i0 + "," + ("0d9bf678-10-" + i0),
            c: common_vendor.p({
              title: item.title,
              avatar: item.avatar,
              note: item.note,
              time: item.time,
              ["badge-positon"]: "right",
              ["badge-text"]: item.badgeText,
              clickable: "true"
            }),
            d: common_vendor.o(($event) => operation($event, index, 0), item.mid),
            e: "0d9bf678-10-" + i0 + "," + ("0d9bf678-9-" + i0),
            f: "0d9bf678-9-" + i0,
            g: item.mid
          };
        }),
        o: common_vendor.p({
          ["right-options"]: options2.value
        }),
        p: !msg_warning.value.length
      }, !msg_warning.value.length ? {} : {}) : {}, {
        q: current.value === 2
      }, current.value === 2 ? common_vendor.e({
        r: common_vendor.f(msg_system.value, (item, index, i0) => {
          return {
            a: common_vendor.o(($event) => jump(1, index, item.mid), item.mid),
            b: "0d9bf678-14-" + i0 + "," + ("0d9bf678-13-" + i0),
            c: common_vendor.p({
              title: item.title,
              avatar: item.avatar,
              note: item.note,
              time: item.time,
              ["badge-positon"]: "right",
              ["badge-text"]: item.badgeText,
              clickable: "true"
            }),
            d: common_vendor.o(($event) => operation($event, index, 0), item.mid),
            e: "0d9bf678-13-" + i0 + "," + ("0d9bf678-12-" + i0),
            f: "0d9bf678-12-" + i0,
            g: item.mid
          };
        }),
        s: common_vendor.p({
          ["right-options"]: options2.value
        }),
        t: !msg_system.value.length
      }, !msg_system.value.length ? {} : {}) : {});
    };
  }
};
const MiniProgramPage = /* @__PURE__ */ common_vendor._export_sfc(_sfc_main, [["__file", "/Users/renming/Documents/HBuilderProjects/family-uniui/pages/message/message.vue"]]);
wx.createPage(MiniProgramPage);

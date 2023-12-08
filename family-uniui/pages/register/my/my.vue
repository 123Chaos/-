<template>
  <view class="container">
    <view class="box1">
      <view class="box1-info">
        <view class="avatar"><img :src="userInfo.avatar" class="img" /></view>
        <view class="name">{{ userInfo.uname }}</view>
        <view class="manage" @click="jump(1)">账号管理</view>
      </view>
      <view class="box1-icons">
        <view
          class="box1-icon-item"
          v-for="icon in icons"
          :key="icon.iconUrl"
          @click="iconHandler(icon.iid)"
        >
          <img :src="icon.iconUrl" class="iconUrl" />
          <span class="iconName">{{ icon.iconName }}</span>
        </view>
      </view>
    </view>
    <!-- <view class="box2">
      <view class="profile">
        <img src="/static/my/myprofile.png" class="img" />
        <span class="span">我的档案</span>
      </view>
      <view class="profile">
        <img src="/static/my/familyprofile.png" class="img" />
        <span class="span">家庭档案</span>
      </view>
    </view> -->
    <view class="box3">
      <uni-section
        title="联系客服"
        type="line"
        class="item"
        sub-title="+86 18582953747"
      >
      </uni-section>
      <uni-section
        title="建议"
        type="line"
        class="item"
        sub-title="email：799510721@qq.com"
      >
      </uni-section>
      <uni-section title="关于我们" class="item" :sub-title="intro">
      </uni-section>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";

const icons = [
  {
    iid: "1",
    iconUrl: "/static/my/record.png",
    iconName: "就诊记录",
  },
  {
    iid: "2",
    iconUrl: "/static/my/doc.png",
    iconName: "我的医生",
  },
  {
    iid: "3",
    iconUrl: "/static/my/mypre.png",
    iconName: "我的处方",
  },
  {
    iconUrl: "/static/my/order.png",
    iconName: "订单与缴费",
  },
];
const userInfo = ref({
  uuid: "114514",
  uname: "Ming",
  avatar: "http://120.79.246.16:8080//static/avatar.gif",
  phoneNumber: "18582953747",
});
const intro =
  "75载峥嵘岁月，风雨兼程。广东省第二人民医院（广东省应急医院）坐落在珠江南畔，毗邻广州新城市中轴线，紧靠广州人工智能和新一代信息技术巨头汇聚之地——琶洲，经历了辽沈战役、湘赣战役、广东战役，抗美援朝、八·六海战、对越自卫反击战，在抗击非典、新冠肺炎疫情中白衣执甲、勇敢逆行，一路走来，与中华民族同呼吸共命运。";

function iconHandler(id) {
  if (id === "1") {
    uni.navigateTo({ url: "/pages/record/record" });
  }
  if (id === "2") {
    uni.navigateTo({ url: "/pages/mydoc/mydoc" });
  }
  if (id === "3") {
    uni.navigateTo({ url: "/pages/mypre/mypre" });
  }
  if (id === "4") {
    uni.navigateTo({ url: "/pages/orders/orders" });
  }
}

function jump(id) {
  if (id === 1) {
    uni.navigateTo({
      url: `/pages/manage/manage?id=${userInfo.value.uuid}&uname=${userInfo.value.uname}&avatar=${userInfo.value.avatar}&phoneNumber=${userInfo.value.phoneNumber}&`,
    });
  }
}
</script>

<style lang="scss">
.container {
  display: flex;
  width: 750rpx;
  height: 100vh;
  flex-direction: column;
  gap: 50rpx;
  align-items: center;
  margin-top: 100rpx;
  .box1 {
    width: 650rpx;
    margin-top: 125rpx;
    box-shadow: 15rpx 10rpx #ddd;
    border-radius: 16rpx;
    display: flex;
    flex-direction: column;
    .box1-info {
      position: relative;
      width: 100%;
      height: 125rpx;
      .avatar {
        position: absolute;
        left: 50rpx;
        bottom: 25rpx;
        width: 150rpx;
        height: 150rpx;
        border-radius: 75rpx;
        .img {
          width: 150rpx;
          height: 150rpx;
          border-radius: 75rpx;
        }
      }
      .name,
      .manage {
        margin-left: 250rpx;
        color: black;
      }
      .manage {
        margin-top: 10rpx;
        font-size: 12px;
        color: #aaa;
      }
    }
    .box1-icons {
      display: flex;
      margin-bottom: 10rpx;
      .box1-icon-item {
        flex: 1;
        display: flex;
        font-size: 24rpx;
        flex-direction: column;
        align-items: center;
        .iconUrl {
          width: 70rpx;
          height: 70rpx;
        }
      }
    }
  }
  .box2 {
    width: 650rpx;
    height: 200rpx;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 150rpx;
    .profile {
      display: flex;
      flex-direction: column;
      align-items: center;
      .img {
        width: 150rpx;
        height: 150rpx;
      }
      .span {
        font-size: 28rpx;
      }
    }
  }
  .box3 {
    width: 650rpx;
  }
}
</style>

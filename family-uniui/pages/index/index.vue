<template>
  <view class="container">
    <view class="header">
    </view>
    <swiper indicator-dots autoplay circular class="swiper-container">
      <swiper-item v-for="banner in banners" :key="banner.id">
        <img :src="banner.url" class="img" />
      </swiper-item>
    </swiper>
    <view class="services">
      <view class="service" v-for="service in services" :key="service.sid" @click="serviceHandler(service.sid)">
        <img :src="service.url" class="img" />
        <span class="span">{{ service.sname }}</span>
      </view>
    </view>
    <view class="segments">
      <view class="more2">
        <view class="left">医学科普</view>
      </view>
      <view class="content">
        <view class="item" v-for="item in list" @click="jump(4, item.id)">
          <img :src="item.logo" class="img" />
          <view class="title">{{ item.title }}</view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref, onBeforeMount } from "vue";
import { onTabItemTap } from "@dcloudio/uni-app";
import api from "../../api/api";

const banners = ref([
  { id: "1", url: "/static/index/banner1.png" },
  { id: "2", url: "/static/index/banner2.png" },
  { id: "3", url: "/static/index/banner1.png" },
]);
const services = ref([
  { sid: "1", url: "/static/index/inquiry.png", sname: "问诊订单" },
  { sid: "2", url: "/static/index/lookafter.png", sname: "服务订单" },
  { sid: "3", url: "/static/index/market.png", sname: "服务采购" },
  { sid: "4", url: "/static/index/inhospital.png", sname: "申请住院" },
]);
const list = ref([]);

function serviceHandler(sid) {
  if (sid === "1") {
    uni.navigateTo({ url: "/pages/orders/orders" });
  }
  if (sid === "2") {
    uni.navigateTo({ url: "/pages/orders/orders" });
  }
  if (sid === "3") {
    uni.navigateTo({ url: "/pages/market/market" });
  }
  if (sid === "4") {
    uni.navigateTo({ url: "/pages/inquiry/inquiry" });
  }
}

function jump(id, pid) {
  if (id === 4) {
    if (pid) uni.navigateTo({ url: `/pages/detail/detail?id=${pid}` });
  }
}

async function init() {
  checkLogin()
  const res = await api.index.readingList({ banner: '1' })
  if (res.data) {
    list.value = res.data.data
  }
}

async function checkLogin() {
  const isLogin = uni.getStorageSync("token")
  if (isLogin) return
  uni.navigateTo({
    url: '/pages/login/login'
  })
}

onBeforeMount(() => {
  init();
})

// dbclick to refresh
const dbclick = ref(false);
function refresh() {
  uni.showLoading({
    title: "加载中...",
    mask: true,
  });
  init();
  uni.hideLoading();
}
onTabItemTap((e) => {
  if (dbclick.value) {
    refresh();
  }
  dbclick.value = true;
  setTimeout(() => {
    dbclick.value = false;
  }, 200);
});
</script>

<style lang="scss">
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-image: linear-gradient(to bottom,
      #1bbcb6 15%,
      rgba(#ddd, 0.3) 31%);

  .header {
    display: flex;
    width: 700rpx;
    margin-top: 100rpx;
    gap: 30rpx;
    margin-bottom: 20rpx;

    .search {
      display: flex;
      align-items: center;
      width: 420rpx;
      height: 64rpx;
      background: #ffffff;
      border: 2px solid #ffffff;
      border-radius: 8rpx;

      .img {
        width: 36rpx;
        height: 32rpx;
        margin-left: 18rpx;
      }

      .span {
        opacity: 0.45;
        font-size: 28rpx;
        color: #333333;
        letter-spacing: 0.88px;
        margin-left: 16rpx;
      }
    }

    .message {
      display: flex;
      align-items: center;

      .img {
        width: 48rpx;
        height: 48rpx;
      }
    }
  }

  .swiper-container {
    width: 710rpx;
    height: 330rpx;
    margin-bottom: 20rpx;

    .img {
      border-radius: 12rpx;
      width: 100%;
      height: 100%;
    }
  }

  .services {
    box-sizing: border-box;
    display: flex;
    width: 710rpx;
    flex-wrap: wrap;
    gap: 50rpx;
    padding-left: 50rpx;
    background-image: url(/static/index/index-banner.png);
    border-radius: 20rpx;

    .service {
      display: flex;
      align-items: center;
      flex-direction: column;
      margin-top: 10rpx;
      margin-bottom: 10rpx;

      .img {
        width: 92rpx;
        height: 92rpx;
      }

      .span {
        font-size: 28rpx;
        color: #333333;
        letter-spacing: 1.7rpx;
        text-align: center;
      }
    }
  }

  .segments {
    width: 710rpx;

    .more2 {
      display: flex;
      height: 60rpx;
      justify-content: space-between;
      margin-top: 38rpx;

      .left {
        font-size: 44rpx;
        color: #333;
        letter-spacing: 2.8rpx;
      }

      .right {
        line-height: 60rpx;
        font-size: 28rpx;
        color: #333;
        font-weight: bold;
      }
    }

    .content {
      width: 710rpx;
      margin-top: 28rpx;
      display: flex;
      flex-wrap: wrap;
      gap: 12rpx;
      margin-bottom: 20rpx;

      .item {
        display: flex;
        width: 345rpx;
        min-height: 212rpx;
        background-color: #fff;
        border-radius: 22rpx;
        flex-direction: column;

        .img {
          width: 322rpx;
          height: 212rpx;
          margin-top: 8rpx;
          margin-left: 12rpx;
          border-radius: 22rpx;
        }

        .title {
          display: -webkit-box;
          margin-left: 18rpx;
          font-size: 26rpx;
          color: #333333;
          letter-spacing: 3rpx;
          margin-top: 14rpx;
          margin-bottom: 22rpx;
          overflow: hidden;
          -webkit-line-clamp: 2;
          text-overflow: ellipsis;
          -webkit-box-orient: vertical;
        }
      }
    }
  }
}
</style>

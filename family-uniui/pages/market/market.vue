<template>
  <view class="container">
    <view class="header">
      <view class="search">
        <img src="/static/public/search.png" class="img" />
        <input
          confirm-type="search"
          class="nav-bar-input"
          type="text"
          placeholder="输入关键词搜索"
          v-model="keyword"
          placeholder-class="placeholder"
        />
      </view>
    </view>
    <view class="content">
      <view
        class="item"
        v-for="item in list"
        :key="item.uid"
        @click="jump(2, item.uid)"
      >
        <view class="left">
          <img :src="item.url" class="img" />
        </view>
        <view class="right">
          <view class="title">{{ item.title }}</view>
          <view class="lower">
            <span class="price">￥{{ item.price }}</span>
            <span class="count">
              库存
              {{ item.count }}
              件
            </span>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";

const list = ref([
  {
    uid: "799510721",
    title: "猫咪 | 究极生物 | 可爱",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
  {
    uid: "799510722",
    title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
  {
    uid: "799510723",
    title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
  {
    uid: "79951072122",
    title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
  {
    uid: "7995",
    title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
  {
    uid: "7992",
    title: "猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪猫咪",
    count: "1",
    url: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
    price: "9999",
  },
]);
const keyword = ref("");

function jump(id, uid) {
  if (id === 1) {
    uni.navigateTo({
      url: `/pages/searchdetail/searchdetail?keyword=${keyword.value}`,
    });
  }
  if (id === 2) {
    uni.navigateTo({
      url: `/pages/itemdetail/itemdetail?uid=${uid}`,
    });
  }
}
</script>

<style lang="scss">
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: rgba(#ddd, 0.3);
  .header {
    .search {
      width: 680rpx;
      height: 88rpx;
      background-color: #fff;
      border-radius: 44rpx;
      display: flex;
      align-items: center;
      gap: 20rpx;
      .img {
        width: 32rpx;
        height: 36rpx;
        margin-left: 200rpx;
      }
      .placeholder {
        color: #333;
        opacity: 0.45;
        font-size: 28rpx;
        letter-spacing: 1.7rpx;
      }
    }
  }
  .content {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 20rpx;
    margin-bottom: 20rpx;
    gap: 12rpx;
    .item {
      display: flex;
      flex-direction: column;
      width: 346rpx;
      background-color: #fff;
      border-radius: 12rpx;
      overflow: hidden;
      .left {
        height: 266rpx;
        .img {
          width: 100%;
          height: 100%;
        }
      }
      .right {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        .title {
          margin-top: 16rpx;
          margin-left: 12rpx;
          margin-bottom: 10rpx;
          letter-spacing: 1.7rpx;
          font-size: 28rpx;
          color: #333;
          display: -webkit-box;
          -webkit-box-orient: vertical;
          -webkit-line-clamp: 2;
          text-overflow: ellipsis;
          overflow: hidden;
        }
        .lower {
          display: flex;
          height: 40rpx;
          align-items: center;
          justify-content: space-between;
          margin-bottom: 10rpx;
          .price {
            color: #ff0000;
            font-weight: bold;
            letter-spacing: 2rpx;
            margin-left: 14rpx;
          }
          .count {
            font-size: 28rpx;
            color: #333;
            opacity: 0.38;
            margin-right: 16rpx;
          }
        }
      }
    }
  }
}
</style>

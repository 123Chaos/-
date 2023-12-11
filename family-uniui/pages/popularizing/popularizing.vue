<template>
  <view class="container">
    <view class="header"> </view>
    <view class="content" v-if="list.length !== 0">
      <view v-for="item in list" class="card" :key="item?.id">
        <view class="upper" @click="jump(4, item?.id)">
          <img class="upper-img" :src="item.url" />
          <view class="title">
            <span class="span">{{ item.title }}</span>
          </view>
        </view>

        <view class="lower">
          <view class="lower-item" @click="operation(0)">
            <img src="/static/popularizaring/share.png" class="img" />
            <view class="op">分享</view>
          </view>
        </view>
      </view>
    </view>
    <view v-if="list.length === 0" style="color: #ddd"> 暂无更多文章 </view>
  </view>
</template>

<script setup>
import { ref } from "vue";
import { onReachBottom, onLoad } from "@dcloudio/uni-app";
import api from "../../api/api";

const list = ref([]);
const pageNum = ref(0);

function operation(id) {
  if (id === 0) {
    uni.showToast({
      title: "分享成功",
      icon: "none",
    });
  }
}

function jump(id, pid) {
  if (id === 4) {
    uni.navigateTo({ url: `/pages/detail/detail?id=${pid}` });
  }
}

async function init() {
  const res = await api.reading.indexReading({ pageNum: pageNum.value++ });
  if (res?.data.data) list.value = res.data.data;
}

onLoad(() => {
  init();
});

onReachBottom(async () => {
  uni.showLoading({
    title: "加载中...",
    mask: true,
  });
  const res = await api.reading.indexReading({ pageNum: pageNum.value++ });
  list.value = list.value.concat(res.data.data);
  uni.hideLoading();
});
</script>

<style lang="scss">
.container {
  height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  overflow-x: hidden;
  background-image: linear-gradient(
    to bottom,
    #1bbcb6 15%,
    rgba(#ddd, 0.3) 31%
  );

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

  .content {
    display: flex;
    flex-direction: column;

    .card {
      width: 700rpx;
      height: 400rpx;
      margin-bottom: 20rpx;
      background: #fff;
      border-radius: 20rpx;
      overflow: hidden;

      .upper {
        width: 100%;
        position: relative;

        .upper-img {
          width: 100%;
          height: 328rpx;
        }

        .title {
          position: absolute;
          width: 100%;
          height: 114rpx;
          background-color: rgba(0, 0, 0, 0.55);
          font-size: 28rpx;
          color: #fff;
          bottom: 10rpx;

          .span {
            margin-top: 18rpx;
            margin-left: 21rpx;
            letter-spacing: 1.7rpx;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            text-overflow: ellipsis;
            overflow: hidden;
          }
        }
      }

      .lower {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 5rpx;
        gap: 20%;

        .lower-item {
          display: flex;
          align-items: center;
          justify-content: center;

          .img {
            width: 32rpx;
            height: 32rpx;
            margin-right: 14rpx;
          }

          .op {
            font-size: 28rpx;
            opacity: 0.5;
          }

          .active {
            color: #1bbc98;
          }
        }

        .op017 {
          opacity: 0.17;
        }
      }
    }
  }
}
</style>

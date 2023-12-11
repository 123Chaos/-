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
        :key="item.hospital_id"
        @click="jump(item.hospital_id)"
      >
        <view class="left"></view>
        <view class="right">
          <view class="project_name">{{ item.project_name }}</view>
          <view class="lower">
            <span class="total_money">￥{{ item.total_money }}</span>
          </view>
          <view class="lower">
            <span class="hospital_name"
              >医院名称：{{ item.hospital_name }}</span
            >
          </view>
          <view class="lower">
            <span class="type">服务类型：{{ item.type }}</span>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";
import { onReachBottom, onLoad } from "@dcloudio/uni-app";
import api from "../../api/api";

const list = ref([]);
const keyword = ref("");
const pageNum = ref(0);

function jump(hospital_id) {
  uni.navigateTo({
    url: `/pages/itemdetail/itemdetail?uid=${hospital_id}`,
  });
}

const init = async () => {
  const res = await api.lookafter.list({ pageNum: pageNum.value++ });
  if (res?.data.data) {
    list.value = res.data.data;
  }
};

onLoad(() => {
  init();
});

onReachBottom(async () => {
  uni.showLoading({
    title: "加载中...",
    mask: true,
  });
  const res = await api.lookafter.list({ pageNum: pageNum.value++ });
  if (res?.data.data.length > 0) list.value = list.value.concat(res.data.data);
  uni.hideLoading();
});
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
        .project_name {
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
          .total_money {
            color: #ff0000;
            font-weight: bold;
            letter-spacing: 2rpx;
            margin-left: 14rpx;
          }
          .hospital_name {
            color: #333;
            letter-spacing: 2rpx;
            margin-left: 14rpx;
            font-size: 24rpx;
          }
          .type {
            color: burlywood;
            letter-spacing: 2rpx;
            margin-left: 14rpx;
            font-size: 24rpx;
          }
        }
      }
    }
  }
}
</style>

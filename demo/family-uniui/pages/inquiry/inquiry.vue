<template>
  <view class="container">
    <view class="content">
      <view
        class="card"
        v-for="item in list"
        :key="item.hospital_id"
        @click="jump(item.hospital_id)"
      >
        <view class="left"><img :src="item.logo" class="img" /></view>
        <view class="right">医院名称：{{ item.name }}</view>
      </view>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";
import { onLoad, onReachBottom } from "@dcloudio/uni-app";
import api from "../../api/api";

const list = ref([
  {
    hospital_id: 1,
    logo: "http://120.79.246.16:8080/static/avatar.gif",
    name: "111",
  },
]);
const pageNum = ref(0);

function jump(id) {
  uni.navigateTo({
    url: `/pages/itemdetail/itemdetail?iid=${id}`,
  });
}

async function init() {
  const res = await api.lookafter.list({ pageNum: pageNum.value++ });
  if (res?.data.data) {
    list.value = res.data.data;
  }
}

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
  justify-content: center;
  background-color: rgba(#ddd, 0.3);

  .card {
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-around;
    width: 700rpx;
    height: 380rpx;
    background-color: white;
    border-radius: 20rpx;
    margin-top: 20rpx;
    margin-bottom: 20rpx;
    box-shadow: 0 4rpx 4rpx 4rpx rgba(#ccc, 0.6);
    .left {
      width: 250rpx;
      height: 250rpx;
      .img {
        border-radius: 10rpx;
        width: 100%;
        height: 100%;
      }
    }
  }
}
</style>

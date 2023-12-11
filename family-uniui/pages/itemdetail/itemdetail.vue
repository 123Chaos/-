<template>
  <view class="container">
    <view class="content" v-if="detailId === 2">
      <img :src="list.img">
      <view class="title">{{ list.project_name }}</view>
      <view class="item">医院名：{{ list.hospital_name }}</view>
      <view class="item">地址：{{ list.address }}</view>
      <view class="item">经度：{{ list.longitude }}</view>
      <view class="item">维度：{{ list.latitude }}</view>
      <view class="item">联系人：{{ list.contacts }}</view>
      <view class="item">联系电话：{{ list.contacts_phone }}</view>
    </view>
    <view class="content" v-if="detailId === 1">
      <view class="title">{{ list.project_name }}</view>
      <view class="item">医院名：{{ list.hospital_name }}</view>
      <view class="item">服务类型：{{ list.type }}</view>
      <view class="item">介绍：{{ list.introduce }}</view>
      <view class="item">预约须知：{{ list.appointment_desc }}</view>
      <view class="item">费用须知：{{ list.fee_desc }}</view>
    </view>
    <view class="price" v-if="detailId === 1">¥{{ list.total_money }}</view>
    <view class="apply" @click="onApply" v-if="detailId === 2">立即申请</view>
    <view class="submit" @click="onSubmit" v-if="detailId === 1">立即购买</view>
  </view>
</template>

<script setup>
import { onLoad } from "@dcloudio/uni-app";
import { ref } from "vue";
import api from "../../api/api";

const list = ref({});
const detailId = ref(1);

async function init(id) {
  if (detailId.value === 2) {
    const res = await api.inhospital.detail({ inhospital_id: id });
    if (res?.data.data) {
        list.value = res.data.data;
    }
  } else {
    const res = await api.lookafter.detail({ project_id: id });
    if (res?.data.data) {
      list.value = res.data.data;
    }
  }
}

const onSubmit = async () => {
  const res = await api.inhospital.order({ order: list.value.hospital_id });
  if (res?.data.data) {
    uni.showToast({
      title: "购买成功",
      duration: 1000,
      icon: "success",
    });
  } else {
    uni.showToast({
      title: "购买失败",
      duration: 1000,
    });
  }
};

const onApply = async () => {
  const res = await api.lookafter.order({ order: list.value.hospital_id });
  if (res?.data.data) {
    uni.showToast({
      title: "申请成功",
      duration: 1000,
      icon: "success",
    });
  } else {
    uni.showToast({
      title: "申请失败",
      duration: 1000,
    });
  }
};

onLoad((e) => {
  if (e.uid) {
    detailId.value = 1;
    init(e.uid);
  } else {
    detailId.value = 2;
    init(e.iid);
  }
});
</script>

<style lang="scss">
.container {
  position: relative;
  display: flex;
  flex-direction: column;

  .swiper-container {
    width: 730rpx;
    height: 400rpx;
    margin-bottom: 20rpx;
    margin-top: 20rpx;
    margin-left: 10rpx;
    border-radius: 24rpx;
    overflow: hidden;

    .img {
      width: 100%;
      height: 100%;
    }
  }

  .content {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-right: 20rpx;
    margin-left: 20rpx;
    gap: 20rpx;
    .title {
      font-size: 36rpx;
      margin-bottom: 20rpx;
    }

    .item {
      word-break: break-all;
      width: 500rpx;
      font-size: 24rpx;
      color: #aaa;
    }
  }

  .submit {
    position: fixed;
    width: 200rpx;
    height: 80rpx;
    text-align: center;
    line-height: 80rpx;
    color: white;
    background-color: red;
    border-radius: 50rpx;
    right: 20rpx;
    bottom: 20rpx;
  }

  .price {
    position: fixed;
    left: 20rpx;
    bottom: 20rpx;
    color: orangered;
    font-size: 48rpx;
    font-weight: bold;
    letter-spacing: 1.7rpx;
  }

  .apply {
    position: fixed;
    width: 200rpx;
    height: 80rpx;
    text-align: center;
    line-height: 80rpx;
    color: white;
    background-color: goldenrod;
    border-radius: 50rpx;
    right: 20rpx;
    bottom: 20rpx;
  }
}
</style>

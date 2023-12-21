<template>
  <view class="container">
    <uni-nav-bar :fixed="true" background-color="rgba(#000,0)" status-bar left-icon="left" left-text="返回"
      @clickLeft="jump(0)" />
    <view class="content">
      <view class="header">
        <view class="title">{{ list?.title }}</view>
        <view class="writer">{{ list?.hospital_name }}</view>
        <view class="time">{{ list?.update_time }}</view>
      </view>
      <view class="passage">
        <video :src="list?.url || ''" class="vedio"></video>
        <h5>描述：{{ list?.describe }}</h5>
        <h5>文章分类：{{ list?.type }}</h5>
      </view>
    </view>
  </view>
</template>

<script setup>
import { onLoad } from "@dcloudio/uni-app";
import { ref } from "vue";
import api from '../../api/api'

const id = ref('');
const list = ref();

function jump(id) {
  if (id === 0) {
    uni.navigateBack(1);
  }
}

async function init() {
  const res = await api.reading.detailReading({ id: id.value })
  if (res?.data.data) {
    list.value = res?.data.data
  } else {
    list.value = { title: '出现未知错误' }
  }
}

onLoad((e) => {
  id.value = e.id;
  init();
});
</script>

<style lang="scss">
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  .content {
    display: flex;
    flex-direction: column;
    margin-top: 20rpx;
    width: 700rpx;

    .title {
      font-size: 42rpx;
      letter-spacing: 5rpx;
      margin-bottom: 20rpx;
      overflow: hidden;
    }

    .writer {
      font-size: 28rpx;
      color: royalblue;
      margin-bottom: 20rpx;
    }

    .time {
      color: #bbb;
      margin-bottom: 50rpx;
    }
  }

  .passage {
    display: flex;
    flex-direction: column;
    gap: 30rpx;

    .vedio {
      width: 700rpx;
    }
    h5 {
      word-break: break-all;
    }
  }
}
</style>

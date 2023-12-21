<template>
  <view class="container">
    <uni-card is-shadow="true" is-full class="item" @click="jump(1)">
      <span class="span">修改密码</span>
      <uni-icons type="right" size="20" class="icon"></uni-icons>
    </uni-card>
    <uni-card is-shadow="true" is-full class="item" @click="jump(2)">
      <span class="span">修改头像（开发中）</span>
      <uni-icons type="right" size="20" class="icon"></uni-icons>
    </uni-card>
    <uni-card is-shadow="true" is-full class="item" @click="jump(3)">
      <span class="span">修改名称</span>
      <uni-icons type="right" size="20" class="icon"></uni-icons>
    </uni-card>
    <button type="warn" class="btn" @click="jump(4)">登出账号</button>
  </view>
</template>

<script setup>
import { onLoad } from "@dcloudio/uni-app";

function jump(id) {
  if (id === 4) {
    uni.removeStorage({
      key: "token",
      success: function () {},
      faile: function () {},
      complete: (complete) => {
        uni.switchTab({
          url: "/pages/index/index",
        });
      },
    });
  } else if (id === 2) {
    // 调起用户的相册进行相片选择
  } else {
    // 进入到编辑界面
    uni.navigateTo({
      url: `/pages/edit/edit?op=${id}`,
    });
  }
}

onLoad((e) => {
  console.log(e);
});
</script>

<style lang="scss">
.container {
  display: flex;
  flex-direction: column;
  gap: 5rpx;
  margin-top: 5rpx;

  .item {
    position: relative;
    width: 750rpx;
    height: 100rpx;

    .icon {
      position: absolute;
      right: 50rpx;
    }
  }

  .btn {
    margin-top: 10rpx;
  }
}
</style>

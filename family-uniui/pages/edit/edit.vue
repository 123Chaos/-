<template>
  <view class="container">
    <view class="phone" v-if="op === '1'">
      <uni-section title="原密码" type="line">
        <uni-easyinput
          :styles="input"
          trim="all"
          v-model="form.oldPassword"
          placeholder="请输入原密码"
          type="password"
        ></uni-easyinput>
      </uni-section>
      <uni-section title="验证码" type="line" class="section">
        <template v-slot:right>
          <view class="vCode" @click="getCode"> {{ codeStatus }} </view>
        </template>
        <uni-easyinput
          :styles="input"
          trim="all"
          v-model="form.vCode"
          placeholder="请输入验证码."
          z
        ></uni-easyinput>
      </uni-section>
      <uni-section title="新密码" type="line"
        ><uni-easyinput
          :styles="input"
          trim="all"
          v-model="form.newPassword"
          placeholder="请输入新密码"
          type="password"
        ></uni-easyinput
      ></uni-section>
      <button type="primary" class="btn" @click="jump(1)">修改</button>
    </view>
    <view class="uname" v-if="op === '3'">
      <uni-section title="新名称" type="line"
        ><uni-easyinput
          :styles="input"
          trim="all"
          v-model="form.newName"
          placeholder="请输入新名称"
        ></uni-easyinput
      ></uni-section>
      <button type="primary" class="btn" @click="jump(2)">修改</button>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";
import { onLoad } from "@dcloudio/uni-app";

const op = ref("1");
const form = ref({
  oldPassword: "",
  vCode: "",
  newPassword: "",
  newName: "",
});
const input = {
  color: "#2979FF",
};
const codeStatus = ref("发送验证码");

function getCode() {
  form.value.vCode = Math.floor(Math.random() * 1000000)
    .toString()
    .padEnd(6, "7");
  codeStatus.value = "重新发送";
}

function jump(id) {
  // form提交表单
  uni.navigateTo({ url: "/pages/manage/manage" });
}
onLoad((e) => {
  console.log(e);
  op.value = e.op;
});
</script>

<style lang="scss">
.container {
  .vCode {
    display: inline-block;
    width: 200rpx;
    height: 60rpx;
    line-height: 60rpx;
    text-align: center;
    border: 2rpx solid #aaa;
    border-radius: 12rpx;
    font-size: 32rpx;
    color: #2979ff;
  }
  .btn {
    margin-top: 50rpx;
    width: 300rpx;
  }
}
</style>

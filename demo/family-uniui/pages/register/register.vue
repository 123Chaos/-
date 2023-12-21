<template>
  <view class="container">
    <view class="header">
      <img src="/static/logo.png" class="logo" />
      <span class="title">广东省第二人民医院</span>
    </view>
    <view class="login">
      <form class="form">
        <view class="userName">
          <img src="/static/login/phone.png" class="img" />
          <input
            type="text"
            class="input"
            placeholder="请输入手机号"
            placeholder-class="placeholder"
            v-model="form.phoneNumber"
          />
        </view>
        <view class="vCode">
          <img src="/static/login/vcode.png" class="img" />
          <input
            type="text"
            class="input"
            placeholder="请输入验证码"
            placeholder-class="placeholder"
            v-model="form.vCode"
          />
          <button class="btn" @click="getCode">{{ countDown }}</button>
        </view>
        <view class="userPassword">
          <img src="/static/login/password.png" class="img" />
          <input
            type="password"
            class="input"
            placeholder="请输入密码"
            placeholder-class="placeholder"
            v-model="form.password"
          />
        </view>
        <button class="submit" @click="jump">注册</button>
      </form>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";

const countDown = ref("获取验证码");
const form = ref({
  phoneNumber: "",
  vCode: "",
  password: "",
});
const countDownBtn = ref();
const phonePattern = /^1[34578]\d{9}$/;
const passwordPattern = /^[0-9]{6,18}$/;

function jump() {
  // send the info
  if (validate(form)) {
    uni.setStorage({
      key: "token",
      data: "token",
    });
    uni.navigateBack({ delta: 1 });
  }
}

function validate(form) {
  if (!phonePattern.test(form.value.phoneNumber)) {
    uni.showToast({
      title: "手机号格式错误",
      duration: 1000,
      icon: "error",
    });
    return false;
  }
  // 验证码验证

  if (!passwordPattern.test(form.value.password)) {
    uni.showToast({
      title: "密码必须是6~18位之间的数字",
      duration: 1000,
      icon: "error",
    });
    return false;
  }
  return true;
}

function getCode() {
  if (form.value.vCode) {
    countDownBtn.value.disabled = true;
  }
  // 验证是否输入手机号
  form.value.vCode = Math.floor(Math.random() * 1000000)
    .toString()
    .padEnd(6, "7");
  uni.showToast({
    title: "验证码发送成功",
    duration: 1000,
  });
}
</script>

<style lang="scss">
.container {
  background-image: linear-gradient(to bottom, #a7cefe 0%, #fff 50%, #fff 100%);
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 50rpx;
  .header {
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    padding-top: 10rpx;
    padding-right: 50rpx;
    width: 650rpx;
    .logo {
      width: 50rpx;
      height: 50rpx;
      margin-right: 20rpx;
      margin-left: 20rpx;
    }
    .title {
      height: 50rpx;
      font-size: 32rpx;
      letter-spacing: 10rpx;
      font-weight: bold;
      line-height: 50rpx;
    }
  }
  .login {
    width: 650rpx;
    height: 600rpx;
    display: flex;
    align-items: center;
    justify-content: center;
    .form {
      width: 100%;
      height: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      .userName {
        display: flex;
        margin-bottom: 50rpx;
        justify-content: flex-start;
        .img {
          width: 50rpx;
          height: 50rpx;
        }
        .input {
          border-bottom: 2rpx solid #ccc;
          margin-left: 20rpx;
        }
      }
      .vCode {
        display: flex;
        margin-bottom: 50rpx;
        justify-content: flex-start;
        align-items: center;
        .img {
          width: 50rpx;
          height: 50rpx;
        }
        .input {
          width: 200rpx;
          border-bottom: 2rpx solid #ccc;
          margin-left: 20rpx;
        }
        .btn {
          width: 100px;
          font-size: 24rpx;
          color: #585fe3;
          background-color: rgba(#89bbf7, 0.5);
          margin-left: 40rpx;
        }
      }
      .userPassword {
        display: flex;
        justify-content: flex-start;
        .img {
          width: 50rpx;
          height: 50rpx;
        }
        .input {
          border-bottom: 2rpx solid #ccc;
          margin-left: 20rpx;
        }
      }
      .submit {
        height: 75rpx;
        margin-top: 50rpx;
        line-height: 75rpx;
        background-color: #89bbf7;
        border-radius: 50rpx;
        width: 90%;
        color: azure;
      }
      .rules {
        font-size: 30rpx;
        text-align: center;
        margin-top: 20rpx;
        .protocol {
          color: rgb(98, 170, 242);
        }
      }
      .placeholder {
        font-size: 28rpx;
        letter-spacing: 2rpx;
      }
    }
  }
}
</style>

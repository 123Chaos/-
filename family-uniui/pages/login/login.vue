<template>
  <view class="container">
    <view class="header">
      <img src="/static/login/header.png" class="img" />
    </view>
    <view class="login">
      <span class="span">登录</span>
      <form class="form">
        <view class="userName">
          <img src="/static/login/phone.png" class="img" />
          <input type="text" class="input" placeholder="请输入手机号码" placeholder-class="placeholder"
            v-model="form.phoneNumber" />
        </view>
        <view class="vCode">
          <img src="/static/login/vcode.png" class="img" />
          <input type="text" class="input" placeholder="请输入验证码" placeholder-class="placeholder" v-model="form.vCode" />
          <view class="btn" @click="getCode"> 获取验证码 </view>
        </view>
        <view class="userPassword">
          <img src="/static/login/password.png" class="img" />
          <input type="password" class="input" placeholder="请输入密码" placeholder-class="placeholder"
            v-model="form.password" />
        </view>
      </form>
    </view>
    <view class="submit" @click="jump(1)">
      登录
      <view class="icon">
        <img src="/static/login/right-arrow.png" class="img" />
      </view>
    </view>
    <span class="span">未注册用户会自动注册</span>
  </view>
</template>

<script setup>
import { ref } from "vue";
import api from "../../api/api"

const form = ref({
  phoneNumber: "",
  vCode: "",
  password: "",
});
const phonePattern = /^1[34578]\d{9}$/;
const passwordPattern = /^[0-9]{6,18}$/;

async function jump() {
  if (validate(form)) {
    const res = await api.login.loginLogin({ phone: form.value.phoneNumber, password: form.value.password })
    if (res.data.errno !== 0) {
      uni.showToast({
        title: "账号密码错误",
        duration: 1000,
        icon: "error",
      });
      return;
    }
    if (res.data !== '') {
      if (res.data.data !== '') {
        uni.setStorageSync('token', res.data.data)
        uni.showToast({
          title: "登陆成功",
          duration: 1000,
          icon: "success",
        });
      } else {
        const dres = await api.login.loginLogin({ phone: form.value.phoneNumber, password: form.value.password })
        uni.setStorageSync('token', dres.data.data)
        uni.showToast({
          title: "注册成功",
          duration: 1000,
          icon: "success",
        });
      }
      uni.switchTab({ url: "/pages/index/index" });
    }

  }
}

function getCode() {
  form.value.vCode = Math.floor(Math.random() * 1000000)
    .toString()
    .padEnd(6, "7");
  uni.showToast({
    title: "验证码发送成功",
    duration: 1000,
  });
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
  if (!form.value.vCode) {
    uni.showToast({
      title: "验证码错误",
      duration: 1000,
      icon: "error",
    });
    return false
  }
  if (!passwordPattern.test(form.value.password)) {
    uni.showToast({
      title: "密码6-18位数字",
      duration: 1000,
      icon: "error",
    });
    return false;
  }
  return true;
}
</script>

<style lang="scss">
.container {
  display: flex;
  height: 100vh;
  flex-direction: column;
  align-items: center;
  background-image: linear-gradient(to bottom,
      #1bbcb6 0%,
      #1bbcb6 22%,
      #fff 50%);

  .header {
    margin-top: 150rpx;
    margin-bottom: 42rpx;

    .img {
      width: 526rpx;
      height: 150rpx;
    }
  }

  .login {
    width: 708rpx;
    height: 556rpx;
    display: flex;
    flex-direction: column;
    background: #fff;
    box-shadow: 0 2rpx 76rpx 0 rgba(4, 79, 83, 0.12);
    border-radius: 26rpx;

    .span {
      font-size: 48rpx;
      color: #0b5855;
      letter-spacing: 3rpx;
      font-weight: bold;
      margin-left: 50rpx;
      margin-top: 36rpx;
    }

    .form {
      display: flex;
      flex-direction: column;
      margin-left: 66rpx;
      margin-top: 40rpx;

      .userName {
        display: flex;
        justify-content: flex-start;
        margin-bottom: 40rpx;
      }

      .vCode {
        position: relative;
        display: flex;
        justify-content: flex-start;
        margin-bottom: 40rpx;

        .btn {
          position: absolute;
          left: 382rpx;
          top: -20rpx;
          width: 212rpx;
          height: 66rpx;
          background: #f5fdfd;
          border: 2rpx solid #1bbcb6;
          border-radius: 33rpx;
          font-size: 32rpx;
          color: #1bbcb6;
          letter-spacing: 2rpx;
          text-align: center;
          line-height: 66rpx;
          z-index: 2;
        }
      }

      .userPassword {
        display: flex;
        justify-content: flex-start;
      }

      .img {
        width: 42rpx;
        height: 42rpx;
      }

      .input {
        width: 510rpx;
        margin-left: 25rpx;
        margin-bottom: 40rpx;
        padding-bottom: 22rpx;
        border-bottom: 2rpx solid rgba(#979797, 0.14);
      }

      .placeholder {
        opacity: 0.48;
        font-size: 32rpx;
        color: #333333;
        letter-spacing: 2rpx;
        font-weight: 400;
      }
    }
  }

  .submit {
    position: relative;
    width: 620rpx;
    height: 116rpx;
    background: #1bbcb6;
    box-shadow: 0 20rpx 50rpx 0 rgba(0, 129, 136, 0.27);
    border-radius: 30rpx;
    font-size: 16px;
    color: #ffffff;
    letter-spacing: 2rpx;
    text-align: center;
    line-height: 116rpx;
    margin-top: 72rpx;

    .icon {
      position: absolute;
      display: flex;
      align-items: center;
      justify-content: center;
      right: 35rpx;
      top: 35rpx;
      width: 50rpx;
      height: 50rpx;
      background: #008188;
      border-radius: 50rpx;

      .img {
        width: 38rpx;
        height: 38rpx;
      }
    }
  }

  .span {
    margin-top: 20rpx;
    color: #1bbcb6;
    font-size: 28rpx;
  }
}
</style>

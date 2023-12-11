<template>
  <view class="container">
    <view class="banner">
      <view class="upper">
        <view class="left">
          <img :src="user.avatar" class="img" />
        </view>
        <view class="right">
          <view class="uname">{{ user.uname }}</view>
          <view class="manage" @click="jump(1)">账号管理</view>
        </view>
      </view>
      <view class="lower">
        <view
          class="item"
          v-for="(item, index) in list"
          @click="serviceHandler(item.sid)"
        >
          <img :src="item.url" class="img" />
          <span class="span">{{ item.sname }}</span>
        </view>
      </view>
    </view>
    <view class="profile"></view>
    <view class="callback">
      <view class="part">
        <view class="left">
          <img src="/static/my/call.png" class="img" />
          <span class="span">联系客服</span>
        </view>
        <view class="right phone">+86 18582953747</view>
      </view>
      <view class="part">
        <view class="left">
          <img src="/static/my/advice.png" class="img" />
          <span class="span">建议意见</span>
        </view>
        <view class="right email">799510721@qq.com</view>
      </view>
    </view>
    <view class="about">
      <view class="upper">
        <img :src="about.url" class="img" />
      </view>
      <view class="lower">{{ about.content }}</view>
    </view>
  </view>
</template>

<script setup>
import { ref } from "vue";

const user = ref({
  avatar: "http://120.79.246.16:8080//static/avatar.gif",
  uname: "阮哥",
});
const list = ref([
  {
    sid: "1",
    url: "/static/my/record.png",
    sname: "处方单",
  },
  {
    sid: "2",
    url: "/static/my/doc.png",
    sname: "服务单",
  },
  {
    sid: "3",
    url: "/static/my/pre.png",
    sname: "住院记录",
  },
  {
    sid: "4",
    url: "/static/my/order.png",
    sname: "消息",
  },
]);
const about = ref({
  url: "/static/my/about.png",
  content:
    "关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们",
});

function jump(id) {
  if (id === 1) {
    uni.navigateTo({
      url: "/pages/manage/manage",
    });
  }
}

function serviceHandler(sid) {
  if (sid === "1") {
    uni.navigateTo({
      url: "/pages/orders/orders??op_id=1",
    });
  }
  if (sid === "2") {
    uni.navigateTo({
      url: "/pages/orders/orders?op_id=2",
    });
  }
  if (sid === "3") {
    uni.navigateTo({
      url: "/pages/record/record",
    });
  }
  if (sid === "4") {
    uni.navigateTo({
      url: "/pages/message/message",
    });
  }
}
</script>

<style lang="scss">
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-image: linear-gradient(
    to bottom,
    #1bbcb6 15%,
    rgba(#ddd, 0.3) 31%
  );
  .banner {
    width: 700rpx;
    height: 330rpx;
    margin-top: 182rpx;
    border-radius: 16rpx;
    background-color: #fff;

    // background-image: url();
    .upper {
      position: relative;

      .left {
        position: absolute;
        top: -62rpx;
        left: 26rpx;
        width: 186rpx;
        height: 186rpx;
        box-shadow: 0 4rpx 8rpx 0 rgba(22, 83, 80, 0.23);
        border-radius: 186rpx;
        overflow: hidden;

        .img {
          width: 100%;
          height: 100%;
        }
      }

      .right {
        margin-left: 226rpx;
        margin-top: 24rpx;

        .uname {
          color: #333;
          letter-spacing: 2rpx;
          margin-bottom: 4rpx;
          font-weight: bold;
        }

        .manage {
          font-size: 28rpx;
          color: #333;
          opacity: 0.45;
          letter-spacing: 1.7rpx;
        }
      }
    }

    .lower {
      display: flex;
      flex-wrap: wrap;
      margin-top: 70rpx;
      justify-content: space-evenly;
      .item {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 6rpx;

        .img {
          width: 72rpx;
          height: 72rpx;
        }

        .span {
          font-size: 28rpx;
          color: #333;
          letter-spacing: 1.7rpx;
        }
      }
    }
  }

  .callback {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 700rpx;
    height: 216rpx;
    background-color: #fff;
    margin-top: 20rpx;
    border-radius: 16rpx;

    .part {
      display: flex;
      gap: 56rpx;
      width: 100%;
      height: 107rpx;
      line-height: 107rpx;

      .left {
        display: flex;
        align-items: center;
      }

      .right {
        font-size: 32rpx;
        letter-spacing: 2rpx;
      }

      .phone {
        color: #0098ff;
      }

      .email {
        color: #333;
      }
    }

    .img {
      width: 40rpx;
      height: 40rpx;
      margin-right: 24rpx;
      margin-left: 60rpx;
    }

    .span {
      opacity: 0.69;
      color: #333;
      letter-spacing: 2rpx;
    }
  }

  .about {
    width: 700rpx;
    margin-top: 20rpx;
    background-color: #fff;
    border-radius: 16rpx;
    margin-bottom: 100rpx;
    .upper {
      .img {
        width: 654rpx;
        height: 204rpx;
        margin-left: 18rpx;
        margin-right: 28rpx;
        margin-top: 24rpx;
      }
    }

    .lower {
      font-size: 28rpx;
      color: #888;
      letter-spacing: 1.7rpx;
      margin-top: 18rpx;
      margin-left: 30rpx;
      margin-bottom: 18rpx;
    }
  }
}
</style>

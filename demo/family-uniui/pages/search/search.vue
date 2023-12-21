<template>
  <view class="container">
    <view class="header">
      <uni-nav-bar
        left-icon="left"
        @clickLeft="jump(1)"
        fixed="true"
        status-bar
        class="navBar"
      >
        <view class="search">
          <uni-icons
            class="input-uni-icon"
            type="search"
            size="18"
            color="#999"
          />
          <input
            confirm-type="search"
            class="nav-bar-input"
            type="text"
            placeholder="输入搜索关键词"
            v-model="keyword"
          />
          <view class="btn" @click="jump(2)">
            <span class="span">搜索</span>
          </view>
        </view>
      </uni-nav-bar>
    </view>
    <!-- 存放在本地storage -->
    <view class="history">
      <uni-section title="搜索历史" class="title">
        <template v-slot:decoration>
          <view class="decoration"></view>
        </template>
        <template v-slot:right>
          <uni-icons type="trash" size="24" @click="historyHandler"></uni-icons>
        </template>
      </uni-section>
      <view class="tags">
        <uni-tag
          :inverted="true"
          :text="item"
          v-for="item in history.value"
          class="tag"
          custom-style="background-color:#eee;color:#000;border:none;"
          @click="jump(2, item)"
        />
      </view>
    </view>
    <!-- 热门搜索，要加表 -->
    <view class="hot-search"></view>
    <!-- 热门内容，要加表 -->
    <view class="hot-content"></view>
  </view>
</template>

<script setup>
import { ref } from "vue";
import { onLoad } from "@dcloudio/uni-app";

const keyword = ref("");
const history = ref({
  key: "history",
  value: [],
});

function jump(id, item) {
  if (id === 1) {
    uni.navigateBack({
      delta: 1,
    });
  }
  if (id === 2) {
    if (item) keyword.value = item;
    if (Array.isArray(history.value.value)) {
      // LRU history
      const length = history.value.value.length;
      for (let i = 0; i < length; i++) {
        if (keyword.value === history.value.value[i]) {
          history.value.value.splice(i, 1);
          history.value.value.unshift(keyword.value);
          break;
        }
        if (i === length - 1) history.value.value.push(keyword.value);
      }
    } else {
      history.value.value = [keyword.value];
    }
    uni.navigateTo({
      url: `/pages/searchdetail/searchdetail?keyword=${keyword.value}`,
    });
    uni.setStorage({
      key: "history",
      data: JSON.stringify([...new Set(history.value.value)]),
    });
  }
}

function historyHandler() {
  uni.removeStorage({
    key: "history",
    success: () => {
      history.value.value = [];
    },
  });
}

function init() {
  uni.getStorage({
    key: "history",
    success: (res) => {
      history.value.value = JSON.parse(res.data).value;
    },
  });
}

onLoad(() => {
  init();
});
</script>

<style lang="scss">
.container {
  .header {
    .navBar {
      position: relative;
      .search {
        width: 300rpx;
        height: 50rpx;
        display: flex;
        align-items: center;
        padding-left: 10rpx;
        gap: 10rpx;
        border: 2rpx solid #aaa;
        border-radius: 32rpx;
        margin-left: -20rpx;
        margin-top: 15rpx;
      }
      .btn {
        position: absolute;
        display: flex;
        width: 100rpx;
        align-items: center;
        justify-content: center;
        left: 450rpx;
        // border: 2rpx solid #aaa;
        .span {
          color: #1f6764;
        }
      }
    }
  }
  .history {
    .title {
      .decoration {
        width: 4rpx;
        height: 16rpx;
        margin-right: 10rpx;
        background-color: #1f6764;
      }
    }
    .tags {
      display: flex;
      gap: 20rpx;
      margin-left: 20rpx;
      flex-wrap: wrap;
    }
  }
}
</style>

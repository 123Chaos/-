<template>
  <view class="container">
    <view class="card card-info" v-for="(item, index) in list" :key="item.uuid">
      <view class="left">
        <view class="upper"> {{ item.name }} </view>
        <view class="lower">
          {{ item.sex === "0" ? "男" : "女" }} {{ `${item.birthday}岁` }}
        </view>
      </view>
      <view class="right">
        <button size="mini" class="btn" @click="opHandler(1, index)">
          删除档案
        </button>
        <button size="mini" class="btn" @click="opHandler(2, item.id)">
          设为默认
        </button>
      </view>
      <view class="tag">
        <uni-tag text="默认" type="primary" v-if="item.default === '1'" />
      </view>
    </view>
    <view class="card tac" @click="opHandler(3)">添加家庭成员</view>
  </view>
</template>

<script setup>
import { ref, onBeforeMount } from "vue";
import api from "../../api/api";

const list = ref([
  {
    id: "114514",
    name: "Ming",
    sex: "0",
    birthday: "21",
    default: "1",
  },
  {
    id: "1818910",
    name: "P",
    sex: "1",
    birthday: "20",
    default: "0",
  },
]);

async function opHandler(opId, index) {
  if (opId === 1) {
    const res = await api.health.delProfileHealth({ disease_id: index })
    if (res?.data.data) refresh()
  }
  if (opId === 2) {
    const res = await api.health.setDefaultHealth({ disease_id: index })
    if (res?.data.data) refresh()
  }
  if (opId === 3) {
    uni.navigateTo({ url: "/pages/healthdetail/healthdetail" });
  }
}

async function refresh() {
  const res = await api.health.indexHealth({ profileList: '1' })
  if (res?.data.data) {
    list.value = res.data.data
  }
}
onBeforeMount(async () => {
  refresh()
})
</script>

<style lang="scss">
.container {
  display: flex;
  height: 100vh;
  flex-direction: column;
  align-items: center;
  background-color: #eee;

  .card {
    margin-top: 20rpx;
    width: 700rpx;
    height: 200rpx;
    background-color: #fff;
    border-radius: 16rpx;
  }

  .tac {
    text-align: center;
    line-height: 200rpx;
  }

  .card-info {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    gap: 100rpx;

    .left {
      display: flex;
      flex-direction: column;
      gap: 20rpx;

      .lower {
        color: rgb(82, 82, 82);
        font-size: 28rpx;
      }
    }

    .right {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10rpx;
      margin-right: 40rpx;

      .img {
        width: 50rpx;
        height: 50rpx;
      }
    }

    .tag {
      position: absolute;
      right: 0;
      top: 0;
    }
  }
}
</style>

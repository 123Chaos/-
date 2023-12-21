<template>
  <view class="container">
    {{ keyword }}
  </view>
</template>

<script setup>
import { ref } from 'vue'
import { onLoad } from "@dcloudio/uni-app";

const keyword = ref('')

onLoad((e) => {
  keyword.value = e.keyword
});
</script>

<style lang="scss"></style>

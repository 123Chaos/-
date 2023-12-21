<template>
	<view>
		<view>正在查看第{{ msgs.mid }}条信息</view>
		<view>内容为：{{ msgs.content }}</view>
	</view>
</template>

<script setup>
import { onLoad } from "@dcloudio/uni-app";
import { ref } from "vue";

const msgs = ref({
  mid: "-1",
  content:
    "这是一条处方通知哈哈哈哈哈这是一条处方通知哈哈哈哈哈这是一条处方通知哈哈哈哈哈",
});

function init(e) {
  msgs.value.mid = e.mid;
}

onLoad((e) => {
  init(e);
});
</script>

<style lang="scss"></style>

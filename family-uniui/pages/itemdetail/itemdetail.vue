<template>
	<view class="container">
		<swiper indicator-dots autoplay circular class="swiper-container">
			<swiper-item v-for="url in list.urls" :key="list.uid">
				<img :src="url" class="img" />
			</swiper-item>
		</swiper>
		<view class="content">
			<view class="title">{{ list.title }}</view>
			<view class="price">¥{{ list.price }}</view>
			<view class="address">送货地址：{{ formRef.address }}</view>
		</view>
		<view class="submit">立即购买</view>
	</view>
</template>

<script setup>
	import {
		onLoad
	} from '@dcloudio/uni-app'
	import {
		ref
	} from 'vue'

	const list = ref({
		uid: "799510721",
		urls: ["https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
			"https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg",
			"https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/shuijiao.jpg"
		],
		price: "4000.00",
		title: '猫咪 | 究极生物 | 猫咪 | 究极生物 | 可爱猫咪 | 究极生物 | 可爱',
		count: "1",
	})

	const formRef = ref({
		uid: "799510721",
		count: "2",
		type: ['加菲猫', '幼崽'],
		address: "SYSU"
	})

	onLoad((e) => {
		// get e.uid
	})
</script>

<style lang="scss">
	.container {
		position: relative;
		display: flex;
		flex-direction: column;

		.swiper-container {
			width: 730rpx;
			height: 400rpx;
			margin-bottom: 20rpx;
			margin-top: 20rpx;
			margin-left: 10rpx;
			border-radius: 24rpx;
			overflow: hidden;

			.img {
				width: 100%;
				height: 100%;
			}
		}

		.content {

			display: flex;
			flex-direction: column;
			justify-content: space-between;
			margin-right: 20rpx;
			margin-left: 20rpx;

			.title {
				font-size: 36rpx;
				margin-bottom: 20rpx;
			}

			.price {
				color: orangered;
				font-size: 48rpx;
				font-weight: bold;
				letter-spacing: 1.7rpx;
				margin-bottom: 20rpx;
			}

			.address {
				font-size: 24rpx;
				color: #aaa;
			}
		}

		.submit {
			position: fixed;
			width: 200rpx;
			height: 80rpx;
			text-align: center;
			line-height: 80rpx;
			color: white;
			background-color: red;
			border-radius: 50rpx;
			right: 20rpx;
			bottom: 20rpx;
		}

	}
</style>
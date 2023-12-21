<template>
	<view class="container">
		<view class="header">
		</view>
		<view class="content" v-if="list">
			<view class="banner">
				<view class="left">
					<img :src="list.avatar" class="img" />
				</view>
				<view class="right">
					<view class="name"> {{ list.uname }}</view>
				</view>
				<view class="tag">默认</view>
			</view>
			<view class="info">
				<view class="basic">
					<span class="marker">|</span>
					<span class="title">基本信息</span>
					<view class="info-content">
						<view class="info-item">姓名：{{ list.uname }}</view>
						<view class="info-item">身份证号码：{{ list.info?.id }}</view>
						<view class="info-item">性别：{{ list.sex === "0" ? "男" : "女" }}</view>
						<view class="info-item">电话号码：{{ list.phoneNumber }}</view>
						<view class="info-item">企业编号：{{ list.info?.cid }}</view>
						<view class="info-item">企业名称：{{ list.info?.cname }}</view>
					</view>
				</view>
				<view class="history">
					<span class="marker">|</span>
					<span class="title">健康史</span>
					<view class="info-content">
						<view class="info-item">个人史：{{ list.history?.personal }}</view>
						<view class="info-item">家族史：{{ list.history?.family }}</view>
						<view class="info-item">过敏史：{{ list.history?.allergic }}</view>
					</view>
				</view>
			</view>
			<view class="control" @click="jump(4)">
				<view class="op">切换病患</view>
				<img src="/static/health/switch.png" class="img" />
			</view>
		</view>
		<view class="Ncontent" @click="jump(0)" v-if="!list">前往登陆</view>
	</view>
</template>

<script setup>
import {
	ref
} from "vue";
import {
	onTabItemTap,
	onLoad
} from "@dcloudio/uni-app";
import api from "../../api/api";

const list = ref({});

function jump(id) {
	if (id === 0) {
		uni.navigateTo({
			url: "/pages/login/login"
		});
	}
	if (id === 1) {
		uni.navigateTo({
			url: "/pages/message/message"
		});
	}
	if (id === 2) {
		uni.navigateTo({
			url: "/pages/search/search"
		});
	}
	if (id === 3) {
		uni.navigateTo({
			url: "/pages/hospitaldetail/hospitaldetail"
		});
	}
	if (id === 4) {
		uni.navigateTo({
			url: "/pages/healthedit/healthedit"
		});
	}
}

async function init() {
	const res = await api.health.indexHealth();
	if (res.data?.data) {
		list.value = res.data.data
	}
}

onLoad(() => {
	init();
});

// dbclick to refresh
function refresh() {
	uni.showLoading({
		title: "加载中...",
		mask: true,
	});
	init();
	uni.hideLoading();
}
const dbclick = ref(false);
onTabItemTap((e) => {
	if (dbclick.value) refresh();
	dbclick.value = true;
	setTimeout(() => {
		dbclick.value = false;
	}, 200);
});
</script>

<style lang="scss">
.container {
	position: relative;
	display: flex;
	height: 100vh;
	flex-direction: column;
	align-items: center;
	background-image: linear-gradient(to bottom,
			#1bbcb6 15%,
			rgba(#ddd, 0.3) 31%);

	.header {
		display: flex;
		width: 700rpx;
		margin-top: 100rpx;
		gap: 30rpx;
		margin-bottom: 20rpx;

		.search {
			display: flex;
			align-items: center;
			width: 420rpx;
			height: 64rpx;
			background: #ffffff;
			border: 2px solid #ffffff;
			border-radius: 8rpx;

			.img {
				width: 36rpx;
				height: 32rpx;
				margin-left: 18rpx;
			}

			.span {
				opacity: 0.45;
				font-size: 28rpx;
				color: #333333;
				letter-spacing: 0.88px;
				margin-left: 16rpx;
			}
		}

		.message {
			display: flex;
			align-items: center;

			.img {
				width: 48rpx;
				height: 48rpx;
			}
		}
	}

	.content {
		display: flex;
		width: 100%;
		height: 100vh;
		flex-direction: column;
		align-items: center;

		.banner {
			position: relative;
			display: flex;
			width: 700rpx;
			height: 216rpx;
			border-radius: 16rpx;
			margin-top: 20rpx;
			background-color: #fff;

			// background-image: url(/static/health/banner.png);
			.left {
				width: 158rpx;
				height: 158rpx;
				margin-left: 26rpx;
				margin-top: 30rpx;
				margin-right: 52rpx;
				border-radius: 158rpx;
				box-shadow: 0 4rpx 6rpx 0 rgba(22, 83, 80, 0.23);
				overflow: hidden;

				.img {
					width: 100%;
					height: 100%;
				}
			}

			.right {
				margin-top: 25rpx;
				display: flex;
				flex-direction: column;

				.name {
					color: #333;
					font-size: 32rpx;
					letter-spacing: 2rpx;
					font-weight: bold;
					margin-bottom: 10rpx;
				}

				.detail {
					color: #333;
					opacity: 0.45;
					letter-spacing: 1.7rpx;
					font-size: 28rpx;
				}

				.inhospital {
					font-size: 28rpx;
					color: #0070ff;
					letter-spacing: 1.7rpx;
					text-align: center;
					margin-top: 30rpx;
				}
			}

			.tag {
				width: 116rpx;
				height: 52rpx;
				position: absolute;
				right: 24rpx;
				top: 16rpx;
				background: #f8ffff;
				border: 2rpx solid #1bbcb6;
				border-radius: 26rpx;
				font-size: 28rpx;
				color: #1bbcb6;
				letter-spacing: 1.7rpx;
				text-align: center;
				line-height: 52rpx;
			}
		}

		.info {
			box-sizing: border-box;
			width: 700rpx;
			background: url(/static/health/info.png) no-repeat right top;
			background-color: #fff;
			border-radius: 20rpx;
			padding-bottom: 20rpx;
			margin-top: 22rpx;

			.marker {
				color: #1bbcb6;
				margin-right: 13rpx;
				margin-left: 20rpx;
			}

			.title {
				color: #333;
				font-size: 40rpx;
				letter-spacing: 2.5rpx;
				font-weight: bold;
			}

			.info-content {
				display: flex;
				font-size: 26rpx;
				flex-direction: column;
				gap: 20rpx;
				margin-top: 20rpx;
				margin-bottom: 10rpx;
				margin-left: 40rpx;
				color: #333;
				letter-spacing: 2rpx;
			}

			.history {
				margin-top: 36rpx;
			}

			.basic {
				margin-top: 28rpx;
			}
		}

		.control {
			display: flex;
			box-sizing: border-box;
			width: 700rpx;
			height: 100rpx;
			background-color: #fff;
			border-radius: 16rpx;
			justify-content: center;
			align-items: center;
			margin-top: 68rpx;

			.img {
				width: 56rpx;
				height: 56rpx;
				margin-left: 37rpx;
			}

			.op {
				color: #333;
				font-size: 40rpx;
				letter-spacing: 2.5rpx;
			}
		}
	}

	.Ncontent {
		position: absolute;
		width: 200rpx;
		height: 100rpx;
		text-align: center;
		line-height: 100rpx;
		border-radius: 20rpx;
		top: 50%;
		color: white;
		background-color: #1bbcb6;
	}
}
</style>
<template>
	<view class="container">
		<uni-data-picker placeholder="选择医院和科室" popup-title="请选择医院" :localdata="hospitalList" @change="onChange"
			class="header">
		</uni-data-picker>
		<view class="content">
			<view class="card" v-for="item in list" :key="item.id" @click="jump(item.id, item.status)">
				<view class="left">
					<img :src="item.avatar" class="img" />
				</view>
				<view class="right">
					<view class="part1">
						<view class="name">{{ item.name }}</view>
						<view class="title">{{ item.title }}</view>
					</view>
					<view class="part2">
						{{ item.department.join(' ') }}
					</view>
					<view class="part3">
						<view class="tag" v-for="tag in item.tags">
							{{ tag }}
						</view>
					</view>
					<view class="part4">
						擅长：{{ item.description }}
					</view>
				</view>
				<view class="status status-active" v-if="item.status === 1">·出诊中</view>
				<view class="status status-inactive" v-if="item.status === 0">·未出诊</view>
			</view>
		</view>
	</view>
</template>

<script setup>
	import {
		ref
	} from "vue";
	import {
		onLoad
	} from "@dcloudio/uni-app";

	const departmentList = ref([{
			text: "所有科室",
			value: -1
		}, {
			text: "精神科",
			value: 1
		},
		{
			text: "外科",
			value: 2
		}
	])
	const hospitalList = ref([{
			value: 0,
			text: '全部医院',
			children: []
		},
		{
			value: 1,
			text: '广东省第二医院',
			children: []
		}
	])
	const formRef = ref({
		hospitalId: 0,
		departmentId: 0,
		pageNum: 1,
		pageSize: 10
	})
	const list = ref([{
		id: 1,
		status: 1,
		avatar: 'http://120.79.246.16:8080//static/avatar.gif',
		name: '孙思邈',
		title: '医师',
		department: ['广东省第二人民医院', '互联网医疗中心'],
		tags: ['全科', '妇产科'],
		description: '擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导',
	},{
		id: 1,
		status: 1,
		avatar: 'http://120.79.246.16:8080//static/avatar.gif',
		name: '孙思邈',
		title: '医师',
		department: ['广东省第二人民医院', '互联网医疗中心'],
		tags: ['全科', '妇产科'],
		description: '擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导',
	},{
		id: 1,
		status: 1,
		avatar: 'http://120.79.246.16:8080//static/avatar.gif',
		name: '孙思邈',
		title: '医师',
		department: ['广东省第二人民医院', '互联网医疗中心'],
		tags: ['全科', '妇产科'],
		description: '擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导',
	},{
		id: 1,
		status: 1,
		avatar: 'http://120.79.246.16:8080//static/avatar.gif',
		name: '孙思邈',
		title: '医师',
		department: ['广东省第二人民医院', '互联网医疗中心'],
		tags: ['全科', '妇产科'],
		description: '擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导擅长健康指导',
	}])

	function onChange(e) {
		if (e?.detail.value[0]) {
			formRef.value['hospitalId'] = e.detail.value[0].value
		}
		if (e?.detail.value[1]) {
			formRef.value['departmentId'] = e.detail.value[1].value
		} else {
			formRef.value['departmentId'] = 0
		}
		search()
	}

	function search() {

	}

	function getList(uid) {

	}

	function getAllDepartment() {

	}

	function jump(id, status) {
		if (status === 1) uni.navigateTo({
			url: `/pages/inquirydetail/inquirydetail?id=${id}`
		})
	}

	function init() {
		getList(formRef)
		getAllDepartment()
	}

	onLoad(() => {
		init()
	});
</script>

<style lang="scss">
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background-color: rgba(#ddd, 0.3);

		.header {
			margin-top: 20rpx;
			margin-bottom: 20rpx;
		}

		.card {
			position: relative;
			display: flex;
			width: 700rpx;
			height: 380rpx;
			gap: 20rpx;
			background-color: white;
			border-radius: 20rpx;
			margin-bottom: 20rpx;
			box-shadow: 0 4rpx 4rpx 4rpx rgba(#ccc, 0.6);
			.left {
				margin-left: 30rpx;
				padding-top: 20rpx;
				.img {
					width: 150rpx;
					height: 150rpx;
					border-radius: 150rpx;
				}
			}
			.right {
				margin-top: 20rpx;
				.part1 {
					display: flex;
					gap: 20rpx;
					align-items: center;
					letter-spacing: 1.7rpx;
					margin-bottom: 10rpx;
					.title {
						font-size: 28rpx;
						color: #aaa
					}
				}
				.part2 {
					font-size: 24rpx;
					color: #aaa;
					margin-bottom: 10rpx;
				}
				.part3 {
					display: flex;
					gap: 10rpx;
					margin-bottom: 50rpx;
					.tag {
						background-color: rgba(orange,0.6);
						color: orangered;
						font-size: 24rpx;
						padding-left: 5rpx;
						padding-right: 5rpx;
					}
				}
				.part4 {
					display: -webkit-box;
					font-size: 24rpx;
					letter-spacing: 1.7rpx;
					overflow: hidden;
					-webkit-line-clamp: 4;
					text-overflow: ellipsis;
					-webkit-box-orient: vertical;
					padding-right: 30rpx;
				}
			}
			.submit {
				position: absolute;
				right: 20rpx;
				bottom: 20rpx;
				width: 150rpx;
				height: 50rpx;
				background-color: green;
				color: white;
				font-size: 28rpx;
				text-align: center;
				line-height: 50rpx;
				border-radius: 20rpx;
			}
			.status {
				position: absolute;
				right: 30rpx;
				top: 20rpx;
				font-size: 28rpx;
				letter-spacing: 1.7rpx;
			}

			.status-active {
				color: green;
			}

			.status-inactive {
				color: rgba(#ccc, 0.65);
			}
		}
	}
</style>
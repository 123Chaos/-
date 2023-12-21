<template>
	<view class="container">
		<view class="segment">
			<uni-segmented-control :current="current" :values="items" style-type="text" active-color="#1f6764"
				@clickItem="onClickItem" />
		</view>
		<view class="content">
			<view v-if="current === 0" class="service-notice">
				<uni-section title="处方通知" type="line" class="msg" v-if="msg_priscription.length">
					<view v-for="(item, index) in msg_priscription" :key="item.mid">
						<uni-swipe-action>
							<uni-swipe-action-item :right-options="options2" @click="operation($event, index, 0)">
								<view class="content-box">
									<uni-list-chat :title="item.title" :avatar="item.avatar" :note="item.note"
										:time="item.time" badge-positon="right" :badge-text="item.badgeText"
										clickable=true @click="jump(1, index, item.mid)">
									</uni-list-chat>
								</view>
							</uni-swipe-action-item>
						</uni-swipe-action>
					</view>
				</uni-section>
				<uni-section title="服务通知" type="line" class="msg" v-if="msg_service.length">
					<view v-for="(item, index) in msg_service" :key="item.mid">
						<uni-swipe-action>
							<uni-swipe-action-item :right-options="options2" @click="operation($event, index, 1)">
								<view class="content-box">
									<uni-list-chat :title="item.title" :avatar="item.avatar" :note="item.note"
										:time="item.time" badge-positon="right" :badge-text="item.badgeText"
										clickable=true @click="jump(1, index, item.mid)">
									</uni-list-chat>
								</view>
							</uni-swipe-action-item>
						</uni-swipe-action>
					</view>
				</uni-section>
				<view class="hold" v-if="!(msg_priscription.length || msg_service.length)">暂时没有新的服务提醒哦~</view>
			</view>
			<view v-if="current === 1">
				<view v-for="(item, index) in msg_warning" :key="item.mid">
					<uni-swipe-action>
						<uni-swipe-action-item :right-options="options2" @click="operation($event, index, 0)">
							<view class="content-box">
								<uni-list-chat :title="item.title" :avatar="item.avatar" :note="item.note"
									:time="item.time" badge-positon="right" :badge-text="item.badgeText" clickable=true
									@click="jump(1, index, item.mid)">
								</uni-list-chat>
							</view>
						</uni-swipe-action-item>
					</uni-swipe-action>
				</view>
				<view class="hold" v-if="!msg_warning.length">暂时没有新的病房预警哦~</view>
			</view>
			<view v-if="current === 2">
				<view v-for="(item, index) in msg_system" :key="item.mid">
					<uni-swipe-action>
						<uni-swipe-action-item :right-options="options2" @click="operation($event, index, 0)">
							<view class="content-box">
								<uni-list-chat :title="item.title" :avatar="item.avatar" :note="item.note"
									:time="item.time" badge-positon="right" :badge-text="item.badgeText" clickable=true
									@click="jump(1, index, item.mid)">
								</uni-list-chat>
							</view>
						</uni-swipe-action-item>
					</uni-swipe-action>
				</view>
				<view class="hold" v-if="!msg_system.length">暂时没有新的系统消息哦~</view>
			</view>
		</view>
	</view>
</template>

<script setup>
	import {
		ref
	} from "vue";

	const current = ref(0);
	const items = ref(["服务提醒", "病房预警", "系统消息"]);
	// 服务提醒
	const msg_priscription = ref([{
			mid: "p1",
			title: "处方通知1",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条处方通知",
			time: "2023-10-26 20:20",
			badgeText: "dot",
		},
		{
			mid: "p2",
			title: "处方通知2",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条处方通知",
			time: "2023-10-26 20:21",
			badgeText: "dot",
		},
		{
			mid: "p3",
			title: "处方通知3",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条处方通知",
			time: "2023-10-27 11:20",
			badgeText: "dot",
		},
		{
			mid: "p4",
			title: "处方通知4",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条处方通知",
			time: "2023-10-29 21:20",
			badgeText: "dot",
		},
	]);
	const msg_service = ref([{
			mid: "s1",
			title: "服务通知1",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条服务通知",
			time: "2023-10-26 20:20",
			badgeText: "dot",
		},
		{
			mid: "s2",
			title: "服务通知2",
			avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
			note: "这是一条服务通知",
			time: "2023-10-26 20:21",
			badgeText: "dot",
		},
	]);
	const options2 = ref([{
		text: "删除",
		style: {
			backgroundColor: "#F56C6C",
		},
	}, ]);
	// 病房预警
	const msg_warning = ref([{
		mid: "w1",
		title: "病房预警1",
		avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
		note: "这是一条病房预警",
		time: "2023-10-26 20:20",
		badgeText: "dot",
	}, ]);
	// 系统消息
	const msg_system = ref([{
		mid: "y1",
		title: "系统消息1",
		avatar: "https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/unicloudlogo.png",
		note: "这是一条系统消息",
		time: "2023-10-26 20:20",
		badgeText: "dot",
	}, ]);

	function operation(e, index, id) {
		if (current.value === 0 && e.index === 0) {
			if (id === 0) msg_priscription.value.splice(index, 1);
			else msg_service.value.splice(index, 1);
		} else if (current.value === 1 && e.index === 0) {
			msg_warning.value.splice(index, 1);
		} else {
			msg_system.value.splice(index, 1);
		}
		uni.showToast({
			title: `删除成功`,
			icon: "none",
		});
	}

	function onClickItem(e) {
		if (current.value !== e.currentIndex) {
			current.value = e.currentIndex;
		}
	}

	function jump(id, ...args) {
		if (id === 1) {
			const index = args[0];
			const mid = args[1];
			uni.navigateTo({
				url: `/pages/msgdetail/msgdetail?mid=${mid}`
			});
			if (mid && mid[0] === "p") {
				msg_priscription.value[index].badgeText = "";
			}
			if (mid && mid[0] === "s") {
				msg_service.value[index].badgeText = "";
			}
			if (mid && mid[0] === "w") {
				msg_warning.value[index].badgeText = "";
			}
			if (mid && mid[0] === "y") {
				msg_system.value[index].badgeText = "";
			}
		}
	}
</script>

<style lang="scss">
	.container {
		.content {
			.service-notice {
				display: flex;
				flex-direction: column;

				.msg {
					width: 100%;
				}
			}

			.hold {
				text-align: center;
				margin-top: 200rpx;
				color: #aaa;
			}
		}
	}
</style>
import request from '../lib/request.js';

export default {
	remindMessage: (data) => {
		return request({
			url: '/message/remind',
			method: "get",
			data: data || {}
		})
	},
	warnMessage: (data) => {
		return request({
			url: '/message/warn',
			method: "get",
			data: data || {}
		})
	},
	systemMessage: (data) => {
		return request({
			url: '/message/system',
			method: "get",
			data: data || {}
		})
	},
}
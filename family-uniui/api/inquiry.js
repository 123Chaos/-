import request from '../lib/request.js';

export default {
	indexInquiry: (data) => {
		return request({
			url: '/inquiry/index',
			method: "get",
			data: data || {}
		})
	},
	detailInquiry: (data) => {
		return request({
			url: '/inquiry/detail',
			method: "get",
			data: data || {}
		})
	},
}
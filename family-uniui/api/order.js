import request from '../lib/request.js';

export default {
	cf_order: (data) => {
		return request({
			url: '/cf_order/list',
			method: "get",
			data: data || {}
		})
	},
	wz_order: (data) => {
		return request({
			url: '/wz_order/list',
			method: "get",
			data: data || {}
		})
	},
}
import request from '../lib/request.js';

export default {
	list: (data) => {
		return request({
			url: '/inhospital/list',
			method: "get",
			data: data
		})
	},
	detail: (data) => {
		return request({
			url: '/inhospital/detail',
			method: "get",
			data: data
		})
	},
	order: (data) => {
		return request({
			url: '/inhospital/order',
			method: "post",
			data: data
		})
	}
}
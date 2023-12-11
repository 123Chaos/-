import request from '../lib/request.js';

export default {
	list: (data) => {
		return request({
			url: '/lookafter_project/list',
			method: "get",
			data: data
		})
	},
    detail: (data) => {
		return request({
			url: '/lookafter_project/detail',
			method: "get",
			data: data
		})
	},
	order: (data) => {
		return request({
			url: '/lookafter_project/order',
			method: "post",
			data: data
		})
	},
}
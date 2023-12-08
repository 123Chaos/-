import request from '../lib/request.js';

export default {
	indexHealth: (data) => {
		return request({
			url: '/health/list',
			method: "get",
			data: data || {}
		})
	},
	profileHealth: (data) => {
		return request({
			url: '/health/profile',
			method: "get",
			data: data || {}
		})
	},
	delProfileHealth: (data) => {
		return request({
			url: '/health/delete',
			method: "post",
			data: data || {}
		})
	},
	setDefaultHealth: (data) => {
		return request({
			url: '/health/update',
			method: "post",
			data: data || {}
		})
	},
}
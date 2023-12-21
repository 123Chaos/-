import request from '../lib/request.js';

export default {
	indexReading: (data) => {
		return request({
			url: '/reading/list',
			method: "get",
			data: data || {}
		})
	},
	detailReading: (data) => {
		return request({
			url: '/reading/detail',
			method: "get",
			data: data || {}
		})
	},
	bannerReading: (data) => {
		return request({
			url: '/reading/list',
			method: "get",
			data: data || {}
		})
	},
}
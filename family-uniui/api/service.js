import request from '../lib/request.js';

export default {
	inquiryService: (data) => {
		return request({
			url: '/service/inquiry',
			method: "get",
			data: data || {}
		})
	},
	lookafterService: (data) => {
		return request({
			url: '/service/lookafter',
			method: "get",
			data: data || {}
		})
	},
	marketService: (data) => {
		return request({
			url: '/service/market',
			method: "get",
			data: data || {}
		})
	},
	inhospitalService: (data) => {
		return request({
			url: '/service/inhospital',
			method: "get",
			data: data || {}
		})
	},
	moreService: (data) => {
		return request({
			url: '/service/more',
			method: "get",
			data: data || {}
		})
	},
}
import request from '../lib/request.js';

export default {
	publicSearch: (data) => {
		return request({
			url: '/search/public',
			method: "get",
			data: data || {}
		})
	},
	inquirySearch: (data) => {
		return request({
			url: '/search/inquiry',
			method: "get",
			data: data || {}
		})
	},
	marketSearch: (data) => {
		return request({
			url: '/search/market',
			method: "get",
			data: data || {}
		})
	},
}
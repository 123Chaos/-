import request from '../lib/request.js';

export default {
	getOrder: (data) => {
		return request({
			url: '/order/get',
			method: "get",
			data: data || {}
		})
	},
	
}
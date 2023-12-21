import request from '../lib/request.js';

export default {
	loginLogin: (data) => {
		return request({
			url: '/user/login',
			method: "post",
			data: data || {}
		})
	},
	
}
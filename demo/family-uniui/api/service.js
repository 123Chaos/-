import request from '../lib/request.js';

export default {
	inquiryService: (data) => {
		return request({
			url: '/service/inquiry',
			method: "get",
			data: data || {}
		})
	}
}
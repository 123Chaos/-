import request from '../lib/request.js';

export default {
	readingList: (data) => {
		return request({
			url: '/reading/list',
			method: "get",
			data: data
		})
	},
}
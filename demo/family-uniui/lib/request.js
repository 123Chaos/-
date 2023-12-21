const base_url = "http://127.0.0.1:8360";

const request = async (config) => {
  config.url = base_url + config.url;
  console.log(config.url);
  try {
    const value = uni.getStorageSync("token");
    console.log(value)
    if (value) {
      config.header = {
        authorization: value,
      };
    }
  } catch (e) {
    // error
  }

  const res = uni.request({
    url: config.url,
    method: config.method,
    header: config.header,
    data: config.data,
  });

  return res;
};

export default request;

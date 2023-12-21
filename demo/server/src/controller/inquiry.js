const Base = require('./base.js');

module.exports = class extends Base {
    async indexAction() {
        const data = this.get()
        if (data.pageNum && typeof +data.pageNum === 'number') {
            try {
                const list = await think.model('account')
                    .join('ss_hospital on ss_account.hospital_id=ss_hospital.id')
                    .join('ss_hospital_department on ss_hospital.id=ss_hospital_department.hospital_id')
                    .limit(+data.pageNum * 10, 10)
                    .select()
                return this.success(list)
            } catch (e) {
                return this.fail(e)
            }
        }
        return this.fail(1, '参数有误')
    }
};

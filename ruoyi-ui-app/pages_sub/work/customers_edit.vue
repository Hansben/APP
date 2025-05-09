<template>
  <view class="container">
    <view class="example">
      <uni-forms ref="form" :model="form" labelWidth="80px">
        <uni-forms-item label="客户名称" name="contactPerson" required>
          <uni-easyinput v-model="form.customerName" placeholder="请输入客户名称"/>
        </uni-forms-item>
        <uni-forms-item label="联系人姓名" name="contactPerson" required>
          <uni-easyinput v-model="form.contactPerson" placeholder="请输入联系人姓名"/>
        </uni-forms-item>
        <uni-forms-item label="联系电话" name="address" required>
          <uni-easyinput v-model="form.contactNumber" placeholder="请输入联系电话"/>
        </uni-forms-item>
        <uni-forms-item label="客户地址" name="">
          <uni-easyinput v-model="form.address" placeholder="请输入客户地址"/>
        </uni-forms-item>
      </uni-forms>
      <button type="primary" @click="submit">提交</button>
      <button type="primary" v-if="form.customerId && form.customerId!==''" @click="handleDelete">删除</button>
    </view>
  </view>
</template>

<script>
import {addCustomers, delCustomers, getCustomers, updateCustomers} from "../../api/ims/customers";

export default {
  data() {
    return {
      form: {},
    }
  },
  onLoad(option) {
    this.form.customerId = option.customerId
    if (this.form.customerId && this.form.customerId !== '') {
      this.load(option.customerId)
    }
  },
  onReady() {
  },
  methods: {
    change(e) {
      console.log("e:", e);
    },
    load(customerId) {
      getCustomers(customerId).then(response => {
        this.form = response.data
      })
    },
    submit() {
      if (this.form.customerId && this.form.customerId !== '') {
        updateCustomers(this.form).then(response => {
          this.$modal.msgSuccess("修改成功")
          this.$tab.navigateBack()
        })
      } else {
        addCustomers(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.$tab.navigateBack()
        });
      }
    },
    handleDelete() {
      delCustomers(this.form.customerId).then(response => {
        this.$modal.msgSuccess("新增成功");
        this.$tab.navigateBack()
      });
    },
  }
}
</script>

<style lang="scss" scoped>
page {
  background-color: #ffffff;
}

.example {
  padding: 15px;
  background-color: #fff;
}

.segmented-control {
  margin-bottom: 15px;
}

.button-group {
  margin-top: 15px;
  display: flex;
  justify-content: space-around;
}

.form-item {
  display: flex;
  align-items: center;
  flex: 1;
}

.button {
  display: flex;
  align-items: center;
  height: 35px;
  line-height: 35px;
  margin-left: 10px;
}
</style>

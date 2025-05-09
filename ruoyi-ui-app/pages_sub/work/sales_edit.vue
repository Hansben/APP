<template>
  <view class="container">
    <view class="example">
      <uni-forms ref="form" :model="form" labelWidth="80px">
        <uni-forms-item label="商品" name="productId" required>
          <uni-data-picker
              v-model="form.productId"
              :localdata="      productOptions.map(option => {
	return {
		value:option.value,
		text:option.label,
		children:option.children.map(childOption => {
			return {
				value:childOption.value,
				text:childOption.label,
			}
		}),
	}
})"
              @change="change"
          ></uni-data-picker>
        </uni-forms-item>
        <uni-forms-item label="客户" name="customerId" required>
          <uni-data-select
              v-model="form.customerId"
              :localdata="customerOptions.map(option => {
	return {
		value:option.value,
		text:option.label,
	}
})"
              @change="change"
          ></uni-data-select>
        </uni-forms-item>
        <uni-forms-item label="销售日期" name="saleDate" required>
          <uni-datetime-picker type="date" :clear-icon="false" v-model="form.saleDate"/>
        </uni-forms-item>
        <uni-forms-item label="销售数量" name="quantity">
          <uni-easyinput v-model="form.quantity" placeholder="请输入销售数量"/>
        </uni-forms-item>
        <uni-forms-item label="销售总金额" name="totalAmount">
          <uni-easyinput v-model="form.totalAmount" placeholder="请输入销售总金额"/>
        </uni-forms-item>
      </uni-forms>
      <button type="primary" @click="submit">提交</button>
      <button type="primary" v-if="form.saleId && form.saleId!==''" @click="handleDelete">删除</button>
    </view>
  </view>
</template>

<script>
import {addSales, delSales, getSales, updateSales} from "../../api/ims/sales.js";
import UniDataSelect from "../../uni_modules/uni-data-select/components/uni-data-select/uni-data-select.vue";
import {customerList} from "../../api/ims/customers";
import {productTypes} from "../../api/ims/products";

export default {
  components: {UniDataSelect},
  dicts: ['ims_product_type'],
  data() {
    return {
      productOptions: [],
      customerOptions: [],
      form: {},
    }
  },
  onLoad(option) {
    if (option.saleId && option.saleId !== '') {
      this.form.saleId = option.saleId
      this.load(option.saleId)
    }
    this.getProductTypes();
    this.getSupplierList();
  },
  onReady() {
  },
  methods: {
    getProductTypes() {
      productTypes().then(response => {
        this.productOptions = response.data;
      });
    },
    getSupplierList() {
      customerList().then(response => {
        this.customerOptions = response.data;
      });
    },
    change(e) {
      console.log("e:", e);
    },
    load(saleId) {
      getSales(saleId).then(response => {
        this.form = response.data
      })
    },
    submit() {
      if (this.form.saleId && this.form.saleId !== '') {
        updateSales(this.form).then(response => {
          this.$modal.msgSuccess("修改成功")
          this.$tab.navigateBack()
        })
      } else {
        addSales(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.$tab.navigateBack()
        });
      }
    },
    handleDelete() {
      delSales(this.form.saleId).then(response => {
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

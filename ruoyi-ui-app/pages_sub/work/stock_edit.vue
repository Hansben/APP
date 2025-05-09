<template>
  <view class="container">
    <view class="example">
      <uni-forms ref="form" :model="form" labelWidth="80px">
        <uni-forms-item label="商品" name="productName" required>
          <uni-easyinput v-model="form.productName" placeholder="请输入商品"/>
        </uni-forms-item>
        <uni-forms-item label="类别" name="category" required>
          <uni-data-select
              v-model="form.category"
              :localdata="dict.type.ims_product_type.map(option => {
	return {
		value:option.value,
		text:option.label,
	}
})"
              field="label as text "
              @change="change"
          ></uni-data-select>
        </uni-forms-item>
        <uni-forms-item label="单价" name="unitPrice" required>
          <uni-easyinput v-model="form.unitPrice" placeholder="请输入单价"/>
        </uni-forms-item>
        <uni-forms-item label="描述" name="description">
          <uni-easyinput v-model="form.description" placeholder="请输入描述"/>
        </uni-forms-item>
      </uni-forms>
      <button type="primary" @click="submit">提交</button>
      <button type="primary" v-if="form.productId && form.productId!==''" @click="handleDelete">删除</button>
    </view>
  </view>
</template>

<script>
import {addProducts, delProducts, getProducts, updateProducts} from "../../api/ims/products";
import UniDataSelect from "../../uni_modules/uni-data-select/components/uni-data-select/uni-data-select.vue";

export default {
  components: {UniDataSelect},
  dicts: ['ims_product_type'],
  data() {
    return {
      form: {
        productId: "",
        productName: "",
        category: "",
        purchaseDate: "",
        description: ""
      },
    }
  },
  onLoad(option) {
    this.form.productId = option.productId
    if (this.form.productId && this.form.productId !== '') {
      this.load(option.productId)
    }
  },
  onReady() {
  },
  methods: {
    change(e) {
      console.log("e:", e);
    },
    load(productId) {
      getProducts(productId).then(response => {
        this.form = response.data
      })
    },
    submit() {
      if (this.form.productId && this.form.productId !== '') {
        updateProducts(this.form).then(response => {
          this.$modal.msgSuccess("修改成功")
          this.$tab.navigateBack()
        })
      } else {
        addProducts(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.$tab.navigateBack()
        });
      }
    },
    handleDelete() {
      delProducts(this.form.productId).then(response => {
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

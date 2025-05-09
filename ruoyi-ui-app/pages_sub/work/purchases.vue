<template>
  <view>
    <view class="uni-container">
      <uni-fab ref="fab" :horizontal="horizontal" :vertical="vertical"
               @fabClick="fabClick"/>
      <uni-table ref="table" :loading="loading" border stripe emptyText="暂无更多数据">
        <uni-tr>
          <uni-th width="100" align="center">商品</uni-th>
          <uni-th width="100" align="center">供应商</uni-th>
          <uni-th width="100" align="center">采购日期</uni-th>
          <uni-th width="100" align="center">采购数量</uni-th>
          <uni-th width="100" align="center">采购总金额</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in purchasesList" :key="index">
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.productName }}</view>
          </uni-td>
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.supplierName }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.purchaseDate }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.quantity }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.totalAmount }}</view>
          </uni-td>
        </uni-tr>
      </uni-table>
      <view class="uni-pagination-box">
        <uni-pagination show-icon :page-size="queryParams.pageSize" :current="queryParams.pageNum" :total="total"
                        @change="change"/>
      </view>
    </view>
  </view>
</template>
<script>
import {listPurchases} from '@/api/ims/purchases'
import {productTypes} from "@/api/ims/products";
import {supplierList} from "@/api/ims/suppliers";

export default {
  data() {
    return {
      horizontal: 'right',
      vertical: 'bottom',
      productOptions: [],
      supplierOptions: [],
      purchasesList: [],
      // 数据总量
      total: 0,
      loading: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10
      },
    }
  },
  onLoad() {
    this.getData(1)
    this.getProductTypes();
    this.getSupplierList();
  },
  methods: {
    fabClick() {
      this.$tab.navigateTo('/pages_sub/work/purchases_edit')
    },
    handleToEditInfo(item) {
      this.$tab.navigateTo('/pages_sub/work/purchases_edit?purchaseId=' + item.purchaseId)
    },
    getProductTypes() {
      productTypes().then(response => {
        this.productOptions = response.data;
      });
    },
    getSupplierList() {
      supplierList().then(response => {
        this.supplierOptions = response.data;
      });
    },
    // 分页触发
    change(e) {
      this.getData(e.current)
    },
    // 获取数据
    getData(pageCurrent, value = '') {
      this.loading = true
      this.queryParams.pageNum = pageCurrent
      listPurchases(this.queryParams).then(response => {
        this.purchasesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
  }
}
</script>
<style>
/* #ifndef H5 */
/* page {
	padding-top: 85px;
} */
/* #endif */
.uni-group {
  display: flex;
  align-items: center;
}
</style>


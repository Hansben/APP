<template>
  <view>
    <view class="uni-container">
      <uni-fab ref="fab" :horizontal="horizontal" :vertical="vertical"
               @fabClick="fabClick"/>
      <uni-table ref="table" :loading="loading" border stripe emptyText="暂无更多数据">
        <uni-tr>
          <uni-th width="100" align="center">商品</uni-th>
          <uni-th width="100" align="center">客户</uni-th>
          <uni-th width="100" align="center">销售日期</uni-th>
          <uni-th width="100" align="center">销售数量</uni-th>
          <uni-th width="100" align="center">销售总金额</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in salesList" :key="index">
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.productName }}</view>
          </uni-td>
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.customerName }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.saleDate }}</view>
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
import {listSales} from '@/api/ims/sales'
import {productTypes} from "@/api/ims/products";
import {customerList} from "@/api/ims/customers";

export default {
  data() {
    return {
      horizontal: 'right',
      vertical: 'bottom',
      productOptions: [],
      customerOptions: [],
      salesList: [],
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
    this.getcustomerList();
  },
  methods: {
    fabClick() {
      this.$tab.navigateTo('/pages_sub/work/sales_edit')
    },
    handleToEditInfo(item) {
      this.$tab.navigateTo('/pages_sub/work/sales_edit?saleId=' + item.saleId)
    },
    getProductTypes() {
      productTypes().then(response => {
        this.productOptions = response.data;
      });
    },
    getcustomerList() {
      customerList().then(response => {
        this.customerOptions = response.data;
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
      listSales(this.queryParams).then(response => {
        this.salesList = response.rows;
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


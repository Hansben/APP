<template>
  <view>
    <view class="uni-container">
      <uni-fab ref="fab" :horizontal="horizontal" :vertical="vertical"
               @fabClick="fabClick"/>
      <uni-table ref="table" :loading="loading" border stripe emptyText="暂无更多数据">
        <uni-tr>
          <uni-th width="100" align="center">客户名称</uni-th>
          <uni-th width="100" align="center">联系人姓名</uni-th>
          <uni-th width="100" align="center">联系电话</uni-th>
          <uni-th width="100" align="center">客户地址</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in customersList" :key="index">
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.customerName }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.contactPerson }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.contactNumber }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.address ? item.address : '' }}</view>
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
import {listCustomers} from '@/api/ims/customers'

export default {
  data() {
    return {
      customersList: [],
      horizontal: 'right',
      vertical: 'bottom',
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
  },
  methods: {
    fabClick() {
      this.$tab.navigateTo('/pages_sub/work/customers_edit')
    },
    handleToEditInfo(item) {
      this.$tab.navigateTo('/pages_sub/work/customers_edit?customerId=' + item.customerId)
    },
    // 分页触发
    change(e) {
      this.getData(e.current)
    },
    // 获取数据
    getData(pageCurrent, value = '') {
      this.loading = true
      this.queryParams.pageNum = pageCurrent
      listCustomers(this.queryParams).then(response => {
        this.customersList = response.rows;
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


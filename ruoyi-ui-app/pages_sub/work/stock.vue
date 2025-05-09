<template>
  <view>
    <view class="uni-container">
      <uni-table ref="table" :loading="loading" border stripe emptyText="暂无更多数据">
        <uni-tr>
          <uni-th width="100" align="center">商品</uni-th>
          <uni-th width="100" align="center">库存</uni-th>
          <uni-th align="center">最后更新时间</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in inventoryList" :key="index">
          <uni-td>{{ item.productName }}</uni-td>
          <uni-td>
            <view class="name">{{ item.quantity }}</view>
          </uni-td>
          <uni-td align="center">{{ item.lastUpdated }}</uni-td>
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
import {listInventory} from '@/api/ims/inventory'

export default {
  data() {
    return {
      inventoryList: [],
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
    // 分页触发
    change(e) {
      this.getData(e.current)
    },
    // 获取数据
    getData(pageCurrent, value = '') {
      this.loading = true
      this.queryParams.pageNum = pageCurrent
      listInventory(this.queryParams).then(response => {
        this.inventoryList = response.rows;
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


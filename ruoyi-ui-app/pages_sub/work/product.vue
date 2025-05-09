<template>
  <view>
    <view class="uni-container">
      <uni-fab ref="fab" :horizontal="horizontal" :vertical="vertical"
               @fabClick="fabClick"/>
      <uni-table ref="table" :loading="loading" border stripe emptyText="暂无更多数据">
        <uni-tr>
          <uni-th width="100" align="center">商品</uni-th>
          <uni-th width="100" align="center">类别</uni-th>
          <uni-th width="100" align="center">单价</uni-th>
          <uni-th width="100" align="center">描述</uni-th>
        </uni-tr>
        <uni-tr v-for="(item, index) in productsList" :key="index">
          <uni-td>
            <view @click="handleToEditInfo(item)">{{ item.productName }}</view>
          </uni-td>
          <uni-td>
            <view @click="handleToEditInfo(item)">
              <dict-tag :options="dict.type.ims_product_type" :value="item.category"/>
            </view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.unitPrice }}</view>
          </uni-td>
          <uni-td align="center">
            <view @click="handleToEditInfo(item)">{{ item.description ? item.description : '' }}</view>
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
import {listProducts} from '@/api/ims/products'

export default {
  dicts: ['ims_product_type'],
  data() {
    return {
      horizontal: 'right',
      vertical: 'bottom',
      productsList: [],
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
      this.$tab.navigateTo('/pages_sub/work/product_edit')
    },
    handleToEditInfo(item) {
      this.$tab.navigateTo('/pages_sub/work/product_edit?productId=' + item.productId)
    },
    // 分页触发
    change(e) {
      this.getData(e.current)
    },
    // 获取数据
    getData(pageCurrent, value = '') {
      this.loading = true
      this.queryParams.pageNum = pageCurrent
      listProducts(this.queryParams).then(response => {
        this.productsList = response.rows;
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


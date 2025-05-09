<template>
  <view class="work-container">
    <!-- 轮播图 -->
    <uni-swiper-dot class="uni-swiper-dot-box" :info="data" :current="current" field="content">
      <swiper class="swiper-box" :current="swiperDotIndex" @change="changeSwiper">
        <swiper-item v-for="(item, index) in data" :key="index">
          <view class="swiper-item" @click="clickBannerItem(item)">
            <image :src="item.image" mode="aspectFill" :draggable="false"/>
          </view>
        </swiper-item>
      </swiper>
    </uni-swiper-dot>

    <!-- 宫格组件 -->
    <uni-section title="系统管理" type="line"></uni-section>
    <view class="grid-body">
      <uni-grid :column="4" :showBorder="false" @change="changeGrid">
        <uni-grid-item v-if="roles&&['admin', 'common'].some(role => roles.includes(role))" :index="Number(0)" key="0">
          <view class="grid-item-box">
            <uni-icons type="map-filled" size="30"></uni-icons>
            <text class="text">实时库存</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'cg'].some(role => roles.includes(role))" :index="Number(1)" key="1">
          <view class="grid-item-box">
            <uni-icons type="shop-filled" size="30"></uni-icons>
            <text class="text">商品管理</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'xs'].some(role => roles.includes(role))" :index="Number(2)" key="2">
          <view class="grid-item-box">
            <uni-icons type="person-filled" size="30"></uni-icons>
            <text class="text">客户管理</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'cg'].some(role => roles.includes(role))" :index="Number(3)" key="3">
          <view class="grid-item-box">
            <uni-icons type="staff-filled" size="30"></uni-icons>
            <text class="text">供应商管理</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'cg'].some(role => roles.includes(role))" :index="Number(4)" key="4">
          <view class="grid-item-box">
            <uni-icons type="cloud-download-filled" size="30"></uni-icons>
            <text class="text">入库</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'xs'].some(role => roles.includes(role))" :index="Number(5)" key="5">
          <view class="grid-item-box">
            <uni-icons type="cloud-upload-filled" size="30"></uni-icons>
            <text class="text">出库</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin', 'common'].some(role => roles.includes(role))" :index="Number(6)" key="6">
          <view class="grid-item-box">
            <uni-icons type="list" size="30"></uni-icons>
            <text class="text">出入库记录</text>
          </view>
        </uni-grid-item>
        <uni-grid-item v-if="roles&&['admin'].some(role => roles.includes(role))" :index="Number(7)" key="7">
          <view class="grid-item-box">
            <uni-icons type="calendar-filled" size="30"></uni-icons>
            <text class="text">统计分析</text>
          </view>
        </uni-grid-item>
      </uni-grid>
    </view>
  </view>
</template>

<script>

export default {
  data() {
    return {
      roles: this.$store.state.user.roles,
      current: 0,
      swiperDotIndex: 0,
      data: [{
        image: '/static/images/banner/banner01.jpg'
      }
      ]
    }
  },
  methods: {
    clickBannerItem(item) {
      console.info(item)
    },
    changeSwiper(e) {
      this.current = e.detail.current
    },
    changeGrid(e) {
      console.info(e)
      this.$modal.showToast(e.detail.index)
      if (e.detail.index === 0) {
        uni.navigateTo({
          url: '/pages_sub/work/stock'
        });
      } else if (e.detail.index === 1) {
        uni.navigateTo({
          url: '/pages_sub/work/product'
        });
      } else if (e.detail.index === 2) {
        uni.navigateTo({
          url: '/pages_sub/work/customers'
        });
      } else if (e.detail.index === 3) {
        uni.navigateTo({
          url: '/pages_sub/work/suppliers'
        });
      } else if (e.detail.index === 4) {
        uni.navigateTo({
          url: '/pages_sub/work/purchases'
        });
      } else if (e.detail.index === 5) {
        uni.navigateTo({
          url: '/pages_sub/work/sales'
        });
      } else if (e.detail.index === 6) {
        uni.navigateTo({
          url: '/pages_sub/work/changes'
        });
      } else if (e.detail.index === 7) {
        uni.navigateTo({
          url: '/pages_sub/index'
        });
      }
    }
  }
}
</script>

<style lang="scss" scoped>
/* #ifndef APP-NVUE */
page {
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  background-color: #fff;
  min-height: 100%;
  height: auto;
}

view {
  font-size: 14px;
  line-height: inherit;
}

/* #endif */

.text {
  text-align: center;
  font-size: 26rpx;
  margin-top: 10rpx;
}

.grid-item-box {
  flex: 1;
  /* #ifndef APP-NVUE */
  display: flex;
  /* #endif */
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 15px 0;
}

.uni-margin-wrap {
  width: 690rpx;
  width: 100%;;
}

.swiper {
  height: 300rpx;
}

.swiper-box {
  height: 150px;
}

.swiper-item {
  /* #ifndef APP-NVUE */
  display: flex;
  /* #endif */
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #fff;
  height: 300rpx;
  line-height: 300rpx;
}

@media screen and (min-width: 500px) {
  .uni-swiper-dot-box {
    width: 400px;
    /* #ifndef APP-NVUE */
    margin: 0 auto;
    /* #endif */
    margin-top: 8px;
  }

  .image {
    width: 100%;
  }
}
</style>

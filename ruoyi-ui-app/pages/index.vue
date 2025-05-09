<template>
  <view class="content">
    <image class="logo" src="@/static/logo.png"></image>
    <view class="text-area">
      <button @click="navigateToPage">跳转到目标页面</button>
    </view>
  </view>
</template>

<script>
export default {
  methods: {
    navigateToPage() {
      uni.navigateTo({
        url: '/pages_sub/index'
      });
    }
  }
};
</script>
<style scoped>


.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.logo {
  height: 200rpx;
  width: 200rpx;
  margin-top: 200rpx;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 50rpx;
}

.text-area {
  display: flex;
  justify-content: center;
}

.title {
  font-size: 36rpx;
  color: #8f8f94;
}
</style>

<template>
  <view class="about-container">
    <view class="header-section text-center">
      <image style="width: 150rpx;height: 150rpx;" src="/static/logo200.png" mode="widthFix">
      </image>
      <uni-title type="h2" title="进销存管理系统"></uni-title>
    </view>

    <view class="content-section">
      <view class="menu-list">
        <view class="list-cell list-cell-arrow">
          <view class="menu-item-box">
            <view>版本信息</view>
            <view class="text-right">v{{ version }}</view>
          </view>
        </view>

      </view>
    </view>

    <view class="copyright">
      <view>Copyright &copy; 2025 进销存管理系统 All Rights Reserved.</view>
    </view>
  </view>
</template>

<script>
export default {
  data() {
    return {
      version: getApp().globalData.config.appInfo.version
    }
  }
}
</script>

<style lang="scss" scoped>
page {
  background-color: #f8f8f8;
}

.copyright {
  margin-top: 50rpx;
  text-align: center;
  line-height: 60rpx;
  color: #999;
}

.header-section {
  display: flex;
  padding: 30rpx 0 0;
  flex-direction: column;
  align-items: center;
}
</style>

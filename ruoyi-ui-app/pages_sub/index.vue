<template>
  <view class="content">
    <view class="text-area">
      <view style="width:750rpx; height:750rpx">
        <l-echart ref="chartRef1" @finished="init1"></l-echart>
        <l-echart ref="chartRef2" @finished="init2"></l-echart>
      </view>
    </view>
  </view>
</template>
<script>
import {allView} from '@/api/ims/inventory'
import * as echarts from './static/echarts.min'

export default {
  data() {
    return {
      viewData: {},
      option: {
        title: [
          {
            text: ''
          }
        ],
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross',
            crossStyle: {
              color: '#999'
            }
          }
        },
        toolbox: {},
        legend: {
          data: ['采购', '销售', '差额']
        },
        xAxis: [
          {
            type: 'category',
            data: [],
            axisPointer: {
              type: 'shadow'
            }
          }
        ],
        yAxis: [
          {
            type: 'value',
            name: '采购',
            axisLabel: {
              formatter: '{value} '
            }
          },
          {
            type: 'value',
            name: '销售',
            axisLabel: {
              formatter: '{value} '
            }
          }
        ],
        series: [
          {
            name: '采购',
            type: 'bar',
            tooltip: {
              valueFormatter: function (value) {
                return value;
              }
            },
            data: []
          },
          {
            name: '销售',
            type: 'bar',
            tooltip: {
              valueFormatter: function (value) {
                return value;
              }
            },
            data: []
          }
        ]
      },
    };
  },
  onLoad() {
    this.getData()
  },
  // 组件能被调用必须是组件的节点已经被渲染到页面上
  methods: {
    async init1() {
      // chart 图表实例不能存在data里
      const chart1 = await this.$refs.chartRef1.init(echarts);
      let option = {...this.option};
      option.title[0].text = '数量统计'
      option.xAxis[0].data = this.viewData.ckDate;
      option.series[0].data = this.viewData.rkCount;
      option.series[1].data = this.viewData.ckCount;
      chart1.setOption(option)      // chart 图表实例不能存在data里
    },
    async init2() {
      // chart 图表实例不能存在data里
      const chart2 = await this.$refs.chartRef2.init(echarts);
      let option = {...this.option};
      option.title[0].text = '金额统计'
      option.xAxis[0].data = this.viewData.ckDate;
      option.series[0].data = this.viewData.rkAmount;
      option.series[1].data = this.viewData.ckAmount;
      chart2.setOption(option)      // chart 图表实例不能存在data里
    },
    getData() {
      allView().then(response => {
        this.viewData = response.data;
      })
    }
  }
}</script>
<style scoped>
.echarts-wrap {
  width: 100%;
  height: 300px;
}

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

<template>
  <div>
    <div v-if="true">
      <!--      垂直水平居中展示欢迎-->
      <div style="display: flex; justify-content: center; align-items: center; height: 80vh;">
        <div>
          <h1>欢迎使用进销存管理系统</h1>
        </div>
      </div>
    </div>
    <div v-if="false">


      <el-row style="padding: 40px">
        <el-col :span="12">
          <div ref="chart1" style=" height: 400px;"></div>
        </el-col>
        <el-col :span="12">
          <div ref="chart2" style=" height: 400px;"></div>
        </el-col>
      </el-row>

      <el-row style="padding: 40px">
        <el-col :span="12">
          <div ref="chart3" style=" height: 400px;"></div>
        </el-col>
        <el-col :span="12">
          <div ref="chart4" style=" height: 400px;"></div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>

export default {
  name: "Index",
  data() {
    return {
      color1: [
        '#fb7293',
        '#96BFFF'
      ],
      color2: [
        '#FFDB5C',
        '#E690D1',
      ],
      color3: [
        '#78C2C4',
      ],
      color4: [
        '#D7C4BB',
      ],
      // 当前选择的筛选维度，默认按日筛选
      selectedType: 'date',
      // 开始日期
      startDate: null,
      // 结束日期
      endDate: null
    };
  },
  mounted() {
  },
  computed: {},
  methods: {}
};
</script>

<style scoped>


.radio-group {
  /* 设置单选框组与下面日期选择器的间距 */
  margin-bottom: 10px;
}

.date-picker {
  /* 设置日期选择器之间的间距 */
  margin-right: 10px;
}
</style>

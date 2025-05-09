<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="变动日期" prop="changeDate">
        <el-date-picker clearable
                        v-model="queryParams.changeDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择变动日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="变动类型" prop="changeType">
        <el-select v-model="queryParams.changeType" placeholder="请选择变动类型" clearable>
          <el-option
            v-for="dict in dict.type.ims_change_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="变动数量" prop="quantityChange">
        <el-input
          v-model="queryParams.quantityChange"
          placeholder="请输入变动数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>


    <el-table v-loading="loading" :data="changesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="商品" align="center" prop="productName"/>
      <el-table-column label="变动日期" align="center" prop="changeDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.changeDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="变动类型" align="center" prop="changeType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.ims_change_type" :value="scope.row.changeType"/>
        </template>
      </el-table-column>
      <el-table-column label="变动数量" align="center" prop="quantityChange"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ims:changes:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ims:changes:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改库存变动记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="变动日期" prop="changeDate">
          <el-date-picker clearable
                          v-model="form.changeDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择变动日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="变动类型" prop="changeType">
          <el-select v-model="form.changeType" placeholder="请选择变动类型">
            <el-option
              v-for="dict in dict.type.ims_change_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="变动数量" prop="quantityChange">
          <el-input v-model="form.quantityChange" placeholder="请输入变动数量"/>
        </el-form-item>
        <el-form-item label="关联的采购或销售记录的ID" prop="referenceId">
          <el-input v-model="form.referenceId" placeholder="请输入关联的采购或销售记录的ID"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listChanges, getChanges, delChanges, addChanges, updateChanges} from "@/api/ims/changes";

export default {
  name: "Changes",
  dicts: ['ims_change_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 库存变动记录表格数据
      changesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productId: null,
        changeDate: null,
        changeType: null,
        quantityChange: null,
        referenceId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productId: [
          {required: true, message: "商品，关联ims_products表的product_id不能为空", trigger: "change"}
        ],
        changeDate: [
          {required: true, message: "变动日期不能为空", trigger: "blur"}
        ],
        changeType: [
          {required: true, message: "变动类型不能为空", trigger: "change"}
        ],
        quantityChange: [
          {required: true, message: "变动数量不能为空", trigger: "blur"}
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询库存变动记录列表 */
    getList() {
      this.loading = true;
      listChanges(this.queryParams).then(response => {
        this.changesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        changeId: null,
        productId: null,
        changeDate: null,
        changeType: null,
        quantityChange: null,
        referenceId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.changeId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加库存变动记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const changeId = row.changeId || this.ids
      getChanges(changeId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改库存变动记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.changeId != null) {
            updateChanges(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addChanges(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const changeIds = row.changeId || this.ids;
      this.$modal.confirm('是否确认删除库存变动记录编号为"' + changeIds + '"的数据项？').then(function () {
        return delChanges(changeIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ims/changes/export', {
        ...this.queryParams
      }, `changes_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

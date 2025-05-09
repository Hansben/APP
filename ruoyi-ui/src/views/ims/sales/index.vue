<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="销售日期" prop="saleDate">
        <el-date-picker clearable
                        v-model="queryParams.saleDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择销售日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="销售数量" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入销售数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="销售总金额" prop="totalAmount">
        <el-input
          v-model="queryParams.totalAmount"
          placeholder="请输入销售总金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ims:sales:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ims:sales:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ims:sales:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ims:sales:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="salesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="商品" align="center" prop="productName"/>
      <el-table-column label="客户" align="center" prop="customerName"/>
      <el-table-column label="销售日期" align="center" prop="saleDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.saleDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="销售数量" align="center" prop="quantity"/>
      <el-table-column label="销售总金额" align="center" prop="totalAmount"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ims:sales:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ims:sales:remove']"
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

    <!-- 添加或修改销售信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="销售商品" prop="productId">
          <el-cascader
            :props="{emitPath:false}"
            v-model="form.productId"
            :options="productOptions"></el-cascader>
        </el-form-item>
        <el-form-item label="客户" prop="customerId">
          <el-select v-model="form.customerId" placeholder="请选择">
            <el-option
              v-for="item in customerOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="销售日期" prop="saleDate">
          <el-date-picker clearable
                          v-model="form.saleDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择销售日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="销售数量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入销售数量"/>
        </el-form-item>
        <el-form-item label="销售总金额" prop="totalAmount">
          <el-input v-model="form.totalAmount" placeholder="请输入销售总金额"/>
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
import {listSales, getSales, delSales, addSales, updateSales} from "@/api/ims/sales";
import {productTypes} from "@/api/ims/products";
import {customerList} from "@/api/ims/customers";

export default {
  name: "Sales",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      productOptions: [],
      customerOptions: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 销售信息表格数据
      salesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productId: null,
        customerId: null,
        saleDate: null,
        quantity: null,
        totalAmount: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productId: [
          {required: true, message: "销售的商品，关联ims_products表的product_id不能为空", trigger: "change"}
        ],
        customerId: [
          {required: true, message: "客户，关联ims_customers表的customer_id不能为空", trigger: "change"}
        ],
        saleDate: [
          {required: true, message: "销售日期不能为空", trigger: "blur"}
        ],
        quantity: [
          {required: true, message: "销售数量不能为空", trigger: "blur"}
        ],
        totalAmount: [
          {required: true, message: "销售总金额不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getProductTypes();
    this.getCustomerList();
  },
  methods: {
    getProductTypes() {
      productTypes().then(response => {
        this.productOptions = response.data;
      });
    },
    getCustomerList() {
      customerList().then(response => {
        this.customerOptions = response.data;
      });
    },
    /** 查询销售信息列表 */
    getList() {
      this.loading = true;
      listSales(this.queryParams).then(response => {
        this.salesList = response.rows;
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
        saleId: null,
        productId: null,
        customerId: null,
        saleDate: null,
        quantity: null,
        totalAmount: null
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
      this.ids = selection.map(item => item.saleId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加销售信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const saleId = row.saleId || this.ids
      getSales(saleId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改销售信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.saleId != null) {
            updateSales(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSales(this.form).then(response => {
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
      const saleIds = row.saleId || this.ids;
      this.$modal.confirm('是否确认删除销售信息编号为"' + saleIds + '"的数据项？').then(function () {
        return delSales(saleIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ims/sales/export', {
        ...this.queryParams
      }, `sales_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

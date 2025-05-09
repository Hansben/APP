<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="采购日期" prop="purchaseDate">
        <el-date-picker clearable
                        v-model="queryParams.purchaseDate"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择采购日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="采购数量" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入采购数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="采购总金额" prop="totalAmount">
        <el-input
          v-model="queryParams.totalAmount"
          placeholder="请输入采购总金额"
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
          v-hasPermi="['ims:purchases:add']"
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
          v-hasPermi="['ims:purchases:edit']"
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
          v-hasPermi="['ims:purchases:remove']"
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
          v-hasPermi="['ims:purchases:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="purchasesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="商品" align="center" prop="productName"/>
      <el-table-column label="供应商" align="center" prop="supplierName"/>
      <el-table-column label="采购日期" align="center" prop="purchaseDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.purchaseDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="采购数量" align="center" prop="quantity"/>
      <el-table-column label="采购总金额" align="center" prop="totalAmount"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ims:purchases:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ims:purchases:remove']"
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

    <!-- 添加或修改采购信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="采购商品" prop="productId">
          <el-cascader
            :props="{emitPath:false}"
            v-model="form.productId"
            :options="productOptions"
            @change="handleChange"></el-cascader>
        </el-form-item>
        <el-form-item label="供应商" prop="supplierId">
          <el-select v-model="form.supplierId" placeholder="请选择">
            <el-option
              v-for="item in supplierOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="采购日期" prop="purchaseDate">
          <el-date-picker clearable
                          v-model="form.purchaseDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择采购日期">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="采购数量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入采购数量"/>
        </el-form-item>
        <el-form-item label="采购总金额" prop="totalAmount">
          <el-input v-model="form.totalAmount" placeholder="请输入采购总金额"/>
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
import {listPurchases, getPurchases, delPurchases, addPurchases, updatePurchases} from "@/api/ims/purchases";
import {productTypes} from "@/api/ims/products";
import {supplierList} from "@/api/ims/suppliers";

export default {
  name: "Purchases",
  data() {
    return {
      productOptions: [],
      supplierOptions: [],
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
      // 采购信息表格数据
      purchasesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        productId: null,
        supplierId: null,
        purchaseDate: null,
        quantity: null,
        totalAmount: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        productId: [
          {required: true, message: "采购的商品，关联ims_products表的product_id不能为空", trigger: "change"}
        ],
        supplierId: [
          {required: true, message: "供应商，关联ims_suppliers表的supplier_id不能为空", trigger: "change"}
        ],
        purchaseDate: [
          {required: true, message: "采购日期不能为空", trigger: "blur"}
        ],
        quantity: [
          {required: true, message: "采购数量不能为空", trigger: "blur"}
        ],
        totalAmount: [
          {required: true, message: "采购总金额不能为空", trigger: "blur"}
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getProductTypes();
    this.getSupplierList();
  },
  methods: {
    getProductTypes() {
      productTypes().then(response => {
        this.productOptions = response.data;
      });
    },
    getSupplierList() {
      supplierList().then(response => {
        this.supplierOptions = response.data;
      });
    },
    handleChange() {

    },
    /** 查询采购信息列表 */
    getList() {
      this.loading = true;
      listPurchases(this.queryParams).then(response => {
        this.purchasesList = response.rows;
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
        purchaseId: null,
        productId: null,
        supplierId: null,
        purchaseDate: null,
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
      this.ids = selection.map(item => item.purchaseId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加采购信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const purchaseId = row.purchaseId || this.ids
      getPurchases(purchaseId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改采购信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.purchaseId != null) {
            updatePurchases(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPurchases(this.form).then(response => {
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
      const purchaseIds = row.purchaseId || this.ids;
      this.$modal.confirm('是否确认删除采购信息编号为"' + purchaseIds + '"的数据项？').then(function () {
        return delPurchases(purchaseIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ims/purchases/export', {
        ...this.queryParams
      }, `purchases_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

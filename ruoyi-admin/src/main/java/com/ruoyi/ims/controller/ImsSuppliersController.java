package com.ruoyi.ims.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.ims.domain.ImsSuppliers;
import com.ruoyi.ims.service.IImsSuppliersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 供应商信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/suppliers")
public class ImsSuppliersController extends BaseController
{
    @Autowired
    private IImsSuppliersService imsSuppliersService;

    /**
     * 查询供应商信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsSuppliers imsSuppliers)
    {
        startPage();
        List<ImsSuppliers> list = imsSuppliersService.selectImsSuppliersList(imsSuppliers);
        return getDataTable(list);
    }


    @GetMapping("/supplierList")
    public AjaxResult supplierList()
    {
        return success(imsSuppliersService.supplierList());
    }


    /**
     * 导出供应商信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:export')")
    @Log(title = "供应商信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsSuppliers imsSuppliers)
    {
        List<ImsSuppliers> list = imsSuppliersService.selectImsSuppliersList(imsSuppliers);
        ExcelUtil<ImsSuppliers> util = new ExcelUtil<ImsSuppliers>(ImsSuppliers.class);
        util.exportExcel(response, list, "供应商信息数据");
    }

    /**
     * 获取供应商信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:query')")
    @GetMapping(value = "/{supplierId}")
    public AjaxResult getInfo(@PathVariable("supplierId") Long supplierId)
    {
        return success(imsSuppliersService.selectImsSuppliersBySupplierId(supplierId));
    }

    /**
     * 新增供应商信息
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:add')")
    @Log(title = "供应商信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsSuppliers imsSuppliers)
    {
        return toAjax(imsSuppliersService.insertImsSuppliers(imsSuppliers));
    }

    /**
     * 修改供应商信息
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:edit')")
    @Log(title = "供应商信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsSuppliers imsSuppliers)
    {
        return toAjax(imsSuppliersService.updateImsSuppliers(imsSuppliers));
    }

    /**
     * 删除供应商信息
     */
    @PreAuthorize("@ss.hasPermi('ims:suppliers:remove')")
    @Log(title = "供应商信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{supplierIds}")
    public AjaxResult remove(@PathVariable Long[] supplierIds)
    {
        return toAjax(imsSuppliersService.deleteImsSuppliersBySupplierIds(supplierIds));
    }
}

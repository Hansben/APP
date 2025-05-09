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
import com.ruoyi.ims.domain.ImsCustomers;
import com.ruoyi.ims.service.IImsCustomersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客户信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/customers")
public class ImsCustomersController extends BaseController
{
    @Autowired
    private IImsCustomersService imsCustomersService;

    /**
     * 查询客户信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsCustomers imsCustomers)
    {
        startPage();
        List<ImsCustomers> list = imsCustomersService.selectImsCustomersList(imsCustomers);
        return getDataTable(list);
    }
    @GetMapping("/customerList")
    public AjaxResult customerList()
    {
        return success(imsCustomersService.customerList());
    }
    /**
     * 导出客户信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:export')")
    @Log(title = "客户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsCustomers imsCustomers)
    {
        List<ImsCustomers> list = imsCustomersService.selectImsCustomersList(imsCustomers);
        ExcelUtil<ImsCustomers> util = new ExcelUtil<ImsCustomers>(ImsCustomers.class);
        util.exportExcel(response, list, "客户信息数据");
    }

    /**
     * 获取客户信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:query')")
    @GetMapping(value = "/{customerId}")
    public AjaxResult getInfo(@PathVariable("customerId") Long customerId)
    {
        return success(imsCustomersService.selectImsCustomersByCustomerId(customerId));
    }

    /**
     * 新增客户信息
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:add')")
    @Log(title = "客户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsCustomers imsCustomers)
    {
        return toAjax(imsCustomersService.insertImsCustomers(imsCustomers));
    }

    /**
     * 修改客户信息
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:edit')")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsCustomers imsCustomers)
    {
        return toAjax(imsCustomersService.updateImsCustomers(imsCustomers));
    }

    /**
     * 删除客户信息
     */
    @PreAuthorize("@ss.hasPermi('ims:customers:remove')")
    @Log(title = "客户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{customerIds}")
    public AjaxResult remove(@PathVariable Long[] customerIds)
    {
        return toAjax(imsCustomersService.deleteImsCustomersByCustomerIds(customerIds));
    }
}

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
import com.ruoyi.ims.domain.ImsSales;
import com.ruoyi.ims.service.IImsSalesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 销售信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/sales")
public class ImsSalesController extends BaseController
{
    @Autowired
    private IImsSalesService imsSalesService;

    /**
     * 查询销售信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsSales imsSales)
    {
        startPage();
        List<ImsSales> list = imsSalesService.selectImsSalesList(imsSales);
        return getDataTable(list);
    }

    /**
     * 导出销售信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:export')")
    @Log(title = "销售信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsSales imsSales)
    {
        List<ImsSales> list = imsSalesService.selectImsSalesList(imsSales);
        ExcelUtil<ImsSales> util = new ExcelUtil<ImsSales>(ImsSales.class);
        util.exportExcel(response, list, "销售信息数据");
    }

    /**
     * 获取销售信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:query')")
    @GetMapping(value = "/{saleId}")
    public AjaxResult getInfo(@PathVariable("saleId") Long saleId)
    {
        return success(imsSalesService.selectImsSalesBySaleId(saleId));
    }

    /**
     * 新增销售信息
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:add')")
    @Log(title = "销售信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsSales imsSales)
    {
        return toAjax(imsSalesService.insertImsSales(imsSales));
    }

    /**
     * 修改销售信息
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:edit')")
    @Log(title = "销售信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsSales imsSales)
    {
        return toAjax(imsSalesService.updateImsSales(imsSales));
    }

    /**
     * 删除销售信息
     */
    @PreAuthorize("@ss.hasPermi('ims:sales:remove')")
    @Log(title = "销售信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{saleIds}")
    public AjaxResult remove(@PathVariable Long[] saleIds)
    {
        return toAjax(imsSalesService.deleteImsSalesBySaleIds(saleIds));
    }
}

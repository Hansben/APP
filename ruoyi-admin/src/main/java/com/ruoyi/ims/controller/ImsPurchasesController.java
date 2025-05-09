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
import com.ruoyi.ims.domain.ImsPurchases;
import com.ruoyi.ims.service.IImsPurchasesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 采购信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/purchases")
public class ImsPurchasesController extends BaseController
{
    @Autowired
    private IImsPurchasesService imsPurchasesService;

    /**
     * 查询采购信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsPurchases imsPurchases)
    {
        startPage();
        List<ImsPurchases> list = imsPurchasesService.selectImsPurchasesList(imsPurchases);
        return getDataTable(list);
    }

    /**
     * 导出采购信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:export')")
    @Log(title = "采购信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsPurchases imsPurchases)
    {
        List<ImsPurchases> list = imsPurchasesService.selectImsPurchasesList(imsPurchases);
        ExcelUtil<ImsPurchases> util = new ExcelUtil<ImsPurchases>(ImsPurchases.class);
        util.exportExcel(response, list, "采购信息数据");
    }

    /**
     * 获取采购信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:query')")
    @GetMapping(value = "/{purchaseId}")
    public AjaxResult getInfo(@PathVariable("purchaseId") Long purchaseId)
    {
        return success(imsPurchasesService.selectImsPurchasesByPurchaseId(purchaseId));
    }

    /**
     * 新增采购信息
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:add')")
    @Log(title = "采购信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsPurchases imsPurchases)
    {
        return toAjax(imsPurchasesService.insertImsPurchases(imsPurchases));
    }

    /**
     * 修改采购信息
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:edit')")
    @Log(title = "采购信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsPurchases imsPurchases)
    {
        return toAjax(imsPurchasesService.updateImsPurchases(imsPurchases));
    }

    /**
     * 删除采购信息
     */
    @PreAuthorize("@ss.hasPermi('ims:purchases:remove')")
    @Log(title = "采购信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{purchaseIds}")
    public AjaxResult remove(@PathVariable Long[] purchaseIds)
    {
        return toAjax(imsPurchasesService.deleteImsPurchasesByPurchaseIds(purchaseIds));
    }
}

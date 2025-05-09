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
import com.ruoyi.ims.domain.ImsInventory;
import com.ruoyi.ims.service.IImsInventoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库存信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/inventory")
public class ImsInventoryController extends BaseController
{
    @Autowired
    private IImsInventoryService imsInventoryService;

    /**
     * 查询库存信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsInventory imsInventory)
    {
        startPage();
        List<ImsInventory> list = imsInventoryService.selectImsInventoryList(imsInventory);
        return getDataTable(list);
    }


    /**
     *
     */
    @GetMapping("/allView")
    public AjaxResult allView()
    {
        return imsInventoryService.allView();
    }

    /**
     * 导出库存信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:export')")
    @Log(title = "库存信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsInventory imsInventory)
    {
        List<ImsInventory> list = imsInventoryService.selectImsInventoryList(imsInventory);
        ExcelUtil<ImsInventory> util = new ExcelUtil<ImsInventory>(ImsInventory.class);
        util.exportExcel(response, list, "库存信息数据");
    }

    /**
     * 获取库存信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:query')")
    @GetMapping(value = "/{inventoryId}")
    public AjaxResult getInfo(@PathVariable("inventoryId") Long inventoryId)
    {
        return success(imsInventoryService.selectImsInventoryByInventoryId(inventoryId));
    }

    /**
     * 新增库存信息
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:add')")
    @Log(title = "库存信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsInventory imsInventory)
    {
        return toAjax(imsInventoryService.insertImsInventory(imsInventory));
    }

    /**
     * 修改库存信息
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:edit')")
    @Log(title = "库存信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsInventory imsInventory)
    {
        return toAjax(imsInventoryService.updateImsInventory(imsInventory));
    }

    /**
     * 删除库存信息
     */
    @PreAuthorize("@ss.hasPermi('ims:inventory:remove')")
    @Log(title = "库存信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{inventoryIds}")
    public AjaxResult remove(@PathVariable Long[] inventoryIds)
    {
        return toAjax(imsInventoryService.deleteImsInventoryByInventoryIds(inventoryIds));
    }
}

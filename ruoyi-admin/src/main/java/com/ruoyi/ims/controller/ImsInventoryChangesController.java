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
import com.ruoyi.ims.domain.ImsInventoryChanges;
import com.ruoyi.ims.service.IImsInventoryChangesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 库存变动记录Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/changes")
public class ImsInventoryChangesController extends BaseController
{
    @Autowired
    private IImsInventoryChangesService imsInventoryChangesService;

    /**
     * 查询库存变动记录列表
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsInventoryChanges imsInventoryChanges)
    {
        startPage();
        List<ImsInventoryChanges> list = imsInventoryChangesService.selectImsInventoryChangesList(imsInventoryChanges);
        return getDataTable(list);
    }

    /**
     * 导出库存变动记录列表
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:export')")
    @Log(title = "库存变动记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsInventoryChanges imsInventoryChanges)
    {
        List<ImsInventoryChanges> list = imsInventoryChangesService.selectImsInventoryChangesList(imsInventoryChanges);
        ExcelUtil<ImsInventoryChanges> util = new ExcelUtil<ImsInventoryChanges>(ImsInventoryChanges.class);
        util.exportExcel(response, list, "库存变动记录数据");
    }

    /**
     * 获取库存变动记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:query')")
    @GetMapping(value = "/{changeId}")
    public AjaxResult getInfo(@PathVariable("changeId") Long changeId)
    {
        return success(imsInventoryChangesService.selectImsInventoryChangesByChangeId(changeId));
    }

    /**
     * 新增库存变动记录
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:add')")
    @Log(title = "库存变动记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsInventoryChanges imsInventoryChanges)
    {
        return toAjax(imsInventoryChangesService.insertImsInventoryChanges(imsInventoryChanges));
    }

    /**
     * 修改库存变动记录
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:edit')")
    @Log(title = "库存变动记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsInventoryChanges imsInventoryChanges)
    {
        return toAjax(imsInventoryChangesService.updateImsInventoryChanges(imsInventoryChanges));
    }

    /**
     * 删除库存变动记录
     */
    @PreAuthorize("@ss.hasPermi('ims:changes:remove')")
    @Log(title = "库存变动记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{changeIds}")
    public AjaxResult remove(@PathVariable Long[] changeIds)
    {
        return toAjax(imsInventoryChangesService.deleteImsInventoryChangesByChangeIds(changeIds));
    }
}

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
import com.ruoyi.ims.domain.ImsProducts;
import com.ruoyi.ims.service.IImsProductsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品信息Controller
 * 
 * @author suyl
 * @date 2025-04-07
 */
@RestController
@RequestMapping("/ims/products")
public class ImsProductsController extends BaseController
{
    @Autowired
    private IImsProductsService imsProductsService;

    /**
     * 查询商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:products:list')")
    @GetMapping("/list")
    public TableDataInfo list(ImsProducts imsProducts)
    {
        startPage();
        List<ImsProducts> list = imsProductsService.selectImsProductsList(imsProducts);
        return getDataTable(list);
    }


    @GetMapping("/productTypes")
    public AjaxResult productTypes()
    {
        return success(imsProductsService.productTypes());
    }

    /**
     * 导出商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('ims:products:export')")
    @Log(title = "商品信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImsProducts imsProducts)
    {
        List<ImsProducts> list = imsProductsService.selectImsProductsList(imsProducts);
        ExcelUtil<ImsProducts> util = new ExcelUtil<ImsProducts>(ImsProducts.class);
        util.exportExcel(response, list, "商品信息数据");
    }

    /**
     * 获取商品信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('ims:products:query')")
    @GetMapping(value = "/{productId}")
    public AjaxResult getInfo(@PathVariable("productId") Long productId)
    {
        return success(imsProductsService.selectImsProductsByProductId(productId));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('ims:products:add')")
    @Log(title = "商品信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImsProducts imsProducts)
    {
        return toAjax(imsProductsService.insertImsProducts(imsProducts));
    }

    /**
     * 修改商品信息
     */
    @PreAuthorize("@ss.hasPermi('ims:products:edit')")
    @Log(title = "商品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImsProducts imsProducts)
    {
        return toAjax(imsProductsService.updateImsProducts(imsProducts));
    }

    /**
     * 删除商品信息
     */
    @PreAuthorize("@ss.hasPermi('ims:products:remove')")
    @Log(title = "商品信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productIds}")
    public AjaxResult remove(@PathVariable Long[] productIds)
    {
        return toAjax(imsProductsService.deleteImsProductsByProductIds(productIds));
    }
}

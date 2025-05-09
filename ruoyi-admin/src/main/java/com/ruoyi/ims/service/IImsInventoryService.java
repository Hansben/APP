package com.ruoyi.ims.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.ims.domain.ImsInventory;

/**
 * 库存信息Service接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
public interface IImsInventoryService 
{
    /**
     * 查询库存信息
     * 
     * @param inventoryId 库存信息主键
     * @return 库存信息
     */
    public ImsInventory selectImsInventoryByInventoryId(Long inventoryId);

    /**
     * 查询库存信息列表
     * 
     * @param imsInventory 库存信息
     * @return 库存信息集合
     */
    public List<ImsInventory> selectImsInventoryList(ImsInventory imsInventory);

    /**
     * 新增库存信息
     * 
     * @param imsInventory 库存信息
     * @return 结果
     */
    public int insertImsInventory(ImsInventory imsInventory);

    /**
     * 修改库存信息
     * 
     * @param imsInventory 库存信息
     * @return 结果
     */
    public int updateImsInventory(ImsInventory imsInventory);

    /**
     * 批量删除库存信息
     * 
     * @param inventoryIds 需要删除的库存信息主键集合
     * @return 结果
     */
    public int deleteImsInventoryByInventoryIds(Long[] inventoryIds);

    /**
     * 删除库存信息信息
     * 
     * @param inventoryId 库存信息主键
     * @return 结果
     */
    public int deleteImsInventoryByInventoryId(Long inventoryId);

    AjaxResult allView();
}

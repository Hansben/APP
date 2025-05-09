package com.ruoyi.ims.service;

import java.util.List;
import com.ruoyi.ims.domain.ImsInventoryChanges;

/**
 * 库存变动记录Service接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
public interface IImsInventoryChangesService 
{
    /**
     * 查询库存变动记录
     * 
     * @param changeId 库存变动记录主键
     * @return 库存变动记录
     */
    public ImsInventoryChanges selectImsInventoryChangesByChangeId(Long changeId);

    /**
     * 查询库存变动记录列表
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 库存变动记录集合
     */
    public List<ImsInventoryChanges> selectImsInventoryChangesList(ImsInventoryChanges imsInventoryChanges);

    /**
     * 新增库存变动记录
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 结果
     */
    public int insertImsInventoryChanges(ImsInventoryChanges imsInventoryChanges);

    /**
     * 修改库存变动记录
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 结果
     */
    public int updateImsInventoryChanges(ImsInventoryChanges imsInventoryChanges);

    /**
     * 批量删除库存变动记录
     * 
     * @param changeIds 需要删除的库存变动记录主键集合
     * @return 结果
     */
    public int deleteImsInventoryChangesByChangeIds(Long[] changeIds);

    /**
     * 删除库存变动记录信息
     * 
     * @param changeId 库存变动记录主键
     * @return 结果
     */
    public int deleteImsInventoryChangesByChangeId(Long changeId);
}

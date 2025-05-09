package com.ruoyi.ims.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsInventoryChangesMapper;
import com.ruoyi.ims.domain.ImsInventoryChanges;
import com.ruoyi.ims.service.IImsInventoryChangesService;

/**
 * 库存变动记录Service业务层处理
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsInventoryChangesServiceImpl implements IImsInventoryChangesService 
{
    @Autowired
    private ImsInventoryChangesMapper imsInventoryChangesMapper;

    /**
     * 查询库存变动记录
     * 
     * @param changeId 库存变动记录主键
     * @return 库存变动记录
     */
    @Override
    public ImsInventoryChanges selectImsInventoryChangesByChangeId(Long changeId)
    {
        return imsInventoryChangesMapper.selectImsInventoryChangesByChangeId(changeId);
    }

    /**
     * 查询库存变动记录列表
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 库存变动记录
     */
    @Override
    public List<ImsInventoryChanges> selectImsInventoryChangesList(ImsInventoryChanges imsInventoryChanges)
    {
        return imsInventoryChangesMapper.selectImsInventoryChangesList(imsInventoryChanges);
    }

    /**
     * 新增库存变动记录
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 结果
     */
    @Override
    public int insertImsInventoryChanges(ImsInventoryChanges imsInventoryChanges)
    {
        return imsInventoryChangesMapper.insertImsInventoryChanges(imsInventoryChanges);
    }

    /**
     * 修改库存变动记录
     * 
     * @param imsInventoryChanges 库存变动记录
     * @return 结果
     */
    @Override
    public int updateImsInventoryChanges(ImsInventoryChanges imsInventoryChanges)
    {
        return imsInventoryChangesMapper.updateImsInventoryChanges(imsInventoryChanges);
    }

    /**
     * 批量删除库存变动记录
     * 
     * @param changeIds 需要删除的库存变动记录主键
     * @return 结果
     */
    @Override
    public int deleteImsInventoryChangesByChangeIds(Long[] changeIds)
    {
        return imsInventoryChangesMapper.deleteImsInventoryChangesByChangeIds(changeIds);
    }

    /**
     * 删除库存变动记录信息
     * 
     * @param changeId 库存变动记录主键
     * @return 结果
     */
    @Override
    public int deleteImsInventoryChangesByChangeId(Long changeId)
    {
        return imsInventoryChangesMapper.deleteImsInventoryChangesByChangeId(changeId);
    }
}

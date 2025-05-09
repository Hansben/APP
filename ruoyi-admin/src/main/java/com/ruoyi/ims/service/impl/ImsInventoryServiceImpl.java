package com.ruoyi.ims.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.ims.domain.ViewData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsInventoryMapper;
import com.ruoyi.ims.domain.ImsInventory;
import com.ruoyi.ims.service.IImsInventoryService;

/**
 * 库存信息Service业务层处理
 *
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsInventoryServiceImpl implements IImsInventoryService {
    @Autowired
    private ImsInventoryMapper imsInventoryMapper;

    /**
     * 查询库存信息
     *
     * @param inventoryId 库存信息主键
     * @return 库存信息
     */
    @Override
    public ImsInventory selectImsInventoryByInventoryId(Long inventoryId) {
        return imsInventoryMapper.selectImsInventoryByInventoryId(inventoryId);
    }

    /**
     * 查询库存信息列表
     *
     * @param imsInventory 库存信息
     * @return 库存信息
     */
    @Override
    public List<ImsInventory> selectImsInventoryList(ImsInventory imsInventory) {
        return imsInventoryMapper.selectImsInventoryList(imsInventory);
    }

    /**
     * 新增库存信息
     *
     * @param imsInventory 库存信息
     * @return 结果
     */
    @Override
    public int insertImsInventory(ImsInventory imsInventory) {
        return imsInventoryMapper.insertImsInventory(imsInventory);
    }

    /**
     * 修改库存信息
     *
     * @param imsInventory 库存信息
     * @return 结果
     */
    @Override
    public int updateImsInventory(ImsInventory imsInventory) {
        return imsInventoryMapper.updateImsInventory(imsInventory);
    }

    /**
     * 批量删除库存信息
     *
     * @param inventoryIds 需要删除的库存信息主键
     * @return 结果
     */
    @Override
    public int deleteImsInventoryByInventoryIds(Long[] inventoryIds) {
        return imsInventoryMapper.deleteImsInventoryByInventoryIds(inventoryIds);
    }

    /**
     * 删除库存信息信息
     *
     * @param inventoryId 库存信息主键
     * @return 结果
     */
    @Override
    public int deleteImsInventoryByInventoryId(Long inventoryId) {
        return imsInventoryMapper.deleteImsInventoryByInventoryId(inventoryId);
    }

    @Override
    public AjaxResult allView() {
        Map<String, Object> result = new HashMap<>();
        List<ViewData> rk = imsInventoryMapper.rk();
        List<String> rkCount = new ArrayList<>();
        List<String> rkDate = new ArrayList<>();
        List<String> rkAmount = new ArrayList<>();
        for (ViewData viewData : rk) {
            rkCount.add(viewData.getCount());
            rkDate.add(viewData.getDate());
            rkAmount.add(viewData.getAmount());
        }
        List<ViewData> ck = imsInventoryMapper.ck();
        List<String> ckCount = new ArrayList<>();
        List<String> ckDate = new ArrayList<>();
        List<String> ckAmount = new ArrayList<>();
        for (ViewData viewData : ck) {
            ckCount.add(viewData.getCount());
            ckDate.add(viewData.getDate());
            ckAmount.add(viewData.getAmount());
        }
        result.put("rkCount", rkCount);
        result.put("rkDate", rkDate);
        result.put("rkAmount", rkAmount);
        result.put("ckCount", ckCount);
        result.put("ckDate", ckDate);
        result.put("ckAmount", ckAmount);
        return AjaxResult.success(result);
    }
}

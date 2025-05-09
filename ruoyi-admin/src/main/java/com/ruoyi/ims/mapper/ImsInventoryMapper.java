package com.ruoyi.ims.mapper;

import java.util.List;
import com.ruoyi.ims.domain.ImsInventory;
import com.ruoyi.ims.domain.ViewData;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 库存信息Mapper接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Repository
@Mapper
public interface ImsInventoryMapper 
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
     * 删除库存信息
     * 
     * @param inventoryId 库存信息主键
     * @return 结果
     */
    public int deleteImsInventoryByInventoryId(Long inventoryId);

    /**
     * 批量删除库存信息
     * 
     * @param inventoryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImsInventoryByInventoryIds(Long[] inventoryIds);

    int stockIn(ImsInventory imsInventory);

    int stockOut(ImsInventory imsInventory);

    List<ViewData> rk();

    List<ViewData> ck();
}

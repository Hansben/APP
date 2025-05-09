package com.ruoyi.ims.mapper;

import java.util.List;
import com.ruoyi.ims.domain.ImsPurchases;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 采购信息Mapper接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Repository
@Mapper
public interface ImsPurchasesMapper 
{
    /**
     * 查询采购信息
     * 
     * @param purchaseId 采购信息主键
     * @return 采购信息
     */
    public ImsPurchases selectImsPurchasesByPurchaseId(Long purchaseId);

    /**
     * 查询采购信息列表
     * 
     * @param imsPurchases 采购信息
     * @return 采购信息集合
     */
    public List<ImsPurchases> selectImsPurchasesList(ImsPurchases imsPurchases);

    /**
     * 新增采购信息
     * 
     * @param imsPurchases 采购信息
     * @return 结果
     */
    public Long insertImsPurchases(ImsPurchases imsPurchases);

    /**
     * 修改采购信息
     * 
     * @param imsPurchases 采购信息
     * @return 结果
     */
    public int updateImsPurchases(ImsPurchases imsPurchases);

    /**
     * 删除采购信息
     * 
     * @param purchaseId 采购信息主键
     * @return 结果
     */
    public int deleteImsPurchasesByPurchaseId(Long purchaseId);

    /**
     * 批量删除采购信息
     * 
     * @param purchaseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImsPurchasesByPurchaseIds(Long[] purchaseIds);
}

package com.ruoyi.ims.service.impl;

import com.ruoyi.ims.domain.ImsPurchases;
import com.ruoyi.ims.mapper.ImsInventoryChangesMapper;
import com.ruoyi.ims.mapper.ImsInventoryMapper;
import com.ruoyi.ims.mapper.ImsPurchasesMapper;
import com.ruoyi.ims.service.IImsPurchasesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.ruoyi.ims.utils.StockUtil.inOrOutMethod;

/**
 * 采购信息Service业务层处理
 *
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsPurchasesServiceImpl implements IImsPurchasesService {
    @Autowired
    private ImsPurchasesMapper imsPurchasesMapper;
    @Autowired
    private ImsInventoryMapper imsInventoryMapper;
    @Autowired
    private ImsInventoryChangesMapper imsInventoryChangesMapper;

    /**
     * 查询采购信息
     *
     * @param purchaseId 采购信息主键
     * @return 采购信息
     */
    @Override
    public ImsPurchases selectImsPurchasesByPurchaseId(Long purchaseId) {
        return imsPurchasesMapper.selectImsPurchasesByPurchaseId(purchaseId);
    }

    /**
     * 查询采购信息列表
     *
     * @param imsPurchases 采购信息
     * @return 采购信息
     */
    @Override
    public List<ImsPurchases> selectImsPurchasesList(ImsPurchases imsPurchases) {
        return imsPurchasesMapper.selectImsPurchasesList(imsPurchases);
    }

    /**
     * 新增采购信息
     *
     * @param imsPurchases 采购信息
     * @return 结果
     */
    @Override
    public int insertImsPurchases(ImsPurchases imsPurchases) {
        Long id = imsPurchasesMapper.insertImsPurchases(imsPurchases);
        return inOrOutMethod("cgrk",id, imsPurchases.getProductId(), imsPurchases.getQuantity(), imsInventoryMapper, imsInventoryChangesMapper);
    }

    /**
     * 修改采购信息
     *
     * @param imsPurchases 采购信息
     * @return 结果
     */
    @Override
    public int updateImsPurchases(ImsPurchases imsPurchases) {
        return imsPurchasesMapper.updateImsPurchases(imsPurchases);
    }

    /**
     * 批量删除采购信息
     *
     * @param purchaseIds 需要删除的采购信息主键
     * @return 结果
     */
    @Override
    public int deleteImsPurchasesByPurchaseIds(Long[] purchaseIds) {
        return imsPurchasesMapper.deleteImsPurchasesByPurchaseIds(purchaseIds);
    }

    /**
     * 删除采购信息信息
     *
     * @param purchaseId 采购信息主键
     * @return 结果
     */
    @Override
    public int deleteImsPurchasesByPurchaseId(Long purchaseId) {
        return imsPurchasesMapper.deleteImsPurchasesByPurchaseId(purchaseId);
    }
}

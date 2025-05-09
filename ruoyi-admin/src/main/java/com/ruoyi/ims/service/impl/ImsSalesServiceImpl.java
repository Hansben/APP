package com.ruoyi.ims.service.impl;

import java.util.*;

import com.ruoyi.ims.domain.ImsInventory;
import com.ruoyi.ims.domain.ImsInventoryChanges;
import com.ruoyi.ims.domain.ImsSuppliers;
import com.ruoyi.ims.mapper.ImsInventoryChangesMapper;
import com.ruoyi.ims.mapper.ImsInventoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsSalesMapper;
import com.ruoyi.ims.domain.ImsSales;
import com.ruoyi.ims.service.IImsSalesService;

import static com.ruoyi.ims.utils.StockUtil.inOrOutMethod;

/**
 * 销售信息Service业务层处理
 *
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsSalesServiceImpl implements IImsSalesService {
    @Autowired
    private ImsSalesMapper imsSalesMapper;
    @Autowired
    private ImsInventoryMapper imsInventoryMapper;
    @Autowired
    private ImsInventoryChangesMapper imsInventoryChangesMapper;

    /**
     * 查询销售信息
     *
     * @param saleId 销售信息主键
     * @return 销售信息
     */
    @Override
    public ImsSales selectImsSalesBySaleId(Long saleId) {
        return imsSalesMapper.selectImsSalesBySaleId(saleId);
    }

    /**
     * 查询销售信息列表
     *
     * @param imsSales 销售信息
     * @return 销售信息
     */
    @Override
    public List<ImsSales> selectImsSalesList(ImsSales imsSales) {
        return imsSalesMapper.selectImsSalesList(imsSales);
    }

    /**
     * 新增销售信息
     *
     * @param imsSales 销售信息
     * @return 结果
     */
    @Override
    public int insertImsSales(ImsSales imsSales) {
        Long id = imsSalesMapper.insertImsSales(imsSales);
        return inOrOutMethod("xsck", id, imsSales.getProductId(), imsSales.getQuantity(), imsInventoryMapper, imsInventoryChangesMapper);
    }


    /**
     * 修改销售信息
     *
     * @param imsSales 销售信息
     * @return 结果
     */
    @Override
    public int updateImsSales(ImsSales imsSales) {
        return imsSalesMapper.updateImsSales(imsSales);
    }

    /**
     * 批量删除销售信息
     *
     * @param saleIds 需要删除的销售信息主键
     * @return 结果
     */
    @Override
    public int deleteImsSalesBySaleIds(Long[] saleIds) {
        return imsSalesMapper.deleteImsSalesBySaleIds(saleIds);
    }

    /**
     * 删除销售信息信息
     *
     * @param saleId 销售信息主键
     * @return 结果
     */
    @Override
    public int deleteImsSalesBySaleId(Long saleId) {
        return imsSalesMapper.deleteImsSalesBySaleId(saleId);
    }


}

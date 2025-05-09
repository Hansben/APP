package com.ruoyi.ims.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsSuppliersMapper;
import com.ruoyi.ims.domain.ImsSuppliers;
import com.ruoyi.ims.service.IImsSuppliersService;

/**
 * 供应商信息Service业务层处理
 *
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsSuppliersServiceImpl implements IImsSuppliersService {
    @Autowired
    private ImsSuppliersMapper imsSuppliersMapper;

    /**
     * 查询供应商信息
     *
     * @param supplierId 供应商信息主键
     * @return 供应商信息
     */
    @Override
    public ImsSuppliers selectImsSuppliersBySupplierId(Long supplierId) {
        return imsSuppliersMapper.selectImsSuppliersBySupplierId(supplierId);
    }

    /**
     * 查询供应商信息列表
     *
     * @param imsSuppliers 供应商信息
     * @return 供应商信息
     */
    @Override
    public List<ImsSuppliers> selectImsSuppliersList(ImsSuppliers imsSuppliers) {
        return imsSuppliersMapper.selectImsSuppliersList(imsSuppliers);
    }

    /**
     * 新增供应商信息
     *
     * @param imsSuppliers 供应商信息
     * @return 结果
     */
    @Override
    public int insertImsSuppliers(ImsSuppliers imsSuppliers) {
        return imsSuppliersMapper.insertImsSuppliers(imsSuppliers);
    }

    /**
     * 修改供应商信息
     *
     * @param imsSuppliers 供应商信息
     * @return 结果
     */
    @Override
    public int updateImsSuppliers(ImsSuppliers imsSuppliers) {
        return imsSuppliersMapper.updateImsSuppliers(imsSuppliers);
    }

    /**
     * 批量删除供应商信息
     *
     * @param supplierIds 需要删除的供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteImsSuppliersBySupplierIds(Long[] supplierIds) {
        return imsSuppliersMapper.deleteImsSuppliersBySupplierIds(supplierIds);
    }

    /**
     * 删除供应商信息信息
     *
     * @param supplierId 供应商信息主键
     * @return 结果
     */
    @Override
    public int deleteImsSuppliersBySupplierId(Long supplierId) {
        return imsSuppliersMapper.deleteImsSuppliersBySupplierId(supplierId);
    }

    @Override
    public List supplierList() {
        List list = new ArrayList();
        ImsSuppliers imsSuppliers = new ImsSuppliers();
        List<ImsSuppliers> result = imsSuppliersMapper.selectImsSuppliersList(imsSuppliers);
        for (ImsSuppliers suppliers : result) {
            Map<String, Object> map = new HashMap<>();
            map.put("label", suppliers.getSupplierName());
            map.put("value", suppliers.getSupplierId());
            list.add(map);
        }
        return list;
    }
}

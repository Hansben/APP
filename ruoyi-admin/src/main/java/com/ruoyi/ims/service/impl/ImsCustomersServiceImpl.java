package com.ruoyi.ims.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.ims.domain.ImsSuppliers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsCustomersMapper;
import com.ruoyi.ims.domain.ImsCustomers;
import com.ruoyi.ims.service.IImsCustomersService;

/**
 * 客户信息Service业务层处理
 *
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsCustomersServiceImpl implements IImsCustomersService {
    @Autowired
    private ImsCustomersMapper imsCustomersMapper;

    /**
     * 查询客户信息
     *
     * @param customerId 客户信息主键
     * @return 客户信息
     */
    @Override
    public ImsCustomers selectImsCustomersByCustomerId(Long customerId) {
        return imsCustomersMapper.selectImsCustomersByCustomerId(customerId);
    }

    /**
     * 查询客户信息列表
     *
     * @param imsCustomers 客户信息
     * @return 客户信息
     */
    @Override
    public List<ImsCustomers> selectImsCustomersList(ImsCustomers imsCustomers) {
        return imsCustomersMapper.selectImsCustomersList(imsCustomers);
    }

    /**
     * 新增客户信息
     *
     * @param imsCustomers 客户信息
     * @return 结果
     */
    @Override
    public int insertImsCustomers(ImsCustomers imsCustomers) {
        return imsCustomersMapper.insertImsCustomers(imsCustomers);
    }

    /**
     * 修改客户信息
     *
     * @param imsCustomers 客户信息
     * @return 结果
     */
    @Override
    public int updateImsCustomers(ImsCustomers imsCustomers) {
        return imsCustomersMapper.updateImsCustomers(imsCustomers);
    }

    /**
     * 批量删除客户信息
     *
     * @param customerIds 需要删除的客户信息主键
     * @return 结果
     */
    @Override
    public int deleteImsCustomersByCustomerIds(Long[] customerIds) {
        return imsCustomersMapper.deleteImsCustomersByCustomerIds(customerIds);
    }

    /**
     * 删除客户信息信息
     *
     * @param customerId 客户信息主键
     * @return 结果
     */
    @Override
    public int deleteImsCustomersByCustomerId(Long customerId) {
        return imsCustomersMapper.deleteImsCustomersByCustomerId(customerId);
    }

    @Override
    public List customerList() {
        List list = new ArrayList();
        ImsCustomers imsCustomers = new ImsCustomers();
        List<ImsCustomers> result = imsCustomersMapper.selectImsCustomersList(imsCustomers);
        for (ImsCustomers item : result) {
            Map<String, Object> map = new HashMap<>();
            map.put("label", item.getCustomerName());
            map.put("value", item.getCustomerId());
            list.add(map);
        }
        return list;
    }
}

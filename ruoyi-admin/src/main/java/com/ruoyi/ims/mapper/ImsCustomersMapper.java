package com.ruoyi.ims.mapper;

import java.util.List;
import com.ruoyi.ims.domain.ImsCustomers;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 客户信息Mapper接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Repository
@Mapper
public interface ImsCustomersMapper 
{
    /**
     * 查询客户信息
     * 
     * @param customerId 客户信息主键
     * @return 客户信息
     */
    public ImsCustomers selectImsCustomersByCustomerId(Long customerId);

    /**
     * 查询客户信息列表
     * 
     * @param imsCustomers 客户信息
     * @return 客户信息集合
     */
    public List<ImsCustomers> selectImsCustomersList(ImsCustomers imsCustomers);

    /**
     * 新增客户信息
     * 
     * @param imsCustomers 客户信息
     * @return 结果
     */
    public int insertImsCustomers(ImsCustomers imsCustomers);

    /**
     * 修改客户信息
     * 
     * @param imsCustomers 客户信息
     * @return 结果
     */
    public int updateImsCustomers(ImsCustomers imsCustomers);

    /**
     * 删除客户信息
     * 
     * @param customerId 客户信息主键
     * @return 结果
     */
    public int deleteImsCustomersByCustomerId(Long customerId);

    /**
     * 批量删除客户信息
     * 
     * @param customerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImsCustomersByCustomerIds(Long[] customerIds);
}

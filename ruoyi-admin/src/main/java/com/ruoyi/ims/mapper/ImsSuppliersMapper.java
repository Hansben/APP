package com.ruoyi.ims.mapper;

import java.util.List;

import com.ruoyi.ims.domain.ImsSuppliers;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 供应商信息Mapper接口
 *
 * @author suyl
 * @date 2025-04-07
 */
@Repository
@Mapper
public interface ImsSuppliersMapper {
    /**
     * 查询供应商信息
     *
     * @param supplierId 供应商信息主键
     * @return 供应商信息
     */
    public ImsSuppliers selectImsSuppliersBySupplierId(Long supplierId);

    /**
     * 查询供应商信息列表
     *
     * @param imsSuppliers 供应商信息
     * @return 供应商信息集合
     */
    public List<ImsSuppliers> selectImsSuppliersList(ImsSuppliers imsSuppliers);

    /**
     * 新增供应商信息
     *
     * @param imsSuppliers 供应商信息
     * @return 结果
     */
    public int insertImsSuppliers(ImsSuppliers imsSuppliers);

    /**
     * 修改供应商信息
     *
     * @param imsSuppliers 供应商信息
     * @return 结果
     */
    public int updateImsSuppliers(ImsSuppliers imsSuppliers);

    /**
     * 删除供应商信息
     *
     * @param supplierId 供应商信息主键
     * @return 结果
     */
    public int deleteImsSuppliersBySupplierId(Long supplierId);

    /**
     * 批量删除供应商信息
     *
     * @param supplierIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImsSuppliersBySupplierIds(Long[] supplierIds);
}

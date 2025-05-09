package com.ruoyi.ims.service;

import java.util.List;
import com.ruoyi.ims.domain.ImsSales;

/**
 * 销售信息Service接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
public interface IImsSalesService 
{
    /**
     * 查询销售信息
     * 
     * @param saleId 销售信息主键
     * @return 销售信息
     */
    public ImsSales selectImsSalesBySaleId(Long saleId);

    /**
     * 查询销售信息列表
     * 
     * @param imsSales 销售信息
     * @return 销售信息集合
     */
    public List<ImsSales> selectImsSalesList(ImsSales imsSales);

    /**
     * 新增销售信息
     * 
     * @param imsSales 销售信息
     * @return 结果
     */
    public int insertImsSales(ImsSales imsSales);

    /**
     * 修改销售信息
     * 
     * @param imsSales 销售信息
     * @return 结果
     */
    public int updateImsSales(ImsSales imsSales);

    /**
     * 批量删除销售信息
     * 
     * @param saleIds 需要删除的销售信息主键集合
     * @return 结果
     */
    public int deleteImsSalesBySaleIds(Long[] saleIds);

    /**
     * 删除销售信息信息
     * 
     * @param saleId 销售信息主键
     * @return 结果
     */
    public int deleteImsSalesBySaleId(Long saleId);

}

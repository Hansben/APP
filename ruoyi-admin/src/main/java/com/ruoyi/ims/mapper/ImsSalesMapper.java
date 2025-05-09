package com.ruoyi.ims.mapper;

import java.util.List;
import com.ruoyi.ims.domain.ImsSales;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 销售信息Mapper接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Repository
@Mapper
public interface ImsSalesMapper 
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
    public Long insertImsSales(ImsSales imsSales);

    /**
     * 修改销售信息
     * 
     * @param imsSales 销售信息
     * @return 结果
     */
    public int updateImsSales(ImsSales imsSales);

    /**
     * 删除销售信息
     * 
     * @param saleId 销售信息主键
     * @return 结果
     */
    public int deleteImsSalesBySaleId(Long saleId);

    /**
     * 批量删除销售信息
     * 
     * @param saleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImsSalesBySaleIds(Long[] saleIds);
}

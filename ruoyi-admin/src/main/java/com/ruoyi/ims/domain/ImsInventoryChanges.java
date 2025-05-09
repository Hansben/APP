package com.ruoyi.ims.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库存变动记录对象 ims_inventory_changes
 * 
 * @author suyl
 * @date 2025-04-07
 */
public class ImsInventoryChanges extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 库存变动记录的唯一标识符 */
    private Long changeId;

    /** 商品，关联ims_products表的product_id */
    @Excel(name = "商品，关联ims_products表的product_id")
    private Long productId;

    /** 变动日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "变动日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date changeDate;

    /** 变动类型（采购入库、销售出库等） */
    @Excel(name = "变动类型", readConverterExp = "采=购入库、销售出库等")
    private String changeType;

    /** 变动数量 */
    @Excel(name = "变动数量")
    private Long quantityChange;

    /** 关联的采购或销售记录的ID */
    @Excel(name = "关联的采购或销售记录的ID")
    private Long referenceId;

    public void setChangeId(Long changeId) 
    {
        this.changeId = changeId;
    }

    public Long getChangeId() 
    {
        return changeId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setChangeDate(Date changeDate) 
    {
        this.changeDate = changeDate;
    }

    public Date getChangeDate() 
    {
        return changeDate;
    }
    public void setChangeType(String changeType) 
    {
        this.changeType = changeType;
    }

    public String getChangeType() 
    {
        return changeType;
    }
    public void setQuantityChange(Long quantityChange) 
    {
        this.quantityChange = quantityChange;
    }

    public Long getQuantityChange() 
    {
        return quantityChange;
    }
    public void setReferenceId(Long referenceId) 
    {
        this.referenceId = referenceId;
    }

    public Long getReferenceId() 
    {
        return referenceId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("changeId", getChangeId())
            .append("productId", getProductId())
            .append("changeDate", getChangeDate())
            .append("changeType", getChangeType())
            .append("quantityChange", getQuantityChange())
            .append("referenceId", getReferenceId())
            .toString();
    }
}

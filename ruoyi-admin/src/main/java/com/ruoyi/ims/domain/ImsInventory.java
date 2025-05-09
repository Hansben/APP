package com.ruoyi.ims.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 库存信息对象 ims_inventory
 * 
 * @author suyl
 * @date 2025-04-07
 */
public class ImsInventory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 库存记录的唯一标识符 */
    private Long inventoryId;

    /** 商品，关联ims_products表的product_id */
    @Excel(name = "商品，关联ims_products表的product_id")
    private Long productId;

    /** 当前库存数量 */
    @Excel(name = "当前库存数量")
    private Long quantity;

    /** 最后更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastUpdated;

    public void setInventoryId(Long inventoryId) 
    {
        this.inventoryId = inventoryId;
    }

    public Long getInventoryId() 
    {
        return inventoryId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setLastUpdated(Date lastUpdated) 
    {
        this.lastUpdated = lastUpdated;
    }

    public Date getLastUpdated() 
    {
        return lastUpdated;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("inventoryId", getInventoryId())
            .append("productId", getProductId())
            .append("quantity", getQuantity())
            .append("lastUpdated", getLastUpdated())
            .toString();
    }
}

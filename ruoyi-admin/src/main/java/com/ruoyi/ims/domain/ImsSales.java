package com.ruoyi.ims.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 销售信息对象 ims_sales
 * 
 * @author suyl
 * @date 2025-04-07
 */
public class ImsSales extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 销售记录的唯一标识符 */
    private Long saleId;

    /** 销售的商品，关联ims_products表的product_id */
    @Excel(name = "销售的商品，关联ims_products表的product_id")
    private Long productId;

    /** 客户，关联ims_customers表的customer_id */
    @Excel(name = "客户，关联ims_customers表的customer_id")
    private Long customerId;

    /** 销售日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "销售日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date saleDate;

    /** 销售数量 */
    @Excel(name = "销售数量")
    private Long quantity;

    /** 销售总金额 */
    @Excel(name = "销售总金额")
    private BigDecimal totalAmount;

    public void setSaleId(Long saleId) 
    {
        this.saleId = saleId;
    }

    public Long getSaleId() 
    {
        return saleId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setSaleDate(Date saleDate) 
    {
        this.saleDate = saleDate;
    }

    public Date getSaleDate() 
    {
        return saleDate;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setTotalAmount(BigDecimal totalAmount) 
    {
        this.totalAmount = totalAmount;
    }

    public BigDecimal getTotalAmount() 
    {
        return totalAmount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("saleId", getSaleId())
            .append("productId", getProductId())
            .append("customerId", getCustomerId())
            .append("saleDate", getSaleDate())
            .append("quantity", getQuantity())
            .append("totalAmount", getTotalAmount())
            .toString();
    }
}

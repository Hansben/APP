package com.ruoyi.ims.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 采购信息对象 ims_purchases
 * 
 * @author suyl
 * @date 2025-04-07
 */
public class ImsPurchases extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 采购记录的唯一标识符 */
    private Long purchaseId;

    /** 采购的商品，关联ims_products表的product_id */
    @Excel(name = "采购的商品，关联ims_products表的product_id")
    private Long productId;

    /** 供应商，关联ims_suppliers表的supplier_id */
    @Excel(name = "供应商，关联ims_suppliers表的supplier_id")
    private Long supplierId;

    /** 采购日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "采购日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchaseDate;

    /** 采购数量 */
    @Excel(name = "采购数量")
    private Long quantity;

    /** 采购总金额 */
    @Excel(name = "采购总金额")
    private BigDecimal totalAmount;

    public void setPurchaseId(Long purchaseId) 
    {
        this.purchaseId = purchaseId;
    }

    public Long getPurchaseId() 
    {
        return purchaseId;
    }
    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }
    public void setSupplierId(Long supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Long getSupplierId() 
    {
        return supplierId;
    }
    public void setPurchaseDate(Date purchaseDate) 
    {
        this.purchaseDate = purchaseDate;
    }

    public Date getPurchaseDate() 
    {
        return purchaseDate;
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
            .append("purchaseId", getPurchaseId())
            .append("productId", getProductId())
            .append("supplierId", getSupplierId())
            .append("purchaseDate", getPurchaseDate())
            .append("quantity", getQuantity())
            .append("totalAmount", getTotalAmount())
            .toString();
    }
}

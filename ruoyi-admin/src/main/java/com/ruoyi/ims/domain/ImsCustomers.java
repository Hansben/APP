package com.ruoyi.ims.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 客户信息对象 ims_customers
 * 
 * @author suyl
 * @date 2025-04-07
 */
public class ImsCustomers extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客户的唯一标识符 */
    private Long customerId;

    /** 客户名称 */
    @Excel(name = "客户名称")
    private String customerName;

    /** 联系人姓名 */
    @Excel(name = "联系人姓名")
    private String contactPerson;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactNumber;

    /** 客户地址 */
    @Excel(name = "客户地址")
    private String address;

    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }
    public void setCustomerName(String customerName) 
    {
        this.customerName = customerName;
    }

    public String getCustomerName() 
    {
        return customerName;
    }
    public void setContactPerson(String contactPerson) 
    {
        this.contactPerson = contactPerson;
    }

    public String getContactPerson() 
    {
        return contactPerson;
    }
    public void setContactNumber(String contactNumber) 
    {
        this.contactNumber = contactNumber;
    }

    public String getContactNumber() 
    {
        return contactNumber;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customerId", getCustomerId())
            .append("customerName", getCustomerName())
            .append("contactPerson", getContactPerson())
            .append("contactNumber", getContactNumber())
            .append("address", getAddress())
            .toString();
    }
}

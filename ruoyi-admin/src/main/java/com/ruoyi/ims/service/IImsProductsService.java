package com.ruoyi.ims.service;

import java.util.List;
import java.util.Map;

import com.ruoyi.ims.domain.ImsProducts;

/**
 * 商品信息Service接口
 * 
 * @author suyl
 * @date 2025-04-07
 */
public interface IImsProductsService 
{
    /**
     * 查询商品信息
     * 
     * @param productId 商品信息主键
     * @return 商品信息
     */
    public ImsProducts selectImsProductsByProductId(Long productId);

    /**
     * 查询商品信息列表
     * 
     * @param imsProducts 商品信息
     * @return 商品信息集合
     */
    public List<ImsProducts> selectImsProductsList(ImsProducts imsProducts);

    /**
     * 新增商品信息
     * 
     * @param imsProducts 商品信息
     * @return 结果
     */
    public int insertImsProducts(ImsProducts imsProducts);

    /**
     * 修改商品信息
     * 
     * @param imsProducts 商品信息
     * @return 结果
     */
    public int updateImsProducts(ImsProducts imsProducts);

    /**
     * 批量删除商品信息
     * 
     * @param productIds 需要删除的商品信息主键集合
     * @return 结果
     */
    public int deleteImsProductsByProductIds(Long[] productIds);

    /**
     * 删除商品信息信息
     * 
     * @param productId 商品信息主键
     * @return 结果
     */
    public int deleteImsProductsByProductId(Long productId);

    List productTypes();
}

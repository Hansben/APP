package com.ruoyi.ims.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.system.service.impl.SysDictTypeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ims.mapper.ImsProductsMapper;
import com.ruoyi.ims.domain.ImsProducts;
import com.ruoyi.ims.service.IImsProductsService;

/**
 * 商品信息Service业务层处理
 * 
 * @author suyl
 * @date 2025-04-07
 */
@Service
public class ImsProductsServiceImpl implements IImsProductsService 
{
    @Autowired
    private ImsProductsMapper imsProductsMapper;
    @Autowired
    private SysDictTypeServiceImpl dictTypeMapper;

    /**
     * 查询商品信息
     * 
     * @param productId 商品信息主键
     * @return 商品信息
     */
    @Override
    public ImsProducts selectImsProductsByProductId(Long productId)
    {
        return imsProductsMapper.selectImsProductsByProductId(productId);
    }

    /**
     * 查询商品信息列表
     * 
     * @param imsProducts 商品信息
     * @return 商品信息
     */
    @Override
    public List<ImsProducts> selectImsProductsList(ImsProducts imsProducts)
    {
        return imsProductsMapper.selectImsProductsList(imsProducts);
    }

    /**
     * 新增商品信息
     * 
     * @param imsProducts 商品信息
     * @return 结果
     */
    @Override
    public int insertImsProducts(ImsProducts imsProducts)
    {
        return imsProductsMapper.insertImsProducts(imsProducts);
    }

    /**
     * 修改商品信息
     * 
     * @param imsProducts 商品信息
     * @return 结果
     */
    @Override
    public int updateImsProducts(ImsProducts imsProducts)
    {
        return imsProductsMapper.updateImsProducts(imsProducts);
    }

    /**
     * 批量删除商品信息
     * 
     * @param productIds 需要删除的商品信息主键
     * @return 结果
     */
    @Override
    public int deleteImsProductsByProductIds(Long[] productIds)
    {
        return imsProductsMapper.deleteImsProductsByProductIds(productIds);
    }

    /**
     * 删除商品信息信息
     * 
     * @param productId 商品信息主键
     * @return 结果
     */
    @Override
    public int deleteImsProductsByProductId(Long productId)
    {
        return imsProductsMapper.deleteImsProductsByProductId(productId);
    }

    @Override
    public List productTypes() {
        List list = new ArrayList();
        // 查询数据字典
        List<SysDictData> imsProductType = dictTypeMapper.selectDictDataByType("ims_product_type");
        for (SysDictData sysDictData : imsProductType) {
            Map<String, Object> map = new HashMap<>();
            ImsProducts imsProducts = new ImsProducts();
            imsProducts.setCategory(sysDictData.getDictValue());
            List<ImsProducts> result = imsProductsMapper.selectImsProductsList(imsProducts);
            map.put("value", sysDictData.getDictValue());
            map.put("label", sysDictData.getDictLabel());
            List children = new ArrayList();
            for (ImsProducts products : result) {
                if (sysDictData.getDictValue().equals(products.getCategory())) {
                    Map<String, Object> childrenItem = new HashMap<>();
                    childrenItem.put("value", products.getProductId());
                    childrenItem.put("label", products.getProductName());
                    children.add(childrenItem);
                }

            }
            map.put("children", children);
            list.add(map);
        }
        return list;
    }
}

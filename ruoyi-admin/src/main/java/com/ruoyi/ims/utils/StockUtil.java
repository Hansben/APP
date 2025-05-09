package com.ruoyi.ims.utils;

import com.ruoyi.ims.domain.ImsInventory;
import com.ruoyi.ims.domain.ImsInventoryChanges;
import com.ruoyi.ims.mapper.ImsInventoryChangesMapper;
import com.ruoyi.ims.mapper.ImsInventoryMapper;

import java.util.Date;

public class StockUtil {
    public static int inOrOutMethod(String changeType,Long id, Long productId, Long quantity, ImsInventoryMapper imsInventoryMapper, ImsInventoryChangesMapper imsInventoryChangesMapper) {
        ImsInventory imsInventory = new ImsInventory();
        imsInventory.setProductId(productId);
        imsInventory.setLastUpdated(new Date());
        imsInventory.setQuantity(quantity);
        if (changeType.equals("cgrk")) {
            imsInventoryMapper.stockIn(imsInventory);

        }else {
            imsInventoryMapper.stockOut(imsInventory);

        }
        ImsInventoryChanges imsInventoryChanges = new ImsInventoryChanges();
        imsInventoryChanges.setProductId(productId);
        imsInventoryChanges.setChangeDate(new Date());
        imsInventoryChanges.setChangeType(changeType);
        imsInventoryChanges.setQuantityChange(quantity);
        imsInventoryChanges.setReferenceId(id);
        imsInventoryChangesMapper.insertImsInventoryChanges(imsInventoryChanges);
        return 1;
    }
}

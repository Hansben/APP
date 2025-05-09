import request from '@/utils/request'

// 查询库存信息列表
export function listInventory(query) {
    return request({
        url: '/ims/inventory/list',
        method: 'get',
        params: query
    })
}

export function allView() {
    return request({
        url: '/ims/inventory/allView',
        method: 'get',
    })
}

// 查询库存信息详细
export function getInventory(inventoryId) {
    return request({
        url: '/ims/inventory/' + inventoryId,
        method: 'get'
    })
}

// 新增库存信息
export function addInventory(data) {
    return request({
        url: '/ims/inventory',
        method: 'post',
        data: data
    })
}

// 修改库存信息
export function updateInventory(data) {
    return request({
        url: '/ims/inventory',
        method: 'put',
        data: data
    })
}

// 删除库存信息
export function delInventory(inventoryId) {
    return request({
        url: '/ims/inventory/' + inventoryId,
        method: 'delete'
    })
}

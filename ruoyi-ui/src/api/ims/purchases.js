import request from '@/utils/request'

// 查询采购信息列表
export function listPurchases(query) {
  return request({
    url: '/ims/purchases/list',
    method: 'get',
    params: query
  })
}

// 查询采购信息详细
export function getPurchases(purchaseId) {
  return request({
    url: '/ims/purchases/' + purchaseId,
    method: 'get'
  })
}

// 新增采购信息
export function addPurchases(data) {
  return request({
    url: '/ims/purchases',
    method: 'post',
    data: data
  })
}

// 修改采购信息
export function updatePurchases(data) {
  return request({
    url: '/ims/purchases',
    method: 'put',
    data: data
  })
}

// 删除采购信息
export function delPurchases(purchaseId) {
  return request({
    url: '/ims/purchases/' + purchaseId,
    method: 'delete'
  })
}

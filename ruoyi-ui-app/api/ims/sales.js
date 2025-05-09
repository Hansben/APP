import request from '@/utils/request'

// 查询销售信息列表
export function listSales(query) {
  return request({
    url: '/ims/sales/list',
    method: 'get',
    params: query
  })
}

// 查询销售信息详细
export function getSales(saleId) {
  return request({
    url: '/ims/sales/' + saleId,
    method: 'get'
  })
}

// 新增销售信息
export function addSales(data) {
  return request({
    url: '/ims/sales',
    method: 'post',
    data: data
  })
}

// 修改销售信息
export function updateSales(data) {
  return request({
    url: '/ims/sales',
    method: 'put',
    data: data
  })
}

// 删除销售信息
export function delSales(saleId) {
  return request({
    url: '/ims/sales/' + saleId,
    method: 'delete'
  })
}

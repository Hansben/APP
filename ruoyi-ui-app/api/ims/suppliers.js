import request from '@/utils/request'

// 查询供应商信息列表
export function listSuppliers(query) {
  return request({
    url: '/ims/suppliers/list',
    method: 'get',
    params: query
  })
}

// 查询供应商信息列表
export function supplierList() {
  return request({
    url: '/ims/suppliers/supplierList',
    method: 'get',
  })
}

// 查询供应商信息详细
export function getSuppliers(supplierId) {
  return request({
    url: '/ims/suppliers/' + supplierId,
    method: 'get'
  })
}

// 新增供应商信息
export function addSuppliers(data) {
  return request({
    url: '/ims/suppliers',
    method: 'post',
    data: data
  })
}

// 修改供应商信息
export function updateSuppliers(data) {
  return request({
    url: '/ims/suppliers',
    method: 'put',
    data: data
  })
}

// 删除供应商信息
export function delSuppliers(supplierId) {
  return request({
    url: '/ims/suppliers/' + supplierId,
    method: 'delete'
  })
}

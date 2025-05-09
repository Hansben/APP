import request from '@/utils/request'

// 查询客户信息列表
export function listCustomers(query) {
  return request({
    url: '/ims/customers/list',
    method: 'get',
    params: query
  })
}
export function customerList() {
  return request({
    url: '/ims/customers/customerList',
    method: 'get',
  })
}

// 查询客户信息详细
export function getCustomers(customerId) {
  return request({
    url: '/ims/customers/' + customerId,
    method: 'get'
  })
}

// 新增客户信息
export function addCustomers(data) {
  return request({
    url: '/ims/customers',
    method: 'post',
    data: data
  })
}

// 修改客户信息
export function updateCustomers(data) {
  return request({
    url: '/ims/customers',
    method: 'put',
    data: data
  })
}

// 删除客户信息
export function delCustomers(customerId) {
  return request({
    url: '/ims/customers/' + customerId,
    method: 'delete'
  })
}

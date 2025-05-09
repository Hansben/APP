import request from '@/utils/request'

// 查询商品信息列表
export function listProducts(query) {
  return request({
    url: '/ims/products/list',
    method: 'get',
    params: query
  })
}

// 查询商品类别信息列表
export function productTypes() {
  return request({
    url: '/ims/products/productTypes',
    method: 'get',
  })
}

// 查询商品信息详细
export function getProducts(productId) {
  return request({
    url: '/ims/products/' + productId,
    method: 'get'
  })
}

// 新增商品信息
export function addProducts(data) {
  return request({
    url: '/ims/products',
    method: 'post',
    data: data
  })
}

// 修改商品信息
export function updateProducts(data) {
  return request({
    url: '/ims/products',
    method: 'put',
    data: data
  })
}

// 删除商品信息
export function delProducts(productId) {
  debugger
  return request({
    url: '/ims/products/' + productId,
    method: 'delete'
  })
}

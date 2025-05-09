import request from '@/utils/request'

// 查询库存变动记录列表
export function listChanges(query) {
  return request({
    url: '/ims/changes/list',
    method: 'get',
    params: query
  })
}

// 查询库存变动记录详细
export function getChanges(changeId) {
  return request({
    url: '/ims/changes/' + changeId,
    method: 'get'
  })
}

// 新增库存变动记录
export function addChanges(data) {
  return request({
    url: '/ims/changes',
    method: 'post',
    data: data
  })
}

// 修改库存变动记录
export function updateChanges(data) {
  return request({
    url: '/ims/changes',
    method: 'put',
    data: data
  })
}

// 删除库存变动记录
export function delChanges(changeId) {
  return request({
    url: '/ims/changes/' + changeId,
    method: 'delete'
  })
}

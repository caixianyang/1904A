package com.fh.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.mapper.RoleAndResourceMapper;
import com.fh.mapper.RoleMapper;
import com.fh.model.Role;
import com.fh.model.RoleAndResource;
import com.fh.service.RoleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;//
    @Autowired
    private RoleAndResourceMapper roleAndResourceMapper;//

    @Override
    public ServerResponse queryMapRoleList(ProductSearchParm productSearchParm) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>();

        Integer totalCount = roleMapper.selectCount(queryWrapper);
       int current =  productSearchParm.getStart() / productSearchParm.getLength()+1;
        IPage<Role> iPage = roleMapper.selectPage(new Page<>(current, productSearchParm.getLength()), queryWrapper);

        List list = iPage.getRecords();

        Map map = new HashMap();
        map.put("draw",productSearchParm.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",list);
        return ServerResponse.success(map);
    }

    @Override
    public ServerResponse queryRoleList() {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<Role>();
        List<Role> roleList = roleMapper.selectList(queryWrapper);
        return ServerResponse.success(roleList);
    }

    @Override
    public void updateRole(Role role, List<Integer> resourceIdsList) {
        //修改角色
        roleMapper.updateById(role);
        //删除角色相关资源
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("roleId",role.getId());
        roleAndResourceMapper.delete(queryWrapper);
        //重新添加权限
        resourceIdsList.forEach(x->{
            RoleAndResource roleAndResource = new RoleAndResource();
            roleAndResource.setRoleId(role.getId());
            roleAndResource.setResourceId(x);
            roleAndResourceMapper.insert(roleAndResource);
        });
    }

    @Override
    public void deleteRole(Integer id) {
        roleMapper.deleteById(id);
        QueryWrapper queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("roleId",id);
        roleAndResourceMapper.delete(queryWrapper);
    }

    @Override
    public void addRole(String name, String remark, String resourceIds) {
        //保存角色
        Role role = new Role();
        role.setRoleName(name);
        role.setRemark(remark);
        role.setInsertDate(new Date());
        roleMapper.insert(role);
        //角色权限关联表
        if(StringUtils.isNotBlank(resourceIds)){
            String[] ridArr = resourceIds.substring(1).split(",");
            for (int i=0; i < ridArr.length; i++){
                String rid = ridArr[i];
                RoleAndResource roleAndResource = new RoleAndResource();
                roleAndResource.setRoleId(role.getId());
                roleAndResource.setResourceId(Integer.valueOf(rid));
                roleAndResourceMapper.insert(roleAndResource);
            }
        }

    }
}

package com.fh.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.common.ServerResponse;
import com.fh.mapper.ResourceMapper;
import com.fh.mapper.RoleAndResourceMapper;
import com.fh.model.Resource;
import com.fh.model.RoleAndResource;
import com.fh.model.User;
import com.fh.service.ResourceService;
import com.fh.util.RedisUtil;
import com.fh.util.SessionUtil;
import com.fh.util.SystemConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    private ResourceMapper resourceMapper;//
    @Autowired
    private RoleAndResourceMapper roleAndResourceMapper;//

    @Override
    public List<Resource> queryResourceList() {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<Resource>();
        List<Resource> roleList = resourceMapper.selectList(queryWrapper);
        return roleList;
    }

    @Override
    public List<Resource> queryRole(Integer pid) {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<Resource>();
        queryWrapper.eq("pid",pid);
        List<Resource> role = resourceMapper.selectList(queryWrapper);
        return role;
    }

    @Override
    public void addResource(Resource resource) {
        resourceMapper.insert(resource);
    }

    @Override
    public void updateResource(Resource resource) {
        resourceMapper.updateById(resource);
    }

    @Override
    public void deleteResource(Integer id) {
        resourceMapper.deleteById(id);
    }

    @Override
    public ServerResponse queryResourceListByRoleId(Integer roleId) {
        //查询全部资源
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        List<Resource> allResourceList = resourceMapper.selectList(queryWrapper);
        //查询该角色拥有的资源
        QueryWrapper<RoleAndResource> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("roleId",roleId);
        List<RoleAndResource> roleAndResourceList = roleAndResourceMapper.selectList(queryWrapper2);
        //把用户所拥有的资源id放在一个集合
        List<Integer> list = new ArrayList<>();
        roleAndResourceList.forEach(rr -> {
            list.add(rr.getResourceId());
        });
        //两种资源进行比较   如果相等 默认选中
        List<Resource> resourceList = allResourceList.stream().filter(x -> {
            if (list.contains(x.getId())) {
                x.setChecked(true);
            }
            return true;
        }).collect(Collectors.toList());

        return ServerResponse.success(resourceList);
    }

    @Override
    public ServerResponse getCurrentResourceAndUser(HttpServletRequest request, HttpServletResponse response) {
       // User user = (User) request.getSession().getAttribute(SystemConstant.LOGIN_CURRENT_USERNAME);
        String sessionId = SessionUtil.getSessionId(request, response);
        String userString = RedisUtil.get(SystemConstant.LOGIN_CURRENT_USER + sessionId);
        User user = JSON.parseObject(userString, User.class);
        List<Resource> resourceList =   resourceMapper.getCurrentResourceAndUser(user.getId());
        return ServerResponse.success(resourceList);
    }


}

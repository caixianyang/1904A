package com.fh.controller;


import com.fh.common.ServerResponse;
import com.fh.model.Resource;
import com.fh.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("resource/")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;//

    @RequestMapping("toList")
    public String toList(){
        return "resource/list";
    }

    @RequestMapping("queryRole")
    @ResponseBody
    public List queryRole(Integer pid){
        List<Resource> roleList =  resourceService.queryRole(pid);

        return roleList;
    }

    @RequestMapping("queryResourceList")
    @ResponseBody
    public ServerResponse queryResourceList(){
        List<Resource> list = resourceService.queryResourceList();
        return ServerResponse.success(list);
    }

    @RequestMapping("queryResourceListByRoleId")
    @ResponseBody
    public ServerResponse queryResourceListByRoleId(Integer roleId){
        return resourceService.queryResourceListByRoleId(roleId);
    }

    @RequestMapping("addResource")
    @ResponseBody
    public ServerResponse addResource(Resource resource){
        resourceService.addResource(resource);
        return ServerResponse.success(resource.getId());
    }

    @RequestMapping("updateResource")
    @ResponseBody
    public ServerResponse updateResource(Resource resource){
        resourceService.updateResource(resource);
        return ServerResponse.success(resource.getId());
    }

    @RequestMapping("deleteResource")
    @ResponseBody
    public ServerResponse deleteResource(Integer id){
        resourceService.deleteResource(id);
        return ServerResponse.success();
    }

    /**
     * 获取当前用户拥有的权限
     * */
    @RequestMapping("getCurrentResourceAndUser")
    @ResponseBody
    public ServerResponse getCurrentResourceAndUser(HttpServletRequest request, HttpServletResponse response){
        return resourceService.getCurrentResourceAndUser(request,response);
    }

}

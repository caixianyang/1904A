package com.fh.controller;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.model.Role;
import com.fh.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role/")
public class RoleController {
    @Autowired
    private RoleService roleService;//

    @RequestMapping("toList")
    public String toList(){
        return "role/list";
    }

    @RequestMapping("queryMapRoleList")
    @ResponseBody
    public ServerResponse queryMapRoleList(ProductSearchParm productSearchParm){
        return  roleService.queryMapRoleList(productSearchParm);
    }

    @RequestMapping("queryRoleList")
    @ResponseBody
    public ServerResponse queryRoleList(){
        return roleService.queryRoleList();
    }



    @RequestMapping("addRole")
    @ResponseBody
    public ServerResponse addRole(String name,String remark,String resourceIds){
        roleService.addRole(name,remark,resourceIds);
        return ServerResponse.success();
    }

    @RequestMapping("updateRole")
    @ResponseBody
    public ServerResponse updateRole(Role role, @RequestParam("resourceIds[]") List<Integer> resourceIdsList){
        roleService.updateRole(role,resourceIdsList);
        return ServerResponse.success();
    }

    public ServerResponse deleteRole(Integer id){
        roleService.deleteRole(id);
        return ServerResponse.success();
    }

}

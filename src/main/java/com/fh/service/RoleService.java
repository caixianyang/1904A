package com.fh.service;


import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.model.Role;

import java.util.List;


public interface RoleService {

    void addRole(String name, String remark, String resourceIds);

    ServerResponse queryMapRoleList(ProductSearchParm productSearchParm);

    ServerResponse queryRoleList();


    void updateRole(Role role, List<Integer> resourceIdsList);

    void deleteRole(Integer id);
}

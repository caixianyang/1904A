package com.fh.service;


import com.fh.common.ServerResponse;
import com.fh.model.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface ResourceService {

    List<Resource> queryResourceList();

    List<Resource> queryRole(Integer pid);

    void addResource(Resource resource);

    void updateResource(Resource resource);

    void deleteResource(Integer id);

    ServerResponse queryResourceListByRoleId(Integer roleId);

    ServerResponse getCurrentResourceAndUser(HttpServletRequest request, HttpServletResponse response);
}

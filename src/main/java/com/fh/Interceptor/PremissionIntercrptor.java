package com.fh.Interceptor;


import com.alibaba.fastjson.JSONArray;
import com.fh.mapper.ResourceMapper;
import com.fh.model.Resource;
import com.fh.util.RedisUtil;
import com.fh.util.SessionUtil;
import com.fh.util.SystemConstant;
import org.apache.commons.lang.StringUtils;
import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.List;

public class PremissionIntercrptor extends HandlerInterceptorAdapter {

    @Autowired
    private ResourceMapper resourceMapper;//

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("--权限拦截--");

        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method method = handlerMethod.getMethod();

        if (method.isAnnotationPresent(Ignore.class)) {
            return true;
        }

        //获取当前登录的路径
        String requestURI = request.getRequestURI();
        //获取sessionId
        String sessionId = SessionUtil.getSessionId(request, response);
        //获取当前登录用户拥有的资源   List<Resource> resourceList = (List<Resource>) request.getSession().getAttribute(SystemConstant.CURRENT_RESOURCE);
        String resource1 = RedisUtil.get(SystemConstant.USER_RESOURCE + sessionId);
        List<Resource> resourceList = JSONArray.parseArray(resource1, Resource.class);
        //如果不加判断 公共的方法将会被拦截
        //获取所有的资源 List<Resource> allResourceList = (List<Resource>) request.getSession().getAttribute(SystemConstant.ALL_RESOURCE);
        String allResource = RedisUtil.get(SystemConstant.ALL_RESOURCE);
        List<Resource> allResourceList = JSONArray.parseArray(allResource, Resource.class);
        Boolean isFilter = false;//
        if (allResourceList != null && allResourceList.size() > 0) {

            for (Resource resource : allResourceList) {
                if (StringUtils.isNotBlank(resource.getUrl()) && requestURI.contains(resource.getUrl())) {
                    isFilter = true;//该请求存在与所有权限中 需要进行下一步的权限判断
                    break;
                }
            }
        }
        if (!isFilter) {
            return true;//该请求不存在与权限资源中 不需要拦截 直接放行
        }

        //判断当前请求是否在资源里面
        Boolean hasPremission = false;//
        if (resourceList != null && resourceList.size() > 0) {
            for (Resource resource : resourceList) {
                if (StringUtils.isNotBlank(resource.getUrl()) && resource.getUrl().contains(requestURI)) {
                    hasPremission = true;//
                    break;
                }
            }
        }
        if (!hasPremission) {
            response.sendRedirect(SystemConstant.NOT_PREMISSION);
        }

        return hasPremission;
    }

}

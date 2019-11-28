package com.fh.Interceptor;

import com.fh.mapper.UserMapper;
import com.fh.util.RedisUtil;
import com.fh.util.SessionUtil;
import com.fh.util.SystemConstant;
import org.apache.commons.lang.StringUtils;
import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;


public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("----开始拦截---");
       // User user = (User) request.getSession().getAttribute(SystemConstant.LOGIN_CURRENT_USERNAME);
        HandlerMethod handlerMethod = (HandlerMethod) handler;
       Method method =  handlerMethod.getMethod();

       if(method.isAnnotationPresent(Ignore.class)){
           return true;
       }

        //获取sessionId
        String sessionId = SessionUtil.getSessionId(request, response);
        String userString = RedisUtil.get(SystemConstant.LOGIN_CURRENT_USER + sessionId);
        if(StringUtils.isNotBlank(userString)){
            return true;
        }else{
            String requestHeader= request.getHeader("X-Requested-With");
            if(StringUtils.isNotBlank(requestHeader)&& requestHeader.equals("XMLHttpRequest")){
                response.setHeader("ajaxTime",SystemConstant.AJAX_SESSION_OUT);
                return  false;
            }

            //用户没有登陆  跳转到登陆页面
            response.sendRedirect(SystemConstant.LOGIN_PAGE);
            return false;


        }

    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

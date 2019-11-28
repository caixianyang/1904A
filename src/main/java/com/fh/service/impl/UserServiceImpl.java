package com.fh.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.ServerResponse;
import com.fh.mapper.ResourceMapper;
import com.fh.mapper.RoleAndUserMapper;
import com.fh.mapper.UserMapper;
import com.fh.model.Prop;
import com.fh.model.Resource;
import com.fh.model.RoleAndUser;
import com.fh.model.User;
import com.fh.service.UserService;
import com.fh.util.*;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleAndUserMapper roleAndUserMapper;//
    @Autowired
    private ResourceMapper resourceMapper;//


    @Override
    public Long queryCount(ProductSearchParm productSearchParm) {
        return userMapper.queryCount(productSearchParm);
    }

    @Override
    public List queryMapUserList(ProductSearchParm productSearchParm) {
        return userMapper.queryMapUserList(productSearchParm);
    }

    @Override
    public List<Prop> queryTypeList() {
        return userMapper.queryTypeList();
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    @Override
    public void deleteBatch(List list) {
        userMapper.deleteBatch(list);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.getUserById(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public boolean getUserByName(String name) {

        User user =  userMapper.getUserByName(name);
        if(user ==null){
            //用户不存在   可以注册
            return true;
        }else
            //用户已存在   不可以注册
            return false;

    }

    @Override
    public ServerResponse insertUser(User user, List<Integer> roleArr) {
        String salt = RandomStringUtils.randomAlphabetic( 20);
        String encodePwd =  MD5Util.MD5(MD5Util.MD5(user.getPwd()+salt));
        user.setPwd(encodePwd);
        user.setSalt(salt);
        user.setCteateDate(new Date());
        userMapper.insert(user);
        //增加用户绑定角色
        if(roleArr != null && roleArr.size() > 0){
            roleArr.forEach(x->{
                RoleAndUser roleAndUser = new RoleAndUser();
                roleAndUser.setUserId(user.getId());
                roleAndUser.setRoleId(x);
                roleAndUserMapper.insert(roleAndUser);
            });
        }
        return ServerResponse.success();
    }

    @Override
    public void loginOut(HttpServletRequest request, HttpServletResponse response) {
        //清除session中的所有数据
        String sessionId = SessionUtil.getSessionId(request, response);
        RedisUtil.expire(SystemConstant.LOGIN_CURRENT_USER+sessionId,0);
        //清除cookie
        cleanCookie(response);
    }

    @Override
    public ServerResponse login(User user, HttpServletRequest request, HttpServletResponse response) {
       int flag=0;
        User us = userMapper.getUserByName(user.getName());
        if(us == null ){
            flag = SystemConstant.LONGIN_USERNAME_ERROR;//用户不存在
        }else{//用户已存在
            String encodePwd =  MD5Util.MD5(MD5Util.MD5(user.getPwd()+us.getSalt()));
            if(!us.getPwd().equals(encodePwd)){
                flag = SystemConstant.LONGIN_PASSWORD_ERROR;//密码不正确
            }else{
                //登陆成功
                flag=SystemConstant.LONGIN_SUCCESS;//LOGIN_CURRENT_USERNAME
                //把数据放在缓存中
                writeCache(request, us,response);

                //记住我 一周
                if(user.getRememberMe()==1){
                    writeCookie(user, response);

                }
            }
        }

        return ServerResponse.success(flag);
    }

    //刷新
    @Override
    public void refresh(HttpServletRequest request,HttpServletResponse response) {
        String sessionId = SessionUtil.getSessionId(request, response);
        String userString = RedisUtil.get(SystemConstant.LOGIN_CURRENT_USER + sessionId);
        User user = JSON.parseObject(userString, User.class);
        //User user = (User) request.getSession().getAttribute(SystemConstant.LOGIN_CURRENT_USERNAME);
        writeCache(request,user,response);
    }

    //发送验证码
    @Override
    public ServerResponse codeForget(String phone,HttpServletRequest request) {
        Integer flag = null;//
        if(StringUtils.isNotBlank(phone)){
            //发送验证码
            String code = SendMsgUtil.sendCode(phone);
            if(StringUtils.isNotBlank(code)){
                //把验证码放到session 里
                RedisUtil.set(SystemConstant.CODE,code);
                //request.getSession().setAttribute(SystemConstant.CODE,code);
                //发送验证码成功
                flag = 1;
            }else{
                flag = 2;//发送验证码失败
            }
        }else{
            flag = 3;//手机号为空
        }

        return ServerResponse.success(flag);
    }

    @Override
    public ServerResponse allBackPassWord(User user, String code, HttpServletRequest request) {
        //先判断验证码是否正确
        //String sessionCode = (String) request.getSession().getAttribute(SystemConstant.CODE);
        String sessionCode = RedisUtil.get(SystemConstant.CODE);
        if(StringUtils.isNotBlank(code) && code.equals(sessionCode)){
            //根据手机号判断用户信息
            QueryWrapper<User> queryWrapper = new QueryWrapper();
            queryWrapper.eq("phone",user.getPhone());
            //加盐
            String salt = RandomStringUtils.randomAlphabetic( 20);
            //密码加密
            String encodePwd =  MD5Util.MD5(MD5Util.MD5(user.getPwd()+salt));
            user.setPwd(encodePwd);
            user.setSalt(salt);
            userMapper.update(user,queryWrapper);
            return ServerResponse.success();

        }else{
            return ServerResponse.codeError();
        }



    }

    //将用户相关的数据存放到session里
    private void writeCache(HttpServletRequest request, User us,HttpServletResponse response) {
        //将用户信息存放到session里  request.getSession().setAttribute(SystemConstant.LOGIN_CURRENT_USERNAME, us);
        String jsonString = JSON.toJSONString(us);
        String sessionId = SessionUtil.getSessionId(request, response);//首先获取session  拿着sessionid作为key
        RedisUtil.set(SystemConstant.LOGIN_CURRENT_USER+sessionId,jsonString);

        //获取当前登录用户拥有的资源
        List<Resource> resourceList = resourceMapper.getCurrentResourceAndUser(us.getId());
        String resource = JSON.toJSONString(resourceList);
        //将当前登录用户拥有的资源存放到session里 request.getSession().setAttribute(SystemConstant.CURRENT_RESOURCE, resourceList);
        RedisUtil.set (SystemConstant.USER_RESOURCE+sessionId,resource);
        //获取所有的资源
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        List<Resource> allResourceList = resourceMapper.selectList(queryWrapper);
        String allResource = JSON.toJSONString(allResourceList);
        //将所有的资源存放到session里  request.getSession().setAttribute(SystemConstant.ALL_RESOURCE, allResourceList);
        RedisUtil.set (SystemConstant.ALL_RESOURCE,allResource);
    }

    private void writeCookie(User user, HttpServletResponse response) {
        //把用户信息存储到cookie中
        try {
            String encodeUserName = URLEncoder.encode(user.getName(),"UTF-8");
            Cookie cookie = new Cookie(SystemConstant.COOKIE_KEY,encodeUserName);
            //设置cookie过期时间 单位是秒
            cookie.setMaxAge(SystemConstant.COOKIE_OUT_TIME);
            //cookie.setMaxAge(1*60);
            //这种cookie作用域
            cookie.setPath("/");
            response.addCookie(cookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    //清除cookie 设置过期时间为0
    private void cleanCookie(HttpServletResponse response){
        Cookie cookie = new Cookie(SystemConstant.COOKIE_KEY,"");
        //设置cookie 过期时间 单位是秒
        cookie.setMaxAge(0);
        //设置cookie 作用域
        cookie.setPath("/");
        response.addCookie(cookie);
    }

}

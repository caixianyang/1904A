package com.fh.controller;

import com.fh.ProductSearchParm.ProductSearchParm;
import com.fh.common.LogMsg;
import com.fh.common.ServerResponse;
import com.fh.model.Prop;
import com.fh.model.User;
import com.fh.service.UserService;
import com.fh.util.MD5Util;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user/")
public class UserController {
    @Autowired
    private UserService userService;//

    @RequestMapping("toList")
    public String toList(){
        return "user/list";
    }

    @RequestMapping("queryMapUserList")
    @ResponseBody
    public ServerResponse queryMapUserList(ProductSearchParm productSearchParm){
        Long totalCount = userService.queryCount(productSearchParm);
        List list = userService.queryMapUserList(productSearchParm);
        Map map = new HashMap();
        map.put("draw",productSearchParm.getDraw());
        map.put("recordsTotal",totalCount);
        map.put("recordsFiltered",totalCount);
        map.put("data",list);
        return ServerResponse.success(map);
    }

    @RequestMapping("queryTypeList")
    @ResponseBody
    public ServerResponse queryTypeList(User user,Integer start, Integer length){
        List<Prop> typeList  = userService.queryTypeList();
        return ServerResponse.success(typeList);

    }

    @RequestMapping("checkUserByName")
    @ResponseBody
    @Ignore
    public Map checkUserByName( String userName){
        Map map=new HashMap();
        map.put("valid",userService.getUserByName(userName));
        return map;
    }

    @RequestMapping("login")
    @ResponseBody
    @Ignore
    public ServerResponse login(User user, HttpServletRequest request, HttpServletResponse response){
        return  userService.login(user,request,response);
    }

    @RequestMapping("addUser")
    @ResponseBody
    @Ignore
    @LogMsg("注册用户")
    public ServerResponse addUser(User user){

            String salt = RandomStringUtils.randomAlphabetic( 20);
            String encodePwd =  MD5Util.MD5(MD5Util.MD5(user.getPwd()+salt));
            user.setPwd(encodePwd);
            user.setSalt(salt);
            user.setCteateDate(new Date());
            userService.addUser(user);

        return ServerResponse.success();

    }

    @RequestMapping("insertUser")
    @ResponseBody
    @LogMsg("添加用户")
    public ServerResponse insertUser(User user,@RequestParam("roleArr[]") List<Integer> roleArr){

        return userService.insertUser(user,roleArr);
    }

    @RequestMapping("updateUser")
    @ResponseBody
    @LogMsg("修改用户")
    public ServerResponse updateUser(User user){

        User us= userService.getUserById(user.getId());
            String salt = us.getSalt();
            String encodePwd = us.getPwd();
            user.setPwd(encodePwd);
            user.setSalt(salt);
            user.setCteateDate(new Date());
            userService.updateUser(user);

        return ServerResponse.success();

    }

    @RequestMapping("getUserById")
    @ResponseBody
    public  ServerResponse getUserById(Integer id){
        User user = userService.getUserById(id);
        return ServerResponse.success(user);
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    @LogMsg("删除用户")
    public ServerResponse deleteUser(Integer id){
            userService.deleteUser(id);
        return ServerResponse.success();
    }

    @RequestMapping("loginOut")
    public String loginOut( HttpServletRequest request, HttpServletResponse response){
        userService.loginOut(request,response);
        return "redirect:/login.jsp";
    }
    //刷新缓存
    @RequestMapping("refresh")
    public String refresh( HttpServletRequest request,HttpServletResponse response){
        userService.refresh(request,response);
        return "redirect:/login.jsp";
    }

    @RequestMapping("deleteBatch")
    @ResponseBody
    @LogMsg("用户批量删除")
    public ServerResponse deleteBatch(@RequestParam("idsList[]")List list){
            userService.deleteBatch(list);
        return ServerResponse.success();

    }

    //发送验证码
    @RequestMapping("codeForget")
    @ResponseBody
    @Ignore
    public ServerResponse codeForget(String phone,HttpServletRequest request){
        return userService.codeForget(phone,request);

    }

    //修改密码
    @RequestMapping("allBackPassWord")
    @ResponseBody
    @Ignore
    public ServerResponse allBackPassWord(User user,String code,HttpServletRequest request) {
        return  userService.allBackPassWord(user ,code,request);


    }

    }

package com.fh.util;

public class SystemConstant {


    public static final String LOGIN_CURRENT_USERNAME = "user";
    public static final String COOKIE_KEY = "login";
    public static final String LOGIN_PAGE = "/login.jsp";
    public static final  String LOGIN_CURRENT_USER="user:";
    public static final String NOT_PREMISSION = "/noPremission.jsp";
    //public static final String AJAX_SESSION_TIME_OUT = "ajaxTime";
    public static final String PDF_TIMPATE_FILE_PATH = "1904A-ptf.html";
    public static final String EXCEL_TIMPATE_FILE_PATH = "1094A-excel.xml";
    public static final String WORD_TIMPATE_FILE_PATH = "1904A-wod.xml";
    public static final int COOKIE_OUT_TIME = 24*60*60;//cookie默认有效时间一周
    public static final int COOKIE_OUT_TIME_DEFAULT=30*60;//cookie默认有效时间半个小时
    public static final int LONGIN_USERNAME_ERROR = 1;
    public static final int LONGIN_PASSWORD_ERROR = 2;
    public static final int LONGIN_SUCCESS = 3;
    public static final int LOG_ERROR = 0;
    public static final int LOG_SUCCESS = 1;
    public static final  String AJAX_SESSION_OUT="timeOut";


    public static final String UPLOAD_FILE_PATH ="upload" ;
    public static final String CURRENT_RESOURCE = "current_resource";//当前用户所拥有的权限
    public static final String USER_RESOURCE = "user_resource:";//当前用户所拥有的权限
    public static final String ALL_RESOURCE = "all_resource";//所有用户所拥有的权限
    public static final String CODE = "code";//手机验证码
    public static final String CATEGORYLIST = "categoryList";//商品分类
    public static final String CATEGORYLIST_LOCK = "categoryList:lock";//商品分类锁 key
    public static final long REDIS_KEY_OUT_TIME = 5*1000;//redis中锁键超时
}

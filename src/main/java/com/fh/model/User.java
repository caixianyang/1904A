package com.fh.model;

import com.baomidou.mybatisplus.annotation.TableField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {

    private Integer id;//用户ID
    private String name;//用户名
    private String pwd;//用户密码
    private String realUserName;//真实姓名--
    private Integer sex;//性别--
    private Integer age;//年龄--
    private String phone;//手机号--
    private String email;//邮箱--
    private Integer salary;//工资--
    private String userImgUrl;//用户头像
    private String salt;//加盐
    @TableField(exist = false)
    private Integer rememberMe;//记住我//记住密码

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date cteateDate ;//注册时间
    @TableField(exist = false)
    private String area;//
    private Integer area1;//
    private Integer area2;//
    private Integer area3;//
    private Integer area4;//


    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Integer getArea1() {
        return area1;
    }

    public void setArea1(Integer area1) {
        this.area1 = area1;
    }

    public Integer getArea2() {
        return area2;
    }

    public void setArea2(Integer area2) {
        this.area2 = area2;
    }

    public Integer getArea3() {
        return area3;
    }

    public void setArea3(Integer area3) {
        this.area3 = area3;
    }

    public Integer getArea4() {
        return area4;
    }

    public void setArea4(Integer area4) {
        this.area4 = area4;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUserImgUrl() {
        return userImgUrl;
    }

    public void setUserImgUrl(String userImgUrl) {
        this.userImgUrl = userImgUrl;
    }

    public Date getCteateDate() {
        return cteateDate;
    }

    public void setCteateDate(Date cteateDate) {
        this.cteateDate = cteateDate;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Integer getRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(Integer rememberMe) {
        this.rememberMe = rememberMe;
    }

    public String getRealUserName() {
        return realUserName;
    }

    public void setRealUserName(String realUserName) {
        this.realUserName = realUserName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

}

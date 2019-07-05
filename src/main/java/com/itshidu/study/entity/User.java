package com.itshidu.study.entity;


import lombok.Data;

import javax.persistence.*;
import java.util.List;

/**
 * 用户表
 */
@Data
@Entity
@Table(name="study_u")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long id;
    private  String  username;
    private  String  password;
    private  String  salt;	  //密码作料
    private  String  nickname;
    private String avatar;
    private String phone;
    private  int     age ;
    private  String  email;
    private Double balance;//余额
    private String qqOpenid;//qq 登录 的唯一
    private Boolean  rights; //权限 0 没权限 1 有权限


}

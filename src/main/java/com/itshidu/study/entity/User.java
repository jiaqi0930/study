package com.itshidu.study.entity;


import lombok.Data;

import javax.persistence.*;

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


}

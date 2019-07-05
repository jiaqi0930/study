package com.itshidu.study.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.*;

@Data
@Entity
@Table(name = "study_coupon")//优惠券
public class Coupon {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long     id ;
    private  String name ;//优惠名字
    private Boolean appoint ;//针对的课程  0 针对某个课程 1 代表  全部课程
    @OneToMany(fetch = FetchType.EAGER)
    private List<Course> courseALL;//优惠的所有课程
    @OneToOne(fetch = FetchType.EAGER)
    private Course course;//优惠的某个课程
    @ManyToOne(fetch = FetchType.EAGER)
    private  User  user ;//领取的  人
    private long  amount;//数量
    private double  price;//额度
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  gettime ; //领取时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  outtime;//截止时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  validTime;//有效时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date  offtime;//到期时间

}


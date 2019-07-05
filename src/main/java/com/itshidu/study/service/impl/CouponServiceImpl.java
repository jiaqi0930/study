package com.itshidu.study.service.impl;

import com.itshidu.study.entity.Coupon;
import com.itshidu.study.service.CouponService;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService {

    @Override
    public Object save(Coupon coupon) {

        System.out.println("名字："+coupon.getName());
        System.out.println("时间："+coupon.getValidTime());
        System.out.println("课程："+coupon.getCourseALL());
        System.out.println("单个课程："+coupon.getCourse());
        System.out.println("人："+coupon.getUser());
        System.out.println("状态："+coupon.getAppoint());



        return null;
    }
}

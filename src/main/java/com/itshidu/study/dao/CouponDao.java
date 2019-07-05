package com.itshidu.study.dao;

import com.itshidu.study.entity.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CouponDao extends JpaRepository<Coupon ,Long> {

}

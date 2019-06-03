package com.itshidu.study.dao;

import com.itshidu.study.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserDao extends JpaRepository<User, Long> {

	
	 User findByUsername(String userpassword);
	 User findByEmail(String Email);
	
}

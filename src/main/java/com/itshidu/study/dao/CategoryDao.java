package com.itshidu.study.dao;

import com.itshidu.study.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDao extends JpaRepository<Category,Long> {
}

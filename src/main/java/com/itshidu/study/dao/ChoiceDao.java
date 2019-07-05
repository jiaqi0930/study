package com.itshidu.study.dao;

import com.itshidu.study.entity.Choice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ChoiceDao extends JpaRepository<Choice,Long > {

       @Query("from  Choice c where   c.course.id=?1 and c.user.id=?2")
    Choice findByUserAndCourse(long course_id,long user_id);
       @Query("from  Choice c where c.user.id=?1")
       List<Choice> findByUser(long user_id);

       Choice  findByCourse(long course_id );

}

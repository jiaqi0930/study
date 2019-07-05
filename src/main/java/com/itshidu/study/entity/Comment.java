package com.itshidu.study.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * 评论
 */
@Data
@Entity
@Table(name = "study_comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    @JoinColumn(name="course_id")
    private Course course; //课程
    private Date created;    //评论时间
    @ManyToOne
    @JoinColumn(name="author_id")
    private User author;     //评论者
    @Column(columnDefinition="TEXT")
    private String content;  //评论内容
    @ManyToOne
    @JoinColumn(name="target_id")
    private Comment target;  //针对的目标
}

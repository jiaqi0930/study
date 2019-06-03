package com.itshidu.study.entity;


import lombok.Data;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Data
@Entity
@Table(name="study_chap")//章节表
public class Chapter {
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private long id;//章节id
	  private String chapname;//章节名称
	  
	  @ManyToOne(fetch = FetchType.EAGER)
	  private Course course;
	  @OneToMany(mappedBy="chapter")
	  private List<Hour> Hour;

}

package com.itshidu.study.entity;

import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name="study_hour")//课时表
public class Hour {
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private long id;
	 	private String name; //所有课时
	 	private String video;//视频存放路径
	 	@ManyToOne
	 	private Chapter chapter;



}

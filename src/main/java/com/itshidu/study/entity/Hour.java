package com.itshidu.study.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Data
@Entity
@Table(name="study_hour")//课时表
public class Hour {
	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private long id;
	 	private String catalogue; //所有课时
	 	private long courseurl;//视频存放路径
	 	@ManyToOne(fetch = FetchType.EAGER)
	 	private Chapter chapter;

}

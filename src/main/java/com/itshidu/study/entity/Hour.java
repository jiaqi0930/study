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
	 	private String catalogue; //所有课时
	   @OneToOne(mappedBy="hour")
	 	private Video video;//视频存放路径
	 	@ManyToOne(fetch = FetchType.EAGER)
	 	private Chapter chapter;

}

package com.itshidu.study.entity;


import javax.persistence.*;
import java.util.List;

//@Data
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

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getChapname() {
		return chapname;
	}

	public void setChapname(String chapname) {
		this.chapname = chapname;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Hour> getHour() {
		return Hour;
	}

	public void setHour(List<Hour> hour) {
		Hour = hour;
	}
}

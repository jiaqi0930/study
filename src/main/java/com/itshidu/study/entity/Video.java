package com.itshidu.study.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "study_veo")
public class Video {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private  String url;
    @OneToOne
    private Hour hour;
}

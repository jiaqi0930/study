package com.itshidu.study.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.websocket.OnMessage;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "study_cu")
public class Choice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date created;   //选课时间
    @OneToOne(fetch = FetchType.EAGER)
    private Course course;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

}

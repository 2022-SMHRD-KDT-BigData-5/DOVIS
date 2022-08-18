package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data // 기본 메소드(Getter/Setter/toString)생성
@AllArgsConstructor // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor // 디폴트 생성자 생성
public class Calendar {
	
	@NonNull
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
    private String allDay;
    
    private String at_seq;
    private String loc_seq;
    
    private String loc_name;
    private String loc_addr;
    private String latitude;
    private String longitude;
      
    private String at_name;
    private String at_company;
    private String at_dept;
    private String at_position;
	

}

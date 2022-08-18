package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data // 기본 메소드(Getter/Setter/toString)생성
@AllArgsConstructor // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor // 디폴트 생성자 생성
@RequiredArgsConstructor // 필요한 필드만 요소로 갖는 생성자 생성
public class Schedule {
	
	private String allDay;
	
	private int at_seq;//이거도 where절로 공통적인거 가져와야하는거같음 
		
	private String content;
	
	private String end; // 약속날짜(YYYY-MM-DD-THH-MM-SS형식)
	
	private String groupId; // 회의유형

	@NonNull
	private int id; // pk 시퀀스임
	
	private int loc_seq; // 장소번호..(where절로 장소명으로 가져와야할듯.....)
	
	private String start;// 약속시작날짜(현재시간으로 가져올수도..? 근데 현재 등록시 필요없는듯)
	
	private String title;
	
	private String writer;//스케쥴 작성자 -> 채팅작성자닉네임
	
	private String at_name;
	
	private String loc_name;
	
	
	
	
}

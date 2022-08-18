package com.smhrd.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.Calendar;

public interface CalendarMapper {
	
	// 캘린더 리스트
	// public ArrayList<Calendar> calenList();
	public List<Calendar> calenList();

	// 일정등록
	public int insertC(Calendar calendar);
	
	// 일정삭제
	@Delete("delete from calendar where id = #{id}")
	public int deleteC(int id);
	
	// 투두일정삭제
	@Delete("delete from calendar where id = #{id}")
	public int deletetodo(int id);
	
	// 투두일정등록
	public int inserttodo(Calendar vo);
	
	// 상세 페이지 일정 조회
	public List<Calendar> selectC(int id);
	
	// 상세 페이지 일정 업데이트
	public int updateC(Calendar vo);
	
	// 일정 하나 가져오기
	public Calendar calCheck(int id);
	
	// 업무 카데고리 업데이트
	public int cateup(Calendar vo);


}

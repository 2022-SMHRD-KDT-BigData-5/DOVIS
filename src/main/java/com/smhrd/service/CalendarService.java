package com.smhrd.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.smhrd.domain.Calendar;
import com.smhrd.mapper.CalendarMapper;

@Service
public class CalendarService {
	
	@Autowired
	CalendarMapper mapper;
	
	/*
	 * public ArrayList<Calendar> calenList(){ ArrayList<Calendar> clist =
	 * mapper.calenList(); return clist; }
	 */
	
	public List<Calendar> calenList(){
		List<Calendar> clist = mapper.calenList();		
		return clist;
	}
	
	// 일정 등록
	public int insertC(Calendar calendar) {
		int cnt = mapper.insertC(calendar);		
		return cnt;
	}
	
	// 일정 삭제
	public int deleteC(int id) {

		// 특정한 하나의 게시글 삭제
		int cnt = mapper.deleteC(id);

		// 목록페이지 이동
		return cnt;
	}
	
	// 투두일정삭제
	public int deletetodo(int id) {

		// 특정한 하나의 게시글 삭제
		int cnt = mapper.deletetodo(id);

		// 목록페이지 이동
		return cnt;
	}
	
	// 투두일정등록
	public int inserttodo(Calendar vo) {		
		int cnt = mapper.inserttodo(vo);
		return cnt;
	}
	
	// 일정상세페이지 조회
	public List<Calendar> selectC(int id){
		List<Calendar> sclist = mapper.selectC(id);
		System.out.println("일정상세페이지조회 sv");
		return sclist;
	}
	
	public int updateC(Calendar vo) {
		int cnt = mapper.updateC(vo);
		System.out.println("일정 업데이트 s");
		return cnt;
	}
	
	public Calendar carCheck(int id) {
		Calendar vo = mapper.calCheck(id);
		return vo;
	}
	
	public int cateup(Calendar vo) {
		int cnt = mapper.cateup(vo);
		return cnt;
	}

}

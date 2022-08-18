package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	CalendarService service;

	/*
	 * @GetMapping(params="method=list") public String list() { return "calendar4";
	 * }
	 */

	// 캘린더 페이지로 이동
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar13";
	}

	// 투두 페이지로 이동
	@RequestMapping("/todo.do")
	public String gotodo() {
		return "todo";
	}

	// 일정 삭제할 메소드
	// boardList.do?idx=4 -> int idx
	// boardList.do?idx=4&title=스프링&writer=안현진 -> 경우는 Board vo로 받기
	@RequestMapping("/deleteC.do")
	public String deleteC(int id) {

		// 특정한 하나의 일정 삭제
		service.deleteC(id);

		// 목록페이지 이동
		return "calendar12";
	}
	
	@RequestMapping("/deletetodo.do")
	public String deletetodo(int id) {

		// 특정한 하나의 일정 삭제
		service.deletetodo(id);

		// 목록페이지 이동
		return "todo";
	}

}

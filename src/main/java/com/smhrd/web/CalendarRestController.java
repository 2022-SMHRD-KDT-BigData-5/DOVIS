package com.smhrd.web;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.smhrd.domain.Calendar;
import com.smhrd.domain.Chat;
import com.smhrd.service.CalendarService;

@RestController
public class CalendarRestController {

	@Autowired
	CalendarService service;

	/*
	 * @GetMapping(params = "method=data") public String data(Model d) {
	 * d.addAttribute("list", service.calenList()); return "pageJsonReport"; }
	 */

	@RequestMapping("/calendarList.do")
	public List<Calendar> calenList() {
		List<Calendar> clist = service.calenList();
		return clist;
	}

	// 일정상세페이지 조회
	@RequestMapping("/selectC.do")
	public List<Calendar> selectC(int id) {
		List<Calendar> sclist = service.selectC(id);
		System.out.println("일정상세페이지조회 rc");
		return sclist;
	}

	@RequestMapping("/insertC.do")
	public Calendar insertC(String addEvent) {
		System.out.println("addEvent 확인 : " + addEvent);

		Gson gson = new Gson();
		Calendar calendarVO = gson.fromJson(addEvent, Calendar.class);

		System.out.println("gson으로 확인: " + calendarVO.getTitle());
		System.out.println("gson으로 확인시작: " + calendarVO.getStart());
		System.out.println("gson으로 확인: " + calendarVO.getAllDay());
		System.out.println("쪼개는 거 확인: " + calendarVO.getStart().replace(".", "dot").split("dot")[0]);

		calendarVO.setStart(calendarVO.getStart().replace(".", "dot").split("dot")[0]);
		calendarVO.setEnd(calendarVO.getEnd().replace(".", "dot").split("dot")[0]);

		int cnt = service.insertC(calendarVO);
		System.out.println(cnt);

		return calendarVO;
	}

	@RequestMapping("/inserttodo.do")
	public void inserttodo(Calendar vo) {
		service.inserttodo(vo);
	}

	@RequestMapping("/updateC.do")
	public void updateC(String jsonup) {
		int cnt = 0;
		int cnt2 = 0;
		System.out.println("일정 업데이트 rs 확인");
		System.out.println(jsonup);
		Gson gson = new Gson();
		Calendar vo = gson.fromJson(jsonup, Calendar.class);
		
		vo.setStart(vo.getStart().replace(".", "dot").split("dot")[0]);
		vo.setEnd(vo.getEnd().replace(".", "dot").split("dot")[0]);
		
		System.out.println("업무카테고리1: " + vo.getGroupId());
		
		if(vo.getGroupId().equals("외부회의")) {
			vo.setGroupId("0");
		}else if(vo.getGroupId().equals("내부회의")) {
			vo.setGroupId("1");
		}else if(vo.getGroupId().equals("제출")) {
			vo.setGroupId("2");
		}
		
		// 업무카테고리와 시간
		cnt2 = service.cateup(vo);
		
		// 장소와 인물 seq, 일정제목
		cnt = service.updateC(vo);
		
		System.out.println("업무카테고리2: " + vo.getGroupId());
		System.out.println(cnt);
		/*
		 * // 일정에 혹시 저장안한 내용이 있는지 없는지 확인 Calendar dbvo = service.carCheck(vo.getId());
		 * 
		 * if(dbvo.getAt_seq() == "1" && dbvo.getLoc_seq() == "1") { // 둘다 안되어있음 // 둘다
		 * insert하고 그걸 calendar에 업데이트 해야함 service.insertLN(dbvo);
		 * service.insertAN(dbvo);
		 * 
		 * Calendar vo2 = service.carCheck(vo.setLoc_seq(loc_seq));
		 * 
		 * service.updateC(dbvo);
		 * 
		 * }if(dbvo.getAt_seq() == "1" ) { // 상대 저장안되어있음 // 장소랑 마찬가지
		 * service.insertAN(dbvo); service.updateC(dbvo);
		 * 
		 * }else if(dbvo.getLoc_seq() == "1") { // 장소 저장안되어있음 // 장소가 저장이 안되어있으면 일단 // 1.
		 * 장소 insert // 2. update를 이용해서 방금 insert한 장소의 seq값을 집어넣어줘야함 이걸 하면서 같이 수정된 내용
		 * update해주면 될듯 service.insertLN(dbvo); service.updateC(dbvo);
		 * 
		 * }else { // 둘다 되어있음 // 둘다 되어있는 경우 신경쓰지 않고 셋 다 수정해주면됨 cnt =
		 * service.updateC(vo); }
		 */
		
	}
	

}

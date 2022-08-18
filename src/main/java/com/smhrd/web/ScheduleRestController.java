package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.smhrd.domain.Schedule;
import com.smhrd.service.ScheduleService;

@RestController
public class ScheduleRestController {

	@Autowired
	ScheduleService service;
	@RequestMapping("/insertSchedule.do")
	public void insertSchedule(String jsonsch) {
		
		Gson gson = new Gson();
		Schedule vo = gson.fromJson(jsonsch,Schedule.class); 
		
		
		service.insertSchedule(vo);
	
		service.updateSchedule(vo);
		
		
		System.out.println("누가? : " + vo.getWriter());
		System.out.println("누구랑 : " + vo.getAt_name());
		System.out.println("채팅닉네임: " + vo.getWriter());
		System.out.println("회의구분: " + vo.getGroupId());
		System.out.println("시간:" + vo.getStart());
		System.out.println("장소:" + vo.getLoc_name());
		

	}
	
	
}

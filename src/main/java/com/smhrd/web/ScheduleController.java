//package com.smhrd.web;
//
//import org.apache.ibatis.annotations.Mapper;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.smhrd.domain.Schedule;
//import com.smhrd.mapper.ScheduleMapper;
//@Controller
////public class ScheduleController {

//	@Autowired
//	ScheduleMapper mapper;
//	
//	
//
//		@GetMapping("/insertSchedule.do")
//		public String goMainPage() {
//		return "chat4";	
//		}
//		@PostMapping("/insertSchedule.do")
//		public String insertSchedule(Schedule vo) {
//			System.out.println(vo);
//			mapper.insertCalendar(vo);
//			mapper.insertAt(vo);
//			mapper.insertLoc(vo);
//			System.out.println("id:" + vo.getId()); // 0
//			System.out.println("at_seq:" + vo.getAt_seq()); // 0
//			
//			mapper.updateSchedule(vo);
//			System.out.println("누가? : " + vo.getWriter());
//			System.out.println("누구랑 : " + vo.getAt_name());
//			System.out.println("채팅닉네임: " + vo.getWriter());
//			System.out.println("회의구분: " + vo.getGroupId());
//			System.out.println("시간:" + vo.getStart());
//			System.out.println("장소:" + vo.getLoc_name());
//			
//			
//			
//			return "redirect:/insertSchedule.do";
//		}
//		
//	}


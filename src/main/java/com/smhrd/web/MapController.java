package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Map;
import com.smhrd.service.MapService;

@Controller
public class MapController {
	
	MapService service;
	
	@RequestMapping("/mapTest.do")
	public String goMap(Map map) {
		
		System.out.println("[mapTest 이동]");
		
		//Map openVO = service.selectMap(map);
		
		return "mapTest2";
	}
	
	/*
	 * @RequestMapping("/mapTest.do") public String selectMap(Map map) {
	 * 
	 * System.out.println("[mapTest 접근 성공!]");
	 * 
	 * Map openVO = service.selectMap(map);
	 * 
	 * return "mapTest"; }
	 */
}

package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Map;
import com.smhrd.service.MapService;

@RestController
public class MapRestController {

	@Autowired
	MapService service;

	@RequestMapping("/mapSelect.do")
	public List<Map> mapSelect() {
		System.out.println("mapSelect.co로 이동");
		System.out.println("map rest controller");

		List <Map> maplist = service.mapSelect();

		return maplist;

	}

}

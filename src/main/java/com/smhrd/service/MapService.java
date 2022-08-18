package com.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.domain.Map;
import com.smhrd.mapper.MapMapper;

@Service
public class MapService {
	
	@Autowired
	MapMapper mapper;
	
	
	public List<Map> mapSelect() {
		System.out.println("map service");
		List<Map> maplist = mapper.mapSelect();

		return maplist;

	}
}

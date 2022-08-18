package com.smhrd.service;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.domain.Members;
import com.smhrd.domain.Schedule;
import com.smhrd.mapper.ScheduleMapper;
@Service
public class ScheduleService {
	@Autowired
	ScheduleMapper mapper;
	//스케쥴 등록 
	
	public void insertSchedule(Schedule schedule) {
		mapper.insertCalendar(schedule);
		mapper.insertAt(schedule);
		mapper.insertLoc(schedule);
		
	};
	
	//동시에 스케쥴 업데이트 
	
	public void updateSchedule(Schedule schedule) {
		mapper.updateSchedule(schedule);
	}
	

}

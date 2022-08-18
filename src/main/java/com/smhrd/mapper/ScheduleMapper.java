package com.smhrd.mapper;

import com.smhrd.domain.Schedule;

public interface ScheduleMapper {

	
	public int insertCalendar(Schedule schedule);
	public int insertAt(Schedule schedule);
	public int insertLoc(Schedule schedule);
	
	
	
	public int updateSchedule(Schedule schedule);
}

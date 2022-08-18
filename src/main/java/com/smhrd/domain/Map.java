package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Map {
	
	@NonNull
	private int loc_seq;
	
	private String loc_name;
	
	private String loc_addr;
	
	private int latitude;
	
	private int longitude;
}

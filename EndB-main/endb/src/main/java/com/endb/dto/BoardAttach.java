package com.endb.dto;

import lombok.Data;

@Data
public class BoardAttach {
	
	private int attachNo;
	private int roomId;
	private String userFileName;
	private String savedFileName;
	private int downloadCount;
	
	

}

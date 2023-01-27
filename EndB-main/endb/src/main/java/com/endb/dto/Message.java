package com.endb.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	
	private int messageNo;
	private String title;
	private String content;
	private Date sendDate;
	private Date receiveDate;
	private int sender;
	private int receiver;
	private String senderId;
	private String receiverId;
	
	
}

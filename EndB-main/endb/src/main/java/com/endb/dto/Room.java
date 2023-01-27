package com.endb.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.ToString;


@Data
@ToString
public class Room {
	private int room_id;
	private int price;
	private String location;
	private String room_type;
	private int peaple_num;
	private int bed;
	private int bathroom;
	private int user_no;
	private int atthachno;
	private String title;
	private String content;
	private int deleted;
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	private List<BoardAttach> files;

	public void cloneFiles(List<BoardAttach> files) {
		this.files = new ArrayList<>(files);
	}

	private String savedfilename;
	private String userfilename;

}

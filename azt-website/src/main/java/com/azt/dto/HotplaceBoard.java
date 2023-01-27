package com.azt.dto;

import java.util.Date;
import java.util.List;

public class HotplaceBoard {

	private int boardNo;
	private String title;
	private String writer;
	private String place;
	private String loc;
	private String content;
	private Date writeDate;
	private int readCount;
	private boolean deleted;
	
	private List<HotplaceBoardAttach> files;
	private HotplaceBoardComment comment;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public List<HotplaceBoardAttach> getFiles() {
		return files;
	}
	public void setFiles(List<HotplaceBoardAttach> files) {
		this.files = files;
	}
	public HotplaceBoardComment getComment() {
		return comment;
	}
	public void setComment(HotplaceBoardComment comment) {
		this.comment = comment;
	}
	
	
}

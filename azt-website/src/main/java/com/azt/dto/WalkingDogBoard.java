package com.azt.dto;

import java.util.Date;
import java.util.List;

public class WalkingDogBoard {

		private int boardNo;
		private String title;
		private String writer;
		private String dogName;
		private String breed;
		private String content;
		private String location;
		private Date writeDate;
		private int readCount;
		private boolean deleted;
		private String weight;
		
		private List<WalkingDogBoardAttach> files;
		
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
		public String getDogName() {
			return dogName;
		}
		public void setDogName(String dogName) {
			this.dogName = dogName;
		}
		public String getBreed() {
			return breed;
		}
		public void setBreed(String breed) {
			this.breed = breed;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public Date getWriteDate() {
			return writeDate;
		}
		public void setWriteDate(Date writeDate) {
			this.writeDate = writeDate;
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
		public String getWeight() {
			return weight;
		}
		public void setWeight(String weight) {
			this.weight = weight;
		}
		public List<WalkingDogBoardAttach> getFiles(){
			return files;
		}
		
		public void setFiles(List<WalkingDogBoardAttach> files) {
			this.files = files;
		}
		
	
		
}

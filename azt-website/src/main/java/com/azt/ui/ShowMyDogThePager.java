package com.azt.ui;

public class ShowMyDogThePager {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int currentPage;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	public ShowMyDogThePager(int dataCount, int currentPage, 
		int pageSize, int pagerSize, String linkUrl) {
		
		this.linkUrl = linkUrl;
		
		this.dataCount = dataCount;
		this.pageSize = pageSize;
		this.pagerSize = pagerSize;
		this.currentPage = currentPage;		
		pageCount = (dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0);
	}
	
	
	public String toString(){
		
		StringBuffer linkString = new StringBuffer();		
		
		linkString.append("<br><br><nav aria-label='Page navigation'><ul class='pagination justify-content-center'>");
		linkString.append("&nbsp;");
		
		//1. 처음, 이전 항목 만들기
		if (currentPage > 1) {
			linkString.append(String.format("<li class='page-item first'><a class='page-link' href='%s?pageNo=1'><i class='tf-icon bx bx-chevrons-left'></i></a></li>",linkUrl));
		} else {
			linkString.append("<li class='page-item first'><a class='page-link' href='javascript:void(0);'><i class='tf-icon bx bx-chevrons-left'></i></a></li>");
		}
		linkString.append("&nbsp;");
		linkString.append("&nbsp;");
		
		if (currentPage > 1) {
			linkString.append(String.format("<li class='page-item prev'><a class='page-link' href='%s?pageNo=%d'><i class='tf-icon bx bx-chevron-left'></i></a></li>", linkUrl, currentPage - 1));
		} else {
			linkString.append("<li class='page-item prev'><a class='page-link' href='javascript:void(0);'><i class='tf-icon bx bx-chevron-left'></i></a></li>");
		} 
		linkString.append("&nbsp;");
		
	
		//2. 페이지 번호 Link 만들기
		int pagerBlock = (currentPage - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;
			linkString.append("&nbsp;");
			if (currentPage == i) {
				linkString.append(String.format("<li class='page-item active'><a class='page-link' href='javascript:void(0);'>%d</a></li>", i));
			} else {
				linkString.append(String.format("<li class='page-item'><a class='page-link' href='%s?pageNo=%d'>%d</a></li>", linkUrl, i, i));
			}
			linkString.append("&nbsp;");
		}
		
		//3. 다음, 마지막 항목 만들기
		linkString.append("&nbsp;");
		if (currentPage < pageCount) {
			linkString.append(String.format("<li class='page-item next'><a class='page-link' href='%s?pageNo=%d'><i class='tf-icon bx bx-chevron-right'></i></a></li>",linkUrl, currentPage + 1));
		} else {
			linkString.append("<li class='page-item next'><a class='page-link' href='javascript:void(0);'><i class='tf-icon bx bx-chevron-right'></i></a></li>");
		}
		linkString.append("&nbsp;");
		linkString.append("&nbsp;");
		if (currentPage < pageCount) {
			linkString.append(String.format("<li class='page-item last'><a class='page-link' href='%s?pageNo=%d'><i class='tf-icon bx bx-chevrons-right'></i></a></li>", linkUrl, pageCount));
		} else {
			linkString.append("<li class='page-item last'><a class='page-link' href='javascript:void(0);'><i class='tf-icon bx bx-chevrons-right'></i></a></li>");
		}
		
		linkString.append("&nbsp;");		
		linkString.append("</ul></nav>");
		
		return linkString.toString();
	}
}
	



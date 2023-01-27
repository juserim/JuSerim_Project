package com.endb.ui;

public class MessagePager {
	
	private int pageSize;//한 페이지당 데이터 개수
	private int pagerSize;//번호로 보여주는 페이지 Link 개수
	private int dataCount;//총 데이터 수
	
	private int currentPage;//현재 페이지 번호
	private int pageCount;//총 페이지 수
	
	private String linkUrl;//페이저가 포함되는 페이지의 주소
	
	public MessagePager(int dataCount, int currentPage, 
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
		
		linkString.append("<div class=\"row tm-mb-90\">")
				  .append("<div class=\"col-12 d-flex justify-content-between align-items-center tm-paging-col\">");

		if (currentPage > 1) {
			linkString.append(String.format("<a href='%s?pageNo=%d' class='btn btn-primary tm-btn-prev mb-2'>이전</a>",linkUrl, currentPage-1));
		} else {
			linkString.append("<a href='javascript:' class='btn btn-primary tm-btn-prev mb-2 disabled'>이전</a>");
		}
		
		linkString.append("<div class=\"tm-paging d-flex\">");
		
		
		//2. 페이지 번호 Link 만들기
		int pagerBlock = (currentPage - 1) / pagerSize;
		int start = (pagerBlock * pagerSize) + 1;
		int end = start + pagerSize;
		for (int i = start; i < end; i++) {
			if (i > pageCount) break;

			if (currentPage == i) {
				linkString.append(String.format("<a href='javascript:' class='tm-paging-link'>%d</a>", i));
				
			} else {
				linkString.append(String.format("<a href='%s?pageNo=%d' class='tm-paging-link active'>%d</a>", linkUrl, i, i));
			}

		}
		
		linkString.append("</div>");
		
		//3. 다음, 마지막 항목 만들기

		if (currentPage < pageCount) {
			linkString.append(String.format("<a href='%s?pageNo=%d' class='btn btn-primary tm-btn-next'>다음</a>",linkUrl, currentPage+1));
		} else {
			linkString.append("<a href='javascript:' class='btn btn-primary tm-btn-next disabled'>다음</a>");
		}
	
		linkString.append("</div>")
				  .append("</div>");
		
		return linkString.toString();
	}

}

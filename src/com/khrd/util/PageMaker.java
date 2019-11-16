package com.khrd.util;

public class PageMaker {
   private int total; // 전체 게시글 개수 
   private int currentPage; // 사용자 요청 페이지 번호 
   private int totalPages; // 전체 페이지 개수
   private int startPage; // 페이지 시작 번호
   private int endPage; // 페이지 마지막 번호
   
   public PageMaker() {
      super();
      // TODO Auto-generated constructor stub
   }

	public PageMaker(int total, int currentPage, int size) {
		super();
		this.total = total;
		this.currentPage = currentPage;
		
		if(total == 0) { // 게시글이 0개면 모두 0
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPages = total / size; // 전체 페이지 개수 = 전체 게시글 개수 / 사이즈
			if(total % size > 0) { 
				// 전체 게시글 수이 20이고, size(보여지는 개수)가 9면 나머지가 2. 0보다 크니까 전체 페이지 개수 1 증가
				// total : 20, size : 10이면 나머지 0. 딱 떨어지니까 전체 페이지 수가 증가될 필요 없음
				totalPages++;
			}
			
			// **********
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			// currentPage는 int형이기 때문에 currentPage가 5이하일 경우는 *나 /를 해도 모두 0이 나옴
			// currentPage가 0 ~ 4일때 startPage 1
			// currentPage가 5 ~ 9일때 startPage 6
			// currentPage가 10 ~ ..일때 startPage 11
			// 즉 startPage는 다음을 눌렀을 때 시작되는 수?
			System.out.println(currentPage / 5);
			System.out.println(currentPage / 5 * 5);
			System.out.println("modVal : " + modVal);
			System.out.println("currentPage : " + currentPage);
			System.out.println("startPage : " + startPage);
			System.out.println("-------------");
//			**********
			
			if(modVal == 0) { // currentPage가 5의 배수일 경우 
				// page가 5개밖에 없어서 5의 배수 페이지에 갈 경우 startPage를 다시 낮춰야함 
				// 이 startPage가 현재 보여지는 페이지 수의 시작페이지를 말함.
				// 즉 이 if문이 없으면 5를 눌렀을 때 다음 숫자인 6페이지가 보여지게됨.
				// 그 말은 즉 5를 눌렀을 때 보여지는 페이지는  1 2 3 4 5가 보여야 하고
				// 10을 눌렀을 때 보여지는 페이지는 6 7 8 9 10 이여야함.
				// 즉 startPage는 보여지는 페이지의 시작하는 숫자를 말함.
				startPage -= 5;
				System.out.println("if startPage : " + startPage);
			}
			endPage = startPage + 4;
			
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}
	
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPages() {
		return totalPages;
	}
	
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	@Override
	public String toString() {
		return "PageMaker [total=" + total + ", currentPage=" + currentPage + ", totalPages=" + totalPages + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}

   
}
   
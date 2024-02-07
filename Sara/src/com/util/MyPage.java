package com.util;


// 페이지 처리 클래스
public class MyPage {

	// 페이지 개수 구하는 메서드
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;	// 전체 페이지 개수
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	// 페이징 처리 메소드
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		int numPerBlock = 5; // 1◀이전 6 7 8 9 10 다음▶12 6~10까지 표시되는 페이지의 갯수
		 int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		 int page; // page index 숫자 (…6 7 8 9 10…)
		
		 StringBuffer sb = new StringBuffer();
		
		 if(currentPage == 0 || totalPage == 0) // 데이터 없을경우
		 return "";
		
		 // list.jsp
		 if(listUrl.indexOf("?") != -1){ //주소줄에 ?가 있다면 &를 붙임 ( search값을 가져왔을 경우 )
			 listUrl = listUrl + "&";
		 } else {					// 
			 listUrl = listUrl + "?";
		 }
		
		 // current_page가 9
		 currentPageSetup = (currentPage / numPerBlock) * numPerBlock; //(9/5)*5=5
		
		 //만약 currentPage가 5,10,15,20…이면
		 //currentPageSetup=(currentPage / numPerBlock) * numPerBlock; //(10/5)*5=10
		 if(currentPage % numPerBlock == 0) // 10 % 5 = 0	
			 
			 /* 0으로 딱 떨어지면 ◀ 에도 10이 들어가서 조건 걸어야함. */ 
		 currentPageSetup = currentPageSetup - numPerBlock;//10-5=5(표시할 첫페이지 – 1 해준 값)
		
		 //1과 ◀이전 페이지
		 if(totalPage > numPerBlock && currentPageSetup > 0){ //(34 > 5 && 9 > 0)
		
		 sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\"> ◀이전</a>&nbsp;");
		 }
		 			// 예 ) <a href = "list.jsp?pageNum = 5" ◀이전</a>&nbsp> 
		 
		 //바로가기 페이지
		 page = currentPageSetup + 1; // 5 + 1 = 6 (시작값)
		 
		 //if(6 <= 12 && 6 <= 5 + 5) : 결국 6 7 8 9 10
		 while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			 
		 if(page == currentPage){
		 sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
		 } else {
		 sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
		 }		// 예 ) <a href = "list.jsp?pageNum = 2">2</a>&nbsp; 
		 
		 	page++; //5번(6,7,8,9,10) 반복 후 page 값은 11
		 }
		
		 //다음▶,마지막페이지
		 //if(12 - 5 > 5)
		 if(totalPage - currentPageSetup > numPerBlock){
		 sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
		 }
		 	return sb.toString();
		}
		
}

function searchData(){

		var f = document.searchForm;
		f.action ="<%=cp%>/sara/product.do";		
		f.submit();
	}
	
function searchCategory(){

	var f = document.searchForm;
	f.action ="<%=cp%>/sara/product.do";		
	f.submit();
}
	
	
function addToCart(productId) {
    var addToCart = confirm("장바구니에 추가하시겠습니까?");
    if (addToCart) {
        // 장바구니 추가 코드 
     
    }
}

function addToWishlist(productId) {
    var addToWishlist = confirm("위시리스트에 추가하시겠습니까?");
    if (addToWishlist) {
        // 위시리스트 추가코드 
       
    }
    
    
}
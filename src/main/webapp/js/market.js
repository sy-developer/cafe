function cart_all() {
					var selectAll = document.querySelector(".cart_all_click").checked;
					var selectCart = document.getElementsByName("cart_no");

					for (var i = 0; i < selectCart.length; i++) {
						selectCart[i].checked = selectAll;
					}
				}
				
function sendEdit(button){
					alert("진행됨");
					//button 앞에는 수량창이 있고 뒤에는 번호태그가 있다
					//앞 : button.previousElementSibling
					//뒤 : button.nextElementSibling
					var cart_cnt = button.previousElementSibling.value;
					var cart_no = button.nextElementSibling.value;
					//console.log(cart_no, cart_cnt);
					
					var form = document.querySelector(".edit-form");
					form.querySelector("input[name=cart_no]").value = cart_no;
					form.querySelector("input[name=cart_cnt]").value = cart_cnt;
					  
			        form.submit();//폼 전송버튼 누른 효과
			        	
			        }
			        
function button_event(){												

		var cart_no = document.getElementsByName("cart_no");
		var count = 0;
		
		for(var i=0;i<cart_no.length;i++){
			if(cart_no[i].checked == true){
				count++;
					}
				}
				if(count<=0){
					alert("상품을 선택하세요");
					return false;
				}else{
					var result = confirm("선택하신 상품을 삭제하시겠습니까??");
				if (!result){ 
					return false;
				}else{  
					document.form.submit();
				}
			}
		}	
/*		
	function button_event2(){												

		var cart_no = document.getElementsByName("cart_no");
		var count = 0;
		
		for(var i=0;i<cart_no.length;i++){
			if(cart_no[i].checked == true){
				count++;
					}
				}
				if(count<=0){
					alert("상품을 선택하세요");
					return false;
				}else{
					var result = confirm("선택하신 상품을 구매하시겠습니까??");
				if (!result){ 
					return false;
				}else{  
					location.href="../main/main.do";
				}
			}
		}	
*/	
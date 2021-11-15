/**
 * 
 */
 
let basket = {
    totalCount: 0, 
    totalPrice: 0,
    finalPrice: 0,
    //체크한 장바구니 상품 비우기 -- 망함
    delCheckedItem: function(){
        document.querySelectorAll("input[name=cart_no]:checked").forEach(function (item) {
            item.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
        });
        //AJAX 서버 업데이트 전송
    
        //전송 처리 결과가 성공이면
        this.reCalc();
        this.updateUI();
    }, 
    
    //장바구니 전체 선택 및 해제
    selectAll: function(){
    	 //alert("함수먹히니?");

        if ($(".cart_all_click").is(':checked')){
        	$("input[name=cart_no]").prop("checked", true);
        	//document.querySelectorAll(".checked").prop("checked",true);
        }else{
     	   $("input[name=cart_no]").prop("checked", false);
        	//document.querySelectorAll(".checked").prop("checked",false);
        }
  		
          //AJAX 서버 업데이트 전송
        
          //전송 처리 결과가 성공이면
          this.totalCount = 0;
          this.totalPrice = 0;
          this.finalPrice = 0;
          this.reCalc2();
          this.updateUI();
          
    },
    
    //재계산
    reCalc: function(){
        this.totalCount = 0;
        this.totalPrice = 0;
        this.finalPrice = 0;
        //console.log("재계산진입")
        alert("재계산진입 확인");
        document.querySelectorAll(".p_num").forEach(function (item) {
       
            if(item.parentElement.parentElement.firstElementChild.firstElementChild.firstElementChild.checked == true){
            alert("재계산진입 확인2");
                var count = parseInt(item.getAttribute('value'));
                this.totalCount += count;
                var price = item.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
                this.totalPrice += count * price;
               
            }
        }, this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
    //재계산2
    reCalc2: function(){
        this.totalCount = 0;
        this.totalPrice = 0;
        this.finalPrice = 0;
        //alert("재계산진입 확인");
        document.querySelectorAll(".checked").forEach(function (item) {
            if(item.checked == true){
            //alert("선택한것"+item);
            //alert("재계산진입 확인2");
                var count = parseInt(item.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.getAttribute('value'));
               // alert(count);
                this.totalCount += count;
                var price = item.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.getAttribute('value');
               // alert("price"+price);
                this.totalPrice += count * price;
                var delivercost = document.getElementById('deliver').innerHTML;
                //alert("배송료 : "+delivercost);
                //this.finalPrice += Number(this.totalPrice) + Number(delivercost);
                //alert("최종가격 : "+this.finalPrice);
               
            }
        },this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
    },
    
    //선택상품 구매
    credit: function(){
        this.totalCount = 0;
        this.totalPrice = 0;
        this.finalPrice = 0;
        
        var arrvalue = new Array(); // 배열선언
        
        document.querySelectorAll(".checked").forEach(function (item) {
            if(item.checked == true){
            var v = item.getAttribute('value');
            arrvalue.push(v);
            //alert("배열 확인해보기 : "+arrvalue);
      
               
            }
            
        },this); // forEach 2번째 파라메터로 객체를 넘겨서 this 가 객체리터럴을 가리키도록 함. - thisArg
                var cnt = 0;
        for(var i=0;i<arrvalue.length;i++){
			if(arrvalue.length > 0){
				cnt++;
					}
				}
        if(cnt<=0){
			alert("상품을 선택하세요");
			return false;
		} else {
			var result = confirm("선택하신 상품을 구매하시겠습니까??");
		if (!result){ 
					return false;
				}else{  
		//alert("배열 확인해보기 : "+arrvalue);
		var tot = document.getElementById('finalPrice2').innerHTML;
		//alert(tot);
        var form = document.querySelector(".edit-form1");
        form.querySelector("input[name=array]").value = arrvalue.join(",");
        form.querySelector("input[name=total_aaa]").value = tot;
        form.submit();				
        }
	}

    },
    
    //화면 업데이트
    updateUI: function () {
        //document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
        //document.querySelector('#sum_p_price').textContent = '합계금액: ' + this.totalPrice.formatNumber() + '원';
        //alert("실험 ");
        document.querySelector('#sum_p_price').textContent =  this.totalPrice.formatNumber();
        var deliver = document.getElementById('deliver').innerHTML;
        document.querySelector('#finalPrice').textContent =  (this.totalPrice+ Number(deliver)).formatNumber() + '원';
        document.querySelector('#sum_p_price2').textContent =  this.totalPrice.formatNumber() ;
        document.querySelector('#deliver2').textContent =  Number(deliver).formatNumber() ;
        document.querySelector('#finalPrice2').textContent =  (this.totalPrice+ Number(deliver)).formatNumber() ;
    },
    
    //개별 수량 변경 --이거 안씀 market.js꺼 씀
    changePNum: function (pos) {
    //alert("실험 ");
        var item = document.querySelector('input[name=p_num'+pos+']');
        var p_num = parseInt(item.getAttribute('value'));
        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
        
        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

        item.setAttribute('value', newval);
        item.value = newval;

        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
        //AJAX 업데이트 전송

        //전송 처리 결과가 성공이면    
        this.reCalc();
        this.updateUI();
    },
    
    checkItem: function () {
    //console.log("체크된는지 확인")
    //alert("체크된는지 확인");
        this.reCalc2();
        this.updateUI();
    },
    
    delItem: function () {
        var arrvalue = new Array(); // 배열선언
        
        document.querySelectorAll(".checked").forEach(function (item) {
            if(item.checked == true){
            var v = item.getAttribute('value');
            arrvalue.push(v);
            //alert("배열 확인해보기 : "+arrvalue);    
            }
            
        },this);
        var cnt = 0;
        for(var i=0;i<arrvalue.length;i++){
			if(arrvalue.length > 0){
				cnt++;
					}
				}
        if(cnt<=0){
			alert("상품을 선택하세요");
			return false;
		} else {
			var result = confirm("선택하신 상품을 삭제하시겠습니까??");
		if (!result){ 
					return false;
		    		}else{
		                    //alert("배열 확인해보기 : "+arrvalue);
		                    //alert(tot);
                             var form = document.querySelector(".edit-form2");
                             form.querySelector("input[name=array]").value = arrvalue.join(",");
                                form.submit();
                        }
	}
    },
}

// 숫자 3자리 콤마찍기
Number.prototype.formatNumber = function(){
    if(this==0) return 0;
    let regex = /(^[+-]?\d+)(\d{3})/;
    let nstr = (this + '');
    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    return nstr;
};
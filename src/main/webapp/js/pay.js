function pay(){
		//alert("실험");
		//아임포트
		name=document.getElementsByClassName("user-name")[0].value;
		email=document.getElementsByClassName("form-email")[0].value;
		phone=document.getElementsByClassName("user-phone")[0].value;
		addr1=document.getElementsByClassName("recive-addr1")[0].value;
		addr2=document.getElementsByClassName("recive-addr2")[0].value;
 		price=document.getElementsByClassName("price")[0].innerText;
 		
 		$("#purchase-button").click(function() {
			//alert("dfds");
			var IMP = window.IMP; // 생략가능
			
			IMP.init('imp84084223');
			IMP.request_pay({
				pg : 'kakao',

				pay_method : 'card',

				merchant_uid : 'merchant_' + new Date().getTime(),
				
				name : name,
				amount : price,
				//'${total_cost }원',

				buyer_email : email,
				
				//buyer_name : '${memberDTO.name }',
				
				buyer_tel : phone,
				buyer_addr : addr1,
				//'${memberDTO.addr1 }',
				
				buyer_postcode : addr2,
				//'${memberDTO.addr2 }'
			/*
				   m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			  
			    모바일 결제시,
			    결제가 끝나고 랜딩되는 URL을 지정 
			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다. 메인화면으로 돌아갑니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				location.href = "../main/main.do";

			});
		});
}
function changeCheckbox(){
            //해야할 일
            //1. .select-all의 체크상태를 불러온다.
            var selectAll = document.querySelector(".select-all").checked;
            
            //2. 1번에서 불러온 값으로 모든 .select-item에 check 여부를 설정    
            
            //(주의) document.querySelector()로는 태그를 1개밖에 선택할 수 없다.
            // - document.querySelectorAll()로 태그를 모두 선택할 수 있다.
            // - 위의 명령은 사용 시 결과가 "배열"로 전달된다.
            var selectItem = document.querySelectorAll(".select-item");
            //for(var i=0; i < selectItem.length; i++){
            for(var i in selectItem){
                selectItem[i].checked = selectAll;    
            }
            
        }
            
          //체크박스 여부확인
        function CheckForm(){
            
            //체크박스 체크여부 확인 [하나]
            var chk1=document.joinForm.Agreement1.checked;
            var chk2=document.joinForm.Agreement2.checked;
            var chk3=document.joinForm.Agreement3.checked;

            if(!chk1){
                alert('모든 약관에 동의해 주세요');
                return false;
            } 
            if(!chk2) {
                alert('모든 약관에 동의해 주세요');
                return false;
                
            } if(!chk3){
                alert('모든 약관에 동의해 주세요');
                return false;
            }

         
            }
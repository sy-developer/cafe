// NOTICE!! DO NOT USE ANY OF THIS JAVASCRIPT
// IT'S JUST JUNK FOR OUR DOCS!
// ++++++++++++++++++++++++++++++++++++++++++
/*!
 * Copyright 2014 Twitter, Inc.
 *
 * Licensed under the Creative Commons Attribution 3.0 Unported License. For
 * details, see http://creativecommons.org/licenses/by/3.0/.
 */
 
//팝업창여는 자바스크립트
function go_pop(){
 
 window.open("popup.jsp","new","width=410, height=510, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

/*세팅된 쿠기 가져오기*/
function getCookie(name){
   var cookie = document.cookie;
   
   if(document.cookie != ""){
      // document.cookie는 name=value 쌍으로 구성되어있고, 각 쌍은 ;로 구분합니다. 이때, 쌍 하나는 하나의 독립된 쿠키를 나타냅니다.
      // ;을 기준으로 document.cookie의 값을 분리하면 원하는 쿠키를 찾을 수 있습니다.
      // 정규 표현식이나 배열 관련 함수를 함께 사용해서 말이죠.
      var cookie_array = cookie.split(";");
      for ( var index in cookie_array){
         var cookie_name = cookie_array[index].split("=");
         
         if ( cookie_name[0] == "popupYN"){
            return cookie_name[1];
         }
      }
   }
   return;
}
/*오픈 팝업*/
function openPopup(url){
   var cookieCheck = getCookie("popupYN");
   if (cookieCheck != "N")
      window.open(url,"new","width=410, height=510, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

/*쿠키 세팅*/
function setCookie(name, value, expiredays){
   var date = new Date();
   date.setDate(date.getDate() + expiredays);
   //document.cookie에 값을 할당하면, 브라우저는 이 값을 받아 해당 쿠키를 갱신합니다. 이때, 다른 쿠키의 값은 변경되지 않습니다.
   document.cookie = escape(name) + "=" + escape(value) + ";expires=" + date.toUTCString();
}

/*팝업 닫기*/
function closePopup(){
   if(document.getElementById("check").value){
       setCookie("popupYN", "N", 1);
         self.close();
    }
}



// Intended to prevent false-positive bug reports about Bootstrap not working properly in old versions of IE due to folks testing using IE's unreliable emulation modes.
(function () {
  'use strict';

  function emulatedIEMajorVersion() {
    var groups = /MSIE ([0-9.]+)/.exec(window.navigator.userAgent)
    if (groups === null) {
      return null
    }
    var ieVersionNum = parseInt(groups[1], 10)
    var ieMajorVersion = Math.floor(ieVersionNum)
    return ieMajorVersion
  }

  function actualNonEmulatedIEMajorVersion() {
    // Detects the actual version of IE in use, even if it's in an older-IE emulation mode.
    // IE JavaScript conditional compilation docs: http://msdn.microsoft.com/en-us/library/ie/121hztk3(v=vs.94).aspx
    // @cc_on docs: http://msdn.microsoft.com/en-us/library/ie/8ka90k2e(v=vs.94).aspx
    var jscriptVersion = new Function('/*@cc_on return @_jscript_version; @*/')() // jshint ignore:line
    if (jscriptVersion === undefined) {
      return 11 // IE11+ not in emulation mode
    }
    if (jscriptVersion < 9) {
      return 8 // IE8 (or lower; haven't tested on IE<8)
    }
    return jscriptVersion // IE9 or IE10 in any mode, or IE11 in non-IE11 mode
  }

  var ua = window.navigator.userAgent
  if (ua.indexOf('Opera') > -1 || ua.indexOf('Presto') > -1) {
    return // Opera, which might pretend to be IE
  }
  var emulated = emulatedIEMajorVersion()
  if (emulated === null) {
    return // Not IE
  }
  var nonEmulated = actualNonEmulatedIEMajorVersion()

  if (emulated !== nonEmulated) {
    window.alert('WARNING: You appear to be using IE' + nonEmulated + ' in IE' + emulated + ' emulation mode.\nIE emulation modes can behave significantly differently from ACTUAL older versions of IE.\nPLEASE DON\'T FILE BOOTSTRAP BUGS based on testing in IE emulation modes!')
  }
})();
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>

</head>

<body>
   <form name = "loginForm" action = "8_4" method = "post">
      <p>아이디 : <input type = "text" name = "id" id = "id">
      <p>비밀번호 : <input type = "text" name = "passwd" id = "passwd">
      <p><input type = "button" value = "전송" id = "sm">
   </form>

</body>

<script type = "text/javascript">
   
   var sm = document.querySelector("#sm");
   sm.addEventListener("click", checkLogin);

   function checkLogin() {
      var form = document.loginForm;
      
      for(i = 0; i < form.id.value.length; i++) {
         var ch = form.id.value.charAt(i);
      
      
         if((ch<'a'||ch>'z') && (ch>'A' || ch< 'Z') && (ch > '0' || ch<'9'))
            {
            alert("아이디는 영문 소문자만 입력 가능합니다!");
            form.id.select();
            return;
            }
      }
   
      if(isNaN(form.passwd.value)) {
         alert("비밀번호는 숫자만 입력 가능합니다!");
         form.passwd.select();
         return;
      }
      
      form.submit();
   }
   
</script>
</html>


</body>
</html>
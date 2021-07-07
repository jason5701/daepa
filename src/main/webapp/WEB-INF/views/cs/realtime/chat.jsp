<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
   <link rel="stylesheet" href="/resources/css/chat.css"/>
   <title>채팅</title>  
</head>
<body>
   <div class="chat_wrap">
      <div class="header">채 팅 방</div>
      <div id="chat"></div>
      <script id="temp" type="text/x-handlebars-template">
          <div class="{{printLeftRight sender}}">
             <div class="sender">{{sender}}</div>
             <div class="message">{{message}}</div>
            <div class="date">{{date}}</div>
          </div>
       </script>
      <script>
         var uid = "${sessionScope.id}";
         Handlebars.registerHelper("printLeftRight", function(sender){
            if(uid != sender) { 
               return "left"; 
            }else {
               return "right";
            }
         });
      </script>
      <textarea id="txtMessage" placeholder="Press Enter for send message."></textarea>
   </div>   
</body>
<script>
   var uid = "${sessionScope.id}";
   //메시지보내기
   $("#txtMessage").on('keydown', function(e){
      if(e.keyCode == 13 && !e.shiftKey) {
         e.preventDefault();
         var message = $(this).val();
         if(message=="") {
            alert("내용을 입력하세요!");
            return;
         }
         //서버로메시지보냄
         sock.send(uid + "|" + message);
         $("#txtMessage").val("");
         
         $("#chat").scrollTop($("#chat")[0].scrollHeight);
      }
   });
   
	
   //웹소켓정의
   var sock=new SockJS("http://localhost:8088/echo");
   sock.onmessage=onMessage;
   sock.onclose=onClose;
   
   //서버에서  클라이언트가 메세지 받았을때
   function onMessage(msg){
      var items=msg.data.split("|"); //구분자 | 는 배열로 되어있음.
      var sender=items[0];
      var message=items[1];
      var date=items[2];
      //alert(sender + "\n" + message + "\n" + date);
      var temp=Handlebars.compile($("#temp").html());
      var data={"sender":sender, "message":message, "date":date};
      $("#chat").append(temp(data));
   }
   //콜솔에 채팅창 닫힐때 연결끊김
   function onClose(evt){
      console.log("연결끊김");
   }
</script>
</html>
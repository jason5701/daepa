<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>파일업로드 Ajax</title>
</head>
<body>
	<h1>파일업로드 Ajax</h1>
	<div id="upload">
		<input type="file" id="file" accept="image/*">
	</div>
	<div id="uploaded">
		<ul id="uploadFiles"></ul>
	</div>
</body>
<script>
	//파일업로드
	$("#file").on("change", function(){
	    //alert("언제발생하는가?"); //파일을 선택한 후
	    var file=$("#file")[0].files[0]; //파일즈에 0해줘야지 ㄱ지금 선택한 파일을 가져올수있음. (여러개의 파일을 선책할수있기 때문이다.)
	    //alert(file); //오브젝트 가져옴 
	    if(file == null) return;//파일이 선택되지 않았을떄는 아무액션이 발생하지 안흥ㅁ
	    var formData=new FormData();
	    formData.append("file",file); //여기서 받은 파일이 폼데이터로 호출됨
	 
 
	    $.ajax({
	    	type:"post",
	        url:"uploadFile",
	        processData:false,
	        contentType:false,
	        data:formData,
	        success:function(data){
	        	var str="<li fullName="+data+">";
	            	str+="<img src='displayFile?fullName=" + data + "' width=200>";
	                str+="<br/><a href='/downloadFile?fullName=" + data + "'>" + data + "</a>"
	                str+="<button> 삭제 </button>";
	                str+="</li>"
	           	 	$("#uploadFiles").append(str); //기존값에 계속 추가할경우 어팬드 // 새로운것 하나만 업로드할경우 html (.thml(srt))
	            	//alert(data);
	         }
		});
	});
 
	$("#uploadFiles").on("click","li button", function(){
    	var li=$(this).parent();
    	var fullName=li.attr("fullName");
    	if(!confirm("파일을 삭제하실래요?")) return;
    	$.ajax({
    		type:"get",
    		url: "/deleteFile",
    		data:{"fullName":fullName},
    		success:function(){
       			alert("삭제완료");
       			li.remove(); //화면에 나와있는것 삭제
    		}
 		});
	});
</script>
</html>
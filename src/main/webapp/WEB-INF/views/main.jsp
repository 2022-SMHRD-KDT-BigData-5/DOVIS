<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dovis</title>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/main.css">
<!-- main css -->
<link rel="stylesheet" href="resources/css/dovis.css">
</head>
<body>
	<div class="sidebar">
		<div class="logo_content">
			<div class="logo">
				<i class='bx bxs-ghost bx-spin' style='color: #859bfd'></i>
				<div class="logo_name">DOVIS</div>
			</div>
			<i class='bx bx-menu' id="btn"></i>
		</div>
		<ul class="nav_list">
			<li><a href=" dovis.do"> <i class='bx bx-home-alt-2'></i> <span
					class="link_name">home</span>
			</a> <span class="tooltip">home</span></li>
			<li><a href="chat.do"> <i class='bx bx-chat'></i> <span
					class="link_name">message</span>
			</a> <span class="tooltip">message</span></li>
			<li><a href="calendar.do"> <i class='bx bx-calendar'></i> <span
					class="link_name">calendar</span>
			</a> <span class="tooltip">calendar</span></li>
			<li><a href="setting.do"> <i class='bx bx-cog'></i> <span
					class="link_name">setting</span>
			</a> <span class="tooltip">setting</span></li>
			<li><a href="logoutcheck.do"> <i class='bx bx-exit'></i> <span
					class="link_name">logout</span>
			</a> <span class="tooltip">logout</span></li>
		</ul>
	</div>

	<div class="home_content">
		<div class="text">
			<div class="home-mes">
				<h3>DOVIS</h3>
				<span>"${loginVO.mem_name}"님 반갑습니다 :)</span>
			</div>
			<div id="myDIV" class="to-header">
				<!-- <h2>My To Do List</h2> -->
				<input type="hidden" id="mem_id" value="${loginVO.mem_id}">
				<input type="text" id="myInput" placeholder="추가">

				<!-- <span
				onclick="newElement()" class="addBt">ADD</span> -->
				<span class="addBt" id="addtd">ADD</span>
			</div>

			<div id="list-group">
				<ul id="myUL">
					<!-- to do list 일정생성 -->
					<!-- <li class="list">일정1</li>
				<li class="list">일정2</li> -->
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
  // To do 스크립트
 // 일정 출력
 $(document).ready(() => {
 	//ajax통신, 글 데이터가져오기
 	$.ajax({
 		url: 'calendarList.do', // 어디로 요청보낼것인가 
 		type: 'post',// GET? POST?
 		data: {
 			//'key(name)' :value -> 보내줄 데이터       
 		},
 		//dataType: 'json',//응답받는 데이터가 어떤 형태인지
 		success: function (res) {
 			//요청 성공했을때 실행되는 call back 함수
 			//res --> 응답받는 데이터가 더 담기는 변수
 			//console.log(res[0].title);
 			console.log($("#mem_id").val());

 			$('#myUL').html('');
 			for (let i = 0; i < res.length; i++) {
 				console.log("투두출력자: "+res[i].writer);	
 				console.log("오늘 날짜: " + todayDate());
 				console.log("투두날짜: "+res[i].start.split(" ")[0]);
 				
 				

 					 if($("#mem_id").val() == res[i].writer){
 						 
 						li = `
 		                  <li class="list">
 		                   ` + res[i].title + `
 		                   <button class="close"> \u00D7 </button>
 		                   <input type="hidden" id="calid" value= ` + res[i].id + `>
 		                  </li>                
 		                  `; 
 							
 						
 						if(todayDate() == res[i].start.split(" ")[0]){
 					 		console.log(res[i].title);
 					 		
 					 		$('#myUL').append(li);
 				 		}

 				}
 			}
 				 
 		},
 		error: function (e) {
 			alert('error');
 		}
 	});

 })

// 투두일정삭제
$(document).on(
				"click",
				".close",
				function() {
					console.log("지울 일정 id: "+ $(this).siblings("#calid").val());
					// 아이디를 보내서 삭제
					$.ajax({
						data : {
							id : $(this).siblings("#calid").val()
						},
						url : "deletetodo.do",
						type : "post",
						//dataType : "text",
						context : this,
						success : function(res) {
							// 이렇게 페이지 다시 이동해야 적용되는 상태ㅠㅠ
							location.href = "todo.do";
							console.log("일정삭제 성공");


						},
						error : function(e) {
							alert("통신실패!");
						}
					})
});

// 투두일정등록 
$(document).on(
			"click",
			"#addtd",
			function() {
				console.log("등록할 일정: "+ $("#myInput").val());
				console.log("로그인 아이디: "+ $("#mem_id").val());
				// 아이디를 보내서 삭제
				$.ajax({
					data : {
						title : $("#myInput").val(),
						writer : $("#mem_id").val(),
					},
					url : "inserttodo.do",
					type : "post",
					//dataType : "text",
					context : this,
					success : function(res) {
						// 이렇게 페이지 다시 이동해야 적용되는 상태ㅠㅠ
						location.href = "todo.do";
						console.log("투두등록 성공");


					},
					error : function(e) {
						alert("통신실패!");
					}
				})
});

// 오늘 날짜
function todayDate(){
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+1;
	var date = now.getDate();
	
	// 날짜출력형식
	var _date = year + '-'+('0'+month).slice(-2)+'-'+('0'+date).slice(-2);
	console.log(_date);
	
	return _date;
}
 
 </script>
	<script>
//목록 항목을 클릭할 때 "확인됨" 기호 추가
 var list = document.querySelector('#myUL');
 list.addEventListener('click', function(ev) {
   if (ev.target.tagName === 'LI') {
     ev.target.classList.toggle('checked');
   }
 }, false);
 </script>
	<script>
        let btn = document.querySelector("#btn");        
        let sidebar = document.querySelector(".sidebar");        
        
        btn.onclick = function() {
            sidebar.classList.toggle("active");
        }

    </script>
</body>

</html>
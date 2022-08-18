<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Document</title>
<style>
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	/* 요소의 전체 너비 및 높이에 패딩 및 테두리 포함 */
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	font-family: 'yg-jalnan';
}

/* to do */

/* 목록에서 여백 및 채우기 제거 */
#my#myUL {
	margin: 0;
	padding: 0;
}

/* 목록 항목 스타일 지정 */
#my#myUL li {
	cursor: pointer;
	position: relative;
	padding: 12px 8px 12px 40px;
	background: #eee;
	font-size: 18px;
	transition: 0.2s;
	/* 목록 항목을 선택할 수 없게 합니다. */
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* 모든 홀수 목록 항목을 다른 색상으로 설정 (zebra-stripes) */
#myUL li:nth-child(odd) {
	background: #f9f9f9;
}

/* 더 어두운 배경색 -  on hover */
#myUL li:hover {
	background: #ddd;
}

/* 클릭하면 배경색을 추가하고 텍스트를 지웁니다.*/
#myUL li.checked {
	background: #888;
	color: #fff;
	text-decoration: line-through;
	text-align: center;
	padding: 1%;
}

/* 클릭하면 "확인됨" 표시 추가 */
#myUL li.checked::before {
	content: '';
	position: absolute;
	border-color: #fff;
	border-style: solid;
	border-width: 0 2px 2px 0;
	top: 15%;
	left: 2%;
	transform: rotate(45deg);
	height: 55%;
	width: 1%;
}

/* 닫기 단추 스타일 지정 */
.close {
	position: absolute;
	right: 0;
	width: 4%;
	top: 0%;
	text-align: center;
	height: 100%;
	border-radius: 0px 15px 15px 0px;
	font-size: 150%;
}

.close:hover {
	background-color: #f44336;
	color: white;
}

/* 머리글 스타일 지정 */
.to-header {
	background-color: #80d351;
	padding: 11px 12px;
	color: white;
	text-align: center;
	border-radius: 15px;
}

/* 헤더 뒤에 플로팅을 지움 */
.to-header:after {
	content: "";
	display: table;
	clear: both;
}

/* 입력 스타일 지정 */
input {
	margin: 0;
	border: none;
	border-radius: 0;
	width: 75%;
	padding: 10px;
	float: left;
	font-size: 24px;
}

/* 추가 단추 스타일 지정 */
.addBt {
	padding: 10px;
	width: 25%;
	background: #d9d9d9;
	color: #555;
	float: left;
	text-align: center;
	font-size: 24px;
	cursor: pointer;
	transition: 0.3s;
	border-radius: 0;
}

.addBt:hover {
	background-color: #bbb;
}

.text {
	width: 85%;
	padding: 100px 100px 100px 100px;
}

.list {
	position: relative;
	font-size: 30px;
	border-radius: 15px;
	margin-top: 1%;
	text-align: center;
	padding: 1%;
}

li {
	list-style-type: none;
}

#myUL {
	padding: 5px;
	overflow-y: auto;
	margin-top: 30px;
	height: 415px;
}

.home-mes {
	text-align: center;
	background-color: #f3f3f3;
	padding: 20px;
	border-radius: 15px;
	margin-bottom: 25px;
	font-size: 35px;
}

summary {
	font-size: 50px;
}

/* tab */
.hero {
	width: 100%;
	height: 100vh;
	display: flex;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	overflow: hidden;
}
/* nav 사이즈 */
.tabs {
	flex-basis: 15%;
	background: #99A799;
}
/* content 사이즈 */
.content-box {
	flex-basis: 100%;
	background: #f1f1f1;
}
/* 버튼 속성 */
.tabs button {
	width: 100%;
	height: 20%;
	background: transparent;
	border: none;
	outline: none;
	padding: 18px 30px;
	font-weight: bold;
	font-size: 27px;
	color: #fff;
	cursor: pointer;
	border-radius: 20px 0 0 20px;
}

#tab1 {
	background: #f1f1f1;
	color: #000;
}

#content1, #content2, #content3, #content4, #content5 {
	height: 100%;
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	transform: translateY(100%);
	transition: 0s;
}

.content-text {
	width: 90%;
	height: 85%;
	margin: 10%;
	padding: 3%;
	background-color: #ebccae;
	border-radius: 10px;
}

.content-text h1 {
	color: #015247;
	margin-bottom: 30px;
}

.content-text p {
	font-size: 13px;
}

#content1 {
	transform: translateY(0%);
}

#logout-center {
	position: fixed;
	justify-content: center;
	/* left: 25%;  */
	top: 20%;
	width: 75%;
	height: 70%;
	background-color: #ADC2A9;
}

#logout-contnet1 {
	background-color: #FEF5ED;
	padding: 10px;
	border-radius: 15px;
	top: 3%;
	left: 3%;
	width: 40%;
	height: 90%;
	text-align: center;
	margin: 10px;
	position: absolute;
	/* overflow-y: scroll; */
	overflow-y: auto;
	scrollbar-width: none;
}

#logout-contnet2 {
	background-color: #FEF5ED;
	padding: 10px;
	border-radius: 15px;
	top: 3%;
	right: 3%;
	width: 40%;
	height: 90%;
	text-align: center;
	margin: 10px;
	position: absolute;
	overflow-y: auto;
	scrollbar-width: none;
}
/* #list-group{
    padding: 3%;
    overflow-y: auto;
    height: 550px;
    margin-top: 1%;
} */

/* calendar */
#calendar {
	background-color: #fff;
	border-radius: 5%;
	padding: 20px;
}

/* User info */
.container {
	background: #fff;
	/* width: 1000px; */
	/* max-width: 100%; */
	/* height: calc(100vh - 40px); */
	/* margin: 0 auto;
   
  border-radius: 20px;
  box-shadow: 2px 5px 20px rgba(119,119,119,.5); */
	/* box-shadow: 0 1px 1px 0 rgba(0,0,0,0,06),0 2px 5px 0 rgba(0,0,0,0,06); */
	/* position: fixed; */
	justify-content: center;
	left: 50%;
	top: 20%;
	display: flex;
	height: 550px;
	/* position: relative; */
	/* padding: 40px 50px 40px 40px; */
	/* display: flex;
  left: 78px;
  transition: all 0.5s ease; */
}

.container .text {
	font-size: 25px;
	font-weight: 500;
	column-rule: var(- -bg_color);
	margin: 50px;
}
/* 회원정보 수정 */

/* .input-box span{
  color: #777;
  /* font-size: 20px;
  letter-spacing: 1px;
  margin-left: 2px;
  margin-top: 10px;
} */
.user_info {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 45px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
	border-radius: 20px;
	border: 1px solid #ccc;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}
/* 입력란 */
/* .input-box input{
  height: 45px;
  width: 40%;
  outline: none;
  border-radius: 20px;
  border: 1px solid #ccc;
  padding-left: 15px;
  font-size: 16px;
  margin-top: 30px;            
  padding: 0 24px; */
/* margin-left: 50px; */
/* margin-left: auto;
  margin-right: auto; 
}*/

/* 정보수정 버튼 */
.btn input {
	border-radius: 20px;
	text-transform: uppercase;
	border: 0;
	font-size: 15px;
	color: #fff;
	background: #ADC2A9;
	padding: 7px 15px;
	box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, .2);
	cursor: pointer;
	width: 40%;
	margin-bottom: 0px;
	margin: 0 auto;
	display: block;
	height: 45px;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
}
/* 왼쪽칸 */
.container .leftSide {
	position: relative;
	flex: 50%;
	background: #fff;
}
/* 오른쪽칸 */
.container .rightSide {
	position: relative;
	flex: 50%;
	background: #FEF5ED;
	border-right: 1 px solid rgba(0, 0, 0, 0, 06);
}

.rightSide h1 {
	margin-top: 30px;
	text-align: center;
	color: #99A799;
}
/* 프로필 */
.profile-box {
	text-align: center;
}

.profile {
	width: 200px;
	border-radius: 50%;
	background: #C7D36F;
	padding: 6px;
	margin-top: 70px;
}

h2 {
	margin-top: 20px;
}

.profile-box p {
	margin-top: 10px;
}

.profile-bottom {
	background: #ADC2A9;
	color: #73777B;
	padding: 10px 0;
	margin-top: 10px;
	/* margin-bottom: -40px; */
	border-radius: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
	box-shadow: 2px 5px 20px rgba(119, 119, 119, .5);
}
/* .input-bottom{
  text-align: center;
} */
#content {
	/* padding: 10px 0; */
	/* margin-top: 10px; */
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}

#cap-id {
	font-size: 40px;
}
</style>
</head>
<body>
	<div>
		<div id="myDIV" class="to-header">
			<!-- <h2>My To Do List</h2> -->
			<input type="hidden" id="mem_id" value="${loginVO.mem_id}"> <input
				type="text" id="myInput" placeholder="추가">
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
 			console.log(res[0].title);
 			console.log($("#mem_id").val());
 			
 			$('#myUL').html('');
 			for (let i = 0; i < res.length; i++) {
 				console.log("투두출력자: "+res[i].writer);	
 				 if($("#mem_id").val() == res[i].writer){
 				li = `
 		                  <li class="list">
 		                   ` + res[i].title + `
 		                   <button class="close"> \u00D7 </button>
 		                   <input type="hidden" id="calid" value= ` + res[i].id + `>
 		                  </li>                
 		                  `; 
 					$('#myUL').append(li);	
 		        
 		        	
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
		<!-- <script>
// 닫기 단추를 만들어 각 목록 항목에 추가합니다.
	
var myNodelist = document.getElementsByClassName("list");
var i;
for (i = 0; i < myNodelist.length; i++) {
var span = document.createElement("SPAN");
var txt = document.createTextNode("\u00D7");
span.className = "close";
span.appendChild(txt);
myNodelist[i].appendChild(span);
}


//닫기 버튼을 클릭하여 현재 목록 항목 삭제
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}

// 목록 항목을 클릭할 때 "확인됨" 기호 추가
var list = document.querySelector('#myUL');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
  }
}, false);

// 추가 단추를 클릭할 때 새 목록 항목 만들기
function newElement() {
  var li = document.createElement("li");
  var inputValue = document.getElementById("myInput").value;
  var t = document.createTextNode(inputValue);
  li.appendChild(t);
  if (inputValue === '') {
    alert("작성해주세요!");
  } else {
    document.getElementById("myUL").appendChild(li);
  }
  document.getElementById("myInput").value = "";

  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  li.appendChild(span);
  li.className="list";

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
  }
}

</script> -->
</body>
</html>
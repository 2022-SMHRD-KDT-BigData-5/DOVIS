<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dovis</title>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/chat.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> <!-- alert -->

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
			<div class="container">
				<div class="text">
					<!-- 채팅 창-->
					<div class="panel-body" align="center">
						<div class="ChatWrapper">
							<div id="Chatting"></div>

								<div class="form-group">
									<!-- <label class="control-label col-sm-2" for="talker">사용자:</label> -->
									<div class="col-sm-8">
										<%-- <span> ${loginVO.mem_id} </span> --%>
										<input type="hidden" class="form-control" id="talker"
											value="${loginVO.mem_id}" name="talker"> <input
											type="hidden" class="form-control" id="talker_n"
											value="${loginVO.mem_name}" name="talker_n"> <input
											type="hidden" class="form-control" id="talker_info"
											value="${loginVO.mem_name} ${loginVO.mem_dept} ${loginVO.mem_position}"
											name="talker_info">
										<%-- <input type="text" class="form-control" id="talker" value="${loginVO.mem_id}"
                                    name="talker"> --%>
										<input type="hidden" id="modal" name="popup">
									</div>
									<!-- <button id="eCheck" class="btn btn-success col-sm-2">이름확인</button> -->

								<div class="form-group">
									<!-- <label class="control-label col-sm-2" for="talk">Content:</label> -->
									<div class="col-sm-10">
										<input type="text" class="form-control"
											placeholder="메세지를 입력하세요." id="talk" name="talk"
											onkeyup="enterkey()">
										<button class="btn btn-info" id="sendMsg">전송</button>


										<a href="javascript:openModal('modal1');"></a>
									</div>
								</div>
								<!-- 수정 됨 그대로 두기 -->
								<!-- <div class="form-group">
                        <button class="btn btn-info" id="sendMsg">전송</button>
                        
                        
                        <a href="javascript:openModal('modal1');"
                            ></a>
                    </div> -->
								<!-- 수정됨!!!!!!!!!! -->
								<div id="modal"></div>
								<div class="modal-con modal1">
									<a href="javascript:;" class="close">X</a>
									<p class="title">📃일정을 등록하시겠습니까?</p>
									<div class="con">
										<!-- 	 <iframe id="iframe1" name="iframe1" style="display:none"></iframe> -->
										<!-- 	<form action ='insertSchedule.do' method="post"id="cate"  > -->
										<!-- 	<input type="text" value="" name="category" placeholder="회의분류">
                        <input type="submit" value="스케쥴등록 ">  -->

										<table>
											<tr>
												
												<td id="adds" colspan="2"></td>
											</tr>
											<tr>
												<td class="cate" width="90px">회의분류</td>
												<td><select id="add1">
												</select></td>
											</tr>
											<tr>
												<td class="cate">타이틀</td>
												<td id="add2"></td>
											</tr>
											<tr>
												<td class="cate">이름</td>
												<td id="add3"></td>
											</tr>
											<tr>
												<td class="cate">장소</td>
												<td id="add4"></td>
											</tr>
											<tr>
												<td class="cate">날짜</td>
												<td id="add5"></td>
											</tr>
											<tr>
												<td id="add6" colspan="2"></td>
											</tr>
											<!-- 수정됨!!!!!!!!! -->
											<!-- <tr>
                        <td><input type="text" value="${loginVO.mem_id}" name="writer">
                        <td> <select id="add1">
                         
                        
                             </select>
                        </td>
                        <td id="add2"></td>
                        <td id="add3"></td>
                        <td id="add4"></td>
                        <td id="add5"></td>
                        <td id="add6"></td>
                        </tr> -->
										</table>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		let btn = document.querySelector("#btn");
		let sidebar = document.querySelector(".sidebar");

		btn.onclick = function() {
			sidebar.classList.toggle("active");
		}
	</script>

		<script type="text/javascript">
			// 웹소켓
			let websocket;
			let chat = $('#Chatting');
			let talker;

			let talker_info = $('#talker_info').val();

			let talker_n = $('#talker_n').val();
			// console.log("메제시 함수 화자 이름: "+talker_n)

			var loc, title;

			// 페이지가 로드 되면 websocket과 연결
			$(document).ready(connect)
			$('#sendMsg').on('click', function() {
				sendMessage();
				console.log("메세지 전송");
			});

			// 아래 이메일 확인은 로그인 세션 가져올 거라 필요없음
			// 이메일을 확정해야 사용할 수 있게 설정
			/* $('#eCheck').on("click", emailCheck)
			
			function emailCheck(){
				
				talker = $('#talker').val();
				console.log(talker)
				
				if(talker.length != ''){
					$('#talker').attr('readonly', 'readonly');
					$('#sendMsg').removeAttr('disabled');
				}
				
				
			} */

			//입장 버튼을 눌렀을 때 호출되는 함수
			function connect() {
				// 웹소켓 주소
				var wsUri = "ws://localhost:8080/web/echo.do";
				// 소켓 객체 생성
				websocket = new WebSocket(wsUri);
				//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
				websocket.onopen = onOpen;
				websocket.onmessage = onMessage;
				websocket.onclose = function(evt) {
					console.log(evt);
					console.log("세션종료");
				}
				console.log('연결완료');
				console.log(websocket)
			}

			//웹 소켓에 연결되었을 때 호출될 함수
			function onOpen() {
				console.log("웹소켓이 열렸습니다~");
				// chat.append(talker_n + "님이 입장하셨습니다.");
			}

			// * 1 메시지 전송
			function sendMessage() {

				talker = $('#talker').val();
				talker_info = $('#talker_info').val();
				console.log("메제시 함수 화자: " + talker)
				console.log("메제시 함수 화자 이름: " + talker_n)
				console.log("메제시 함수 화자 정보: " + talker_info)

				// email과 content를 가져오기!
				const data = {
					"talker" : talker,
					"talk" : talker_n + ':' + $('#talk').val()
				};

				// JSON.stringify() : json 문자열로 변환함 
				let jsonData = JSON.stringify(data);

				websocket.send(jsonData);
				console.log("메세지 보내기");

				// 대화창 비우기
				$('#talk').val("");

			}

			// 엔터로 채팅 전송
			function enterkey() {
				if (window.event.keyCode == 13) {
					sendMessage();
				}
			}

			// * 2 메세지 수신
			function onMessage(evt) {
				if (evt.data.includes("join this socket")) {
					// 단순히 채팅방에 연결된 경우
					chat.append($('#talker_n').val() + " 님 환영합니다.")
				} else {
					let bt = document.createElement('button');
					let pf = document.createElement('button');
					let smsg = document.createElement('span');
					let pid = document.createElement('input');
					let brr = document.createElement('br');
					// Div 생성하고, 글자 집어넣기~
					let textDiv = document.createElement('div');
					// 메세지만
					let newText = document
							.createTextNode(evt.data.split(":")[2].trim());
					// 이름만
					let pfc = document.createTextNode(evt.data.split(":")[0, 1]
							.trim());
					// 아이디만
					let oid = document.createTextNode(evt.data.split(":")[0]
							.trim());
					textDiv.appendChild(pf);
					textDiv.appendChild(brr);
					pf.appendChild(pfc);
					pid.type = "hidden";
					pid.value = evt.data.split(":")[0].trim();
					//textDiv.appendChild(newText);
					smsg.appendChild(newText);
					textDiv.appendChild(smsg);
					textDiv.appendChild(pid);
					textDiv.appendChild(bt);
					bt.className += 'inTalk';
					pf.className += 'profile';
					//pf.className += 'profile_' +evt.data.split(" : ")[0];
					//pf.value(evt.data.split(" : ")[0]);
					smsg.className += 'talk_txt';
					pid.className += 'cid';
					textDiv.className += 'talk';
					console.log("evt.data 스플릿전 확인용: " + evt.data);
					//putpfc(evt);

					// 사용자 구분해서 좌우 정렬
					if (evt.data.split(" : ")[0] == talker) {
						textDiv.className += ' my';
					} else {
						textDiv.className += ' others';
					}

					// div화면에 추가하기
					chat.append(textDiv);

				}
			}

			// div 바로 클릭 테스트
			/* 	    window.onload = function(){
			 let tl = document.getElementsByClassName("talk my");
			 tl.onclick = inputlog();
			 }
			
			 function inputlog() {
			 console.log('되는지 확인');
			 } */
			// 프로필 클릭 테스트
			function putpfc(evt) {
				let pfs = document.getElementsByClassName('profile_'
						+ evt.data.split(" : ")[0]);
				pfs.onclick = pfc;

			}

			function pfc() {
				console.log('프로필클릭확인');
			}

			// 특정 채팅 로그 클릭해서 디비로 보내기
			$(document).on("click",".inTalk",function() {

								console.log($(this).parent().text());
								console.log("접속자 : " + talker);
								console.log("접속자 이름 : " + talker_n)
								console.log("채팅 : " + $(this).parent().text());
								console.log("채팅 화자 : "
										+ $(this).siblings("button").text());
								console.log("채팅 내용 : "
										+ $(this).siblings(".talk_txt").text());
								//console.log("채팅 화자: "+ $(this).parent().text().split("  ")[0]);
								//console.log("채팅 내용: "+ $(this).parent().text().split("  ")[1]);

								$.ajax({data : {
										talker : talker,
										talk : $(this).siblings(".talk_txt").text()
											},
										url : "insertChatLog.do",
										type : "post",
										//dataType : "text",
										context : this,
										success : function(res) {
										console.log("등록한 채팅 로그 : "	+ $(this).siblings(".talk_txt").text());
										document.getElementsByClassName("modal-con modal1").innerHTML = "";
										openModal('modal1');
											},
										error : function(e) {
											alert("통신실패!");
											}
										})

							});

			//딥러닝 flask ajax연결(개체명인식)
			$(document).on("click",	".inTalk",function() {
								$.ajax({data : {
										talk : $(this).siblings(".talk_txt").text()
											},
										url : "http://localhost:9000/ner",
										type : "post",
										dataType : "json",
										context : this,
										success : function(res) {
											console.log(res);
											var res_date = JSON.stringify(res.날짜).replace('"', '')
												var month = res_date.substring(0, res_date.indexOf('월'));
												console.log("day 확인 : "	+ res_date.substring(res_date.indexOf('월') + 1,	res_date.indexOf('일')));
												var day = res_date.substring(res_date.indexOf('월') + 1,	res_date.indexOf('일'));
												var date = "";
												console.log("월 : " + month);
												console.log("일 : " + day);

												if (month.length == 1) {
													date += "0";
													date += month;
													date += "-";
												} else {
													date += month;
													date += "-";
												}
												if (day.length == 1) {
													date += "0";
													date += day;
												} else {
													date += day;
												}

												res_str = "2022-";
												res_str += date;

												console.log(res_str)

												pms_time = "";
												var res_time = JSON.stringify(
														res.시간)
														.replace('"', '')
														.replace('"', '');
												console.log(res_time)
												var time = res_time.substring(
														0, res_time
																.indexOf('시'));
												console.log(time);

												if (time.length == 1) {
													pms_time += "T0";
													pms_time += time;
													pms_time += ":00:00"

												} else {
													pms_time += "T";
													pms_time += time;
													pms_time += ":00:00"
												}
												console.log(pms_time);
												res_str += pms_time;
												console.log(res_str);

												var loc = res.기관명 + res.지명;
												console.log(loc);

												$("#add3")
														.append(
																'<input type="text" id="at_name" name="at_name" placeholder="이름" value='+ res.인명 +'>')
												$("#add4")
														.append(
																'<input type="text" id="loc" name="loc_name" placeholder="장소" value='+ loc +'>')
												$("#add5")
														.append(
																'<input type="datetime-local" id="date" name="start" placeholder="날짜" value='+ res_str +'>')
												$("#add6")
														.append(
																'<button class="insertKeys">스케쥴등록</button>')

											},

											error : function(request, status,
													error) {

												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);

											}
										})

							});

			//flask <-> ajax 서로통신하게 만드는 이벤트(머신러닝 회의분류)

			$(document).on("click",".inTalk",function() {

								$.ajax({data : {
										talk : $(this).siblings(".talk_txt").text()
											},
										url : "http://localhost:9009/classify",
										type : "post",
										dataType : "json",
										context : this,
										success : function(res) {
										console.log(res);
										var title;
										$("#adds").append('<input type="hidden" value="${loginVO.mem_id}" id ="writer" name="writer" >')
											if (res == "0") {
												//res='외부회의';
											title = '외부회의';
											console.log(title);
											$("#add1").append('<option value='+ res + 'name="groupId" id="groupids">외부회의</option>')
											$("#add2").append('<input type="text" id="people" name="title" placeholder="타이틀" value=['+ title +']>')
											} 
											else if (res == "1") {
												$("#add1").append('<option value='+ res + 'name="groupId" id="groupids">내부회의</option>')
												$("#add2").append('<input type="text" id="people" name="title" placeholder="타이틀" value=['+ title +']>')
													title = '내부회의';
													console.log(title);

												} 
											else if (res == "2") {
													$("#add1").append('<option value='+ res + 'name="groupId" id="groupids">제출</option>')
													$("#add2").append('<input type="text" id="people" name="title" placeholder="타이틀" value=['+ title+']>')
													title = '제출';
													console.log(title);

												}

												// $("#add1").append('<input type="text" id="cate" name="reg" placeholder="회의유형" value='+res+'>')

											},

											error : function(request, status,
													error) {

												alert("code:" + request.status
														+ "\n" + "message:"
														+ request.responseText
														+ "\n" + "error:"
														+ error);

											}
										})

							});

			//모달 등록버튼 클릭시 db에 저장
			$(document)	.on("click",".insertKeys",function() {

								// 디비에 보낼 때 라벨링한 숫자로 다시 변환
								let grids = $("#groupids").text();

								if (grids == "외부회의") {
									grids = "0";
								} else if (grids == "내부회의") {
									grids = "1";
								} else if (grids == "제출") {
									grids = "2";
								}

								schedule = {
									'groupId' : grids,
									'at_name' : $("#at_name").val(),
									'loc_name' : $("#loc").val(),
									'start' : $("#date").val(),
									'writer' : $("#writer").val(),
									'title' : $("#people").val()
								};

								console.log(schedule);
								$.ajax({
										data : {
										jsonsch : JSON.stringify(schedule)
											},
										url : "insertSchedule.do",
										type : "post",
											/* dataType:"json", */
										success : function(res) {
										console.log(res)
										document.getElementsByClassName("modal-con modal1").innerHTML = "";
										if (Swal.fire({
											         title: "등록되었습니다",
											         confirmButtonText: '확인',
											         confirmButtonColor: '#3085d6',
											    })
											    );
												console.log("close_modal 진입전");

												function close_modal(modalname) {
													console.log("close_modal 진입성공!");
													$('.modal1').hide();
		
				       };
				       
				        close_modal('modal1');
					},
					

					
					error: function(request, status, error){
						
						
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

						}							
				

			       	})
				});

	   
	   
		
     
	   
	   //modaltest
        
		function openModal(modalname){
			  document.get
			  $("#modal").fadeIn(300);
			  $("."+modalname).fadeIn(300);
			}
		
		
		$("#modal, .close").on('click',function(){
			  $("#modal").fadeOut(300);
			  $(".modal-con").fadeOut(300);
			  
			});
		
		
	   
	   // 클릭해서 프로필 조회 sibiling input cid
	   $(document).on("click", ".profile", function(){ 
		    console.log("채팅 화자 아이디: "+ $(this).siblings("input").val());
		    // 아이디를 보내서 정보 조회
		    $.ajax({
        		data: {mem_id: $(this).siblings("input").val()},
        		url: "check.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				   			
    				//console.log("조회 멤버 ID: "+$(this).siblings("input").val());
    				console.log("조회: "+ res[0].mem_name);
    				//console.log(${checkP.mem_name} + ${checkP.mem_dept} + ${checkP.mem_position});
    				//swal( " 이름: " +res[0].mem_name + "\n부서: " + res[0].mem_dept + "\n직급: " + res[0].mem_position);
    				Swal.fire({
				        title: " 이름: " +res[0].mem_name + "\n부서: " + res[0].mem_dept + "\n직급: " + res[0].mem_position,
				        confirmButtonText: '확인',
				        confirmButtonColor: '#3085d6',
				    });
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		}) 
		    
    		
    		
    		
        	/* console.log($(this).parent().text());
        	console.log("접속자: "+talker);
        	console.log("접속자 이름: "+talker_n)
        	console.log("채팅: "+ $(this).parent().text());
        	console.log("채팅 화자 아이디: "+ $(this).siblings("input").val());
        	console.log("채팅 내용: "+ $(this).siblings(".talk_txt").text()); */
        	//console.log("채팅 화자: "+ $(this).parent().text().split("  ")[0]);
        	//console.log("채팅 내용: "+ $(this).parent().text().split("  ")[1]);
        	
        	/* $.ajax({
        		data: {talker: talker, talk : $(this).siblings(".talk_txt").text()},
        		url: "insertChatLog.do",
        		type: "post",
    			//dataType : "text",
    			context : this, 
    			success: function(res){
    				console.log("등록한 채팅 로그: "+$(this).siblings(".talk_txt").text());
    				alert("등록했습니다.");
    				
    			},
    			error: function(e){
    				alert("통신실패!");
    			} 
    		}) */
        	
        	
        });
	    
		//	     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    /* window.setInterval(function() {
	        let elem = document.getElementById('Chatting');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
	    */
	
	</script>
</body>
</html>
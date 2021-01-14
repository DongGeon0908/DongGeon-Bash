<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#test_btn {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#btn_group button {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 2px;
}

#btn_group button:hover {
	color: white;
	background-color: skyblue;
}
</style>


<meta charset="UTF-8">
<title>⌨ Console ⌨</title>
</head>
<%
String address = request.getRemoteAddr();
%>


<body bgcolor='#F6E9E8'>
	<h2>My Ip Address : <%=address %></h2>
	<textarea id="messageTextArea" class="input-text" name="history" rows="11" cols="246"
		style="resize: none;"></textarea>
	<textarea id="textMessage" name="inputText" rows="5" cols="246"
		style="resize: none;"></textarea>
	<div id="btn_group">


		<button type="submit" style="float: left;" name="button"
			onclick="sendMessageMain()" id="test_btn" value="enter">Enter</button>
		<button type="submit" style="float: left;"
			name="button" id="test_btn" onclick="clearInput()" value="refresh">Refresh</button>
		<button type="submit" style="float: Right;" name="button"
			id="test_btn" value="change3">Change 3</button>
		<button type="submit" style="float: Right;" name="button"
			id="test_btn" value="change2">Change 2</button>
		<button type="submit" style="float: Right;" name="button"
			id="test_btn" value="change1">Change 1</button>
		<button type="submit" style="float: Right;" name="button"
			id="test_btn" value="changeMain">ChangeMain</button>
	</div>
 	

	<script type="text/javascript">
		// 「WebSocketEx」는 프로젝트 명	
		// 「websocket」는 호스트 명	
		// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
		// 서버의 ip주소 입력해야함
		var webSocket = new WebSocket("ws://192.168.111.128:8080/websocket");

		// 콘솔 텍스트 에리어 오브젝트	
		var messageTextArea = document.getElementById("messageTextArea");

		// WebSocket 서버와 접속이 되면 호출되는 함수	
		webSocket.onopen = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.	
			messageTextArea.value = messageTextArea.value + "Server connect...\n";
		};

		// WebSocket 서버와 접속이 끊기면 호출되는 함수	
		webSocket.onclose = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.	
			messageTextArea.value += "Server Disconnect...\n";
		};

		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수	
		webSocket.onerror = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.	
			messageTextArea.value += "error...\n";
		};

		// WebSocket 서버로 부터 메시지가 오면 호출되는 함수	
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.	
			messageTextArea.value += "Send to Host => " + message.data
					+ "\n";
		};
		
	

		// Send 버튼을 누르면 호출되는 함수	
		function sendMessageMain() {
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득한다.	
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.	
			messageTextArea.value += "Send to Server => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 송신한다.	
			webSocket.send(message.value);
			// 송신 메시지를 작성하는 텍스트 박스를 초기화한다.	
			message.value = "";

		}


		
		// Disconnect 버튼을 누르면 호출되는 함수	
		function disconnect() {
			// WebSocket 접속 해제	
			webSocket.close();
		}

		function clearInput() {

			/* 텍스트박스 지우는 부분 */

			var el = document.getElementsByClassName('input-text');

			for (var i = 0; i < el.length; i++) {
				el[i].value = '';
			}

		}
	</script>
</body>
</html>
- 2021-01-04
```
나만의 원격 드라이버 만들기

--> 웹을 통해 원격으로 들어갈 수 있는 NAS
--> 파일저장 및 Desktop UI 제공




 Telerik UI for JSP


- docker container -> nas01  공유 폴더는 apache tomcat의 share 폴더 --> 컨테이너의 data폴더


사용자 로그인 

서버 선택

서버 프로그래밍 가능한 웹페이지
( 웹을 3분할 -> 왼쪽(기타 기능) 오른쪽(폴더 목록) 아래(Console)

Console 화면 html 변경 -> 윈도우 화면 비율 100%
간단한 css 추가
```

- 2021-01-07
```
웹소켓을 통해서 데이터를 실시간으로 주고받음
--> 웹소켓을 통해 사용자가 입력한 데이터를 서버로 보내면 될듯

@OnMessage
	public void handleMessage(String message) {

		System.out.println("receive from client : " + message);
		// 에코 메시지를 작성한다.
		// String replymessage = "응답메세지!! " + message;
		// 에코 메시지를 콘솔에 출력한다.
		// System.out.println("send to client : " + replymessage);
		// 에코 메시지를 브라우저에 보낸다.
		// return "응답응답return값 : " + replymessage;
	}


매개변수 message를 앞으로 어떻게 사용할지 고려해야함

shellCmd, Reader Ipcontact 메서드 이용해서 Ubuntu로 직접 명령 전달
```


- 2021-01-08
```
웹소켓으로 서버 명령 가능
var webSocket = new WebSocket("ws://192.168.111.128:8080/websocket");

웹소켓 주소 변경 필요		
```

- 2021-01-10
```
명령에 따른 결과값 출력 server to client
-> enter버튼 완료 (websocket이용)
-> clear버튼 완료 (자바스크립트를 이용해 화면지우기)
-> main 서버 적용 완료
```

- 2021-01-11
```
-> client ip 주소 받기 성공
-> client ip search
-> 서버 적용 완료
```

- 2021-01-12
```
docker로 전환하기 위해서 필요한것은 무엇일까?
버튼에서 value값을 뽑아서 해야될까?
아니면 docker 전용 스크립트를 만들어야 하는걸까?
java-> linux 명령 보낼때 cd명령어가 적용되지 않는다.
해당 문제는 쉘스크립트를 통해 처리해야 하는데 어떻게 진행할까?


else if (codeType.equals("python")) {
					codeTestOld = new File("/usr/local/apache/share/codeTest.py");
					if (codeTestOld.exists()) {
						shellCmd("rm -r /usr/local/apache/share/codeTest.py");
					}
					FileWriter codew = new FileWriter("/usr/local/apache/share/codeTest.py");
					codew.write("# -*- coding: utf-8 -*-\n" + code);
					codew.close();

					FileWriter codeMid_python = new FileWriter("/usr/local/apache/share/codeMid_python.sh");
					codeMid_python.write("docker restart " + playDocker + "\n");
					codeMid_python.write(
							"docker exec " + playDocker + " sh -c 'cd data; python3 codeTest.py 2> error.txt'" + "\n");
					codeMid_python.write("docker stop " + playDocker + "\n");
					codeMid_python.close();

					try {
						String playResult = shellCmd("sh ./share/codeMid_python.sh"); // shellcmd로 바로 실행 불가능 그래서
																						// sh파일 먼저 돌림
						playResult = playResult.replace(playDocker, ""); // 알고리즘 코드 실행시 추가적으로 출력되는 문자열

						out.print(playResult);

					} catch (Exception e) {
						out.print(Reader("/usr/local/apache/share/error.txt"));
					}
				}
```



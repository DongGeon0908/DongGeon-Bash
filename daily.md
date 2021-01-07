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
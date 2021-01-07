
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/**
 * Servlet implementation class UsingContainer
 */
@ServerEndpoint("/websocket")
public class UsingContainer extends HttpServlet {
	// WebSocket으로 브라우저가 접속하면 요청되는 함수
	@OnOpen
	public void handleOpen() {
		// 콘솔에 접속 로그를 출력한다.
		System.out.println("client is now connected...");
	}

	// 해당 메서드가 외부로 출력되는 메서드이다.
	// WebSocket으로 메시지가 오면 요청되는 함수
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

	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	@OnClose
	public void handleClose() {
		// 콘솔에 접속 끊김 로그를 출력한다.
		System.out.println("client is now disconnected...");
	}

	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	@OnError
	public void handleError(Throwable t) {
		// 콘솔에 에러를 표시한다.
		t.printStackTrace();
	}

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsingContainer() {
		super();
		// TODO Auto-generated constructor stub
	}


	public static String shellCmd(String command) throws Exception {
		Runtime runTime = Runtime.getRuntime();
		Process process = runTime.exec(command);
		InputStream inputStream = process.getInputStream();

		InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
		BufferedReader bufferReader = new BufferedReader(inputStreamReader);

		String line;
		String result = "";
		if (bufferReader.readLine() != null) {
			while ((line = bufferReader.readLine()) != null) {
				result = result + "<br>" + line;
			}
		} else
			result = "컴파일 오류";

		return result;
	}

	public static String Reader(String fileName) throws IOException {
		BufferedReader bufferReader = new BufferedReader(new FileReader(fileName));
		String result = "";
		while (true) {
			String line = bufferReader.readLine();
			if (line == null)
				break;
			result = result + "<br>" + line;
		}
		bufferReader.close();
		return result;
	}

	public static String getClientIp(HttpServletRequest req) {

		String[] header_IPs = { "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR", "HTTP_X_FORWARDED",
				"HTTP_X_CLUSTER_CLIENT_IP", "HTTP_FORWARDED_FOR", "HTTP_FORWARDED", "X-Forwarded-For",
				"Proxy-Client-IP", "WL-Proxy-Client-IP" };

		for (String header : header_IPs) {
			String ip = req.getHeader(header);

			if (ip != null && !"unknown".equalsIgnoreCase(ip) && ip.length() != 0) {
				return ip;
			}
		}

		return req.getRemoteAddr();

	}

}

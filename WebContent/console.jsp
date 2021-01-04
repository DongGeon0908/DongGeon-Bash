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
<body bgcolor='#F6E9E8'>
	<textarea id="story" name="story" rows="11" cols="246"
		style="resize: none;"></textarea>
	<textarea id="story" name="story" rows="5" cols="246"
		style="resize: none;"></textarea>
	<div id="btn_group">
	<button type="button" style="float: left;" id="test_btn">Enter</button>
	<button type="button" style="float: left;" id="test_btn">Exit</button>
	<button type="button" style="float: left;" id="test_btn">Refresh</button>
	<button type="button" style="float: Right;" id="test_btn">Change 3</button>
	<button type="button" style="float: Right;" id="test_btn">Change 2</button>
	<button type="button" style="float: Right;" id="test_btn">Change 1</button>
	</div>
</body>
</html>
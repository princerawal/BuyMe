<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ask Question</title>
</head>
<body>


<div class="content">
<h1>Submit a new question:</h1>
		<form action="questionsHandler.jsp" method="post">
			<textarea style="font-size: 18pt" rows="1" cols="90" maxlength="250" id="msg" name="question"></textarea> <br>
			<input type="submit" value="Submit">					
		</form>	
	</div>
	<h1><a href="questionSearcher.jsp"> Search for questions</a> </h1>
</body>
</html>
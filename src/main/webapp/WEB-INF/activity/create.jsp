<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach JSP tags etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1>New Activity</h1>
		<form:form method="POST" action="/activity/new" modelAttribute="activityObj" >
			<p>
				Type:
				<form:input type="text" path="type"/>
				<form:errors path="type" />
				Subcategory:
				<form:input type="text" path="subcategory"/>
				<form:errors path="subcategory" />
				Name:
				<form:input type="text" path="name"/>
				<form:errors path="name" />
				Description:
				<form:input type="text-area" path="description"/>
				<form:errors path="description" />
				Location:
				<form:input type="text" path="location"/>
				<form:errors path="location" />
				Images:
				<form:input type="text" path="images"/>
				<form:errors path="images" />
			</p>

			<button>Create</button>
		</form:form>
	</div>
</body>
</html>
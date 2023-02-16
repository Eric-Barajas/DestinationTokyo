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
    <title>Tokyo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<h1> <c:out value="${activity.name}" /> </h1>
		<img class="activitypics" alt="" src="img/${activity.images}">
		<h6><c:out value="${activity.description}" /></h6>
		<p><c:out value="${activity.location}" /></p>
		<h6>
			Number of Comments:
			<c:out value="${number}" /> 
		</h6>
		<hr>
			<h4>Comments</h4>
			<!-- for loop for comments -->
          	<c:forEach var="useraction" items="${useractions}">
          <div>
              <p>
                  <c:out value="${useraction.user.firstName}"/> <c:out value="${useraction.user.lastName}" /> said, 
                  <c:out value="${useraction.comment}" />
                   <c:if test = "${user.id == useraction.user.id}">
         		      <a href="">edit</a>
         		      <a href="">delete</a>
      			  </c:if> 
              </p>
              <hr>
          </div>
      	  	</c:forEach>
      	  <div>
      	  	<hr>
      	  	<form:form method="POST" action="/activity" modelAttribute="userActionObj" >
      	  		<form:input type="hidden" path="user" value="${user.id}" />
      	  		<form:input type="hidden" path="activity" value="${activity.id}" />
				<p>
					Comment:
					<form:input type="text" path="comment"/>
					<form:errors path="comment" />
				</p>
	
				<button>Create</button>
			</form:form>
      	  </div>
      </div>
		
	
<!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
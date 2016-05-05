<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<spring:url value="/"/>" class="navbar-brand">Big Kev's Auto Service Center</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="<spring:url value="/services/"/>">Services</a></li>
				<li><a href="<spring:url value="/appointments/"/>">Appointments</a></li>
				<li><a href="<spring:url value="/schedule/"/>">Schedule</a></li>
				<sec:authorize access="authenticated" var="authenticated"/>
				<c:choose>
					<c:when test="${authenticated}">
						<li>
							<p class="navbar-text">
								Welcome
								<spring:url value="/logout/" var="springLogoutVar"/>
								<c:url value="/logout/" var="clogoutVar"/>
								<spring:url value="/login?logout=true" var="springLogoutViaLoginVar"/>
								
								<sec:authentication property="name"/>
								<a href="${springLogoutVar}">Logout</a>
							</p>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="<spring:url value="/login/"/>">Sign In</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
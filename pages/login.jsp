<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Welcome to SiriusERP.v-1.6 GA</title>
	<%@include file="/common/init.jsp" %>
	<!-- meta tags here -->
</head>
<!-- BEGIN OF BODY -->
<body id="loginbody">
<!-- main containers -->
<div class="lg-r00">
	<div class="lg-r01">
		<div class="lg-r02">
			<div class="lg-r03">
				<div class="lg-r04">
					<div class="lg-about">
						<div>
							<b>Welcome!</b>
							to siriusERP System<br />
							Version 1.6<br />
							&copy;2011
						</div>
					</div>

					<div class="lg-form">
						<form method="post" name="loginForm" id="loginForm" action="<c:url value='/j_spring_security_check'/>">

							<div class="notes">
								Please enter<br />
								your ID and Password to login:
							</div>

							<div class="lg-formarea">
								<table width="200" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><div class="form-label-tiny">User ID</div></td>
									<td><div class="form-value">&nbsp;: <input type="text" name="j_username" class="inputbox" style="width:120px" /></div></td>
								</tr>
								<tr>
									<td><div class="form-label-tiny">Password</div></td>
									<td><div class="form-value">&nbsp;: <input type="password" name="j_password" class="inputbox" style="width:120px" /></div></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><br/>
											<input type="submit" name="s1" value="Login" class="lg-button" />
					  						<input type="reset" name="r1" value="Reset" class="lg-button" />
					  						<br /><br />
					  						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
												<c:set var="message" value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
												<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message=='Bad credentials'}">
													<c:set var="message" value="Please input valid account,${SPRING_SECURITY_LAST_USERNAME} has no validation"/>
												</c:if>
												<span style="color:red;">${message}</span>
											</c:if>
					  						<%-- a href="<c:url value='/page/preparePasswordLocator.htm'/>">Forget Password?</a --%>
									</td>
								</tr>
							  </table>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="left:50;bottom:0;position: absolute;">
<br/>
<a href="<c:url value='/plugins/jsonview.xpi'/>">Plugin JSON View(Firefox)</a>
</div>


</body>
<!-- END OF BODY -->
</html>
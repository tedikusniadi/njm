<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
		<title>Page Not Found</title>
		<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
<!-- /top menu -->


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">

	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/start.htm'/>"><span>Back</span></a>
						</div>

						<div class="main-box" style="height:400px">
						<font color="#FF0000"><strong>PAGE NOT FOUND</strong><br/></font>
				         Sorry, the page doesn't exist. Maybe you have access wrong url<br/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <%@include file="/common/sirius-footer.jsp" %>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

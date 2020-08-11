<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="companystructure.home.htmltitle"/></title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/dialog.js"></script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%"><spring:message code="companystructure.home.linkhelp"/></td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>


	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"></h1>
						<h1 class="page-title"><spring:message code="companystructure.home.title"/></h1>

                        <%@ include file="/filter/organizationFilter.jsp"%>

						 <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
							<tr>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
							</tr>
						</table>
					  	<table class="table-list" cellspacing="0" cellpadding="0">
						<tr>
							<th><spring:message code="companystructure.home.th.code"/></th>
							<th><spring:message code="companystructure.home.th.name"/></th>
							<th><spring:message code="companystructure.home.th.note"/></th>
						</tr>
						<c:forEach items="${organizations}" var="structure">
						<tr>
							<td>${structure.code}</td>
							<td>${structure.firstName} ${structure.middleName} ${structure.lastName}</td>
							<td>${structure.note}</td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
						</table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
						<tr>
							<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
						</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<%@ include file="/common/dialog.jsp"%>
</div>
</body>
<!-- END OF BODY -->
</html>

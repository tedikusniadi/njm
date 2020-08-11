<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
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
						<h1 class="page-title">${pageTitle}</h1>
						<br/>

						<strong>Reference :</strong>
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
				  	  	  <th width="4%"><div style="width:20px"></div></th>
	  	  	  	  	  	  <th width="11%">Date</th>
                          <th width="23%">ID</th>
                          <th width="23%">Customer</th>
  	  	  	  	  	  	  <th width="62%">Note</th>

						</tr>
						<c:forEach items="${returables}" var="returable">
						<tr>
							<td class="tools">
								<a class="item-button-edit" href="<c:url value='/page/salesreturnpreadd2.htm?id=${returable.id}'/>" title="Edit"><span>Edit</span></a>
							</td>
                            <td><fmt:formatDate value='${returable.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${returable.code}'/></td>
                            <td><c:out value='${returable.customer.firstName} ${returable.customer.middleName} ${returable.customer.lastName}'/></td>
                            <td><c:out value='${returable.note}'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

 	<%@include file="/common/sirius-footer.jsp" %>

</div>

</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Follow Up History >> Home</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/followUpHistoryFilter.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

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
				<td width="60%">Sales > Follow Up History</td>
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
						<h1 class="page-title">S08 - Follow Up History</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/followuphistorypreadd.htm'/>"><span><spring:message code='new'/></span></a>
										</c:if>
										<div dojoType="Toggler" targetId="filter">
											<a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
										</div>
									</div>
								</td>
								<td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
							</table>
							</div>

						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<tr>
							<th width="1%"><div style="width:40px"></div></th>
						  	<th width="10%">Sales Person</th>
						  	<th width="10%">Customer Name</th>
						  	<th width="14%">Tipe Motor</th>
						  	<th width="10%">No Telp 1</th>
						  	<th width="10%">No Telp 2</th>
						  	<th width="10%">Next Follow Up</th>
						  	<th width="10%">Last Follow Up</th>
						  	<th width="10%">Type</th>
						  	<th width="15%">Note</th>
						</tr>
						<c:forEach items="${followUp}" var="follow">
						<c:set var="mobile" value="-"/>
						<c:set var="phone" value="-"/>
						<tr>
							<td class="tools">
								<c:if test='${access.edit}'>
									<a class="item-button-edit" href="<c:url value='/page/followuphistorypreedit.htm?id=${follow.id}'/>" title="Edit"><span>Edit</span></a>
								</c:if>
							</td>
							<td><c:out value="${follow.salesPerson.firstName} ${follow.salesPerson.middleName} ${follow.salesPerson.lastName}"/></td>
							<td><c:out value="${follow.customer.firstName} ${follow.customer.middleName} ${follow.customer.lastName}"/></td>
							<td><c:out value='${follow.product.name}'/></td>
							<c:forEach items="${follow.customer.contactMechanisms}" var="contact">
								<c:if test="${contact.active}">
									<c:if test="${contact.contactMechanismType == 'MOBILE'}">
										<c:set var="mobile" value="${contact.contact}"/>
									</c:if>
									<c:if test="${contact.contactMechanismType == 'PHONE'}">
										<c:set var="phone" value="${contact.contact}"/>
									</c:if>
								</c:if>
							</c:forEach>
							<td><c:out value='${mobile}'/></td>
							<td><c:out value='${phone}'/></td>
							<td><fmt:formatDate value="${follow.nextDate}" pattern='dd-MM-yyyy'/></td>
							<td><fmt:formatDate value="${follow.prevDate}" pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${follow.type.name}'/></td>
							<td><c:out value='${follow.note}'/></td>
						</tr>
						</c:forEach>
						<c:remove var="mobile"/>
						<c:remove var="phone"/>
						<tr class="end-table"><td colspan="10">&nbsp;</td></tr>
						</table>
						<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
							<tr>
								<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file='/common/sirius-footer.jsp' %>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>

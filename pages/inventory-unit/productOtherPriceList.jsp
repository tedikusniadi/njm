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
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/productOtherPriceFilter.jsp"%>
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

						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>

						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
                                    	<c:if test='${access.add}'>
											<a class="item-button-new" href="<c:url value='/page/noticeandservicepreadd.htm?service=true'/>"><span><spring:message code="new"/> Service</span></a>
											<a class="item-button-new" href="<c:url value='/page/noticeandservicepreadd.htm?service=false'/>"><span><spring:message code="new"/> Notice</span></a>
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
							<th width="1%"><div style="width:10px"></div></th>
			  	  	  	  	<th width="2%"></th>
			  	  	  	  	<th width="8%">Date</th>
			  	  	  	  	<th width="20%">Tipe Unit</th>
			  	  	  	  	<th width="69%">Amount</th>
    					</tr>
						<c:forEach items="${prices}" var="price" varStatus="status">
						<c:if test="${price.organization.id != prices[status.index-1].organization.id}">
						<tr>
							<td colspan="5"><c:out value='${price.organization.name}'/></td>
						</tr>
						</c:if>
						<c:if test="${price.type ne type}">
						<tr>
							<td>&nbsp;</td>
							<c:if test="${price.type eq 'CITY'}">
								<td colspan="4">JASA KOTA</td>
							</c:if>
							<c:if test="${price.type eq 'REGION'}">
								<td colspan="4">JASA KABUPATEN</td>
							</c:if>
							<c:if test="${price.type eq 'NOTICE'}">
								<td colspan="4">NOTICE</td>
							</c:if>
							<c:if test="${price.type eq 'NOTICEASTRA'}">
								<td colspan="4">BBN ASTRA</td>
							</c:if>
    						<c:set var="type" value="${price.type}"/>
						</tr>
						</c:if>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><fmt:formatDate value='${price.dateFrom}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${price.unitType}'/></td>
                            <td><fmt:formatNumber value='${price.amount}' pattern='#,###.00'/></td>
						</tr>
						</c:forEach>
						<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>

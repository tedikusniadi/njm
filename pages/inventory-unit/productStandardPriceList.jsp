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
	<%@ include file="/filter/productStandardPriceFilter.jsp"%>
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
											<a class="item-button-new" href="<c:url value='/page/productstandardpricepreadd.htm?type=BUYING&from=UNIT'/>"><span>New Purchase Price</span></a>
											<a class="item-button-new" href="<c:url value='/page/productstandardpricepreadd.htm?type=SELLING&from=UNIT'/>"><span>New Selling Price</span></a>
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
							<th width="1%"><div style="width:30px"></div></th>
			  	  	  	  	<th width="8%">From Date</th>
			  	  	  	  	<th width="12%">Tipe Unit</th>
			  	  	  	  	<th width="12%">Price Type</th>
			  	  	  	  	<th width="12%">Unit Price Type</th>
			  	  	  	  	<th width="10%">Amount</th>
			  	  	  	  	<th width="5%">Currency</th>
    					</tr>
						<c:forEach items="${prices}" var="price" varStatus="status">
						<c:if test="${price.product.productCategory.id eq '1'}">
							<c:if test="${price.organization.id != prices[status.index-1].organization.id}">
							<tr>
								<td colspan="7"><c:out value='${price.organization.name}'/></td>
							</tr>
							</c:if>
							<tr>
								<td>&nbsp;</td>
								<td><fmt:formatDate value='${price.dateFrom}' pattern='dd-MM-yyyy'/></td>
								<td><c:out value='${price.unitType}'/></td>
								<td><c:out value='${price.priceType}'/></td>
								<td>
									<c:if test="${price.unitPriceType eq 'ON_THE_ROAD'}">
										<c:out value='ON THE ROAD'/>
									</c:if>
									<c:if test="${price.unitPriceType eq 'OFF_THE_ROAD'}">
										<c:out value='OFF THE ROAD'/>
									</c:if>
								</td>
	                            <td><fmt:formatNumber value='${price.money.amount}' pattern='#,###'/></td>
	                            <td align="center">${price.money.currency.symbol}</td>
							</tr>
						</c:if>
						</c:forEach>
						<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
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
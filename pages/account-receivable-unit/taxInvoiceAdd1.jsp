<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/filter/taxInvoiceAddFilter.jsp"%>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
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
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
                                	<div class="toolbar-clean">
                                        <div dojoType="Toggler" targetId="filter">
                                		<a class="item-button-list" href="<c:url value='/page/taxinvoiceview.htm'/>"><span>List</span></a>
                                            <a class="item-button-search" href="javascript:return false;"><span><spring:message code="sirius.paging.filter"/></span></a>
                                        </div>
							   		</div>
                                </td>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
                            </tr>
							</table>
					  	</div>
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
							<th width="1%"><div style="width:35px"></div></th>
  	  	  	  	  	  	  	<th width="10%">No. SJ</th>
  	  	  	  	  	  	  	<th width="10%">No. SPK</th>
  	  	  	  	  	  	  	<th width="8%">Tanggal</th>
  	  	  	  	  	  	  	<th width="18%">Pelanggan</th>
                          	<th width="15%">Nama STNK</th>
                          	<th width="12%">Nama Tipe</th>
                          	<th width="12%">Warna</th>
                        </tr>
                        <c:forEach items="${deliveryOrders}" var="delivery">
                        <tr>
                        	<td class="tools">
                        		<a class="item-button-edit" href="<c:url value='/page/taxinvoicepreadd2.htm?deliveryId=${delivery.id}'/>" title="Edit"><span>Edit</span></a>
                        	</td>
							<td nowrap="nowrap">${delivery.code}</td>
							<td nowrap="nowrap"><c:out value='${delivery.deliveryPlanningSequence.deliveryPlanning.planable.code}'/></td>
							<td nowrap="nowrap"><fmt:formatDate value='${delivery.date}' pattern='dd-MM-yyyy'/></td>
							<td><c:out value='${delivery.deliveryPlanningSequence.deliveryPlanning.planable.customer.name}'/></td>
                            <td><c:out value='${delivery.deliveryPlanningSequence.deliveryPlanning.planable.customerUnit.name}'/></td>
                            <td><c:forEach items="${delivery.items}" var="item"><c:if test="${item.sequenced}"><c:set var="orderItem" value="${item}"/></c:if></c:forEach>${orderItem.product.typeNames}</td>
                            <td nowrap="nowrap"><c:forEach items="${delivery.items}" var="item"><c:if test="${item.sequenced}"><c:set var="orderItem" value="${item}"/></c:if></c:forEach>${orderItem.product.colors}</td>
                        </tr>
                        </c:forEach>
                        <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <tr><td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td></tr>
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
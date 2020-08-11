<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>${title}</title>
<%@ include file="/common/sirius-header.jsp" %>
<%@ include file="/common/popup.jsp"%>
<style type="text/css" media="screen">
@import url("<c:url value='/assets/sirius.css'/>");
@import url("<c:url value='/css/jquery-ui.css'/>");
</style>
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

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/refunddealerreportview.htm'/>"><span>List</span></a>
							<a class="item-button-print print"><span>Print</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="refundDealerGroup">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Refund Code :</td>
                                          	<td width="73%">
                                          		<input value="${refundDealerGroup.code}" disabled class='input-disabled' size='25'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Company :</td>
                                          	<td width="73%">
                                          		<input value="${refundDealerGroup.organization.name}" disabled class='input-disabled' size='25'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input id="date" value="<fmt:formatDate value='${refundDealerGroup.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Reference :</td>
                                          	<td><a href="<c:url value='/page/journalentrypreview.htm?id=${refundDealerGroup.journalEntry.id}'/>">${refundDealerGroup.journalEntry.code}</a></td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
									<thead>
									<tr>
									  	<th width="15%">No SPK</th>
									  	<th width="20%">Nama Pemesan</th>
									  	<th width="20%">Leasing</th>
									  	<th width="45%">Total</th>
									</tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${refundDealerGroup.details}" var="order">
									<tr>
										<td><c:out value='${order.unitSalesOrder.code}'/></td>
										<%-- <td><fmt:formatDate value="${order.deliveryOrder.date}" pattern='dd-MM-yyyy'/></td> --%>
										<td><c:out value="${order.unitSalesOrder.customer.name}"/></td>
										<td><c:out value="${order.unitSalesOrder.approvedPaymentLeasing.partyLeasing.name}"/></td>
										<td><fmt:formatNumber value="${order.unitSalesOrder.refundDealer.amount}" pattern=',##0.00'/></td>
									</tr>
									</c:forEach>
		                            </tbody>
		                            <tfoot>
		                            	<tr class="end-table"><td colspan="8">&nbsp;</td></tr>
		                            </tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${dealer_edit.createdBy.firstName} ${dealer_edit.createdBy.middleName} ${dealer_edit.createdBy.lastName}'/> (<fmt:formatDate value='${dealer_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${dealer_edit.updatedBy.firstName} ${dealer_edit.updatedBy.middleName} ${dealer_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${dealer_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
$(function()
{
	$(".print").click(function(){
		window.location="<c:url value='/page/refunddealerreportprint.htm?id=${param.id}'/>";
	});
});
</script>
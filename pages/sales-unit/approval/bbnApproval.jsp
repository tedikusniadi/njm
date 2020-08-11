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
	<script type="text/javascript" src="assets/dialog.js"></script>
	<%@ include file="/filter/bbnApprovalFilter.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
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
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
                                	<div class="toolbar-clean">
                                		<c:if test='${access.add}'>
                                			<a class="item-button-process"><span>Process</span></a>
                                		</c:if>
                                        <div dojoType="Toggler" targetId="filter">
                                            <a class="item-button-search" href="javascript:return false;"><span><spring:message code="sirius.paging.filter"/></span></a>
                                        </div>
							   		</div>
                                </td>
								<td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td>
                            </tr>
							</table>
					  	</div>
					  	<form name="formData" method="post">
                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" width="100%">
                        <thead>
                        <tr>
                            <th width="1%"><div style="width:20px"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></div></th>
                            <th width="12%">No.SPK</th>
                          	<th width="8%">Tanggal</th>
                          	<th width="16%">Nama Pemesan</th>
                          	<th width="16%">Nama STNK</th>
                          	<th width="10%">Tipe</th>
                          	<!-- <th width="10%">Nama Tipe</th> -->
                          	<th width="10%">Warna</th>
                          	<th width="10%">No Mesin</th>
                          	<th width="10%">No Rangka</th>
                          	<th width="8%">Payment</th>
                          	<th width="10%" nowrap="nowrap">Customer</th>
                          	<!-- <th width="10%" nowrap="nowrap">Leasing</th>
                          	<th width="10%" nowrap="nowrap">Sub Leasing</th> -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="count" value="0"/>
                        <c:forEach items="${datas}" var="order" varStatus="status">
                        	<%-- <c:set var="paidAmount" value="0"/>
	                       	<c:forEach items="${order.salesOrderAdapter.unitSalesOrder.items}" var="item">
	                       	<c:if test="${item.price.bbn == 'UNAPPROVED' && item.priceType == 'ON_THE_ROAD'}">
                        	<c:set var="count" value="${count+1}"/>
	                       	<c:if test="${not empty order.salesOrderAdapter.unitSalesOrder.paidAmount}">
                        		<c:set var="paidAmount" value="${order.salesOrderAdapter.unitSalesOrder.paidAmount}"/>
	                       	</c:if>
	                        	<tr>
	                        		<c:if test="${order.salesOrderAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	                        			<c:set var="checkbox" value=""/>
                       					<c:set var="checkbox" value="${(order.salesOrderAdapter.unitPrepayment+paidAmount >= (order.salesOrderAdapter.total*0.9))?'':'disabled'}"/>
                        			</c:if>
	                        		<c:if test="${order.salesOrderAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
                       					<c:set var="checkbox" value=""/>
                       					<c:if test="${order.salesOrderAdapter.prepayment-order.salesOrderAdapter.prepaymentApplication > 0}">
                        					<c:set var="checkbox" value="${(order.salesOrderAdapter.prepaymentApplication+paidAmount >= (order.salesOrderAdapter.prepayment*0.75))?'':'disabled'}"/>
                        				</c:if>
                       					<c:if test="${order.salesOrderAdapter.prepayment-order.salesOrderAdapter.prepaymentApplication == 0}">
                        					<c:set var="checkbox" value=""/>
                        				</c:if>
                        				<c:set var="checkbox" value="${(order.totalAfterPrepayment+paidAmount >= (order.prepayment*0.75))?'':'disabled'}"/>
                        				<c:if test="${order.salesOrderAdapter.subdictionLeasing > 0 && !order.salesOrderAdapter.unitSalesOrder.receipted}">
                        					<c:set var="checkbox" value="disabled"/>
                        				</c:if>
                        			</c:if>
	                        		<td>
	                        			<input id="cek[${count}]" type="checkbox" name="id" value="${order.salesOrderAdapter.unitSalesOrder.id}" ${checkbox}/>
	                        			<input id="cek[${count}]" type="checkbox" name="id" value="${order.salesOrderAdapter.unitSalesOrder.id}"/>
	                        			<input type="hidden" value="${count}" name="cekIdx"/>
	                        		</td>
	                        		<td nowrap="nowrap">${order.salesOrderAdapter.unitSalesOrder.code}</td>
	                        		<td><fmt:formatDate value="${order.salesOrderAdapter.unitSalesOrder.date}" pattern="dd-MM-yyyy"/></td>
	                        		<td>${order.salesOrderAdapter.unitSalesOrder.customer.name}</td>
	                        		<td>${order.salesOrderAdapter.unitSalesOrder.customerUnit.name}</td>
	                        		<td>${item.product.types}</td>
	                        		<td>${item.product.typeNames}</td>
	                        		<td>${item.product.colors}</td>
	                        		<td>${item.price.serial}</td>
	                        		<td>${item.price.serialExt1}</td>
	                        		<td>${order.salesOrderAdapter.unitSalesOrder.unitPayment}</td>
	                        		<td><fmt:formatNumber value='${order.salesOrderAdapter.totalAfterPrepayment}' pattern=',##0.00'/></td>
	                        		<c:if test="${not empty order.billingCustomer}">
		                        		<td><fmt:formatNumber value='${order.billingCustomer.billing.unpaid}' pattern=',##0.00'/></td>
		                        	</c:if>
		                        	<c:if test="${empty order.billingCustomer}">
		                        		<td><fmt:formatNumber value='${order.salesOrderAdapter.totalAfterPrepayment}' pattern=',##0.00'/></td>
		                        	</c:if>
		                        	<c:if test="${not empty order.billingLeasing}">
		                        		<td><fmt:formatNumber value='${order.billingLeasing.billing.unpaid}' pattern=',##0.00'/></td>
		                        	</c:if>
		                        	<c:if test="${empty order.billingLeasing}">
		                        		<td>&nbsp;</td>
		                        	</c:if>
		                        	<c:if test="${not empty order.billingSubLeasing}">
		                        		<td><fmt:formatNumber value='${order.billingSubLeasing.billing.unpaid}' pattern=',##0.00'/></td>
		                        	</c:if>
		                        	<c:if test="${empty order.billingSubLeasing}">
		                        		<td>&nbsp;</td>
		                        	</c:if>
	                        		<c:remove var="checkbox"/>
	                        	</tr>
                        	</c:if>
	                       	</c:forEach> --%>
	                       	
	                       	<c:set var="paidAmount" value="0"/>
	                       	<c:forEach items="${order.unitSalesOrder.items}" var="item">
	                        	<c:set var="count" value="${count+1}"/>
		                       	<%-- <c:if test="${not empty order.unitSalesOrder.paidAmount}">
	                        		<c:set var="paidAmount" value="${order.unitSalesOrder.paidAmount}"/>
		                       	</c:if>
		                       	<c:if test="${order.unitSalesOrder.unitPayment == 'CASH'}">
                        			<c:set var="checkbox" value=""/>
                      				<c:set var="checkbox" value="${(order.unitPrepayment+paidAmount >= order.total)?'':'disabled'}"/>
                       			</c:if>
                        		<c:if test="${order.unitSalesOrder.unitPayment == 'CREDIT'}">
                   					<c:set var="checkbox" value=""/>
                   					<c:if test="${order.prepayment-order.prepaymentApplication > 0}">
                       					<c:set var="checkbox" value="${(order.prepaymentApplication+paidAmount >= order.prepayment)?'':'disabled'}"/>
                       				</c:if>
                      				<c:if test="${order.prepayment-order.prepaymentApplication == 0}">
                       					<c:set var="checkbox" value=""/>
                       				</c:if>
                      				<c:set var="checkbox" value="${order.checkable ? '':'disabled'}"/>
                       			</c:if> --%>
                   				<c:set var="checkbox" value="${order.checkable ? '':'disabled'}"/>
	                        	<tr>
	                        		<td>
	                        			<input id="cek[${count}]" type="checkbox" name="id" value="${order.unitSalesOrder.id}" ${checkbox}/>
	                        			<input type="hidden" value="${count}" name="cekIdx"/>
	                        		</td>
	                        		<td nowrap="nowrap">${order.unitSalesOrder.code}</td>
	                        		<td><fmt:formatDate value="${order.unitSalesOrder.date}" pattern="dd-MM-yyyy"/></td>
	                        		<td>${order.unitSalesOrder.customer.name}</td>
	                        		<td>${order.unitSalesOrder.customerUnit.name}</td>
	                        		<td>${item.product.types}</td>
	                        		<td>${item.product.colors}</td>
	                        		<td>${item.price.serial}</td>
	                        		<td>${item.price.serialExt1}</td>
	                        		<td>${order.unitSalesOrder.unitPayment}</td>
	                        		<td><fmt:formatNumber value='${order.totalAfterPrepayment}' pattern=',##0.00'/></td>
	                        		<c:remove var="checkbox"/>
	                        	</tr>
	                       	</c:forEach>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr class="end-table"><td colspan="11">&nbsp;</td></tr>
                        </tfoot>
                        </table>
                        </form>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
                        <tr><td width="65%" align="right" height="20"><a href="javascript:step('first');"><spring:message code="sirius.paging.first"/></a> | <a href="javascript:step('prev');"><spring:message code="sirius.paging.prev"/></a> | <spring:message code="sirius.paging.page"/> <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');"><spring:message code="sirius.paging.next"/></a> | <a href="javascript:step('last');"><spring:message code="sirius.paging.last"/></a></td></tr>
                        </table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".item-button-process").click(function()
	{
		var total = 0;
		var $cek=$("input[name=cekIdx]");
		$.each($cek,function(idx,elem)
		{
			var i=elem.value;
			if($("#cek\\["+i+"\\]").attr("checked"))
			{
				total++;
			}
		});
		
		if(total == 0)
		{
			alert('Mohon pilih Item yang akan diproses !!!');
			return;
		}
		
		var $dialog_confirm = $('<div title="Konfirmasi Approval Proses"></div>')
		.html('Approval BBN sebanyak '+total+', lanjutkan Approval ?');
		
		$dialog_confirm.dialog({
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Yes": function()
				{
					$( this ).dialog( "close" );
					document.formData.action="<c:url value='/page/bbnapprovalprocess.htm'/>";
					document.formData.submit();
				},
				"No": function()
				{
					$( this ).dialog( "close" );
				}
			}
		});
	});
});

function clickAll()
{
	var checked = false;
	if(document.getElementById("checkMaster").checked == true)
		checked = true;

	var tbl = document.getElementById("lineItemTable");
	if(tbl)
	{
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		for(var idx=len;idx>=0;idx--){
			var cname="cek\\["+idx+"\\]";
			var $chk=$("#"+cname);
			if(!$chk.attr("disabled"))
			{
				if(checked)
					$chk.attr("checked",true);
				else
					$chk.removeAttr("checked");
			}
		}
	}
	else
	{
		alert('Table doesnot exsist!');
	}
}
</script>
</body>
</html>
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
                                		<a class="item-button-process"><span>Process</span></a>
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
                        <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <th width="1%"><div style="width:20px"></div></th>
                            <th width="12%">No.SPK</th>
                          	<th width="8%">Tanggal</th>
                          	<th width="20%">Nama Pelanggan</th>
                          	<th width="12%">Tipe</th>
                          	<th width="12%">Nama Tipe</th>
                          	<th width="10%">No Mesin</th>
                          	<th width="10%">No Rangka</th>
                          	<th width="15%">Pengurus BBN</th>
                        </tr>
                        <c:forEach items="${sales}" var="order" varStatus="status">
	                       	<c:forEach items="${order.unitSalesOrder.items}" var="item">
	                       	<c:if test="${item.price.stnk == 'UNAPPROVED'}">
	                        	<tr>
	                        		<td>
	                        			<input id="cek[${status.index}]" type="checkbox" name="id" value="${item.price.id}"/>
	                        			<input type="hidden" value="${status.index}" name="cekIdx"/>
	                        		</td>
	                        		<td>${order.unitSalesOrder.code}</td>
	                        		<td><fmt:formatDate value="${order.unitSalesOrder.date}" pattern="dd-MM-yyyy"/></td>
	                        		<td>${order.unitSalesOrder.customer.name}</td>
	                        		<td>${item.product.types}</td>
	                        		<td>${item.product.typeNames}</td>
	                        		<td>${item.price.serial}</td>
	                        		<td>${item.price.serialExt1}</td>
	                        		<td>${order.unitSalesOrder.bbn.bbnService.name}</td>
	                        	</tr>
                        	</c:if>
	                       	</c:forEach>
                        </c:forEach>
                        <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
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
		.html('Approval STNK sebanyak '+total+', lanjutkan Approval ?');
		
		$dialog_confirm.dialog({
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Yes": function()
				{
					$( this ).dialog( "close" );
					document.formData.action="<c:url value='/page/stnkapprovalprocess.htm'/>";
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
</script>
</body>
</html>
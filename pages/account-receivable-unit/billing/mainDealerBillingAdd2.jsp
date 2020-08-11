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
                                		<a class="item-button-save"><span>Save</span></a>
							   		</div>
                                </td>
                            </tr>
							</table>
					  	</div>
					  	<form id="addForm" name="addForm" method="post" modelAttribute="billing_add">
                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" width="100%">
                        <thead>
                        <tr>
                            <th width="1%"><!-- <div style="width:20px"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></div> --></th>
                            <th width="12%">Invoice</th>
                          	<th width="15%">No SPK</th>
                          	<th width="25%">Customer</th>
                          	<th width="59%">Unpaid</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${adapters}" var="adapter" varStatus="status">
                        <c:set var="total" value="0"/>
                       	<tr>
                       		<td>
                       			<input id="cek[${status.index}]" type="radio" name="periode" value="${adapter.periode}"/>
                       			<input type="hidden" value="${status.index}" name="cekIdx"/>
                       		</td>
                       		<td colspan="5"><strong>${adapter.periode}</strong></td>
                       	</tr>
	                       	<c:forEach items="${adapter.unitBillings}" var="billing">
                        	<c:set var="total" value="${total+billing.unpaid}"/>
                        	<tr>
                        		<td>&nbsp;</td>
                        		<td>${billing.code}</td>
                        		<td>${billing.unitSalesOrder.code}</td>
                        		<td>${billing.unitSalesOrder.customer.name}</td>
                        		<td><fmt:formatNumber value="${billing.unpaid}"/></td>
                        	</tr>
	                       	</c:forEach>
	                    <tr>
	                    	<td>&nbsp;</td>
	                    	<td colspan="3"><strong>Total</strong></td>
                       		<td><strong><fmt:formatNumber value="${total}"/></strong></td>
                       	</tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                        </tfoot>
                        </table>
                        </form>
                        <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
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
	$(".item-button-save").click(function()
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
		else if(total > 1)
		{
			alert('Item yang akan diproses hanya boleh 1 (satu) saja !!!');
			return;
		}
		
		var $dialog_confirm = $('<div title="Konfirmasi Proses Billing"></div>')
		.html('Proses Billing ?');
		
		$dialog_confirm.dialog({
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Yes": function()
				{
					$( this ).dialog( "close" );
					document.addForm.action="<c:url value='/page/maindealerbillingadd.htm'/>";
					document.addForm.submit();
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
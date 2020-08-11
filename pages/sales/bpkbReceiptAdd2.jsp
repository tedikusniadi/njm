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
	<%@ include file="/filter/bpkbDeliveredAddFilter.jsp"%>
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

						<h1 class="page-title"></h1>
						<h1 class="page-title">${pageTitle}</h1>
						<div class="clears">&nbsp;</div>
						<div class="item-navigator">
							<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">
									<div class="toolbar-clean">
										<a class="item-button-back" href="<c:url value='/page/bpkbreceiptpreadd1.htm'/>"><span>Back</span></a>
										<c:if test='${access.add}'>
											<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
										</c:if>
									</div>
								</td>
								<%-- <td width="70%" align="right" height="20"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td> --%>
							</tr>
							</table>
						</div>
						<form:form id="addForm" name="addForm" method="post" modelAttribute="bpkbReceipt_add">
                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" width="100%">
                        <thead>
						<tr>
							<th width="1%"><div style="width:25px"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></div></th>
						  	<th width="8%">Received Date</th>
						  	<th width="12%">Nama STNK</th>
						  	<th width="12%">Tipe</th>
						  	<th width="12%">Nama Tipe</th>
						  	<th width="12%">No Mesin</th>
						  	<th width="12%">No Rangka</th>
						  	<th width="10%">No BPKB</th>
						  	<th width="20%">Note</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${reports}" var="bpkb" varStatus="status">
						<tr>
							<td>
                      			<input id="cek[${status.index}]" type="checkbox" name="ids" value="${bpkb.id}"/>
                      			<input type="hidden" value="${status.index}" name="cekIdx"/>
                      		</td>
							<td nowrap="nowrap"><fmt:formatDate value="${bpkb.receivedDate}" pattern='dd-MM-yyyy'/></td>
							<td nowrap="nowrap">
								<c:forEach items="${bpkb.price.salesOrderItems}" var="item">
									<c:out value='${item.unitSalesOrder.customerUnit.name}'/>
								</c:forEach>
							</td>
							<td nowrap="nowrap"><c:out value='${bpkb.price.product.types}'/></td>
							<td nowrap="nowrap"><c:out value="${bpkb.price.product.typeNames}"/></td>
							<td nowrap="nowrap"><c:out value='${bpkb.price.serial}'/></td>
							<td nowrap="nowrap"><c:out value='${bpkb.price.serialExt1}'/></td>
							<td nowrap="nowrap"><c:out value='${bpkb.referenceNo}'/></td>
							<td><c:out value='${bpkb.note1}'/></td>
						</tr>
						</c:forEach>
						</tbody>
						<tfoot>
							<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
						</tfoot>
						</table>
						</form:form>
						<%-- <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center" height="20">
							<tr>
								<td align="right"><a href="javascript:step('first');">First</a> | <a href="javascript:step('prev');">Prev</a> | Page <c:out value="${filterCriteria.page}"/> of <c:out value="${filterCriteria.totalPage}"/> | <a href="javascript:step('next');">Next</a> | <a href="javascript:step('last');">Last</a></td>
							</tr>
						</table> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
$(function()
{
	$('.b_save').click(function(e)
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
		
		var $dialog_confirm = $('<div title="Konfirmasi Print Proses"></div>')
		.html('Print BPKB Receipt sebanyak '+total+', lanjutkan Print ?');
		
		$dialog_confirm.dialog({
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Yes": function()
				{
					$( this ).dialog( "close" );
					document.addForm.action="<c:url value='/page/bpkbreceiptadd.htm'/>";
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

		for(var idx=len-1;idx>=0;idx--){
			var cname="cek\\["+idx+"\\]";
			var $chk=$("#"+cname);
			if(checked)
				$chk.attr("checked",true);
			else
				$chk.removeAttr("checked");
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

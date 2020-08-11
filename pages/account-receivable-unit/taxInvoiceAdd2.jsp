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
	<%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-list" href="<c:url value='/page/taxinvoiceview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="taxInvoice_add">
							<table width="100%">
								<tr>
									<td>
										<table width="100%" style="borde:none">
											<c:forEach items="${taxInvoice_add.deliveryOrder.items}" var="item"><c:if test="${item.sequenced}"><c:set var="orderItem" value="${item}"/></c:if></c:forEach>
											<tr>
												<td width="18%" align="right">No Faktur :</td>
												<td width="40%"><form:input id='code' path="code" size="30"/></td>
											</tr>
	                                        <tr>
	                                            <td nowrap="nowrap" align="right">Tanggal :</td>
	                                            <td><input inputId="dateId" id="date" name="date" value="<fmt:formatDate value='${taxInvoice_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
	                                        </tr>
											<tr>
			 									<td align="right">No. SJ :</td>
												<td><input disabled class='input-disabled' value="${taxInvoice_add.deliveryOrder.code}" size="30"/></td>
				 							</tr>
											<tr>
			 									<td align="right">No. SPK :</td>
												<td><input disabled class='input-disabled' value="${taxInvoice_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.code}" size="30"/></td>
				 							</tr>
	                                        <tr>
	                                            <td nowrap="nowrap" align="right">Tanggal SJ :</td>
	                                            <td><input value="<fmt:formatDate value='${taxInvoice_add.deliveryOrder.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="9"/></td>
	                                        </tr>
											<tr>
			 									<td align="right">Nama Pelanggan :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${taxInvoice_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customer.name}"/></td>
				 							</tr>
											<tr>
			 									<td align="right">Nama STNK :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${taxInvoice_add.deliveryOrder.deliveryPlanningSequence.deliveryPlanning.planable.customerUnit.name}"/></td>
				 							</tr>
											<tr>
			 									<td align="right">Nama Tipe :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${orderItem.product.typeNames}"/></td>
				 							</tr>
											<tr>
			 									<td align="right">Warna :</td>
												<td><input disabled class='input-disabled inputbox-ext' value="${orderItem.product.colors}"/></td>
				 							</tr>
	                                        <tr>
	                                            <td align="right">Catatan: </td>
	                               		  	  	<td><form:textarea cols="48" rows="5" path='note' size='50'/></td>
	                                        </tr>
										</table>
									</td>
								</tr>
							</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
<script type="text/javascript">
function validation()
{
	if($("#code").val() == '')
	{
		alert('No Faktur tidak boleh kosong !!!');
		return;
	}
	
	if($("#dateId").val() == '')
	{
		alert('Tanggal tidak boleh kosong !!!');
		return;
	}
	
	return true;
}

$(document).ready(function()
{
	$(".item-button-save").click(function()
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/taxinvoiceadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Tax Invoice data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/taxinvoiceview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		}
	});
});
</script>
</html>

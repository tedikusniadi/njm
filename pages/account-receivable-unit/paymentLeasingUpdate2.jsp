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
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
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

						<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/paymentleasingpreeditone.htm?id=${application.paymentLeasingGroup.id}'/>"><span>Back</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="application">
							<table width="100%" >
								<tr>
									<td>
										<table width="100%" style="borde:none">
											<tr>
												<td width="18%" align="right">No SPK :</td>
												<td width="40%"><input class="input-disabled" disabled value='${application.unitSalesOrder.code}'/></td>
											</tr>
											<tr>
			 									<td align="right">Pemesan :</td>
												<td><input disabled class='input-disabled inputbox-ext' value='${application.unitSalesOrder.customer.name}'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Nama STNK :</td>
												<td><input disabled class='input-disabled inputbox-ext' value='${application.unitSalesOrder.customerUnit.name}'/></td>
				 							</tr>
											<tr>
			 									<td align="right">Alamat STNK :</td>
												<td><input id="license-address" disabled class='input-disabled inputbox-ext'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Fasilitas :</td>
												<td><input disabled class='input-disabled inputbox-ext' value='${application.unitSalesOrder.organization.name}'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tanggal :</td>
												<td><input disabled class='input-disabled' size="10" value='<fmt:formatDate value='${application.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Warna :</td>
												<td><input disabled class='input-disabled inputbox' value='${orderItem.product.colors}'/></td>
				 							</tr>
				 							<tr>
				 								<td align="right"><h1>PO Application</h1></td><td></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tipe Motor :</td>
												<td>
													<input type="text" value="${orderItem.product.types}" disabled class='input-disabled'/>
												</td>
				 							</tr>
				 							<tr>
			 									<td align="right">Uang Muka PO :</td>
												<td><input value="<fmt:formatNumber value='${application.unitSalesOrder.poPrepayment}' pattern=',##0.00'/>" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Angsuran :</td>
												<td><input value="<fmt:formatNumber value='${application.installment}' pattern=',##0.00'/>" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tenor :</td>
												<td><input value="${application.tenor}" disabled class='input-disabled' size="10"/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Harga OTR :</td>
												<td><input value="<fmt:formatNumber value='${application.otrPrice}' pattern=',##0.00'/>" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Subsidi Leasing :</td>
												<td><input value="<fmt:formatNumber value='${subdictionLeasing}' pattern=',##0.00'/>" disabled class='input-disabled'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">No PO :</td>
												<td><input id="no-po" value="${application.poLeasing}" name="poLeasing"/></td>
				 							</tr>
				 							<tr>
			 									<td align="right" valign="top">Keterangan :</td>
												<td valign="top"><textarea cols="30" rows="3" class="input-disabled" disabled>${application.unitSalesOrder.note}</textarea></td>
				 							</tr>
										</table>
									</td>
									<td valign="top" width="35%">
										<fieldset>
											<legend>Status Leasing</legend>
											<table>
											<tr>
			 									<td align="right">Keputusan Leasing :</td>
												<td><input disabled name="date" class='input-disabled' value='${application.status}'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right">Tanggal Keputusan :</td>
												<td><input disabled name="date" class='input-disabled' size="13" value='<fmt:formatDate value="${application.date}" pattern="dd-MM-yyyy"/>'/></td>
				 							</tr>
				 							<tr>
			 									<td align="right" valign="top">Keterangan Tambahan :</td>
												<td valign="top"><textarea cols="30" rows="3" class="input-disabled" disabled>${application.note}</textarea></td>
				 							</tr>
										</table>
										</fieldset>
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
function setCustomerInfo(id,cust)
{
	$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:cust},function(json){
		$("#"+id+"-address").val(json.address);
	});
}

setCustomerInfo("license","${application.unitSalesOrder.customerUnit.id}");

$(document).ready(function()
{
	$(".item-button-save").click(function()
	{
		if($("#no-po").val() == '')
		{
			alert('No PO tidak boleh kosong !!!');
			return;
		}
		else
		{
			$.ajax({
				url:"<c:url value='/page/paymentleasingprocessedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Payment Leasing data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/paymentleasingpreeditone.htm?id=${application.paymentLeasingGroup.id}'/>";
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
<!-- END OF BODY -->
</html>

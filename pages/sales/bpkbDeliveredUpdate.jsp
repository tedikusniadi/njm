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
							<a class="item-button-list" href="<c:url value='/page/bpkbdeliveredview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
							<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/bpkbdeliveredprint.htm?id=${bpkb_edit.id}'/>"><span>Print</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="bpkb_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">No SPK :</td>
                                          	<td width="73%"><input value="${orderItem.unitSalesOrder.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                         <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Customer :</td>
                                          	<td width="73%">
                                          		<input class="inputbox input-disabled" disabled value="${orderItem.unitSalesOrder.customer.firstName} ${orderItem.unitSalesOrder.customer.middleName} ${orderItem.unitSalesOrder.customer.lastName}"/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input id="date" value="<fmt:formatDate value='${orderItem.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tipe :</td>
                                            <td>
                                            	<input value='${orderItem.price.product.types}' disabled class='inputbox input-disabled'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Nama Tipe :</td>
                                            <td>
                                            	<input value='${orderItem.price.product.typeNames}' disabled class='inputbox input-disabled'/>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Warna :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.product.colors}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No Mesin :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.serial}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No Rangka :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.serialExt1}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Payment Type :</td>
		                                    <td>
		                                    	<input value="${orderItem.price.unitPayment}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
		                                <c:if test="${orderItem.price.unitPayment == 'CREDIT'}">
			                                <tr>
			                                    <td nowrap="nowrap" align="right">Leasing :</td>
			                                    <td>
			                                    	<input value="${orderItem.unitSalesOrder.approvedPaymentLeasing.partyLeasing.name}" disabled class='input-disabled inputbox'/>
			                                    </td>
			                                </tr>
		                                </c:if>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Status Nomor BPKB</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="40%"align="right">Tanggal Penyerahan BPKB :</td>
                                                        <td width="60%"><input  value="<fmt:formatDate value='${bpkb_edit.deliveredDate}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nomor BPKB :</td>
                                                        <td><input value="${bpkb_edit.referenceNo}" disabled class='input-disabled' size="40"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Nama Pengambil :</td>
                                                        <td><input value="${stnk_edit.customerName}" size="40" disabled class='input-disabled' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Telp. Pengambil :</td>
                                                        <td><input value="${stnk_edit.phone}" size="40" disabled class='input-disabled' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Keterangan Tambahan :</td>
                                                        <td><textarea id="note" name="note2" cols="29" rows="5">${bpkb_edit.note2}</textarea></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                		</table>
                           	  	  </td>
                                </tr>
                                </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${bpkb_edit.createdBy.firstName} ${bpkb_edit.createdBy.middleName} ${bpkb_edit.createdBy.lastName}'/> (<fmt:formatDate value='${bpkb_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${bpkb_edit.updatedBy.firstName} ${bpkb_edit.updatedBy.middleName} ${bpkb_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${bpkb_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Nomor BPKB',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$('.b_save').hide();
		$.ajax({
			url:"<c:url value='/page/bpkbdeliverededit.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Updating Nomor BPKB data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/bpkbdeliveredview.htm'/>";
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason:<br/>'+json.message);
					}
				}
			}
		});
	});
});
</script>
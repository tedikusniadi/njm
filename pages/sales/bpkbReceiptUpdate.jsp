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
							<a class="item-button-list" href="<c:url value='/page/bpkbreceiptview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save b_save"><span>Save</span></a>
							</c:if>
							<c:if test='${access.print}'>
								<a class="item-button-print print"><span>Print</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="bpkbReceipt_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Kode :</td>
                                          	<td width="73%">
                                          		<input value="${bpkbReceipt_edit.code}" disabled class='input-disabled' size='25'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Nama Leasing :</td>
                                            <td>
                                            	<input value="<c:out value='${bpkbReceipt_edit.leasing.name}'/>" disabled class='input-disabled'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<%-- <input value="<fmt:formatDate value='${bpkbReceipt_edit.dateFrom}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/> -
                                            	<input value="<fmt:formatDate value='${bpkbReceipt_edit.dateTo}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/> --%>
                                            	<input value="<fmt:formatDate value='${bpkbReceipt_edit.date}' pattern='dd-MM-yyyy'/>" disabled class='input-disabled' size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td nowrap="nowrap" align="right">Note :</td>
                                            <td>
                                            	<textarea id="note" name="note" cols="29" rows="5">${bpkbReceipt_edit.note}</textarea>
                                            </td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
                                <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
									<thead>
									<tr>
		                                <th width="1%"><div style="width:10px"></div></th>
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
		                            <c:forEach items="${bpkbReceipt_edit.details}" var="priceDetail">
									<tr>
									<c:if test="${priceDetail.referenceType == 'BPKB'}">
										<td>&nbsp;</td>
										<td nowrap="nowrap"><fmt:formatDate value="${priceDetail.receivedDate}" pattern='dd-MM-yyyy'/></td>
										<td nowrap="nowrap">
											<c:forEach items="${priceDetail.price.salesOrderItems}" var="item">
												<c:out value='${item.unitSalesOrder.customerUnit.name}'/>
											</c:forEach>
										</td>
										<td nowrap="nowrap"><c:out value='${priceDetail.price.product.types}'/></td>
										<td nowrap="nowrap"><c:out value="${priceDetail.price.product.typeNames}"/></td>
										<td nowrap="nowrap"><c:out value='${priceDetail.price.serial}'/></td>
										<td nowrap="nowrap"><c:out value='${priceDetail.price.serialExt1}'/></td>
										<td nowrap="nowrap"><c:out value='${priceDetail.referenceNo}'/></td>
										<td><c:out value='${priceDetail.note1}'/></td>
									</c:if>
									</tr>
									</c:forEach>
		                            </tbody>
		                            <tfoot>
		                            	<tr class="end-table"><td colspan="9">&nbsp;</td></tr>
		                            </tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${bpkbReceipt_edit.createdBy.firstName} ${bpkbReceipt_edit.createdBy.middleName} ${bpkbReceipt_edit.createdBy.lastName}'/> (<fmt:formatDate value='${bpkbReceipt_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${bpkbReceipt_edit.updatedBy.firstName} ${bpkbReceipt_edit.updatedBy.middleName} ${bpkbReceipt_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${bpkbReceipt_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'BPKB Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/bpkbreceiptedit.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/bpkbreceiptview.htm'/>";
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
	$(".print").click(function(){
		window.location="<c:url value='/page/bpkbreceiptprint.htm?id=${param.id}'/>";
	});
});
</script>
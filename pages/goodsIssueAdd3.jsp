<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Issue >> Add</title>
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
			<td width="60%">Inventory > Warehouse Management > Goods Issue > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I25 - Goods Issue</h1>

					  	<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/goodsissuepreadd2.htm?id=${goodsIssue_add.warehouseTransaction.id}'/>"><span><spring:message code="back"/></span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsIssue_add">
							<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsIssue_add.warehouseTransaction.issuedFacility.id}"><c:out value='${goodsIssue_add.warehouseTransaction.issuedFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size='10' class="input-disabled" disabled value="<fmt:formatDate value='${goodsIssue_add.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7" class="input-disabled"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          	<td width="74%">
												<c:if test="${goodsIssue_add.warehouseTransaction.transactionSource == 'DELIVERY_ORDER'}">
                                                	<input value="Delivery Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsIssue_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45'/>
                                                </c:if>
                                          	</td>
                                        </tr>
                                        <tr>
                                        	<td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Issued From :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.issuedFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Destination :</td>
                                          	<td width="74%"><input value="${goodsIssue_add.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Issued</th>
                                                <th width="22%">Issue</th>
                                            </tr>
                                            <c:forEach items='${goodsIssue_add.warehouseTransaction.issueables}' var='rec'>
                                            <tr>
                                            	<td>${rec.product.name}</td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="pro-${rec.product.id}" value="${rec.quantity}"/>
                                                </td>
                                                <td>
                                                	<input id="rec" value="<fmt:formatNumber value='${rec.issued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="rec-${rec.product.id}" value="${rec.issued}"/>
                                                    </td>
                                                <td><input id="unrec-${rec.product.id}" value="<fmt:formatNumber value='${rec.unissued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
                                 <br/>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="15%">Product</th>
	  	  	  	  	  	  			<th width="15%">Tipe</th>
	  	  	  	  	  	  			<th width="10%">Nama Tipe</th>
                                    <th width="15%">Warna</th>
                                    <th width="15%">Grid</th>
                                  	<th width="10%">Issued</th>
                                    <th width="15%">No.Mesin</th>
                                    <th width="15%">No.Rangka</th>
                                    <th width="5%">Tahun</th>
                                    <!-- <th width="10%">UoM</th> -->
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsIssue_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<td>${item.warehouseTransactionItem.product.name}</td>
                                	<td>${item.warehouseTransactionItem.product.types}</td>
                                	<td>${item.warehouseTransactionItem.product.typeNames}</td>
                                	<td>${item.warehouseTransactionItem.product.colors}</td>
                                	<td><input class="input-disabled" size="25" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${item.issued}' pattern=',##0.00'/>"/></td>
                                    <%-- <td><input class="input-disabled" size="20" value="${item.grid.name}" disabled/></td> --%>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
	                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
	                                	<tr>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
		                                    <td>
			                                    <input readonly="readonly" size="18" name="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serial}" id="serial[${status.index}-${detailstatus.index}]"/>
			                                    <%-- <c:if test="${detail.goodsIssueItem.product.productCategory == 1}">
			                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/onhandquantitypopupserialview.htm?id=${item.warehouseTransactionItem.product.id}&organization=${org.id}&facility=${goodsIssue_add.warehouseTransaction.issuedFacility.id}&target=serial[${status.index}-${detailstatus.index}]'/>");' style="CURSOR:pointer;" title="Popup Serial" />
		                                    	</c:if>
		                                    	<c:if test="${detail.goodsIssueItem.product.productCategory == 3}">
			                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/onhandquantitypopupserialaccessoriesview.htm?id=${item.warehouseTransactionItem.product.id}&organization=${org.id}&facility=${goodsIssue_add.warehouseTransaction.issuedFacility.id}&target=serial[${status.index}-${detailstatus.index}]'/>");' style="CURSOR:pointer;" title="Popup Serial" />
		                                    	</c:if> --%>
		                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/onhandquantitypopupserialview.htm?id=${item.warehouseTransactionItem.product.id}&organization=${org.id}&facility=${goodsIssue_add.warehouseTransaction.issuedFacility.id}&target=serial[${status.index}-${detailstatus.index}]&pdi=true'/>");' style="CURSOR:pointer;" title="Popup Serial" />
		                                    </td>
		                                    <td><input readonly="readonly" size="18" name="items[${status.index}].details[${detailstatus.index}].serialExt1" value="${detail.serialExt1}" id="serial[${status.index}-${detailstatus.index}]2"/></td>
		                                    <td><input readonly="readonly" size="6" name="items[${status.index}].details[${detailstatus.index}].year" value="${detail.year}" id="serial[${status.index}-${detailstatus.index}]3"/></td>
		                                    <%-- <td><input class="input-disabled" size="10" value="${item.warehouseTransactionItem.measureName}" disabled/></td> --%>
		                                </tr>
	                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                </table>
							</form:form>
						</div>
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
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Issue',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsissueadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Goods Issue data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsissueview.htm'/>";
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

	function opengrid(target)
	{
		var fac = document.getElementById('facility');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Goods Receipt >> Add</title>
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
			<td width="60%">Inventory > Warehouse Management > Goods Receipt > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I23 - Goods Receipt</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt_add">
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
                                                	<option value="${goodsReceipt_add.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt_add.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${goodsReceipt_add.date}' pattern="dd-MM-yyyy"/>" class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7" disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
                                          		<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'UNIT_PURCHASE_ORDER'}">
                                                	<input value="Unit Purchase Order" class='input-disabled' size='45'/>
                                                </c:if>
												<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'PURCHASE_ORDER'}">
                                                	<input value="Purchase Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45'/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
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
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${goodsReceipt_add.warehouseTransaction.receiptables}' var='rec'>
                                            <tr>
                                            	<td>${rec.product.name}</td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="pro-${rec.product.id}" value="${rec.quantity}"/>
                                                </td>
                                                <td>
                                                	<input id="rec" value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="rec-${rec.product.id}" value="${rec.receipted}"/>
                                                    </td>
                                                <td><input id="unrec-${rec.product.id}" value="0.00" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>

                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="20%">Product</th>
	  	  	  	  	  	  			<th width="12%">Tipe</th>
	  	  	  	  	  	  			<th width="15%">Nama Tipe</th>
                                    <th width="12%">Warna</th>
	  	  	  	  	  	  			<th width="12%">Grid</th>
                                  	<th width="10%">Jumlah</th>
                                    <th width="15%">Satuan/No.Mesin</th>
                                    <th width="15%">No.Rangka</th>
                                    <th width="15%">Tahun</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsReceipt_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.name}" disabled/></td>
                                	<td><input class="input-disabled" size="15" value="${item.warehouseTransactionItem.product.types}" disabled/></td>
                                	<td><input class="input-disabled" size="18" value="${item.warehouseTransactionItem.product.typeNames}" disabled/></td>
                                	<td><input class="input-disabled" size="15" value="${item.warehouseTransactionItem.product.colors}" disabled/></td>
                                	<td><input class="input-disabled" size="12" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/>"/></td>
                                    <td><input class="input-disabled" size="7" value="${item.warehouseTransactionItem.measureName}" disabled/></td>
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
		                                    <td><input class="" size="18" name="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serialExt1}" id="serial[${status.index}-${detailstatus.index}]"/>
		                                    <c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
		                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/goodsissuedetailpopup.htm?id=${item.warehouseTransactionItem.id}&target=serial[${status.index}-${detailstatus.index}]'/>");' style="CURSOR:pointer;" title="Popup Serial" /></td>
		                                    </c:if>
		                                    <td><input class="" size="18" name="items[${status.index}].details[${detailstatus.index}].serialExt1" value="${detail.serial}" id="serial[${status.index}-${detailstatus.index}]2"/></td>
		                                    <td><input class="" size="5" name="items[${status.index}].details[${detailstatus.index}].year" value="${detail.year}" id="serial[${status.index}-${detailstatus.index}]3"/></td>
		                                </tr>
	                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Goods Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptview.htm'/>";
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
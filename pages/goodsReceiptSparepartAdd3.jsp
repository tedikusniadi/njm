<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
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
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptsparepartview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="65%">
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
                                          	<td nowrap="nowrap" align="right">Due Date :</td>
                                            <td><input value="<fmt:formatDate value='${goodsReceipt_add.dueDate}' pattern="dd-MM-yyyy"/>" class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right" valign="top">Note :</td>
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
                                        <tr>
		                                    <td align="right">Discount Type : </td>
		                                    <td>
		                                        <select id='discountType' name='discountType' onchange="display();">
		                                        	<option value="CURRENCY">RP</option>
		                                        	<option value="PERCENT">%</option>
		                                        </select>
		                                    </td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="35%" valign="top" align="left">
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
                                        <div>&nbsp;</div>
                                        <fieldset>
                                       		<legend><strong>Transaction</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                            	<th width="60%">&nbsp;</th>
                                           	  <th width="20%"><div id="trx">Amount</div></th>
                                           	  <th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Purchase : </td>
                                                <td><input id="purchase" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="purchaseDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Discount 1 : </td>
                                                <td><input id="discAmount1" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="discAmount1Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Discount 2 : </td>
                                                <td><input id="discAmount2" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="discAmount2Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">DPP : </td>
                                                <td><input id="dppAmount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="dppAmountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">PPN : </td>
                                                <td><input id="taxamount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="taxamountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right"><strong>Total : </strong></td>
                                                <td><input id="total" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="totalDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
								<div>&nbsp;</div>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <th width="15%">Product</th>
	  	  	  	  	  	  			<th width="12%">Tipe</th>
	  	  	  	  	  	  			<!-- <th width="12%">Kualitas</th>
	  	  	  	  	  	  			<th width="12%">Merk</th>
                                    <th width="12%">Warna</th> -->
	  	  	  	  	  	  			<th width="12%">Grid</th>
                                  	<th width="8%">Jumlah</th>
                                    <th width="15%">Satuan</th>
	  	  	  	  	  	  			<th width="8%">Harga</th>
	  	  	  	  	  	  			<th width="8%">Sub Total</th>
                                  	<th width="8%">Disc 1</th>
                                  	<th width="8%">Disc 2</th>
	  	  	  	  	  	  			<th width="8%">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsReceipt_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<td><input class="input-disabled" size="50" value="${item.warehouseTransactionItem.product.code} ${item.warehouseTransactionItem.product.name}" disabled/></td>
                                    <c:if test="${item.warehouseTransactionItem.requisitionItemType == 'NORMAL'}">
                                		<td><input class="input-disabled" size="15" value="REQUISITION" disabled/></td>
                                	</c:if>
                                    <c:if test="${item.warehouseTransactionItem.requisitionItemType != 'NORMAL'}">
                                		<td><input class="input-disabled" size="15" value="TAMBAHAN" disabled/></td>
                                	</c:if>
                                	<%-- <td><input class="input-disabled" size="15" value="${item.warehouseTransactionItem.product.quality}" disabled/></td>
                                	<td><input class="input-disabled" size="18" value="${item.warehouseTransactionItem.product.brand}" disabled/></td>
                                	<td><input class="input-disabled" size="15" value="${item.warehouseTransactionItem.product.primaryColors}" disabled/></td> --%>
                                	<td><input class="input-disabled" size="25" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='5' value="<fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/>"/></td>
                                    <td><input class="input-disabled" size="12" value="${item.warehouseTransactionItem.measureName}" disabled/></td>
                                	<td><form:input id="price[${status.index}]" size="12" path='items[${status.index}].cogs' onchange="display();"/></td>
                                	<td><input id="subTotal[${status.index}]" class="input-disabled" size="12" value="<fmt:formatNumber value='${item.receipted*item.cogs}' pattern=',##0.00'/>" disabled/></td>
                                	<td><form:input id="disc1[${status.index}]" size="12" path='items[${status.index}].discount1' onchange="display();"/></td>
                                	<td><form:input id="disc2[${status.index}]" size="12" path='items[${status.index}].discount2' onchange="display();"/></td>
                                	<td><input id="total[${status.index}]" class="input-disabled" size="15" value="<fmt:formatNumber value='${item.receipted*item.cogs-item.discount1-item.discount2}' pattern=',##0.00'/>" disabled/></td>
                                </tr>
	                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
	                                	<tr>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                    <td><input class="input-disabled" disabled size='5' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
		                                    <td><input class="" size="20" name="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serial}" id="serial[${status.index}-${detailstatus.index}]"/>
		                                </tr>
	                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="11">&nbsp;</td></tr></tfoot>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptsparepartadd.htm'/>",
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
							window.location="<c:url value='/page/goodsreceiptsparepartview.htm'/>";
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
	
	function display()
	{
		//var taxrate=document.getElementById("taxRate").value;
		var taxrate=10;
		var discType = $("#discountType").val();
		
		var purchase = document.getElementById('purchase');
		var purchaseDef = document.getElementById('purchaseDef');
		var totalDisc1 = document.getElementById('discAmount1');
		var totalDisc1Def = document.getElementById('discAmount1Def');
		var totalDisc2 = document.getElementById('discAmount2');
		var totalDisc2Def = document.getElementById('discAmount2Def');
		var dpp = document.getElementById('dppAmount');
		var dppDef = document.getElementById('dppAmountDef');
		var tax = document.getElementById('taxamount');
		var taxDef = document.getElementById('taxamountDef');
		var total = document.getElementById('total');
		var totalDef = document.getElementById('totalDef');
		
		/* <c:forEach items='${taxs}' var='c'>
			if('${c.id}' == document.getElementById('tax').value)
				taxrate = parseFloat('${c.taxRate}')/100;
		</c:forEach> */
		
		var purchaseAmount = 0;
		var totalDisc1Amount = 0;
		var totalDisc2Amount = 0;
		var dppAmount = 0;
		var taxAmount = 0;
		var totalAmount = 0;
		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
			{
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[5].firstChild.value.replace(/,/g,''));
				var amount = t_section.rows[idx].cells[6].firstChild;
				var disc1 = parseFloat(t_section.rows[idx].cells[7].firstChild.value);
				var disc2 = parseFloat(t_section.rows[idx].cells[8].firstChild.value);
				var tAmount = t_section.rows[idx].cells[9].firstChild;
				
				var tDisc1 = 0;
				var tDisc2 = 0;
				
				if(discType == 'CURRENCY')
				{
					tDisc1 = quantity*disc1;
					tDisc2 = quantity*disc2;
				} else
				{
					tDisc1 = (quantity*price)*(disc1/100);
					tDisc2 = (quantity*price)*(disc2/100);
				}
				
				purchaseAmount = purchaseAmount + (quantity*price);
				totalDisc1Amount = totalDisc1Amount + tDisc1;
				totalDisc2Amount = totalDisc2Amount + tDisc2;
				totalAmount = purchaseAmount - (totalDisc1Amount+totalDisc2Amount);
				
				amount.value = (quantity*price).numberFormat('#,###');
				tAmount.value = ((quantity*price)-(tDisc1+tDisc2)).numberFormat('#,###');
			}
		}
		
		purchase.value = purchaseAmount.numberFormat('#,###');
		purchaseDef.value = purchaseAmount.numberFormat('#,###');
		totalDisc1.value = totalDisc1Amount.numberFormat('#,###');
		totalDisc1Def.value = totalDisc1Amount.numberFormat('#,###');
		totalDisc2.value = totalDisc2Amount.numberFormat('#,###');
		totalDisc2Def.value = totalDisc1Amount.numberFormat('#,###');
		dpp.value = totalAmount.numberFormat('#,###');
		dppDef.value = totalAmount.numberFormat('#,###');
		tax.value = Math.round(parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		taxDef.value = Math.round(parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		total.value = (parseFloat(dpp.value.replace(/,/g,''))+parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,###');
		totalDef.value = (parseFloat(dpp.value.replace(/,/g,''))+parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,###');
	}

	function opengrid(target)
	{
		var fac = document.getElementById('facility');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

</script>
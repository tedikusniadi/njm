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
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/goodsreceiptsparepartprint.htm?id=${goodsReceipt_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="goodsReceipt_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.code}" disabled="disabled" class='input-disabled' size='35'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt_edit.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt_edit.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size='10' class="input-disabled" disabled value="<fmt:formatDate value='${goodsReceipt_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          	<td width="74%">
                                          		<form:select path='warehouseTransaction.transactionSource' disabled='true' cssClass="input-disabled">
                                                	<form:option value='PURCHASE_ORDER' label='PURCHASE ORDER'/>
                                                    <form:option value='COLLECTING_ORDER' label='COLLECTING ORDER'/>
                                                    <form:option value='TRANSFER_ORDER' label='TRANSFER ORDER'/>
                                                    <form:option value='UNIT_PURCHASE_ORDER' label='UNIT PURCHASE ORDER'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Discount Type :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.discountType=='CURRENCY'?'RP':'%'}" disabled="disabled" class='input-disabled' size='5'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
										<fieldset>
                                        	<legend><strong>Journal Reference </strong></legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${goodsReceipt_edit.journalEntry.id}'/>">
                                                <c:out value='${goodsReceipt_edit.journalEntry.code}'/>
                                            </a>
                                        </fieldset>
										<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${goodsReceipt_edit.items}' var='rec'>
                                            <tr>
                                            	<td><c:out value='${rec.warehouseTransactionItem.product.name}'/></td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.quantity - rec.warehouseTransactionItem.unissued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.receipted - rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td><input value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
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
                                              	<th width="20%">Amount (Rp)</th>
                                              	<th width="20%">Amount (Rp)</th>
                                            </tr>
                                            <tr>
                                              <td align="right">Purchase : </td>
                                                <td><input id="purchase" value="<fmt:formatNumber value='${adapter.purchase}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.defPurchase}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 1 : </td>
                                                <td><input id="discAmount1" value="<fmt:formatNumber value='${adapter.discount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount1Def" value="<fmt:formatNumber value='${adapter.defDiscount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 2 : </td>
                                                <td><input id="discAmount2" value="<fmt:formatNumber value='${adapter.discount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount2Def" value="<fmt:formatNumber value='${adapter.defDiscount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">DPP : </td>
                                                <td><input id="dppAmount" value="<fmt:formatNumber value='${adapter.dpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="dppAmountDef" value="<fmt:formatNumber value='${adapter.defDpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">PPN : </td>
                                                <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.defTax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              <td align="right"><strong>Transaction Amount : </strong></td>
                                                <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defTotal}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                      		</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
								</form:form>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
	                            	<div id="item" dojoType="ContentPane" label="Item" class="tab-pages" refreshOnShow="true">
                                        <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                       <tr>
		                                    <th width="15%">Nama</th>
			  	  	  	  	  	  			<!-- <th width="12%">Kualitas</th>
			  	  	  	  	  	  			<th width="12%">Merk</th>
		                                    <th width="12%">Warna</th> -->
			  	  	  	  	  	  			<th width="12%">Grid</th>
		                                  	<th width="8%">Jumlah</th>
		                                    <th width="8%">Satuan</th>
			  	  	  	  	  	  			<th width="8%">Harga</th>
			  	  	  	  	  	  			<th width="8%">Sub Total</th>
		                                  	<th width="8%">Disc 1</th>
		                                  	<th width="8%">Disc 2</th>
			  	  	  	  	  	  			<th width="8%">Total</th>
		                                </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${goodsReceipt_edit.items}' var='item' varStatus='status'>
                                        <c:if test="${item.warehouseTransactionItem.requisitionItemType == 'NORMAL'}">
		                                <tr>
		                                	<td nowrap="nowrap">${item.warehouseTransactionItem.product.code} ${item.warehouseTransactionItem.product.name}</td>
		                                	<%-- <td>${item.warehouseTransactionItem.product.quality}</td>
		                                	<td>${item.warehouseTransactionItem.product.brand}</td>
		                                	<td>${item.warehouseTransactionItem.product.primaryColors}</td> --%>
		                                	<td>${item.grid.name}</td>
		                                    <td><fmt:formatNumber value='${item.receipted}' pattern=',##0'/></td>
		                                    <td>${item.warehouseTransactionItem.product.unitOfMeasure.measureId}</td>
		                                    <td><fmt:formatNumber value='${item.cogs}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.receipted*item.cogs}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.discount1}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.discount2}' pattern=',##0.00'/></td>
		                                    <c:if test="${goodsReceipt_edit.discountType == 'CURRENCY'}">
                                            	<td><fmt:formatNumber value='${item.receipted*item.cogs-((item.receipted*item.discount1)+(item.receipted*item.discount2))}' pattern=',##0.00'/></td>
                                            </c:if>
                                            <c:if test="${goodsReceipt_edit.discountType == 'PERCENT'}">
                                            	<td><fmt:formatNumber value='${item.receipted*item.cogs-((item.receipted*item.cogs*item.discount1/100)+(item.receipted*item.cogs*item.discount2/100))}' pattern=',##0.00'/></td>
                                            </c:if>
		                                </tr>
			                            </c:if>
		                                </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                                	<div id="itemTambahan" dojoType="ContentPane" label="Additional Item" class="tab-pages" refreshOnShow="true">
                                        <table id="additionalItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                       <tr>
		                                    <th width="15%">Nama</th>
			  	  	  	  	  	  			<!-- <th width="12%">Kualitas</th>
			  	  	  	  	  	  			<th width="12%">Merk</th>
		                                    <th width="12%">Warna</th> -->
			  	  	  	  	  	  			<th width="12%">Grid</th>
		                                  	<th width="8%">Jumlah</th>
		                                    <th width="8%">Satuan</th>
			  	  	  	  	  	  			<th width="8%">Harga</th>
			  	  	  	  	  	  			<th width="8%">Sub Total</th>
		                                  	<th width="8%">Disc 1</th>
		                                  	<th width="8%">Disc 2</th>
			  	  	  	  	  	  			<th width="8%">Total</th>
		                                </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${goodsReceipt_edit.items}' var='item' varStatus='status'>
                                        <c:if test="${item.warehouseTransactionItem.requisitionItemType != 'NORMAL'}">
		                                <tr>
		                                	<td nowrap="nowrap">${item.warehouseTransactionItem.product.code} ${item.warehouseTransactionItem.product.name}</td>
		                                	<%-- <td>${item.warehouseTransactionItem.product.quality}</td>
		                                	<td>${item.warehouseTransactionItem.product.brand}</td>
		                                	<td>${item.warehouseTransactionItem.product.primaryColors}</td> --%>
		                                	<td>${item.grid.name}</td>
		                                    <td><fmt:formatNumber value='${item.receipted}' pattern=',##0'/></td>
		                                    <td>${item.warehouseTransactionItem.product.unitOfMeasure.measureId}</td>
		                                    <td><fmt:formatNumber value='${item.cogs}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.receipted*item.cogs}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.discount1}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.discount2}' pattern=',##0.00'/></td>
		                                    <c:if test="${goodsReceipt_edit.discountType == 'CURRENCY'}">
                                            	<td><fmt:formatNumber value='${item.receipted*item.cogs-((item.receipted*item.discount1)+(item.receipted*item.discount2))}' pattern=',##0.00'/></td>
                                            </c:if>
                                            <c:if test="${goodsReceipt_edit.discountType == 'PERCENT'}">
                                            	<td><fmt:formatNumber value='${item.receipted*item.cogs-((item.receipted*item.cogs*item.discount1/100)+(item.receipted*item.cogs*item.discount2/100))}' pattern=',##0.00'/></td>
                                            </c:if>
		                                </tr>
			                            </c:if>
		                                </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
							</div>
							<div class="info">Created by : <c:out value='${goodsReceipt_edit.createdBy.firstName} ${goodsReceipt_edit.createdBy.middleName} ${goodsReceipt_edit.createdBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${goodsReceipt_edit.updatedBy.firstName} ${goodsReceipt_edit.updatedBy.middleName} ${goodsReceipt_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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

		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptsparepartedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Goods Receipt data......');
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
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>
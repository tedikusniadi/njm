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

<body onload="error();">

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
							<a class="item-button-list" href="<c:url value='/page/sparepartpurchaseorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.edit and !purchaseOrder_edit.locked}'>
								<a class="item-button-lock" href="javascript:lock(true);"><span>Lock</span></a>
                            </c:if>
                            <c:if test='${access.edit and purchaseOrder_edit.locked}'>
								<a class="item-button-unlock" href="javascript:lock(false);"><span>Unlock</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/sparepartpurchaseorderprint.htm?id=${purchaseOrder_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="purchaseOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="50%">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${purchaseOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" class="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_edit.organization}'>
                                                        <form:option value='${purchaseOrder_edit.organization.id}' label='${purchaseOrder_edit.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" size="15" disabled value="<fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisition.requisitionType" class="combobox-medium" disabled='true'>
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                                    <form:option value='ASSET' label='ASSET'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                               		<form:option value='${purchaseOrder_edit.requisition.currency.id}' label='${purchaseOrder_edit.requisition.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="4" id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.requisition.exchange.rate}' pattern='#,###'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='tax' path='requisition.tax' disabled='true'>
                                                	<form:option value='${purchaseOrder_edit.requisition.tax.id}' label='${purchaseOrder_edit.requisition.tax.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="4" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_edit.requisition.tax.taxRate}' pattern='#,###'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                              		<td width="50%" valign="top">
			  							<table width="100%" style="border:none">
                                        <tr>
                                        	<td valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Reference</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="60%" align="right">Purchase Requisition :</td>
                                                        <td width="40%" align="left"><a href="<c:url value='/page/sparepartpurchaserequisitionpreedit.htm?id=${purchaseOrder_edit.requisition.id}'/>"><c:out value='${purchaseOrder_edit.requisition.code}'/></a></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right" valign="top">Goods Receipt :</td>
                                                        <td align="left">
                                                        	<c:forEach items='${purchaseOrder_edit.receipts}' var='good'>
                                                            	<a href="<c:url value='/page/goodsreceiptsparepartpreedit.htm?id=${good.id}'/>"><c:out value='${good.code}'/></a><br/>
                                                            </c:forEach>
                                                    	</td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right" valign="top">Invoice Verification :</td>
                                                        <td align="left">
                                                        	<c:forEach items='${purchaseOrder_edit.verifications}' var='verify'>
                                                            	<a href="<c:url value='/page/sparepartinvoiceverificationpreedit.htm?id=${verify.verificationGroup.id}'/>"><c:out value='${verify.verificationGroup.code}'/></a><br/>
                                                            </c:forEach>
                                                    	</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                              <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      	<th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${purchaseOrder_edit.requisition.exchange.to.symbol}'/>)</th>
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
                               	  	</td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="addressInformation" dojoType="ContentPane" label="Billing & Shipping Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        	<tr>
                                				<td>Billing Address</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.billTo.address}"/></td>
                                				<td>Shipping Address</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.shippingAddress.address}"/></td>
                                			</tr>
                                			<tr>
                                				<td>City</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.billTo.city.name}"/></td>
                                				</td>
                                				<td>City</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.shippingAddress.city.name}"/></td>
                                			</tr>
                                			<tr>
                                				<td>Postal Code</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.billTo.postalCode}"/></td>
                                				<td>Postal Code</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_edit.requisition.shippingAddress.postalCode}"/></td>
                                			</tr>
                                        </table>
                                	</div>
                                    <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="requisition.billTo" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.requisition.billTo}'>
                                                        <form:option value='${purchaseOrder_edit.requisition.billTo.id}' label='${purchaseOrder_edit.requisition.billTo.party.firstName} ${purchaseOrder_edit.requisition.billTo.party.middleName} ${purchaseOrder_edit.requisition.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="requisition.shipTo" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_edit.requisition.shipTo}'>
                                                        <form:option value='${purchaseOrder_edit.requisition.shipTo.id}' label='${purchaseOrder_edit.requisition.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="transaksi" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true">
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTableTransaksi" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Product</th>
                                            <th width="8%">Type</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1 (Rp)</th>
                                            <th width="8%">Disc 2 (Rp)</th>
                                            <th width="10%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_edit.requisition.items}' var='line'>
                                    	<c:if test="${!additionalTransaction}">
	                                        <c:if test="${line.requisitionItemType == 'NORMAL'}">
	                                        <tr>
	                                        	<td>&nbsp;</td>
	                                        	<td nowrap="nowrap"><c:out value='${line.product.code}'/> <c:out value='${line.product.name}'/></td>
	                                        	<c:if test="${line.requisitionItemType == 'NORMAL'}">
	                                        		<td><c:out value='REQUISITION'/></td>
	                                        	</c:if>
	                                            <td><fmt:formatNumber value='${line.quantity}' pattern='#,###'/></td>
	                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
	                                            <td><fmt:formatNumber value='${line.money.amount}' pattern='#,###'/></td>
	                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern='#,###'/></td>
	                                            <td><fmt:formatNumber value='${line.discount1}' pattern='#,###'/></td>
	                                            <td><fmt:formatNumber value='${line.discount2}' pattern='#,###'/></td>
	                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern='#,###'/></td>
	                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern='#,###'/></td> --%>
	                                        </tr>
	                                        </c:if>
	                                    </c:if>
	                                    <c:if test="${additionalTransaction}">
                                        <tr>
                                        	<td>&nbsp;</td>
                                        	<td nowrap="nowrap"><c:out value='${line.product.code}'/> <c:out value='${line.product.name}'/></td>
                                        	<c:if test="${line.requisitionItemType == 'NORMAL'}">
                                        		<td><c:out value='REQUISITION'/></td>
                                        	</c:if>
                                        	<c:if test="${line.requisitionItemType != 'NORMAL'}">
                                        		<td><c:out value='TAMBAHAN'/></td>
                                        	</c:if>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern='#,###'/></td>
                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount1}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount2}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern='#,###'/></td>
                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern='#,###'/></td> --%>
                                        </tr>
	                                    </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <c:if test="${!additionalTransaction}">
                                    <div id="transaksiTambahanFix" dojoType="ContentPane" label="Transaksi Tambahan" class="tab-pages" refreshOnShow="true">
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTableTransaksiTambahan" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Product</th>
                                            <th width="8%">Type</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1 (Rp)</th>
                                            <th width="8%">Disc 2 (Rp)</th>
                                            <th width="10%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_edit.requisition.items}' var='line'>
                                        <c:if test="${line.requisitionItemType != 'NORMAL'}">
                                        <tr>
                                        	<td>&nbsp;</td>
                                        	<td nowrap="nowrap"><c:out value='${line.product.code}'/> <c:out value='${line.product.name}'/></td>
                                        	<c:if test="${line.requisitionItemType != 'NORMAL'}">
                                        		<td><c:out value='TAMBAHAN'/></td>
                                        	</c:if>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern='#,###'/></td>
                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount1}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount2}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern='#,###'/></td>
                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern='#,###'/></td> --%>
                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    </c:if>
                                    <c:if test="${additionalTransaction}">
                                    <div id="transaksiTambahan" dojoType="ContentPane" label="Transaksi Tambahan" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('lineItemTableTambahan')"><span>Delete Row</span></a>
                                        	<div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="lineItemTableTambahan" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTableTambahan" onclick="clickAll('lineItemTableTambahan');"/></th>
                                            <th colspan="2">Product</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1(%)</th>
                                            <th width="8%">Disc 2(%)</th>
                                            <th width="10%">Total</th>
                                        	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="11">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    </c:if>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${purchaseOrder_edit.createdBy.firstName} ${purchaseOrder_edit.createdBy.middleName} ${purchaseOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${purchaseOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${purchaseOrder_edit.updatedBy.firstName} ${purchaseOrder_edit.updatedBy.middleName} ${purchaseOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${purchaseOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Purchase Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.b_save').click(function(e){		
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/sparepartpurchaseorderedit.htm'/>",
					data:$('#editForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Purchase Order data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/sparepartpurchaseorderview.htm'/>";
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
	
	function validation()
	{
		var tbl = document.getElementById("lineItemTableTambahan");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			
			for(var idx=len-1;idx>=0;idx--)
			{
				var product = t_section.rows[idx].cells[1].firstChild.value;
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var disc1 = parseFloat(t_section.rows[idx].cells[7].firstChild.value);
				var disc2 = parseFloat(t_section.rows[idx].cells[8].firstChild.value);
				
				if(product == '' || product == '0')
				{
					alert('Line Item Product cant be empty!');
					return;
				}
	
				if(quantity == '' || quantity <= '0')
				{
					alert('Line Item Quantity cannot be empty & must be greater than zero !!!');
					return;
				}
				
				if(disc1 == '' || disc1 < '0')
				{
					disc1 = 0;
				}
				
				if(disc2 == '' || disc2 < '0')
				{
					disc2 = 0;
				}
			}
		}
		
		return true;
	}
	
	/* function save()
	{		
		document.editForm.action = "<c:url value='/page/purchaseorderedit.htm'/>";
		document.editForm.submit();
	} */
	
	function lock(lock)
	{
		window.location = "<c:url value='/page/purchaseorderlock.htm?id=${purchaseOrder_edit.id}&lock='/>"+lock;
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
	
	function display()
	{
		var taxrate=document.getElementById("taxRate").value;
		
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
		
		var totalPurchaseAdapter = parseFloat(${adapter.purchase});
		var totalDisc1Adapter = parseFloat(${adapter.discount1});
		var totalDisc2Adapter = parseFloat(${adapter.discount2});
		var totalDppAdapter = parseFloat(${adapter.dpp});
		var totalTaxAdapter = parseFloat(${adapter.tax});
		
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
		
		var tbl = document.getElementById("lineItemTableTambahan");
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
				
				/* var tDisc1 = (quantity*price)*(disc1/100);
				var tDisc2 = (quantity*price)*(disc2/100); */
				var tDisc1 = quantity*disc1;
				var tDisc2 = quantity*disc2;
				
				purchaseAmount = purchaseAmount + (quantity*price);
				totalDisc1Amount = totalDisc1Amount + tDisc1;
				totalDisc2Amount = totalDisc2Amount + tDisc2;
				totalAmount = purchaseAmount - (totalDisc1Amount+totalDisc2Amount);
				
				amount.value = (quantity*price).numberFormat('#,###');
				tAmount.value = ((quantity*price)-(tDisc1+tDisc2)).numberFormat('#,###');
			}
		}
		
		purchase.value = (totalPurchaseAdapter+purchaseAmount).numberFormat('#,###');
		purchaseDef.value = (totalPurchaseAdapter+purchaseAmount).numberFormat('#,###');
		totalDisc1.value = (totalDisc1Adapter+totalDisc1Amount).numberFormat('#,###');
		totalDisc1Def.value = (totalDisc1Adapter+totalDisc1Amount).numberFormat('#,###');
		totalDisc2.value = (totalDisc2Adapter+totalDisc2Amount).numberFormat('#,###');
		totalDisc2Def.value = (totalDisc2Adapter+totalDisc1Amount).numberFormat('#,###');
		dpp.value = (totalDppAdapter+totalAmount).numberFormat('#,###');
		dppDef.value = (totalDppAdapter+totalAmount).numberFormat('#,###');
		tax.value = Math.round(totalTaxAdapter+parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		taxDef.value = Math.round(totalTaxAdapter+parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		total.value = (totalDppAdapter+totalAmount+Math.round(totalTaxAdapter+parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100))).numberFormat('#,###');
		totalDef.value = (totalDppAdapter+totalAmount+Math.round(totalTaxAdapter+parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100))).numberFormat('#,###');
	}

	var index = 0;
	
	function addLineItem()
	{
		var tbl = document.getElementById("lineItemTableTambahan");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCheck(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genQty(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genPrice(index));
				row.insertCell(6).appendChild(genSubTotal(index));
				row.insertCell(7).appendChild(genDisc1(index));
				row.insertCell(8).appendChild(genDisc2(index));
				row.insertCell(9).appendChild(genTotal(index));
				row.insertCell(10).appendChild(genHiddenPrice(index));
				
				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		
		return check;
	}

	function genProduct(index)
	{
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');

		return itemx;
	}

	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '') {
				alert('Please select Organization first !!!');
				return;
			}
			var target="product["+index+"]";
			openpopup("<c:url value='/page/popupproductview.htm?target='/>"+target+"&index="+index+"&categoryId=2&active=true");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Price';

		return _popup;

	}
	
	function genQty(index)
	{
		var quantity = document.createElement("input");
		quantity.type = "text";
		quantity.name = "quantitys";
		quantity.id = "quantity["+index+"]";
		quantity.setAttribute('size',"6");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');
		
		return quantity;
	}
	
	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"20");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;
		
		return uom;
	}
	
	function genPrice(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.id = "price["+index+"]";
		price.name = 'prices';
		price.setAttribute('size',"20");
		price.value = "0";
		/* price.setAttribute('class','input-disabled');
		price.disabled = true; */
		price.setAttribute('onblur','display()');
		
		return price;
	}

	function genHiddenPrice(index)
	{
		var price = document.createElement("input");
		price.type = "hidden";
		price.id = "pricehidden["+index+"]";

		return price;
	}
	
	function genSubTotal(index)
	{
		var sub = document.createElement("input");
		sub.type = "text";
		sub.id = "subTotal["+index+"]";
		sub.setAttribute('size',"20");
		sub.value = "0";
		sub.setAttribute('class','input-disabled');
		sub.disabled = true;
		
		return sub;
	}
	
	function genDisc1(index)
	{
		var disc = document.createElement("input");
		disc.type = "text";
		disc.name = 'discounts1';
		disc.id = "disc1["+index+"]";
		disc.setAttribute('size',"10");
		disc.value = "0";
		disc.setAttribute('onblur','display()');
		
		return disc;
	}
	
	function genDisc2(index)
	{
		var disc = document.createElement("input");
		disc.type = "text";
		disc.name = 'discounts2';
		disc.id = "disc2["+index+"]";
		disc.setAttribute('size',"10");
		disc.value = "0";
		disc.setAttribute('onblur','display()');
		
		return disc;
	}
	
	function genTotal(index)
	{
		var total = document.createElement("input");
		total.type = "text";
		total.id = "total["+index+"]";
		total.setAttribute('size',"20");
		total.value = "0";
		total.setAttribute('class','input-disabled');
		total.disabled = true;
		
		return total;
	}
	
	function setPrice(index)
	{
		var orgId = $("#org").val();
		var productId = $("#product\\["+index+"\\]").val();
		
		$.get("<c:url value='/page/productstandardpriceremote.getbuyingprice.json'/>",{org:orgId,product:productId},
		function(json)
		{
			$("#price\\["+index+"\\]").val(new Number(json.price).numberFormat("#,###"));
			$("#pricehidden\\["+index+"\\]").val(new Number(json.priceId));
		});
	}
</script>
<%@ include file="/common/dialog.jsp"%>
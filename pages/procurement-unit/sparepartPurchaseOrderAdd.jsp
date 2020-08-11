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
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="purchaseOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="50%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <select class="combobox-ext" disabled>
	                                                <option><c:out value='${purchaseOrder_add.requisition.organization.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${purchaseOrder_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisition ID :</td>
                                            <td><input value="${purchaseOrder_add.requisition.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select path="supplier" class="combobox-ext">
                                                    <form:option value='${purchaseOrder_add.requisition.supplier.id}' label='${purchaseOrder_add.requisition.supplier.name}'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisition.requisitionType" class="combobox-medium" disabled='true'>
                                                    <form:option value='STOCK' label='PURCHASE TO STOCK'/>
                                                    <form:option value='ASSET' label='FIXED ASSET ITEM'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='requisition.currency' disabled='true'>
                                               		<form:option value='${purchaseOrder_add.requisition.currency.id}' label='${purchaseOrder_add.requisition.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='requisition.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="5" id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.exchange.rate}' pattern='#,###'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='tax' path='requisition.tax' disabled='true' cssStyle='width:100px;'>
                                                	<form:option value='${purchaseOrder_add.requisition.tax.id}' label='${purchaseOrder_add.requisition.tax.taxName}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="5" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${purchaseOrder_add.requisition.tax.taxRate}' pattern='#,###'/>"/>
                                            </td>
                                        </tr>
										<tr>
                                            <td align="right">Payment Method Type : </td>
                                            <td >
                                                <form:select id='methodType' path='paymentMethodType' disabled='true' cssStyle='width:100px;'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Term :</td>
                                            <td><input class="input-disabled" disabled size="5" value="${purchaseOrder_add.creditTerm.term}"/>&nbsp;Day(s)</td>
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
                                        	<td>
                                           	  <fieldset>
                                              <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      <th width="60%">&nbsp;</th>
                                                      <th width="20%">Amount (<c:out value='${purchaseOrder_add.requisition.exchange.from.symbol}'/>)</th>
                                                      <th width="20%">Amount (<c:out value='${purchaseOrder_add.requisition.exchange.to.symbol}'/>)</th>
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
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.billTo.address}"/></td>
                                				<td>Shipping Address</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.shippingAddress.address}"/></td>
                                			</tr>
                                			<tr>
                                				<td>City</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.billTo.city.name}"/></td>
                                				</td>
                                				<td>City</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.shippingAddress.city.name}"/></td>
                                			</tr>
                                			<tr>
                                				<td>Postal Code</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.billTo.postalCode}"/></td>
                                				<td>Postal Code</td>
                                				<td>: <input disabled class='inputbox-ext input-disabled' value="${purchaseOrder_add.requisition.shippingAddress.postalCode}"/></td>
                                			</tr>
                                        </table>
                                	</div>
                                    <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="requisition.billTo" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.requisition.billTo}'>
                                                        <form:option value='${purchaseOrder_add.requisition.billTo.id}' label='${purchaseOrder_add.requisition.billTo.party.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="requisition.shipTo" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty purchaseOrder_add.requisition.shipTo}'>
                                                        <form:option value='${purchaseOrder_add.requisition.shipTo.id}' label='${purchaseOrder_add.requisition.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true">
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Product</th>
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
                                        <c:forEach items='${purchaseOrder_add.requisition.items}' var='line'>
                                        <tr>
                                        	<td>&nbsp;</td>
                                        	<td nowrap="nowrap"><c:out value='${line.product.code}'/>&nbsp;<c:out value='${line.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern='#,###'/></td>
                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount1}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.discount2}' pattern='#,###'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern='#,###'/></td>
                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern='#,###'/></td> --%>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                            	</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Purchase Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.b_save').click(function(e){		
			$.ajax({
				url:"<c:url value='/page/sparepartpurchaseorderadd.htm'/>",
				data:$('#addForm').serialize(),
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
		});
	});
	
	/* function save(_forward)
	{		
		document.addForm.action = "<c:url value='/page/sparepartpurchaseorderadd.htm?new='/>"+_forward;
		document.addForm.submit();
	} */
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
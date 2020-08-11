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
							<a class="item-button-back" href="javascript:history.back();"><span><spring:message code='back'/></span></a>
                            <c:if test='${access.add}'>
								<a id="save" class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">No. Verifikasi :</td>
                                       	  <td width="71%"><input value="Auto Generated" class='input-disabled' disabled size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <select id="org" class="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${verification.organization.id}'>${verification.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatDate value='${verification.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Pemasok :</td>
		                                    <td>
		                                        <form:select id="supplier" path="supplier" class="combobox-ext">
		                                            <c:if test='${not empty verification.supplier}'>
		                                                <form:option value='${verification.supplier.id}' label='${verification.supplier.name}' />
		                                            </c:if>
		                                        </form:select>
		                                    </td
		                                </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal Jatuh Tempo :</td>
                                            <td><input id="receivedDate" inputId="dueDate" name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                         </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No. Referensi :</td>
		                                    <td>
		                                        <select id="supplier" class="combobox-ext">
		                                            <c:if test='${not empty purchaseOrder}'>
		                                                <option>${purchaseOrder.code}</option>
		                                            </c:if>
		                                        </select>
		                                    </td
		                                </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                    <form:option value='${verification.currency.id}' label='${verification.currency.symbol}' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='${verification.exchangeType}' label='${verification.exchangeType}' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${verification.exchange.rate}' pattern=',##0.00'/>" size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='taxType' path='tax'>
                                                   	<form:option value='${verification.tax.id}' label='${verification.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" value="<fmt:formatNumber value='${verification.tax.taxRate}' pattern=',##0.00'/>" disabled/>
                                                %
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                    <td width="25%" colspan="2" align="left" valign="top">
                                		<fieldset>
                                            <legend><strong>Transaction Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                              <th width="60%">&nbsp;</th>
                                              <th width="20%">Amount (<c:out value='${verification.exchange.from.symbol}'/>)</th>
                                              <th width="20%">Amount (<c:out value='${verification.exchange.to.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                              <td align="right">Purchase : </td>
                                                <td><input id="purchase" value="<fmt:formatNumber value='${adapter.transaction}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.transaction}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 1 : </td>
                                                <td><input id="discAmount1" value="<fmt:formatNumber value='${adapter.discount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount1Def" value="<fmt:formatNumber value='${adapter.discount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 2 : </td>
                                                <td><input id="discAmount2" value="<fmt:formatNumber value='${adapter.discount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount2Def" value="<fmt:formatNumber value='${adapter.discount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">DPP : </td>
                                                <td><input id="dppAmount" value="<fmt:formatNumber value='${adapter.dpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="dppAmountDef" value="<fmt:formatNumber value='${adapter.dpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">PPN : </td>
                                                <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.tax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              <td align="right"><strong>Transaction Amount : </strong></td>
                                                <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.total}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                      		</table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="line" dojoType="ContentPane" label="Barang" class="tab-pages" refreshOnShow="true">
                                    <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
	                                    <th width="1%">&nbsp;</th>
	                                    <th width="15%">Product</th>
	                                    <th width="8%">Unit</th>
	                                    <th width="8%">UoM</th>
	                                    <th width="10%">Unit Price</th>                                    
	                                    <th width="10%">Sub Total</th>
	                                    <th width="8%">Disc 1</th>
	                                    <th width="8%">Disc 2</th>
	                                    <th width="10%">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${verification.verifications}' var='ver' varStatus='status'>
                                    <tr><td colspan="9"><strong>${ver.goodsReceipt.code} (Tipe Diskon : ${ver.goodsReceipt.discountType == 'PERCENT'?'%':'Rp'})</strong></td></tr>
	                                    <c:forEach items='${ver.items}' var='line' varStatus='itemStatus'>
	                                    <tr>
	                                    	<td>&nbsp;</td>
	                                    	<td><c:out value='${line.product.name}'/></td>
	                                        <td><input id="qty[${status.index}]" value="<fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/>" readonly="readonly" class="input-disabled"/></td>
	                                        <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
	                                        <td><input id="price[${status.index}]" value="<fmt:formatNumber value='${line.money.amount}' pattern=',##0.00'/>" readonly="readonly" class="input-disabled"/></td>
	                                        <td><input id="amount[${status.index}]" value="<fmt:formatNumber value='${line.quantity*line.money.amount}' pattern=',##0.00'/>" readonly="readonly" class="input-disabled"/></td>
	                                        <td><form:input id='discount1[${status.index}]' path='verifications[${status.index}].items[${itemStatus.index}].discount1' onchange="display();" readonly="true" class="input-disabled"/></td>
	                                        <td><form:input id='discount2[${status.index}]' path='verifications[${status.index}].items[${itemStatus.index}].discount2' onchange="display();" readonly="true" class="input-disabled"/></td>
		                                    <c:if test="${ver.goodsReceipt.discountType == 'CURRENCY'}">
                                            	<td><input id="subTotal[${status.index}]" value="<fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern=',##0.00'/>" readonly="readonly" class="input-disabled"/></td>
                                            </c:if>
                                            <c:if test="${ver.goodsReceipt.discountType == 'PERCENT'}">
                                            	<td><input id="subTotal[${status.index}]" value="<fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern=',##0.00'/>" readonly="readonly" class="input-disabled"/></td>
                                            </c:if>
	                                    </tr>
	                                    </c:forEach>
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
		$('#save').click(function(){
			$.ajax({
				url:"<c:url value='/page/sparepartinvoiceverificationadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sparepart Verification data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/sparepartinvoiceverificationview.htm'/>";
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
				var quantity = 0;
				var price = 0;
				var amount = 0;
				var disc1 = 0;
				var disc2 = 0;
				var tAmount = 0;
				
				if(t_section.rows[idx].cells[2])
					quantity = parseFloat(t_section.rows[idx].cells[2].firstChild.value.replace(/,/g,''));
				
				if(t_section.rows[idx].cells[4])
					price = parseFloat(t_section.rows[idx].cells[4].firstChild.value.replace(/,/g,''));
				
				if(t_section.rows[idx].cells[5])
					amount = t_section.rows[idx].cells[5].firstChild;
				
				if(t_section.rows[idx].cells[6])
					disc1 = parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/g,''));
				
				if(t_section.rows[idx].cells[7])
					disc2 = parseFloat(t_section.rows[idx].cells[7].firstChild.value.replace(/,/g,''));
				
				if(t_section.rows[idx].cells[8])
					tAmount = t_section.rows[idx].cells[8].firstChild;
				
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
</script>
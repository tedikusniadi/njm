<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Pertamina Verification >> Add</title>
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
			<td width="60%">Financial Accounting > Account Payable > Advance Pertamina Verification > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F29 - Advance Pertamina Verification</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/directinvoiceverificationview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">ID :</td>
                                            <td width="76%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_add.organization}'>
                                                        <form:option value='${verification_add.organization.id}' label='${verification_add.organization.firstName} ${verification_add.organization.lastName} ${verification_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                  			<td nowrap="nowrap" align="right">Date :</td>
                                    		<td><input id="date" name="date" value="<fmt:formatDate value='${verification_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                		</tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Supplier :</td>
                                            <td width="76%"><input value="${verification_add.purchaseOrder.supplier.firstName} ${verification_add.purchaseOrder.supplier.middleName} ${verification_add.purchaseOrder.supplier.lastName}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Pertamina SO :</td>
                                            <td width="76%"><form:input id='invoice' path='invoice' size='30'/></td>
                                        </tr>
                                        <tr>
                                  			<td nowrap="nowrap" align="right">Due Date :</td>
                                    		<td><input id="dueDate" name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                		</tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Currency :</td>
                                            <td width="76%">
                                            	<input value="${verification_add.purchaseOrder.money.currency.symbol}" class='input-disabled' size='6'/>
                                                &nbsp;
                                                <input value="${verification_add.purchaseOrder.money.exchangeType}" class='input-disabled' size='7'/>
                                                &nbsp;
                                                <input value="<fmt:formatNumber value='${verification_add.purchaseOrder.money.rate.rate}' groupingUsed='true' maxFractionDigits='5'/>" class='input-disabled' size='7'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Tax 1 :</td>
                                            <td width="76%">
                                            	<input value="${verification_add.purchaseOrder.tax.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="<fmt:formatNumber value='${verification_add.purchaseOrder.tax.taxRate}' pattern=',##0.00'/>" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Tax 2 :</td>
                                            <td width="76%">
                                            	<input value="${verification_add.purchaseOrder.extTax1.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="<fmt:formatNumber value='${verification_add.purchaseOrder.extTax1.taxRate}' pattern=',##0.00'/>" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Tax 3 :</td>
                                            <td width="76%">
                                            	<input value="${verification_add.purchaseOrder.extTax2.taxId}" class='input-disabled' size='15'/>
                                                &nbsp;
                                                <input value="<fmt:formatNumber value='${verification_add.purchaseOrder.extTax2.taxRate}' pattern=',##0.00'/>" class='input-disabled' size='3'/>&nbsp;%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                          	<td width="74%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input id="taxDate" name="taxDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td width="23%" nowrap="nowrap" align="right">Rounding :</td>
                                      		<td width="77%"><form:input id='rounding' path='rounding' size='10' onchange='display();'/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" nowrap="nowrap" align="right">Note :</td>
                                            <td width="76%"><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                  	<td width="47%" align="left" valign="top">
                                   	  <table style="border:none" width="100%">
                                        <tr>
                                        	<td width="55%" align="left" valign="top">
    <fieldset>
                                                	<legend><strong>Reference</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="31%" align="right">PO No :</td>
                                                   	  <td width="69%"><c:out value='${verification_add.purchaseOrder.code}'/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Debit Memo :</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                      		<td width="45%" align="left" valign="top">
<fieldset>
                                                	<legend><strong>Payment</strong></legend>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td colspan="2" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Recapitulation</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                        <th width="43%">&nbsp;</th>
                                                        <th width="31%" align="center">Amount (
                                                      	<c:out value='${verification_add.purchaseOrder.money.currency.symbol}'/>)</th>
                                                        <th width="26%" align="center">Amount (
                                                      <c:out value='${verification_add.purchaseOrder.money.rate.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Transaction :</td>
                                                        <td><input id="trx" style="text-align:right;" value="<fmt:formatNumber value='${trx}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" style="text-align:right;" value="<fmt:formatNumber value='${deftrx}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 :</td>
                                                        <td><input id="tax" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_add.purchaseOrder.tax.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_add.purchaseOrder.tax.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 :</td>
                                                        <td><input id="tax2" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_add.purchaseOrder.extTax1.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax2" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_add.purchaseOrder.extTax1.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 :</td>
                                                        <td><input id="tax3" style="text-align:right;" value="<fmt:formatNumber value='${trx*verification_add.purchaseOrder.extTax2.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax3" style="text-align:right;" value="<fmt:formatNumber value='${deftrx*verification_add.purchaseOrder.extTax2.taxRate/100}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Debit Memo :</td>
                                                        <td><input id="trx" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Returned Tax :</td>
                                                        <td><input id="trx" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Rounding :</td>
                                                        <td><input id="rnd" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="rnddef" style="text-align:right;" value="0.00" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total :</strong></td>
                                                        <td><input id="total" style="text-align:right;" value="<fmt:formatNumber value='${trx+(trx*verification_add.purchaseOrder.tax.taxRate/100)+(trx*verification_add.purchaseOrder.extTax1.taxRate/100)+(trx*verification_add.purchaseOrder.extTax2.taxRate/100)}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftotal" style="text-align:right;" value="<fmt:formatNumber value='${deftrx+(deftrx*verification_add.purchaseOrder.tax.taxRate/100)+(deftrx*verification_add.purchaseOrder.extTax1.taxRate/100)+(deftrx*verification_add.purchaseOrder.extTax2.taxRate/100)}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
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
                                <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <tr>
                                    <th width="37%">Product</th>
                                  	<th width="10%">Bought Qty</th>
                                  	<th width="10%">Received Qty</th>
                                  	<th width="5%">UoM</th>
                                  	<th width="10%">Price</th>
                                  	<th width="12%">Total</th>
                                  	<th width="8%">Disc (%)</th>
                                    <th width="8%">Disc Amnt</th>
                                </tr>
                                <c:forEach items="${verification_add.items}" var="item" varStatus='status'>
                                <tr>
                                    <td><c:out value='${item.verificateable.product.name}'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.quantity}' pattern=',##0.00'/></td> 
                                    <td><fmt:formatNumber value='${item.verificateable.quantity}' pattern=',##0.00'/></td>
                                    <td><c:out value='${item.verificateable.product.unitOfMeasure.measureId}'/></td>
                                    <td><fmt:formatNumber value='${item.verificateable.unitPrice}' pattern=',##0.00'/></td>
                                    <td>
                                    	<fmt:formatNumber value='${item.verificateable.unitPrice * item.verificateable.quantity}' pattern=',##0.00'/>
                                    	<input type="hidden" id='total[${status.index}]' value="${item.verificateable.unitPrice * item.verificateable.quantity}"/>
                                    </td> 
                                    <td><input id='percent[${status.index}]' name='items[${status.index}].verificateable.percent' value="<fmt:formatNumber value='${item.verificateable.percent}' pattern='##0.00'/>" size='8' onchange='percent(${status.index});' onblur='percent(${status.index});'/></td>
                                    <td><input id='discount[${status.index}]' name='items[${status.index}].verificateable.discountAmount' value="<fmt:formatNumber value='${item.verificateable.discountAmount}' pattern='##0.00'/>" size='8' onchange='amount(${status.index});' onblur='amount(${status.index});'/></td>
                                </tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">	
	function percent(index)
	{
		var percent = document.getElementById('percent['+index+']');
		var discount = document.getElementById('discount['+index+']');
		
		if(percent.value != '' && parseInt(percent.value) > 0)
		{
			var total = document.getElementById('total['+index+']');
			discount.value = parseFloat(total.value)*parseFloat(percent.value)/100;
		}
		
		display();
	}
	
	function amount(index)
	{
		var percent = document.getElementById('percent['+index+']');
		var discount = document.getElementById('discount['+index+']');
		
		if(discount.value != '' && parseInt(discount.value) > 0)
		{
			var total = document.getElementById('total['+index+']');
			percent.value = (parseFloat(discount.value)/parseFloat(total.value))*100;
		}
		
		display();
	}
	
	function display()
	{
		var _trx = 0;
		var _round = 0;
		
		var _tax2 = 0.0;
		var _deftax2 = 0.0;
		
		var _tax3 = 0.0;
		var _deftax3 = 0.0;
		
		var trx = document.getElementById('trx');
		var deftrx = document.getElementById('deftrx');
		
		var tax = document.getElementById('tax');
		var deftax = document.getElementById('deftax');
		
		var tax2 = document.getElementById('tax2');
		var deftax2 = document.getElementById('deftax2');
		
		var tax3 = document.getElementById('tax3');
		var deftax3 = document.getElementById('deftax3');
		
		var total = document.getElementById('total');
		var deftotal = document.getElementById('deftotal');
		
		var rnd = document.getElementById('rnd');
		var rnddef = document.getElementById('rnddef');
		
		var rounding = document.getElementById('rounding');
		if(rounding.value != '')
		{
			_round = parseFloat(rounding.value);
			rnd.value = _round.numberFormat('#,#.00');
			rnddef.value = _round.numberFormat('#,#.00');
		}
	
		<c:forEach items="${verification_add.items}" var="rec" varStatus='status'>
			var discount = document.getElementById('discount[${status.index}]');
			var ttl = document.getElementById('total[${status.index}]');
			_trx = _trx+parseFloat(ttl.value) - parseFloat(discount.value);
		</c:forEach>
		
		trx.value = _trx.numberFormat('#,#.00');
		
		var _deftrx = _trx*parseFloat('${verification_add.purchaseOrder.money.rate.rate}');
		deftrx.value = _deftrx.numberFormat('#,#.00');
		
		var defround = _round*parseFloat('${verification_add.purchaseOrder.money.rate.rate}');
		
		var _tax = _trx*parseFloat('${verification_add.purchaseOrder.tax.taxRate}')/100;
		var _deftax = _deftrx*parseFloat('${verification_add.purchaseOrder.tax.taxRate}')/100;
	
		<c:if test='${not empty verification_add.purchaseOrder.extTax1}'>
			_tax2 = _trx*parseFloat('${verification_add.purchaseOrder.extTax1.taxRate}')/100;
			_deftax2 = _deftrx*parseFloat('${verification_add.purchaseOrder.extTax1.taxRate}')/100;
		</c:if>
		
		<c:if test='${not empty verification_add.purchaseOrder.extTax2}'>
			_tax3 = _trx*parseFloat('${verification_add.purchaseOrder.extTax2.taxRate}')/100;
			_deftax3 = _deftrx*parseFloat('${verification_add.purchaseOrder.extTax2.taxRate}')/100;
		</c:if>
	
		tax.value = _tax.numberFormat('#,#.00');
		deftax.value = _deftax.numberFormat('#,#.00');
		
		total.value = (_trx+_tax+_tax2+_tax3+_round).numberFormat('#,#.00');
		deftotal.value = (_deftrx+_deftax+_deftax2+_deftax3+defround).numberFormat('#,#.00');
	}
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Advance Pertamina Verification',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			if(!$('#invoice').val())
			{
				alert('Pertamina SO cannot be empty!');
				return
			}
			
			if(!dojo.widget.byId('dueDate').getValue())
			{
				alert('Due date cannot be empty!');
				return;
			}
				
			$.ajax({
				url:"<c:url value='/page/directinvoiceverificationadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Advance Pertamina Verification data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/directinvoiceverificationview.htm'/>";							
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
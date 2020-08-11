<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>Direct Sales Order >> Edit</title>
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
			<td width="60%">Sales > Sales Order > Direct Sales Order > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S01 - Direct Sales Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/directsalesorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.add}'>
								<a class="item-button-copy" href="<c:url value='/page/directsalesorderprecopy.htm?id=${salesOrder_edit.id}'/>"><span>Copy</span></a>
                            </c:if>
							<a class="item-button-print" href="<c:url value='/page/directsalesorderprintoption.htm?id=${salesOrder_edit.id}'/>"><span>Print</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${salesOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.organization}'>
                                                        <form:option value='${salesOrder_edit.organization.id}' label='${salesOrder_edit.organization.firstName} ${salesOrder_edit.organization.lastName} ${salesOrder_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 1 :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.salesPerson}'>
                                                        <form:option value='${salesOrder_edit.salesPerson.id}' label='${salesOrder_edit.salesPerson.firstName} ${salesOrder_edit.salesPerson.lastName} ${salesOrder_edit.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 2 :</td>
                                            <td>
                                                <form:select id="secondarySales" path="secondarySales" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.secondarySales}'>
                                                        <form:option value='${salesOrder_edit.secondarySales.id}' label='${salesOrder_edit.secondarySales.firstName} ${salesOrder_edit.secondarySales.lastName} ${salesOrder_edit.secondarySales.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Customer : </td>
                               		  	  	<td width="40%">
  												<form:select id='customer' path='customer' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.customer}'>
                                                        <form:option value='${salesOrder_edit.customer.id}' label='${salesOrder_edit.customer.firstName} ${salesOrder_edit.customer.middleName} ${salesOrder_edit.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Customer Note : </td>
                               		  	  	<td width="40%"><form:input path='customerNote' size='50' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Credit Term : </td>
                               		  	  	<td width="40%"><input id="creditTerm" class="input-disabled" size="10" value="<fmt:formatNumber value='${salesOrder_edit.creditTerm.term}' pattern=',##0.00'/>" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                	<form:option value='${salesOrder_edit.currency.id}' label='${salesOrder_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="10" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax'>
                                                	<form:option value='${salesOrder_edit.tax.id}' label='${salesOrder_edit.tax.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.tax.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='extTax1' path='extTax1'>
                                                	<form:option value='${salesOrder_edit.extTax1.id}' label='${salesOrder_edit.extTax1.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate2" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.extTax1.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='extTax2' path='extTax2'>
                                                	<form:option value='${salesOrder_edit.extTax2.id}' label='${salesOrder_edit.extTax2.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.extTax2.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Invoice Tax Number :</td>
                                            <td>
                                            	<form:input size="7" path='taxCode'/>
                                        		&nbsp;
                                                <form:select id="taxcode" path="invoiceTax" cssClass="combobox">
                                                    <c:if test='${not empty salesOrder_edit.invoiceTax}'>
                                                        <form:option value='${salesOrder_edit.invoiceTax.id}' label='${salesOrder_edit.invoiceTax.code}' />
                                                    </c:if>
                                                </form:select>
                                                <c:if test='${salesOrder_edit.invoiceTax == null}'>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupinvoicetaxview.htm?target=taxcode&organization=${salesOrder_edit.organization.id}'/>');" style="CURSOR:pointer;" title="Invoice Tax Code" />
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td><input class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.rounding}' pattern=',##0.00'/>" size="10"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_edit.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_edit.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Sales : </td>
                                                        <td><input id="sales" value="<fmt:formatNumber value='${adapter.totalSales}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="salesdef" value="<fmt:formatNumber value='${adapter.totalSalesDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Discount : </td>
                                                        <td><input id="discount" value="<fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="discountdef" value="<fmt:formatNumber value='${adapter.totalDiscountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Amount before Tax : </td>
                                                        <td><input id="befortax" value="<fmt:formatNumber value='${adapter.amountBeforeTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="befortaxdef" value="<fmt:formatNumber value='${adapter.amountBeforeTaxDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.taxAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.taxAmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax2Amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.tax2AmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax3Amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.tax3AmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${salesOrder_edit.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${salesOrder_edit.rounding*salesOrder_edit.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total Transaction : </strong></td>
                                                        <td><input id="_trx" value="<fmt:formatNumber value='${adapter.total+salesOrder_edit.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="trxdef" value="<fmt:formatNumber value='${adapter.totalDef+(salesOrder_edit.rounding*salesOrder_edit.exchange.rate)}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
                                    	<table width="100%">
                                        <tr>
                                            <td align="right">Cash Account : </td>
                                            <td>
                                                <form:select id='account' path='cashAccount' cssClass='combobox-ext'>
                                                    <form:option value='${salesOrder_edit.cashAccount.id}' label='${salesOrder_edit.cashAccount.code}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Name : tes</td>
                                            <td><input disabled='true' class='input-disabled' size="30" value="${salesOrder_edit.cashAccount.accountName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input value="${salesOrder_edit.cashAccount.bankName}" disabled='true' class='input-disabled' size="30"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input value="${salesOrder_edit.cashAccount.bankBranch}" disabled='true' class='input-disabled' size="30"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input value="${salesOrder_edit.cashAccount.accountNo}" disabled='true' class='input-disabled' size="30"/></td>
                                        </tr>
                                        </table>
                                    </div>
                                    <div id="items" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="35%">Product</th>
                                            <th width="12%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="12%">Unit Price</th>                                    
                                            <th width="15%">Discount</th>
                                            <th width="15%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${salesOrder_edit.items}' var='item'>
                                        <tr>
                                        	<td><c:out value='${item.product.code} ${item.product.name}'/></td>
                                            <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.discount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${(item.quantity*item.unitPrice)-item.discount}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="warehouse" dojoType="ContentPane" label="Warehouse Information" class="tab-pages" refreshOnShow="true">
                                    	<table width="100%">
                                        <tr>
                                            <td align="right">Wareouse : </td>
                                            <td>
                                            	<form:select id="gudang" path="warehouse" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.warehouse}'>
                                                        <form:option value='${salesOrder_edit.warehouse.id}' label='${salesOrder_edit.warehouse.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                            	<form:select id="grid" path="grid" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.grid}'>
                                                        <form:option value='${salesOrder_edit.grid.id}' label='${salesOrder_edit.grid.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                            	<form:select id="container" path="container" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.container}'>
                                                        <form:option value='${salesOrder_edit.container.id}' label='${salesOrder_edit.container.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        </table>
                                    </div>
                                </div>
							</form:form>
						</div>
							<div class="info">Created by : <c:out value='${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Direct Sales Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){
		
			$.ajax({
				url:"<c:url value='/page/directsalesorderedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Direct Sales Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/directsalesorderview.htm'/>";
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
	
	function opensales(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsalespersonview.htm?target="+target+"&organization='/>"+org.value);
	}
	
	function showcurrency()
	{
		var trx = document.getElementById('trx');
		if(trx)
		{
			<c:forEach items='${currencys}' var='c'>
				if('${c.id}' == document.getElementById('currency').value)
					trx.innerHTML = 'Amount (${c.symbol})';
			</c:forEach>
		}
	}
	
	function display()
	{
		var _date = dojo.widget.byId("date");
		if(_date == null || _date.getDate() == '')
		{
			alert('Please select date first!');
			return;
		}
	
		var curr = document.getElementById('currency');
		var type = document.getElementById('type');
	
		var _event = function(rate)
		{
			var _sales = 0.0;
			var _salesdef = 0.0;
			var taxrate = 1;
			var _disc = 0.0;
			var _discdef = 0.0;
			var defcurrrate = parseFloat(rate);
			
			document.getElementById('trxrate').value = defcurrrate.numberFormat('#,#.0000');
			
			var sales = document.getElementById('sales');
			var salesdef = document.getElementById('salesdef');
			
			var discount = document.getElementById('discount');
			var discountdef = document.getElementById('discountdef');
			
			var beforetax = document.getElementById('befortax');
			var beforetaxdef = document.getElementById('befortaxdef');
			
			var taxamount = document.getElementById('taxamount');
			var taxamountdef = document.getElementById('taxamountdef');
			
			var trx = document.getElementById('_trx');
			var trxdef = document.getElementById('trxdef');
			
			<c:forEach items='${taxes}' var='c'>
				if('${c.id}' == document.getElementById('tax').value)
					taxrate = parseFloat('${c.taxRate}')/100;
			</c:forEach>
			
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
					
				for(var idx=len-1;idx>=0;idx--)
				{
					var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[8].firstChild.value);
					var _discount = parseFloat(t_section.rows[idx].cells[6].firstChild.value);
					var amount = t_section.rows[idx].cells[7].firstChild;
					
					amount.value = ((quantity*price)-_discount).numberFormat('#,#.00');

					_disc = _disc+_discount;
					_discdef = _discdef+(_discount*defcurrrate);
					
					_sales = _sales+(quantity*price);
					_salesdef = _salesdef+(quantity*price*defcurrrate);
				}
			}
			
			sales.value = _sales.numberFormat('#,#.00');
			salesdef.value = _salesdef.numberFormat('#,#.00');
			
			discount.value = _disc.numberFormat('#,#.00');
			discountdef.value = _discdef.numberFormat('#,#.00');
			
			beforetax.value = (_sales-_disc).numberFormat('#,#.00');
			beforetaxdef.value = (_salesdef-_discdef).numberFormat('#,#.00');
			
			taxamount.value = ((_sales-_disc)*taxrate).numberFormat('#,#.00');
			taxamountdef.value = ((_salesdef-_discdef)*taxrate).numberFormat('#,#.00');
			
			trx.value = (((_sales-_disc)*taxrate)+(_sales-_disc)).numberFormat('#,#.00');
			trxdef.value = (((_salesdef-_discdef)*taxrate)+(_salesdef-_discdef)).numberFormat('#,#.00');
		}
	
		ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
	}
	
	function openaccount()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&type=CASH&organization='/>"+org.value);
	}

	var index = 0;
	
	function addLineItem()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genQuan(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genStd(index));
				row.insertCell(6).appendChild(genDisc(index));
				row.insertCell(7).appendChild(genTotal(index));
				row.insertCell(8).appendChild(genHid(index));
				
				index++;
			}
		}
	}
					
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genProduct(index)
	{
		var product = document.createElement("select");
		product.name="products";
		product.id="product["+index+"]";
		product.setAttribute('class','combobox-ext');
					
		return product;
	}
	
	function popup(target,index)
	{			
		var _date = dojo.widget.byId("date");
		if(_date.getValue() == null || _date.getValue() == '')
		{
			alert('Plase select date first!');
			return;
		}
		
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');
		
		openpopup("<c:url value='/page/popupproduct4salesview.htm?target='/>"+target+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+_date.getValue()+"&defCurrency=${default.id}");
	}
	
	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup("product["+index+"]",index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Price';
		
		return _popup;
	}
	
	function genQuan(index)
	{
		var quantity = document.createElement("input");
		quantity.type = "text";
		quantity.name = "quantitys";
		quantity.id = "quantity["+index+"]";
		quantity.setAttribute('size',"13");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');
		
		return quantity;
	}
	
	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"7");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;
		
		return uom;
	}
	
	function genStd(index)
	{
		var std = document.createElement("input");
		std.type = "text";
		std.id = "std["+index+"]";
		std.setAttribute('size',"13");
		std.value = "0";
		std.setAttribute('class','input-disabled');
		std.disabled = true;
		
		return std;
	}
	
	function genDisc(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'discounts';
		price.id = "discount["+index+"]";
		price.setAttribute('size',"13");
		price.value = "0";
		price.setAttribute('onblur','display()');
		
		return price;
	}
	
	function genTotal(index)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "amount["+index+"]";
		amount.setAttribute('size',"15");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;
		
		return amount;
	}
	
	function genHid(index)
	{
		var amount = document.createElement("input");
		amount.type = "hidden";
		amount.id = "hid["+index+"]";
		amount.value = "0";
		
		return amount;
	}
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;
		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
				t_section.rows[idx].cells[0].firstChild.setAttribute('checked',true);
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}
			
	function deleteRow()
	{
		var tbl = document.getElementById("lineItemTable");
			
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
			
		display();
	}
</script>
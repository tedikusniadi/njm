<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Order from Sales >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Procurement > Pertamina Procurement > Purchase Order from Sales > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P28 - Purchase Order from Sales</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/pofromsalesview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
								<a class="item-button-save-new" href="javascript:savenew();"><span>Save &amp; New</span></a>											
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="purchaseOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" onchange="display();" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.organization}'>
                                                        <form:option value='${purchaseOrder_add.organization.id}' label='${purchaseOrder_add.organization.firstName} ${purchaseOrder_add.organization.lastName} ${purchaseOrder_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                              	<form:select path="goodsType" cssClass="combobox">
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                              	</form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchaser :</td>
                                            <td>
                                                <form:select id="purchaser" path="purchaser" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.purchaser}'>
                                                        <form:option value='${purchaseOrder_add.purchaser.id}' label='${purchaseOrder_add.purchaser.firstName} ${purchaseOrder_add.purchaser.lastName} ${purchaseOrder_add.purchaser.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="openpurchaser();" style="CURSOR:pointer;" title="Purchaser" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.supplier}'>
                                                        <form:option value='${purchaseOrder_add.supplier.id}' label='${purchaseOrder_add.supplier.firstName} ${purchaseOrder_add.supplier.lastName} ${purchaseOrder_add.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                              <form:select id="contact" path="contactPerson" cssClass="combobox-ext">
                                                <c:if test='${not empty purchaseOrder_add.contactPerson}'>
                                                  <form:option value='${purchaseOrder_add.contactPerson.id}' label='${purchaseOrder_add.contactPerson.firstName} ${purchaseOrder_add.contactPerson.lastName} ${requisition.contactPerson.middleName}' />
                                                </c:if>
                                              </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencontact();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                <c:forEach items='${currencys}' var='currency'>
                                                    <form:option value='${currency.id}' label='${currency.symbol}' onclick='shocurrency();display();'/>
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="1"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax'>
                                                	<c:forEach items='${taxes}' var='tax'>
                                              			<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                    </c:forEach>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='extTax1' path='extTax1'>
                                                	<option value="" selected></option>
                                                	<c:forEach items='${taxes}' var='tax'>
                                              			<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate2').value = ${tax.taxRate};display();"/>
                                                    </c:forEach>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate2" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='extTax2' path='extTax2'>
                                                	<option value="" selected></option>
                                                	<c:forEach items='${taxes}' var='tax'>
                                              			<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate3').value = ${tax.taxRate};display();"/>
                                                    </c:forEach>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled/>
                                            </td>
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
                                                      <th width="20%"><div id="trx">Amount</div></th>
                                                      <th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="tax2amt" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="tax2amtdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input id="tax3amt" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="tax3amtdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                	<div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.billTo}'>
                                                        <form:option value='${purchaseOrder_add.billTo.id}' label='${purchaseOrder_add.billTo.party.firstName} ${purchaseOrder_add.billTo.party.middleName} ${purchaseOrder_add.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openpostal('billTo');" style="CURSOR:pointer;" title="Address" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.shipTo}'>
                                                        <form:option value='${purchaseOrder_add.shipTo.id}' label='${purchaseOrder_add.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Address" />
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="32%">Product</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="12%">Std Price</th>                                    
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                            <th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${purchaseOrder_add.items}' var='item' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${item.product.code} ${item.product.name}'/></td>
                                            <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${item.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${item.standardSalesOrderItem.productPrice.money.amount}' pattern=',#00.00'/></td>
                                            <td><input id="price[${status.index}]" name="items[${status.index}].price" onchange="display();" value="<fmt:formatNumber value='${item.standardSalesOrderItem.productPrice.money.amount}' pattern='#00.00'/>"/></td>
                                            <td><input id="amt[${status.index}]" value="<fmt:formatNumber value='${item.standardSalesOrderItem.productPrice.money.amount*item.quantity}' pattern=',#00.00'/>"/></td>
                                            <td><input id="items[${status.index}].deliveryDate" name="items[${status.index}].deliveryDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                            <td><input type="hidden" value="${item.quantity}"/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
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

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/ExchangeDWRRemote.js'/>"></script>
<script type="text/javascript">
	function save(_forward)
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			
			if(len == 0)
			{
				alert('You need to provide Line Item first before saving the transaction!');
				return;
			}
			
			for(var idx=len-1;idx>=0;idx--)
			{
				var price = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
				var date = t_section.rows[idx].cells[6].firstChild.firstChild.value;
				
				if(price == '' || price == '0')
				{
					alert('Line Item Buying Price cant be empty!');
					return;
				}
				
				if(date == '')
				{
					alert('Line Item Delivery Date cant be empty!');
					return;
				}
			}

			document.addForm.action = "<c:url value='/page/pofromsalesadd.htm?forward='/>"+_forward;
			document.addForm.submit();
		}	
	}
	
	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
	}
	
	function opencontact()
	{
		var supplier = document.getElementById('supplier');
		if(supplier.value == '')
		{
			alert('Please select Supplier first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcontactpersonview.htm?target=contact&organization='/>"+supplier.value);
	}
	
	function openpurchaser()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppurchaserview.htm?target=purchaser&organization='/>"+org.value);
	}
	
	function openpostal(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		openpopup("<c:url value='/page/popuppostaladdressview.htm?target='/>"+target+"&party="+org.value);
	}
	
	function openfacility()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?target=shipTo&organization='/>"+org.value);
	}
	
	function shocurrency()
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
			var trx = 0.0;
			var trxdef = 0.0;
			var taxrate = 0.0;
			var tax2rate = 0.0;
			var tax3rate = 0.0;

			var defcurrrate = parseFloat(rate);
			
			document.getElementById('trxrate').value = defcurrrate.numberFormat('#,#.0000');
			
			var purchase = document.getElementById('purchase');
			var purchaseDef = document.getElementById('purchaseDef');
			
			var tax = document.getElementById('taxamount');
			var taxDef = document.getElementById('taxamountDef');
			
			var total = document.getElementById('total');
			var totalDef = document.getElementById('totalDef');
			
			var tax2amt = document.getElementById('tax2amt');
			var tax2amtdef = document.getElementById('tax2amtdef');
			
			var tax3amt = document.getElementById('tax3amt');
			var tax3amtdef = document.getElementById('tax3amtdef');
			
			<c:forEach items='${taxes}' var='c'>
				if('${c.id}' == document.getElementById('tax').value)
					taxrate = parseFloat('${c.taxRate}')/100;
				
				if('${c.id}' == dojo.byId('extTax1').value)
					tax2rate = parseFloat('${c.taxRate}')/100;
				
				if('${c.id}' == dojo.byId('extTax2').value)
					tax3rate = parseFloat('${c.taxRate}')/100;
			</c:forEach>
			
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
					
				for(var idx=len-1;idx>=0;idx--)
				{
					var quantity = parseFloat(t_section.rows[idx].cells[7].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
					var amount = t_section.rows[idx].cells[5].firstChild;
					
					amount.value = (quantity*price).numberFormat('#,#.00');
					trx = trx+(quantity*price);
					trxdef = trxdef+(quantity*price*defcurrrate);
				}
			}
			
			purchase.value = trx.numberFormat('#,#.00');
			purchaseDef.value = trxdef.numberFormat('#,#.00');
			
			tax.value = (trx*taxrate).numberFormat('#,#.00');
			taxDef.value = (trxdef*taxrate).numberFormat('#,#.00');
			
			tax2amt.value = (trx*tax2rate).numberFormat('#,#.00');
			tax2amtdef.value = (trxdef*tax2rate).numberFormat('#,#.00');
			
			tax3amt.value = (trx*tax3rate).numberFormat('#,#.00');
			tax3amtdef.value = (trxdef*tax3rate).numberFormat('#,#.00');
			
			total.value = (trx+(trx*taxrate)+(trx*tax2rate)+(trx*tax3rate)).numberFormat('#,#.00');
			totalDef.value = (trxdef+(trxdef*taxrate)+(trxdef*tax2rate)+(trxdef*tax3rate)).numberFormat('#,#.00');
		}
	
		ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
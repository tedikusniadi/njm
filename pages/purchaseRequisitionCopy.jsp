<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Preparation >> Copy</title>
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
			<td width="60%">Procurement > Purchase Preparation > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P20 - Purchase Preparation</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/purchaserequisitionview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="requisition_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="73%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisitionType" cssClass="combobox-ext">
                                                    <form:option value='STOCK' label='PURCHASE TO STOCK'/>
                                                    <form:option value='ASSET' label='FIXED ASSET ITEM'/>
                                                    <form:option value='CONSUME' label='PURCHASE TO CONSUME'/>
                                                    <form:option value='SERVICE' label='SERVICE'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_add.organization}'>
                                                        <form:option value='${requisition_add.organization.id}' label='${requisition_add.organization.firstName} ${requisition_add.organization.lastName} ${requisition_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisitioner" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_add.requisitioner}'>
                                                        <form:option value='${requisition_add.requisitioner.id}' label='${requisition_add.requisitioner.firstName} ${requisition_add.requisitioner.lastName} ${requisition_add.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openrequisitioner();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchase Reason :</td>
                                            <td><form:textarea path='reason' cols='45' rows='5'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_add.approver}'>
                                                        <form:option value='${requisition_add.approver.id}' label='${requisition_add.approver.firstName} ${requisition_add.approver.lastName} ${requisition_add.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_add.supplier}'>
                                                        <form:option value='${requisition_add.supplier.id}' label='${requisition_add.supplier.firstName} ${requisition_add.supplier.lastName} ${requisition_add.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                                <form:select id="contact" path="contact" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_add.contact}'>
                                                        <form:option value='${requisition_add.contact.id}' label='${requisition_add.contact.firstName} ${requisition_add.contact.lastName} ${requisition_add.contact.middleName}' />
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
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='tax' path='tax'>
                                                	<c:forEach items='${taxs}' var='tax'>
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" value="${requisition_add.tax.taxRate}" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payment Method Type : </td>
                                            <td >
                                                <form:select id='methodType' path='paymentMethodType'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Credit Term :</td>
                                            <td><input size="10" class="input-disabled" disabled value="${requisition_add.creditTerm.term}"/>&nbsp; Days</td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="41%" valign="top">
   	    								<fieldset>
                                       		<legend><strong>Transaction Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                              <th width="60%">&nbsp;</th>
                                              <th width="20%">Amount (<c:out value='${requisition_add.currency.symbol}'/>)</th>
                                              <th width="20%">Amount (<c:out value='${default.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                              <td align="right">Purchase : </td>
                                                <td><input id="purchase" value="<fmt:formatNumber value='${adapter.purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.defPurchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              <td align="right">Tax Amount : </td>
                                                <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              <td align="right"><strong>Transaction Amount : </strong></td>
                                                <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
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
                                                    <c:if test='${not empty requisition_add.billTo}'>
                                                        <form:option value='${requisition_add.billTo.id}' label='${requisition_add.billTo.party.firstName} ${requisition_add.billTo.party.middleName} ${requisition_add.billTo.party.lastName}' />
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
                                                    <c:if test='${not empty requisition_add.shipTo}'>
                                                        <form:option value='${requisition_add.shipTo.id}' label='${requisition_add.shipTo.name}' />
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
                                            <th>Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="11%">Std Price</th>                                    
                                            <th width="10%">Buy Price</th>
                                            <th width="11%">Amount</th>
                                            <th width="9%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${requisition_add.items}' var='line' varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${line.productPrice.product.name}'/></td>
                                            <td><input id='quantity[${status.index}]' name='items[${status.index}].quantity' value="<fmt:formatNumber value='${line.quantity}' pattern='##0.00'/>" size='8' onchange='display()'/></td>
                                            <td><c:out value='${line.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.productPrice.money.amount*line.exchange.rate}' pattern=',##0.00'/></td>
                                            <td><input id='price[${status.index}]' name='items[${status.index}].unitPrice' value="<fmt:formatNumber value='${line.unitPrice}' pattern='##0.00'/>" size='8' onchange='display()'/></td>
                                            <td><input size="10" value="<fmt:formatNumber value='${line.quantity*line.unitPrice}' pattern=',##0.00'/>" class='input-disabled' disabled/></td>
                                            <td><input id="date[${status.index}]" name="items[${status.index}].deliveryDate" size="10" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                                        </tfoot>
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
	function save()
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
				var quantity = parseFloat(t_section.rows[idx].cells[1].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
				var date = t_section.rows[idx].cells[6].firstChild.firstChild.value;

				if(quantity == '' || quantity == '0')
				{
					alert('Line Item Quantity cant be empty!');
					return;
				}
				
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

			document.addForm.action = "<c:url value='/page/purchaserequisitionadd2.htm'/>";
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
	
	function openrequisitioner()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppurchaserequisitionerview.htm?target=requisitioner&organization='/>"+org.value);
	}
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppurchaseapproverview.htm?target=approver&organization='/>"+org.value);
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
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
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
			var taxrate = 1;
			var defcurrrate = parseFloat(rate);
			
			document.getElementById('trxrate').value = defcurrrate.numberFormat('#,#.0000');
			
			var purchase = document.getElementById('purchase');
			var purchaseDef = document.getElementById('purchaseDef');
			
			var tax = document.getElementById('taxamount');
			var taxDef = document.getElementById('taxamountDef');
			
			var total = document.getElementById('total');
			var totalDef = document.getElementById('totalDef');
			
			<c:forEach items='${taxs}' var='c'>
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
					var quantity = parseFloat(t_section.rows[idx].cells[1].firstChild.value);
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
			
			total.value = (trx+(trx*taxrate)).numberFormat('#,#.00');
			totalDef.value = (trxdef+(trxdef*taxrate)).numberFormat('#,#.00');
		}
	
		ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
	}
</script>
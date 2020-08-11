<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Billing >> Add</title>
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
			<td width="60%">Financial Accounting > Account Receivable > Billing > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F11 - Billing</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a id="save" class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adapter">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">ID :</td>
                                       	  <td width="71%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="billing.organization" cssClass="combobox-ext" disabled='true'>
                                                   <form:option value='${adapter.billing.organization.id}' label='${adapter.billing.organization.firstName} ${adapter.billing.organization.lastName} ${adapter.billing.organization.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
	                                        <tr>
                                          <td nowrap="nowrap" align="right">Address :</td>
                                          <td>
                                                <form:select id="address" path="billing.taxAddress" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${billing.taxAddress.id}' label='${billing.taxAddress.address}' />
                                                </form:select>										  
                                        </td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Bank/Cash Account :</td>
                                          <td>
                                                <form:select id="accounts" path="billing.bankAccount" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='' label='${adapter.billing.bankAccount.code}' />
                                                </form:select>	
                                        </td>
                                        </tr>									
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${adapter.billing.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><input class="input-disabled" disabled size='30' value="<c:out value='${adapter.billing.doNo}'/>"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">PO No :</td>
                                            <td><input class="input-disabled" disabled size='30' value="<c:out value='${adapter.billing.poNo}'/>"/></td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="billing.customer" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${adapter.billing.customer.id}' label='${adapter.billing.customer.firstName} ${adapter.billing.customer.lastName} ${adapter.billing.customer.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Credit Term :</td>
                                            <td><input size="7" class="input-disabled" disabled value="${adapter.billing.creditTerm.term}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                                <form:select path='billing.tax' disabled='true'>
                                                    <form:option value='${adapter.billing.tax.id}' label='${adapter.billing.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${adapter.billing.tax.taxRate}' pattern=',#00.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select path='billing.extTax1' disabled='true'>
                                                    <form:option value='${adapter.billing.extTax1.id}' label='${adapter.billing.extTax1.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="tax2Rate" class="input-disabled" disabled value="<fmt:formatNumber value='${adapter.billing.extTax1.taxRate}' pattern=',#00.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select path='billing.extTax2' disabled='true'>
                                                    <form:option value='${adapter.billing.extTax2.id}' label='${adapter.billing.extTax2.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="tax3Rate" class="input-disabled" disabled value="<fmt:formatNumber value='${adapter.billing.extTax2.taxRate}' pattern=',#00.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='billing.currency' disabled='true'>
                                                    <form:option value='${adapter.billing.currency.id}' label='${adapter.billing.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='exchangeType' path='billing.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Invoice Tax Number :</td>
                                            <td>
                                                <form:input size="7" path='billing.taxNumber.code'/>
                                                &nbsp;
                                                <form:select id="taxcode" path="billing.taxNumber.invoiceTax" cssClass="combobox" disabled='true'>
                                                    <form:option value='${adapter.billing.taxNumber.invoiceTax.id}' label='${adapter.billing.taxNumber.invoiceTax.code}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td>
                                            	<form:input id='round' path='billing.rounding' size='10' onchange='rounding(this.value);'/>
                                            	<input type="hidden" id="roundingdef" value="0"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Reference Type :</td>
                                            <td>
                                                <form:select path='billing.billingType' disabled='true'>
                                                    <form:option value='${adapter.billing.billingType.id}' label='${adapter.billing.billingType.name}'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Authorizer :</td>
                                            <td>
                                                <form:select id="signer" path="billing.signer" cssClass="combobox-ext">
                                                    <c:if test='${not empty adapter.billing.signer}'>
                                                        <form:option value='${adapter.billing.signer.id}' label='${adapter.billing.signer.firstName} ${adapter.billing.signer.lastName} ${adapter.billing.signer.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="billing.note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                    <td width="50%" colspan="2" align="left" valign="top">
                                		<fieldset>
                                            <legend><strong>Transaction Amount</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                                <td width="48%">&nbsp;</td>
                                              	<td width="25%" align="center"><strong>Amount (
                                              	<c:out value='${billing.currency.symbol}'/>)</strong></td>
                                              	<td width="27%" align="center"><strong>Amount (${default.symbol})</strong></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Total Line Amount :</td>
                                                <td><input id="lineAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="lineAmountDef" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Discount :</td>
                                                <td><input id="discount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="discountdef" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Total Amount After Discount :</td>
                                                <td><input id="linediscount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="linediscountdef" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Tax 1 :</td>
                                                <td><input id="totalTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Tax 2 :</td>
                                                <td><input id="totalTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Tax 3 :</td>
                                                <td><input id="totalTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right">Total After Tax :</td>
                                                <td><input id="totalAfterTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefAfterTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <!--
                                            <tr>
                                                <td>Credit Memo Amount</td>
                                                <td><input id="totalMemo" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemo" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Returned Memo Tax 1</td>
                                                <td><input id="totalMemoTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemoTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Returned Memo Tax 2</td>
                                                <td><input id="totalMemoTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemoTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Returned Memo Tax 3</td>
                                                <td><input id="totalMemoTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemoTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            -->
                                            <tr>
                                                <td align="right">Rounding :</td>
                                                <td><input id="roundingAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="roundingDefAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td align="right"><strong>Total Billing Amount :</strong></td>
                                                <td><input id="totalAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;" selectedTab='line'>
                                <div id="address" dojoType="ContentPane" label="Address & Representative" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <tr>
                                    	<td width="11%" align="right">Billing Address : </td>
                                      	<td width="40%">
                                        	<form:select id='billAddress' path='billing.customerbillingAddress' cssClass='combobox-ext'>
                                            	<c:forEach items='${billing.customer.postalAddresses}' var='address'>
                                                	<form:option value='${address.id}' label='${address.address}'/>
                                            	</c:forEach>
                                            </form:select>
                                            &nbsp;
                                       	 	<img src="assets/icons/list_extensions.gif" onclick="openpostal('billAddress');" style="CURSOR:pointer;" title="Address" />
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td align="right">Tax Invoice Address : </td>
                                        <td>
                                        	<form:select path='billing.customerTaxAddress' cssClass='combobox-ext'>
                                            	<c:forEach items='${billing.customer.postalAddresses}' var='address'>
                                                	<c:forEach items='${address.addressTypes}' var='type'>
                                                        <c:if test="${type.enabled and type.type == 'TAX'}">
                                                            <form:option value='${address.id}' label='${address.address}'/> 
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </form:select>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="9%" align="right">Sales : </td>
                                  		<td width="40%">
						  					<form:select id="sales" path="billing.sales" cssClass="combobox-ext">
                                                <c:if test='${not empty adapter.billing.sales}'>
                                                    <form:option value='${adapter.billing.sales.id}' label='${adapter.billing.sales.firstName} ${adapter.billing.sales.lastName} ${adapter.billing.sales.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupsalespersonview.htm?target=sales&organization=${billing.organization.id}'/>');" style="CURSOR:pointer;" title="Sales" />
                                      </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Representative : </td>
                                        <td>
                                            <form:select id="representative" path="billing.representative" cssClass="combobox-ext">
                                                <c:if test='${not empty adapter.billing.representative}'>
                                                    <form:option value='${adapter.billing.representative.id}' label='${adapter.billing.representative.firstName} ${adapter.billing.representative.lastName} ${adapter.billing.representative.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupsalesrepresentativeview.htm?target=representative&organization=${billing.organization.id}'/>');" style="CURSOR:pointer;" title="Representative" />
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Contact Person  : </td>
                                        <td>
                                            <form:select id="contactPerson" path="billing.customerContactPerson" cssClass="combobox-ext" disabled='true'>
                                                <form:option value='' label='${billing.customerContactPerson.firstName}${billing.customerContactPerson.middleName}${billing.customerContactPerson.lastName}' />
                                            </form:select>	
                                        </td>
                                    </tr>
                                    </table>
                                </div>
                                <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                    <table style="border:none;" width="100%" cellpadding="3">
                                    <tr>
                                    	<td width="76%" align="right">Total Item(s) :
                                   	  	<input size="10" disabled class="input-disabled" style="text-align:right;" value="<fmt:formatNumber value='${adapter.lineSize}' pattern=',##0'/>"/></td>
                                        <td width="24%" align="right">Selected Item(s) :
                                      	<input id="selectedLine" disabled class="input-disabled" style="text-align:right;" size="10" value="<fmt:formatNumber value='${0.00}' pattern='##0'/>"/></td>
                                    </tr>
                                    </table>
                                    <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                                        <th width="2%"><input id="check-master" type="checkbox" onclick="fireCheckboxStateChange(this);"/></th>
                                        <th width="1%">&nbsp;</th>
                                        <th width="36%">Name</th>
                                      	<th width="8%">Qty</th>
                                        <th width="5%">UoM</th>
                                      	<th width="11%" style="text-align:center;">Unit Price</th>
                                      	<th width="11%" style="text-align:center;">Total</th>
                                      	<th width="5%" style="text-align:center;">Curr</th>
                                        <th width="10%" style="text-align:center;">Disc Amount</th>
                                      	<th width="11%" style="text-align:center;">Disc(%)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${adapter.lineItems}" var="line" varStatus='status'>
                                    <tr>
                                        <td><form:checkbox path='lineItems[${status.index}].enabled' value='true' onclick='display();fireSingleItemChecked(this);'/></td>
                                        <td><input type="hidden" value="${line.lineItem.exchange.rate}"/></td>
                                        <td><c:out value='${line.lineItem.line.name}'/></td>
                                        <td><fmt:formatNumber value='${line.lineItem.line.quantity}' pattern=',##0.00'/></td> 
                                        <td><c:out value='${line.lineItem.line.uom.measureId}'/></td>
                                        <td><input style="text-align:right;" class="input-disabled" disabled size="10" value="<fmt:formatNumber value='${line.lineItem.line.unitPrice.amount}' pattern=',##0.00'/>"/></td>
                                        <td><input style="text-align:right;" size="10" class='input-disabled' value="<fmt:formatNumber value='${line.lineItem.line.unitPrice.amount*line.lineItem.line.quantity}' pattern=',##0.00'/>" disabled/></td>
                                        <td style="text-align:center;"><c:out value='${line.lineItem.line.unitPrice.currency.symbol}'/></td>
										<td><input name="lineItems[${status.index}].lineItem.amountDiscount" style="text-align:right;" size='10' <c:if test="${adapter.readonly != ''}">readonly='${adapter.readonly}'</c:if> value="<fmt:formatNumber value='${line.lineItem.amountDiscount}' pattern='##0.00'/>" onchange='display("amt");'/></td>
                                        <td><input name="lineItems[${status.index}].lineItem.percentDiscount" style="text-align:right;" size='10' <c:if test="${adapter.readonly != ''}">readonly='${adapter.readonly}'</c:if> onchange='display("percent");' value="<fmt:formatNumber value='${line.lineItem.percentDiscount}' pattern='##0.00'/>"/></td>
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
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/ExchangeDWRRemote.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">			
	function fireSingleItemChecked(source)
	{
		if(source.checked)
			document.getElementById('selectedLine').value = (parseFloat(document.getElementById('selectedLine').value)+1).numberFormat('#0');
		else
			document.getElementById('selectedLine').value = (parseFloat(document.getElementById('selectedLine').value)-1).numberFormat('#0');
	}
	
	function fireCheckboxStateChange(source)
	{
		if(source.checked)
			document.getElementById('selectedLine').value = "<fmt:formatNumber value='${adapter.lineSize}' pattern='##0'/>";
		else
			document.getElementById('selectedLine').value = "0";
	
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
								
			for(var idx=len-1;idx>=0;idx--)
				t_section.rows[idx].cells[0].firstChild.checked = source.checked;
				
			display();
		}
	}
	
	function rounding(value)
	{
		var currency = document.getElementById('currency');
		var type = document.getElementById('exchangeType');
	
		var _rounding = document.getElementById('roundingAmount');
		_rounding.value = parseFloat(value).numberFormat('#,#.00');
		
		var _event = function(rate)
		{
			
			var _roundingDef = document.getElementById('roundingdef');
			var roundingDef = document.getElementById('roundingDefAmount');
			roundingDef.value = (parseFloat(value)*parseFloat(rate)).numberFormat('#,#.00');
			_roundingDef.value = parseFloat(value)*parseFloat(rate);
			
			display();
		};
		
		ExchangeDWRRemote.loadRate(currency.value,'${default.id}',"<fmt:formatDate value='${adapter.billing.date}' pattern='dd-MM-yyyy'/>",type.value,_event);
	}
	
	function display(from)
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var lineAmount = document.getElementById('lineAmount');
			var lineAmountDef = document.getElementById('lineAmountDef');
			
			var totalTax = document.getElementById('totalTax');
			var totalDefTax = document.getElementById('totalDefTax');
			
			var totalTax2 = document.getElementById('totalTax2');
			var totalDefTax2 = document.getElementById('totalDefTax2');
			
			var totalTax3 = document.getElementById('totalTax3');
			var totalDefTax3 = document.getElementById('totalDefTax3');
			
			var totalAfterTax = document.getElementById('totalAfterTax');
			var totalDefAfterTax = document.getElementById('totalDefAfterTax');
			
			var totalAmount = document.getElementById('totalAmount');
			var totalDefAmount = document.getElementById('totalDefAmount');	
			
			var roundingAmount = document.getElementById('roundingAmount');
			var _roundingDef = document.getElementById('roundingdef');
			
			var discount = document.getElementById('discount');
			var discountdef = document.getElementById('discountdef');
		
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
					
			var t_amount = 0;
			var t_amount_def = 0;
			var t_discount = 0.0;
			var t_discount_def = 0.0;
					
			for(var idx=len-1;idx>=0;idx--)
			{
				if(t_section.rows[idx].cells[0].firstChild.checked == true)
				{
					if(from && from == 'amt')
					{
						t_section.rows[idx].cells[9].firstChild.value = (parseFloat(t_section.rows[idx].cells[8].firstChild.value.replace(/,/gi,''))/parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/gi,''))*100).numberFormat('#,#.00');
					}
					
					if(from && from == 'percent')
					{
						t_section.rows[idx].cells[8].firstChild.value = (parseFloat(t_section.rows[idx].cells[9].firstChild.value.replace(/,/gi,''))*parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/gi,''))/100).numberFormat('#,#.00');
					}
				
					var _rate = parseFloat(t_section.rows[idx].cells[1].firstChild.value);
					
					t_amount += parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/gi,''));
					t_amount_def += parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/gi,''))*_rate;
					
					t_discount += parseFloat(t_section.rows[idx].cells[8].firstChild.value.replace(/,/gi,''));
					t_discount_def += parseFloat(t_section.rows[idx].cells[8].firstChild.value.replace(/,/gi,''))*_rate;
				}
			}
			
			discount.value = t_discount.numberFormat('#,#.00');
			discountdef.value = t_discount_def.numberFormat('#,#.00');
			
			lineAmount.value = t_amount.numberFormat('#,#.00');
			lineAmountDef.value = t_amount_def.numberFormat('#,#.00');;
			
			document.getElementById('linediscount').value = (t_amount-t_discount).numberFormat('#,#.00');
			document.getElementById('linediscountdef').value = (t_amount_def-t_discount_def).numberFormat('#,#.00');			
						
			var _rounding = 0.0;
			var _roundingdef = 0.0;
			
			if(document.getElementById('round').value != '')
				_rounding = parseFloat(document.getElementById('round').value);
			
			if(document.getElementById('roundingdef').value != '')
				_roundingdef = parseFloat(document.getElementById('roundingdef').value);
			
			var _amt_trx = t_amount-t_discount;
			var _amt_trx_def = t_amount_def-t_discount_def;
									
			var _totalTax = _amt_trx*parseFloat('${adapter.billing.tax.taxRate}')/100;
			var _totalDefTax = _amt_trx_def*parseFloat('${adapter.billing.tax.taxRate}')/100;
			
			var _totalTax2 = 0.0;
			var _totalDefTax2 = 0.0;
			
			var _totalTax3 = 0.0;
			var _totalDefTax3 = 0.0;
			
			<c:if test='${not empty adapter.billing.extTax1}'>
				var _totalTax2 = (_amt_trx*parseFloat('${adapter.billing.extTax1.taxRate}')/100);
				var _totalDefTax2 = (_amt_trx_def*parseFloat('${adapter.billing.extTax1.taxRate}')/100);
			</c:if>
			
			<c:if test='${not empty adapter.billing.extTax2}'>
				var _totalTax3 = (_amt_trx*parseFloat('${adapter.billing.extTax2.taxRate}')/100);
				var _totalDefTax3 = (_amt_trx_def*parseFloat('${adapter.billing.extTax2.taxRate}')/100);
			</c:if>
			
			totalTax.value = _totalTax.numberFormat('#,#.00');
			totalDefTax.value = _totalDefTax.numberFormat('#,#.00');
			
			totalTax2.value = _totalTax2.numberFormat('#,#.00');
			totalDefTax2.value = _totalDefTax2.numberFormat('#,#.00');
			
			totalTax3.value = _totalTax3.numberFormat('#,#.00');
			totalDefTax3.value = _totalDefTax3.numberFormat('#,#.00');
		
			var _totalAfterTax = t_amount-t_discount+_totalTax+_totalTax2+_totalTax3;
			var _totalDefAfterTax = t_amount_def-t_discount_def+_totalDefTax+_totalDefTax2+_totalDefTax3;
			
			totalAfterTax.value = _totalAfterTax.numberFormat('#,#.00');
			totalDefAfterTax.value = _totalDefAfterTax.numberFormat('#,#.00');
			
			totalAmount.value = (_totalAfterTax+_rounding).numberFormat('#,#.00');
			totalDefAmount.value = (_totalDefAfterTax+_roundingdef).numberFormat('#,#.00');
		}
	}	
	
	function openpostal(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		openpopup("<c:url value='/page/popuppostaladdressview.htm?party=${adapter.billing.customer.id}&target='/>"+target);
	}
	
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Billing',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('#save').click(function(){
			if(!$('#sales').val())
			{
				alert('Sales cannot be empty!');
				return;
			}
		
			if($('#billAddress').val() == '')
			{
				alert('Billing Address cannot be empty!');
				return;
			}
			
			$.ajax({
				url:"<c:url value='/page/billingadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Billing data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/billingpreedit.htm?id='/>"+json.id;
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Manual Billing (Opening Balance) &gt;&gt; Add</title>
    <%@ include file="/common/sirius-header.jsp" %>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
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
			<td width="60%">Financial Accounting > Account Receivable > Manual Billing (Opening Balance) > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F82 - Manual Billing (Opening Balance) </h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/manualbillingopeningbalanceview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="manual_billing_openingbalance_add">
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
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                   <form:option value='${manual_billing_openingbalance_add.organization.id}' label='${manual_billing_openingbalance_add.organization.firstName} ${manual_billing_openingbalance_add.organization.lastName} ${manual_billing_openingbalance_add.organization.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
	                                        <tr>
                                          <td nowrap="nowrap" align="right">Address :</td>
                                          <td>
                                                <form:select id="address" path="taxAddress" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='' label='${manual_billing_openingbalance_add.taxAddress.address}' />
                                                </form:select>										  
										  </td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Bank/Cash Account :</td>
                                          <td>
										        <form:select id="accounts" path="bankAccount" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='' label='${manual_billing_openingbalance_add.bankAccount.code}' />
                                                </form:select>	
										  </td>
                                        </tr>									
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${manual_billing_openingbalance_add.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.customer.id}' label='${manual_billing_openingbalance_add.customer.firstName} ${manual_billing_openingbalance_add.customer.lastName} ${manual_billing_openingbalance_add.customer.middleName}' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Credit Term :</td>
                                            <td><input size="7" class="input-disabled" disabled value="${manual_billing_openingbalance_add.creditTerm.term}"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select path='tax' disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.tax.id}' label='${manual_billing_openingbalance_add.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${manual_billing_openingbalance_add.tax.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select path='extTax1' disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.extTax1.id}' label='${manual_billing_openingbalance_add.extTax1.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="tax2Rate" class="input-disabled" disabled value="<fmt:formatNumber value='${manual_billing_openingbalance_add.extTax1.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select path='extTax2' disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.extTax2.id}' label='${manual_billing_openingbalance_add.extTax2.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="tax3Rate" class="input-disabled" disabled value="<fmt:formatNumber value='${manual_billing_openingbalance_add.extTax2.taxRate}' pattern='##0.00'/>"/>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.currency.id}' label='${manual_billing_openingbalance_add.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='exchangeType' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input class="input-disabled" disabled size="15" value="<fmt:formatNumber value='${manual_billing_openingbalance_add.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td nowrap="nowrap" align="right">Invoice Tax Number :</td>
                                            <td>
                                                <form:input size="7" path='taxNumber.code'/>
                                                &nbsp;
                                                <form:select id="taxcode" path="taxNumber.invoiceTax" cssClass="combobox" disabled='true'>
                                                    <form:option value='${manual_billing_openingbalance_add.taxNumber.invoiceTax.id}' label='${manual_billing_openingbalance_add.taxNumber.invoiceTax.code}' />
                                                </form:select>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td>
                                            	<form:input id='rounding' path='rounding' size='10' onchange='display()' onkeyup="separator('rounding');"/>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td align="right">Reference Type :</td>
                                            <td>
                                                <form:select path='billingType' disabled='true'>
                                                    <form:option value='5' label='MANUAL(OPENING BALANCE)'/>
                                                </form:select>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Authorizer :</td>
                                            <td>
                                                <form:select id="signer" path="signer" cssClass="combobox-ext">
                                                    <c:if test='${not empty manual_billing_openingbalance_add.signer}'>
                                                        <form:option value='${manual_billing_openingbalance_add.signer.id}' label='${manual_billing_openingbalance_add.signer.firstName} ${manual_billing_openingbalance_add.signer.lastName} ${manual_billing_openingbalance_add.signer.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
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
                                              	<c:out value='${manual_billing_openingbalance_add.currency.symbol}'/>)</strong></td>
                                              	<td width="27%" align="center"><strong>Amount (${default.symbol})</strong></td>
                                            </tr>
                                            <tr>
                                                <td>Total Line Amount</td>
                                                <td><input id="lineAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="lineAmountDef" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Tax </td>
                                                <td><input id="totalTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <!-- <tr>
                                                <td>Tax 2</td>
                                                <td><input id="totalTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax2" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Tax 3</td>
                                                <td><input id="totalTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefTax3" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr> -->
                                            <tr>
                                                <td>Total After Tax</td>
                                                <td><input id="totalAfterTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefAfterTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Credit Memo Amount</td>
                                                <td><input id="totalMemo" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemo" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Returned Memo Tax</td>
                                                <td><input id="totalMemoTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefMemoTax" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td>Rounding</td>
                                                <td><input id="roundingAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="roundingDefAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            <tr>
                                                <td><strong>Total Billing Amount</strong></td>
                                                <td><input id="totalAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                                <td><input id="totalDefAmount" value="0.00" size="15" style="text-align:right" class="input-disabled" disabled/></td>
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
                                    	<td width="11%" align="right">Billing Address : </td>
                                      	<td width="40%">
                                        	<form:select path='customerbillingAddress' cssClass='combobox-ext'>
                                            	<c:forEach items='${manual_billing_openingbalance_add.customer.postalAddresses}' var='address'>
                                                	<form:option value='${address.id}' label='${address.address}'/>
                                            	</c:forEach>
                                            </form:select>
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td align="right">Tax Invoice Address : </td>
                                        <td>
                                        	<form:select path='customerTaxAddress' cssClass='combobox-ext'>
                                            	<c:forEach items='${manual_billing_openingbalance_add.customer.postalAddresses}' var='address'>
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
						  					<form:select id="sales" path="sales" cssClass="combobox-ext">
                                                <c:if test='${not empty manual_billing_openingbalance_add.sales}'>
                                                    <form:option value='${manual_billing_openingbalance_add.sales.id}' label='${manual_billing_openingbalance_add.sales.firstName} ${manual_billing_openingbalance_add.sales.lastName} ${manual_billing_openingbalance_add.sales.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupsalespersonview.htm?target=sales&organization=${manual_billing_openingbalance_add.customer.id}'/>');" style="CURSOR:pointer;" title="Customer" />
                                      </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Representative : </td>
                                        <td>
                                            <form:select id="representative" path="representative" cssClass="combobox-ext">
                                                <c:if test='${not empty manual_billing_openingbalance_add.representative}'>
                                                    <form:option value='${manual_billing_openingbalance_add.representative.id}' label='${manual_billing_openingbalance_add.representative.firstName} ${manual_billing_openingbalance_add.representative.lastName} ${manual_billing_openingbalance_add.representative.middleName}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupsalesrepresentativeview.htm?target=representative&organization=${manual_billing_openingbalance_add.customer.id}'/>');" style="CURSOR:pointer;" title="Customer" />
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Contact Person  : </td>
                                        <td>
                                            <form:select id="contactPerson" path="customerContactPerson" cssClass="combobox-ext" disabled='true'>
                                                <form:option value='' label='${manual_billing_openingbalance_add.customerContactPerson.firstName}${manual_billing_openingbalance_add.customerContactPerson.middleName}${manual_billing_openingbalance_add.customerContactPerson.lastName}' />
                                            </form:select>	
                                        </td>
                                    </tr>                                 
                                    </table>
                                </div>
                                <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                        <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                        <th colspan="2" width="25%">Product</th>
                                        <th width="5%">Quantity</th>                                   
                                        <th width="5%">UoM</th>
                                        <th width="10%">Unit Price</th>                                    
                                        <th width="10%">Total</th>
                                        <th width="5%">Disc(%)</th>
                                        <th width="40%">Disc Amt</th>
                                    </tr>
                                    </thead>
                                    <tbody>
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
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">	
	function rounding(value)
	{
		if(value && value != '')
		{
			var _rounding = document.getElementById('roundingAmount');
			_rounding.value = parseFloat(value).numberFormat('#,###.00');

			var _roundingDef = document.getElementById('roundingdef');
			var roundingDef = document.getElementById('roundingDefAmount');
			
			roundingDef.value = (parseFloat(value)*parseFloat('${manual_billing_openingbalance_add.exchange.rate}')).numberFormat('#,###.00');
			_roundingDef.value = parseFloat(value)*parseFloat('${manual_billing_openingbalance_add.exchange.rate}');
			
			display();
		}
	}
	
	function display()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var lineAmount = document.getElementById('lineAmount');
			var lineAmountDef = document.getElementById('lineAmountDef');
			
			var totalTax = document.getElementById('totalTax');
			var totalDefTax = document.getElementById('totalDefTax');
			
			/* var totalTax2 = document.getElementById('totalTax2');
			var totalDefTax2 = document.getElementById('totalDefTax2');
			
			var totalTax3 = document.getElementById('totalTax3');
			var totalDefTax3 = document.getElementById('totalDefTax3'); */
			
			var totalAfterTax = document.getElementById('totalAfterTax');
			var totalDefAfterTax = document.getElementById('totalDefAfterTax');
			
			var totalAmount = document.getElementById('totalAmount');
			var totalDefAmount = document.getElementById('totalDefAmount');	
			
			var roundingAmount = document.getElementById('roundingAmount');
			var roundingDefAmount = document.getElementById('roundingDefAmount');
		
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
					
			var _lineamount = 0.0;
			var _def_lineamount = 0.0;
			
			var rounding = 0.0;
			var roundingDef = 0.0;
			
			if(document.getElementById('rounding').value != null && document.getElementById('rounding').value != '')
			{
				rounding = parseFloat(document.getElementById('rounding').value.replace(/,/g,''));
				roundingDef = rounding*parseFloat('${manual_billing_openingbalance_add.exchange.rate}');
			}
					
			for(var idx=len-1;idx>=0;idx--)
			{
				var disc = 0.0;
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value.replace(/,/g,''));
				var uDisc = parseFloat(t_section.rows[idx].cells[7].firstChild.value.replace(/,/g,''));
				//var uDiscAmt = parseFloat(t_section.rows[idx].cells[8].firstChild.value.replace(/,/g,''));
				var price = parseFloat(t_section.rows[idx].cells[5].firstChild.value.replace(/,/g,''));
				
				if(uDisc == null || uDisc == '')
					uDisc == 0;

				t_section.rows[idx].cells[8].firstChild.value = ((uDisc/100)*(quantity*price)).numberFormat('#,###.00');
				disc = disc+(uDisc/100)*(quantity*price);
				
				/* if(uDiscAmt >= uDisc)
				{
					disc += uDiscAmt;
					t_section.rows[idx].cells[8].firstChild.value = ((uDiscAmt*100)/(quantity*price));
				}
				else
				{
					disc += (uDisc/100)*(quantity*price);
					t_section.rows[idx].cells[8].firstChild.value = ((uDisc/100)*(quantity*price));
				} */
				
				_lineamount = _lineamount+(quantity*price)-disc;
				
				t_section.rows[idx].cells[6].firstChild.value = (quantity*price).numberFormat('#,###.00');
			}
			
			_def_lineamount = _lineamount*parseFloat('${manual_billing_openingbalance_add.exchange.rate}')
			
			lineAmount.value = _lineamount.numberFormat('#,###.00');
			lineAmountDef.value = _def_lineamount.numberFormat('#,###.00');;
			
			var _totalTax = (_lineamount*parseFloat('${manual_billing_openingbalance_add.tax.taxRate}')/100);
			var _totalDefTax = (_def_lineamount*parseFloat('${manual_billing_openingbalance_add.tax.taxRate}')/100);
			
			var _totalTax2 = 0.0;
			var _totalDefTax2 = 0.0;
			
			var _totalTax3 = 0.0;
			var _totalDefTax3 = 0.0;
			
			<c:if test='${not empty manual_billing_openingbalance_add.extTax1}'>
				var _totalTax2 = (_lineamount*parseFloat('${manual_billing_openingbalance_add.extTax1.taxRate}')/100);
				var _totalDefTax2 = (_def_lineamount*parseFloat('${manual_billing_openingbalance_add.extTax1.taxRate}')/100);
			</c:if>
			
			<c:if test='${not empty manual_billing_openingbalance_add.extTax2}'>
				var _totalTax3 = (_lineamount*parseFloat('${manual_billing_openingbalance_add.extTax2.taxRate}')/100);
				var _totalDefTax3 = (_def_lineamount*parseFloat('${manual_billing_openingbalance_add.extTax2.taxRate}')/100);
			</c:if>
			
			totalTax.value = _totalTax.numberFormat('#,###.00');
			totalDefTax.value = _totalDefTax.numberFormat('#,###.00');
			
			/* totalTax2.value = _totalTax2.numberFormat('#,###.00');
			totalDefTax2.value = _totalDefTax2.numberFormat('#,###.00');
			
			totalTax3.value = _totalTax3.numberFormat('#,###.00');
			totalDefTax3.value = _totalDefTax3.numberFormat('#,###.00'); */
		
			var _totalAfterTax = _lineamount+_totalTax+_totalTax2+_totalTax3;
			var _totalDefAfterTax = _def_lineamount+_totalDefTax+_totalDefTax2+_totalDefTax3;
			
			roundingAmount.value = rounding.numberFormat('#,###.00');
			roundingDefAmount.value = roundingDef.numberFormat('#,###.00');
			
			totalAfterTax.value = _totalAfterTax.numberFormat('#,###.00');
			totalDefAfterTax.value = _totalDefAfterTax.numberFormat('#,###.00');
			
			totalAmount.value = (_totalAfterTax+rounding).numberFormat('#,###.00');
			totalDefAmount.value = (_totalDefAfterTax+roundingDef).numberFormat('#,###.00');
		}
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
	
				row.insertCell(0).appendChild(genCheck(index));
				row.insertCell(1).appendChild(genItem(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genQty(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genPrice(index));
				row.insertCell(6).appendChild(genAmount(index));
				row.insertCell(7).appendChild(genPerc(index));
				row.insertCell(8).appendChild(genPercAmt(index));

				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check";
		
		return check;
	}
	
	function genItem(index)
	{
		var itemx = document.createElement("select");
		itemx.name="items";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');
					
		return itemx;
	}
	
	function popup(target,index)
	{
		var currency = document.getElementById('currency');
		var type = document.getElementById('type');
		
		openpopup("<c:url value='/page/productpopupview.htm?active=true&target="+target+"&index="+index+"&categoryId=1'/>");
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
	
	function genQty(index)
	{
		var received = document.createElement("input");
		received.type = "text";
		received.name = "quantitys";
		received.id = "quan["+index+"]";
		received.setAttribute('size',"5");
		received.value = "0";
		received.setAttribute('onchange','display()');
		
		return received;
	}
	
	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"8");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;
		
		return uom;
	}
	
	function genPrice(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'prices';
		price.id = "std["+index+"]";
		price.setAttribute('size',"18");
		price.value = "0";
		price.setAttribute('onchange','display()');
		price.setAttribute('onkeyup',"separator('std["+index+"]');");
		
		return price;
	}
	
	function genAmount(index)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "amount["+index+"]";
		amount.setAttribute('size',"18");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;
		
		return amount;
	}
	
	function genPerc(index)
	{
		var disc = document.createElement("input");
		disc.id = "disc["+index+"]";
		disc.setAttribute('size',"8");
		disc.value = "0";
		disc.setAttribute('onchange','display()');
		
		return disc;
	}
	
	function genPercAmt(index)
	{
		var discamount = document.createElement("input");
		discamount.name = "discounts";
		discamount.id = "discamount["+index+"]";
		discamount.setAttribute('size',"18");
		discamount.value = "0";
		discamount.setAttribute('onchange','display()');
		discamount.setAttribute('class','input-disabled');
		discamount.disabled = true;
		
		return discamount;
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
	}
	
	$(function(){
		var $dialog = $('<div/>').dialog({autoOpen: false,title: 'Manual Billing Opening Balance',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			if($('#billAddress').val() == '')
			{
				alert('Billing Address cannot be empty!');
				return;
			}
			
			$.ajax({
				url:"<c:url value='/page/manualbillingopeningbalanceadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Manual Billing Opening Balance data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/manualbillingopeningbalancepreedit.htm?id='/>"+json.id;
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
	
	function separator(id)
	{
		var amount = document.getElementById(id);
		
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
		}
	}
</script>
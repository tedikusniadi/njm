<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Standard Sales Order >> Add</title>
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
			<td width="60%">Sales > Sales Order > Standard Sales Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">S02 - Standard Sales Order</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/standardsalesorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save save" id='DONE' style="cursor:pointer;"><span>Save</span></a>
                                <a class="item-button-save-new save" id='NEW' style="cursor:pointer;"><span>Save &amp; New</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_add">
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
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${salesOrder_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Order Type :</td>
                                            <td>
                                                <form:select id="salesType" path="salesType" cssClass="combobox">
                                                	<option value='STANDARD'>Sales from Stock</option>
                                                    <option value='PO_REF'>Sales to Purchase</option>
                                                    <option value='TRANSPORTIR'>Sales Transportir</option>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                <form:option value='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.id}' label='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}'/>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 1 :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                </form:select>
                                                &nbsp;
                                              	<img src="assets/icons/list_extensions.gif" onclick="opensales('salesPerson');" style="CURSOR:pointer;" title="Sales Person" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 2 :</td>
                                            <td>
                                                <form:select id="secondarySales" path="secondarySales" cssClass="combobox-ext">
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opensales('secondarySales');" style="CURSOR:pointer;" title="Sales Person" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext">
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                <c:forEach items='${currencys}' var='currency'>
                                                    <form:option value='${currency.id}' label='${currency.symbol}' onclick='showcurrency();display();'/>
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" size="10" class="input-disabled" disabled value="1"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax'>
                                                	<c:forEach items='${taxes}' var='tax'>
                                              			<form:option value='${tax.id}' label='${tax.taxName}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
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
                                              			<form:option value='${tax.id}' label='${tax.taxName}' onclick="javascript:document.getElementById('taxRate2').value = ${tax.taxRate};display();"/>
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
                                              			<form:option value='${tax.id}' label='${tax.taxName}' onclick="javascript:document.getElementById('taxRate3').value = ${tax.taxRate};display();"/>
                                                    </c:forEach>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                            	<form:select id="warehouse" path="facility" cssClass="combobox-ext">
                                                </form:select>
                                            </td>
                                        </tr>
					     <tr>
                                            <td align="right">PO Customer No  : </td>
                                            <td>
                                            	<form:input path="poNo" size="25"/>
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
                                                        <td align="right">Total Sales : </td>
                                                        <td><input id="sales" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="salesdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Discount : </td>
                                                        <td><input id="discount" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="discountdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Amount before Tax : </td>
                                                        <td><input id="befortax" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="befortaxdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                                        <td align="right"><strong>Total Transaction : </strong></td>
                                                        <td><input id="_trx" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="trxdef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                            	<fieldset>
                                                	<legend><strong>Credit Limit Information</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                    	<td width="48%" align="right">Available Credit Limit</td>
                                                      	<td width="2%">:</td>
                                       	  					<td width="50%">
                           									<input id="plafon" value="0.00" class="input-disabled" disabled size="15"/>
                                                            <input  type="hidden" id="relation" value=""/>
                                                        	&nbsp;
                                                            <img src="assets/icons/list_extensions.gif" onclick="openplafondetail();" style="CURSOR:pointer;" title="Credit Limit History" />
                                                        </td>
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
                                	<div id="info" dojoType="ContentPane" label="Customer" class="tab-pages" refreshOnShow="true">
                                    	<table width="100%">
                                        <tr>
                                            <td width="19%" align="right">Customer : </td>
                       		  	  	  		<td width="40%">
				  								<form:select id='customer' path='customer' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.customer}'>
                                                        <form:option value='${salesOrder_add.customer.id}' label='${salesOrder_add.customer.firstName} ${salesOrder_add.customer.middleName} ${salesOrder_add.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencustomer();" style="CURSOR:pointer;" title="Customer" />
                                          	</td>
                                       	  <td width="41%"><form:errors path='customer' cssClass='error'/></td>
                                        </tr>
                                        <tr>
                                            <td width="19%" align="right">Credit Term : </td>
                       		  	  	  	  <td width="40%"><input id="creditTerm" class="input-disabled" size="10" value="0" disabled/></td>
                                        </tr>
                                        <tr>
                                        	<td width="19%" align="right">Billing Address : </td>
                           		  		  	<td width="40%">
												<form:select id='billingAddress' path='billingAddress' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.billingAddress}'>
                                                        <form:option value='${salesOrder_add.billingAddress.id}' label='${salesOrder_add.billingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                               	  	  	  	</td>
                                            <td width="41%"><form:errors path='billingAddress' cssClass='error'/></td>
                                        </tr>
                                        <tr>
                                        	<td width="19%" align="right">Tax Address : </td>
                           		  		  	<td width="40%">
												<form:select id='taxAddress' path='taxAddress' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.taxAddress}'>
                                                        <form:option value='${salesOrder_add.taxAddress.id}' label='${salesOrder_add.taxAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                   	  	  	</td>
                                            <td width="41%"><form:errors path='taxAddress' cssClass='error'/></td>
                                        </tr>
                                        <tr>
                                            <td width="19%" align="right">Contact Person : </td>
               		  	  		  		  	<td width="40%">
						  						<form:select id='contact' path='contact' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.contact}'>
                                                        <form:option value='${salesOrder_add.contact.id}' label='${salesOrder_add.contact.firstName} ${salesOrder_add.contact.middleName} ${salesOrder_add.contact.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opencontact();" style="CURSOR:pointer;" title="Contact Person" />
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="19%" align="right">Shipping Address : </td>
                                   		  	<td width="40%">
						  						<form:select id="shippingAddress" path="shippingAddress" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.shippingAddress}'>
                                                        <form:option value='${salesOrder_add.shippingAddress.id}' label='${salesOrder_add.shippingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                            <td width="41%"><form:errors path='shippingAddress' cssClass='error'/></td>
                                        </tr>
                                        </table>
                                    </div>
                                    <div id="items" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                             <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                            <th width="27%">Product</th>
                                          	<th width="0%">&nbsp;</th>
                                          	<th width="7%">Qty</th>
                                          	<th width="6%">UoM</th>
                                          	<th width="9%">Unit Price</th>
                                          	<th width="9%">Discount</th>
                                          	<th width="9%">Amount</th>
                                          	<th width="10%">Tot Disc</th>
                                            <th width="9%">Tot Amount</th>
                                            <th width="12%">Note</th>
                                          	<th width="0%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="13">&nbsp;</td></tr></tfoot>
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
<script src="<c:url value='/js/Facility.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function openwarehouse()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}

		var type = '';
		if(dojo.byId('salesType').value == 'TRANSPORTIR')
			type='VIRTUAL';

		openpopup("<c:url value='/page/popupfacilityview.htm?target=warehouse&organization='/>"+org.value+'&implementation='+type);
	}

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
			var taxrate = 0.0;
			var tax2rate = 0.0;
			var tax3rate = 0.0;
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

			var tax2amt = document.getElementById('tax2amt');
			var tax2amtdef = document.getElementById('tax2amtdef');

			var tax3amt = document.getElementById('tax3amt');
			var tax3amtdef = document.getElementById('tax3amtdef');

			var trx = document.getElementById('_trx');
			var trxdef = document.getElementById('trxdef');

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
					var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[5].firstChild.value);
					var _discount = parseFloat(t_section.rows[idx].cells[6].firstChild.value);

					var amount = t_section.rows[idx].cells[7].firstChild;
					var tot_disc = t_section.rows[idx].cells[8].firstChild;
					var tot_amt = t_section.rows[idx].cells[9].firstChild;

					amount.value = (quantity*price).numberFormat('#,#.00');

					tot_disc.value = (quantity*_discount).numberFormat('#,#.00');

					tot_amt.value = (quantity*(price-_discount)).numberFormat('#,#.00');

					_disc = _disc+(_discount*quantity);
					_discdef = _discdef+((_discount*quantity)*defcurrrate);

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

			tax2amt.value = ((_sales-_disc)*tax2rate).numberFormat('#,#.00');
			tax2amtdef.value = ((_salesdef-_discdef)*tax2rate).numberFormat('#,#.00');

			tax3amt.value = ((_sales-_disc)*tax3rate).numberFormat('#,#.00');
			tax3amtdef.value = ((_salesdef-_discdef)*tax3rate).numberFormat('#,#.00');

			trx.value = (((_sales-_disc)*taxrate)+((_sales-_disc)*tax2rate)+((_sales-_disc)*tax3rate)+(_sales-_disc)).numberFormat('#,#.00');
			trxdef.value = (((_salesdef-_discdef)*taxrate)+((_salesdef-_discdef)*tax2rate)+((_salesdef-_discdef)*tax3rate)+(_salesdef-_discdef)).numberFormat('#,#.00');
		}

		ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
	}

	function opencustomer()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
	}

	function opencontact()
	{
		var org = document.getElementById('customer');
		if(org.value == '')
		{
			alert('Please select Customer first!');
			return;
		}

		openpopup("<c:url value='/page/popupcontactpersonview.htm?target=contact&organization='/>"+org.value);
	}

	function openplafondetail()
	{
		var relation = document.getElementById('relation');
		if(relation.value == '')
		{
			alert('No Credit Limit available!');
			return;
		}

		openpopup("<c:url value='/page/popupplafonhistory.htm?id='/>"+relation.value);
	}

	function openaddress(target)
	{
		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}

		openpopup("<c:url value='/page/popuppostaladdressview.htm?party='/>"+customer.value+"&target="+target);
	}

	function openshipping()
	{
		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}
		openpopup("<c:url value='/page/popuppostaladdressview.htm?target=shippingAddress&party='/>"+customer.value);
	}

	function openmobile()
	{
		var contact = document.getElementById('contact');
		if(contact.value == '')
		{
			alert('Please select Contact Person first!');
			return;
		}

		openpopup("<c:url value='/page/popupcontactmechanismview.htm?target=mobile&type=MOBILE&party='/>"+contact.value);
	}

	function openemail()
	{
		var contact = document.getElementById('contact');
		if(contact.value == '')
		{
			alert('Please select Contact Person first!');
			return;
		}

		openpopup("<c:url value='/page/popupcontactmechanismview.htm?target=email&type=EMAIL&party='/>"+contact.value);
	}

	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsalesapproverview.htm?target=approver&organization='/>"+org.value);
	}

	var index = 0;

	var tbl = dojo.byId('lineItemTable');

	var t_section = tbl.tBodies[0];
	if(t_section.rows.length > 0 )
		index = t_section.rows.length+1;

	function addLineItem()
	{
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genQuan(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genStd(index));
				row.insertCell(6).appendChild(genDisc(index));
				row.insertCell(7).appendChild(genAmt(index));
				row.insertCell(8).appendChild(genTotDisc(index));
				row.insertCell(9).appendChild(genTotal(index));
				row.insertCell(10).appendChild(genNote(index));
				row.insertCell(11).appendChild(genHid(index));

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
		product.setAttribute('class','combobox');

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

		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}

		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		var productType = 'GOODS';
		var salesType = document.getElementById('salesType');
		if(salesType.value == 'TRANSPORTIR')
			productType = 'SERVICE';

		openpopup("<c:url value='/page/popupproductprice4customerview.htm?format=false&target='/>"+target+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+_date.getValue()+"&party="+customer.value+"&organization="+org.value+'&productType='+productType);
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
		quantity.setAttribute('size',"5");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');

		return quantity;
	}

	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"5");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;

		return uom;
	}

	function genStd(index)
	{
		var std = document.createElement("input");
		std.name = 'prices';
		std.id = "std["+index+"]";
		std.setAttribute('size',"10");
		std.setAttribute('onblur','display()');
		std.setAttribute('onchange','display()');
		std.value = "0";

		return std;
	}

	function genDisc(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'discounts';
		price.id = "discount["+index+"]";
		price.setAttribute('size',"10");
		price.value = "0";
		price.setAttribute('onblur','display()');

		return price;
	}

	function genAmt(index)
	{
		var amt = document.createElement("input");
		amt.type = "text";
		amt.id = "amt["+index+"]";
		amt.setAttribute('size',"10");
		amt.setAttribute('class','input-disabled');
		amt.disabled = true;

		return amt;
	}

	function genTotDisc(index)
	{
		var tdisc = document.createElement("input");
		tdisc.type = "text";
		tdisc.id = "tdisc["+index+"]";
		tdisc.setAttribute('size',"7");
		tdisc.setAttribute('class','input-disabled');
		tdisc.disabled = true;

		return tdisc;
	}

	function genTotal(index)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "amount["+index+"]";
		amount.setAttribute('size',"10");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}

	function genNote(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.name = 'notes';
		note.id = "note["+index+"]";
		note.setAttribute('size',"13");
		note.value = "-";

		return note;
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
			alert('Table doesnot exsist!');
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

	$(function(){
		Facility.init();

		$('#salesType').click(function(){
			Facility.init();
		});

		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Standard Sales Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.save').click(function(e){
			var $this = $(this);

			if(!$('#approver').val())
			{
				alert('Approver cannot be empty!');
				return;
			}

			if(!$('#warehouse').val() && $('#salesType').val() != 'TRANSPORTIR')
			{
				alert('Warehouse cannot be empty!');
				return;
			}

			if(!$('#salesPerson').val())
			{
				alert('Sales Person cannot be empty!');
				return;
			}

			var tbl = $('#lineItemTable').get(0);
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
					var product = t_section.rows[idx].cells[1].firstChild.value;
					var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);

					if(product == '' || product == '0')
					{
						alert('Line Item Product cant be empty!');
						return;
					}

					if(quantity == '' || quantity == '0')
					{
						alert('Line Item Quantity cant be empty!');
						return;
					}
				}
			}

			$.ajax({
				url:"<c:url value='/page/standardsalesorderadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Standard Sales Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');

							if($this.attr('id').match('DONE'))
								window.location="<c:url value='/page/standardsalesorderview.htm'/>";
							else
								window.location="<c:url value='/page/standardsalesorderpreadd.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
						}
					}
				}
			});
		});

		$cst = $('#customer');
		$cst.focus(function(){
			$.ajax({
				url:"<c:url value='/page/popuppostaladdressjsonview.htm'/>",
				data:{party:$cst.val()},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$bill = $('#billingAddress');
							$bill.empty();

							$tax = $('#taxAddress');
							$tax.empty();

							$ship = $('#shippingAddress');
							$ship.empty();

							$.each(json.addresses,function(idx,obj){
								$.each(obj.types,function(tIdx,tObj){
									if(tObj.enabled)
									{
										if(tObj.type == 'OFFICE')
										{
											$opt = $('<option></option>');
											$opt.attr('value',obj.id);
											$opt.html(obj.address);
											$opt.appendTo($bill);
										}

										if(tObj.type == 'TAX')
										{
											$opt = $('<option></option>');
											$opt.attr('value',obj.id);
											$opt.html(obj.address);
											$opt.appendTo($tax);
										}

										if(tObj.type == 'SHIPPING')
										{
											$opt = $('<option></option>');
											$opt.attr('value',obj.id);
											$opt.html(obj.address);
											$opt.appendTo($ship);
										}
									}
								});
							});
						}
					}
				}
			});
		});
	});
</script>
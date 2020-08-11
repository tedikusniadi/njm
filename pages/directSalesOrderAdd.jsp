<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>Direct Sales Order >> Add</title>
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
			<td width="60%">Sales > Sales Order > Direct Sales Order > Add</td>
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
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                                <a class="item-button-save-new b_save" style="cursor:pointer;"><span>Save &amp; New</span></a>
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
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.organization}'>
                                                        <form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.firstName} ${salesOrder_add.organization.lastName} ${salesOrder_add.organization.middleName}' />
                                                    </c:if>
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
                                                    <c:if test='${not empty salesOrder_add.salesPerson}'>
                                                        <form:option value='${salesOrder_add.salesPerson.id}' label='${salesOrder_add.salesPerson.firstName} ${salesOrder_add.salesPerson.lastName} ${salesOrder_add.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opensales('salesPerson');" style="CURSOR:pointer;" title="Sales Person" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 2 :</td>
                                            <td>
                                                <form:select id="secondarySales" path="secondarySales" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.secondarySales}'>
                                                        <form:option value='${salesOrder_add.secondarySales.id}' label='${salesOrder_add.secondarySales.firstName} ${salesOrder_add.secondarySales.lastName} ${salesOrder_add.secondarySales.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              <img src="assets/icons/list_extensions.gif" onclick="opensales('secondarySales');" style="CURSOR:pointer;" title="Sales Person" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Customer : </td>
                               		  	  	<td width="40%">
  												<form:select id='customer' path='customer' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.customer}'>
                                                        <form:option value='${salesOrder_add.customer.id}' label='${salesOrder_add.customer.firstName} ${salesOrder_add.customer.middleName} ${salesOrder_add.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencustomer('customer');" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Customer Note : </td>
                               		  	  	<td width="40%"><form:input path='customerNote' size='50'/></td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Credit Term : </td>
                               		  	  	<td width="40%"><input id="creditTerm" class="input-disabled" size="10" value="0" disabled/></td>
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
                                            <td nowrap="nowrap" align="right">Invoice Tax Number :</td>
                                            <td>
                                            	<form:input size="7" path='taxCode'/>
                                        		&nbsp;
                                                <form:select id="taxcode" path="invoiceTax" cssClass="combobox">
                                                    <c:if test='${not empty salesOrder_add.invoiceTax}'>
                                                        <form:option value='${salesOrder_add.invoiceTax.id}' label='${salesOrder_add.invoiceTax.code}' />
                                                    </c:if>
                                                </form:select>
                                                <c:if test='${empty salesOrder_add.invoiceTax}'>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opentax();" style="CURSOR:pointer;" title="Invoice Tax Code" />
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td><form:input id='rounding' path='rounding' onchange='display();'/></td>
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
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="round" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="rounddef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                		</table>
                           	  	  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
                                    	<table width="100%">
                                        <tr>
                                            <td align="right">Bank/Cash Account : </td>
                                            <td>
                                                <form:select id='account' path='cashAccount' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_add.cashAccount}'>
                                                        <form:option value='${salesOrder_add.cashAccount.id}' label='${salesOrder_add.cashAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openaccount();;" style="CURSOR:pointer;" title="Bank Account" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Name : </td>
                                            <td><input id='accountName' disabled='true' class='input-disabled' size="30" value="${salesOrder_add.cashAccount.accountName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input id='bankName' disabled='true' class='input-disabled' size="30" value="${salesOrder_add.cashAccount.bankName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input id='bankBranch' disabled='true' class='input-disabled' size="30" value="${salesOrder_add.cashAccount.bankBranch}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input id='accountNo' disabled='true' class='input-disabled' size="30" value="${salesOrder_add.cashAccount.accountNo}"/></td>
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
                                            <th width="35%">Product</th>
                                            <th width="1%">&nbsp;</th>
                                            <th width="12%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="12%">Unit Price</th>
                                            <th width="15%">Disc/Unit</th>
                                            <th width="15%">Ttl Disc</th>
                                            <th width="15%">Total</th>
                                            <th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="warehouse" dojoType="ContentPane" label="Warehouse Information" class="tab-pages" refreshOnShow="true">
                                    	<table width="100%">
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                            	<form:select id="container" path="container" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.container}'>
                                                        <form:option value='${salesOrder_add.container.id}' label='${salesOrder_add.container.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
												<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('container');" style="CURSOR:pointer;" title="Container" />
                                        </td>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                            	<form:select id="facility" path="warehouse" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.warehouse}'>
                                                        <form:option value='${salesOrder_add.warehouse.id}' label='${salesOrder_add.warehouse.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                            	<form:select id="grid" path="grid" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.grid}'>
                                                        <form:option value='${salesOrder_add.grid.id}' label='${salesOrder_add.grid.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>

                                        </tr>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/engine.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface.js'/>"></script>
<script type="text/javascript" src="<c:url value='/page/dwrService/interface/ExchangeDWRRemote.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Direct Sales Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			$target = $(e.target);

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
					var product = t_section.rows[idx].cells[1].firstChild.value;
					var quantity = t_section.rows[idx].cells[3].firstChild.value.toNumber();

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

			if(!$('#customer').val())
			{
				alert('Customer can not be empty!');
				return;
			}

			if(!$('#container').val())
			{
				alert('Please select Container first!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/directsalesorderadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Direct Sales Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							if($target.html() == 'Save')
								window.location="<c:url value='/page/directsalesorderprintoption.htm?id='/>"+json.id;
							else
								window.location="<c:url value='/page/directsalesorderpreadd.htm'/>";
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
				if('${c.id}' == $('#currency').val())
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

		var rounding = document.getElementById('rounding');
		var _rounding = 0.0;

		if(rounding.value != '')
			_rounding = parseFloat(rounding.value);

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

			document.getElementById('round').value = _rounding.numberFormat('#,#.00');
			document.getElementById('rounddef').value = (_rounding*defcurrrate).numberFormat('#,#.00');


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
					var price = parseFloat(t_section.rows[idx].cells[9].firstChild.value);
					var _discount = parseFloat(t_section.rows[idx].cells[6].firstChild.value);
					var amount = t_section.rows[idx].cells[8].firstChild;

					amount.value = (quantity*(price -_discount)).numberFormat('#,#.00');

					_disc = _disc+_discount*quantity;
					_discdef = _discdef+(_discount*quantity*defcurrrate);

					_sales = _sales+(quantity*price);
					_salesdef = _salesdef+(quantity*price*defcurrrate);

					t_section.rows[idx].cells[7].firstChild.value = _discount*quantity;
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

			trx.value = (((_sales-_disc)*taxrate)+((_sales-_disc)*tax2rate)+((_sales-_disc)*tax3rate)+(_sales-_disc)+_rounding).numberFormat('#,#.00');
			trxdef.value = (((_salesdef-_discdef)*taxrate)+((_salesdef-_discdef)*tax2rate)+((_salesdef-_discdef)*tax3rate)+(_salesdef-_discdef)+(_rounding*defcurrrate)).numberFormat('#,#.00');
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

	function opencontainer()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupcontainerbyorganizationview.htm?target=container&organization='/>"+org.value);
	}

	function opentax()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupinvoicetaxview.htm?target=taxcode&organization='/>"+org.value);
	}

	var tbl = dojo.byId('lineItemTable');

	var index = 0;

	if(tbl.tBodies[0].rows.length > 0 )
		index = tbl.tBodies[0].length+1;

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
				row.insertCell(7).appendChild(genTotalDisc(index));
				row.insertCell(8).appendChild(genTotal(index));
				row.insertCell(9).appendChild(genHid(index));

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

		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}

		var customer = document.getElementById('customer');
		if(org.value == '')
		{
			alert('Please select Customer first!');
			return;
		}

		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		openpopup("<c:url value='/page/popupproductprice4salesview.htm?target='/>"+target+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+_date.getValue()+"&defCurrency=${default.id}&organization="+org.value+"&party="+customer.value);
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
		std.type = "text";
		std.id = "std["+index+"]";
		std.setAttribute('size',"8");
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
		price.setAttribute('size',"8");
		price.value = "0";
		price.setAttribute('onblur','display()');

		return price;
	}

	function genTotalDisc(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.id = "total["+index+"]";
		price.setAttribute('size',"8");
		price.value = "0";
		price.setAttribute('onblur','display()');
		price.setAttribute('class','input-disabled');
		price.disabled = true;

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
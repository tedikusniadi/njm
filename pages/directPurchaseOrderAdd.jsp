<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Direct Purchase Order >> Add</title>
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
			<td width="60%">Procurement > Direct Purchase Order > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">P22 - Direct Purchase Order</h1>
                        <div class="clears">&nbsp;</div>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/directpurchaseorderview.htm'/>"><span>List</span></a>
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
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder_add.organization}'>
                                                        <form:option value='${purchaseOrder_add.organization.id}' label='${purchaseOrder_add.organization.firstName} ${purchaseOrder_add.organization.lastName} ${purchaseOrder_add.organization.middleName}' />
                                                    </c:if>
                                                    <form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                              	<form:select path="goodsType" cssClass="combobox">
                                                    <form:option value='STOCK' label='NON ASSET'/>
                                                    <form:option value='ASSET' label='ASSET'/>
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
                                                	<c:forEach items='${taxs}' var='tax'>
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
                                                	<option value="" seleced>&nbsp;</option>
                                                	<c:forEach items='${taxs}' var='tax'>
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
                                                	<option value="" seleced>&nbsp;</option>
                                                	<c:forEach items='${taxs}' var='tax'>
                                              			<form:option value='${tax.id}' label='${tax.taxName}' onclick="javascript:document.getElementById('taxRate3').value = ${tax.taxRate};display();"/>
                                                    </c:forEach>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Rounding :</td>
                                            <td><input id='rounding' name='rounding' value="0.00" onchange='display();' size="10"/></td>
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
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="round" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="rounddef" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext">
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
											<th><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                            <th width="32%">Product</th>
                                            <th width="1%">&nbsp;</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="12%">Std Price</th>
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
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
	function save()
	{
		if(!dojo.byId('billTo').value)
		{
			alert('Bill To Address cannot be empty!');
			return;
		}

		if(!dojo.byId('shipTo').value)
		{
			alert('Ship To Address cannot be empty!');
			return;
		}

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
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[6].firstChild.value);
				var date = t_section.rows[idx].cells[8].firstChild.firstChild.value;

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

			document.addForm.action = "<c:url value='/page/directpurchaseorderadd.htm'/>";
			document.addForm.submit();
		}
	}

	function savenew()
	{
		if(!dojo.byId('billTo').value)
		{
			alert('Bill To Address cannot be empty!');
			return;
		}

		if(!dojo.byId('shipTo').value)
		{
			alert('Ship To Address cannot be empty!');
			return;
		}

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
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[6].firstChild.value);
				var date = t_section.rows[idx].cells[8].firstChild.firstChild.value;

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

			document.addForm.action = "<c:url value='/page/directpurchaseorderaddnew.htm'/>";
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

		var curr = dojo.byId('currency');
		var type = dojo.byId('type');

		var _event = function(rate)
		{
			var trx = 0.0;
			var trxdef = 0.0;
			var taxrate = 0.0;
			var tax2rate = 0.0;
			var tax3rate = 0.0;
			var rounding = 0.0;

			var defcurrrate = parseFloat(rate);

			if(dojo.byId('rounding').value != null && dojo.byId('rounding').value != '')
				rounding = parseFloat(dojo.byId('rounding').value);

			dojo.byId('trxrate').value = defcurrrate.numberFormat('#,#.0000');

			var purchase = dojo.byId('purchase');
			var purchaseDef = dojo.byId('purchaseDef');

			var tax = dojo.byId('taxamount');
			var taxDef = dojo.byId('taxamountDef');

			var total = dojo.byId('total');
			var totalDef = dojo.byId('totalDef');

			var tax2amt = dojo.byId('tax2amt');
			var tax2amtdef = dojo.byId('tax2amtdef');

			var tax3amt = dojo.byId('tax3amt');
			var tax3amtdef = dojo.byId('tax3amtdef');

			<c:forEach items='${taxs}' var='c'>
				if('${c.id}' == dojo.byId('tax').value)
					taxrate = parseFloat('${c.taxRate}')/100;

				if('${c.id}' == dojo.byId('extTax1').value)
					tax2rate = parseFloat('${c.taxRate}')/100;

				if('${c.id}' == dojo.byId('extTax2').value)
					tax3rate = parseFloat('${c.taxRate}')/100;
			</c:forEach>

			var tbl = dojo.byId("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;

				for(var idx=len-1;idx>=0;idx--)
				{
					var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[6].firstChild.value);
					var amount = t_section.rows[idx].cells[7].firstChild;

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

			total.value = (trx+(trx*taxrate)+(trx*tax2rate)+(trx*tax3rate)+rounding).numberFormat('#,#.00');
			totalDef.value = (trxdef+(trxdef*taxrate)+(trxdef*tax2rate)+(trxdef*tax3rate)+rounding).numberFormat('#,#.00');
		}

		ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
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
				row.insertCell(6).appendChild(genPrc(index));
				row.insertCell(7).appendChild(genAmt(index));

				var _date = genDate(index);

				row.insertCell(8).appendChild(_date);

				var node = dojo.widget.createWidget("DropdownDatePicker", {inputName:"dates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_date);

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
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select valid Company first!');
			return;
		}

		var supplier = document.getElementById('supplier');
		if(supplier.value == '')
		{
			alert('Please select valid Supplier first!');
			return;
		}

		var _date = dojo.widget.byId("date");
		if(_date.getValue() == null || _date.getValue() == '')
		{
			alert('Plase select date first!');
			return;
		}

		var currency = document.getElementById('currency');
		var type = document.getElementById('type');

		openpopup("<c:url value='/page/popupproductprice4procurementview.htm?organization='/>"+org.value+"&target="+target+"&party="+supplier.value+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+_date.getValue()+"&defCurrency=${default.id}");
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
		quantity.setAttribute('size',"4");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');

		return quantity;
	}

	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"4");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;

		return uom;
	}

	function genStd(index)
	{
		var std = document.createElement("input");
		std.type = "text";
		std.id = "std["+index+"]";
		std.setAttribute('size',"12");
		std.value = "0";
		std.setAttribute('class','input-disabled');
		std.disabled = true;

		return std;
	}

	function genPrc(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'prices';
		price.id = "price["+index+"]";
		price.setAttribute('size',"12");
		price.value = "0";
		price.setAttribute('onblur','display()');

		return price;
	}

	function genAmt(index)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "amount["+index+"]";
		amount.setAttribute('size',"12");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}

	function genDate(index)
	{
		var date = document.createElement("input");
		date.type = "text";
		date.name = 'dates';
		date.id = "date["+index+"]";
		date.setAttribute('size',"10");

		return date;
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

	$(function(){
		$cst = $('#org');
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
							$bill = $('#billTo');
							$bill.empty();

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
									}
								});
							});
						}
					}
				}
			});

			$.ajax({
				url:"<c:url value='/page/popupfacilityjsonview.htm'/>",
				data:{organization:$cst.val()},
				method : 'GET',
				dataType : 'json',
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$ship = $('#shipTo');
							$ship.empty();

							$.each(json.facilitys,function(idx,obj){
								if(obj.address)
								{
									$opt = $('<option></option>');
									$opt.attr('value',obj.id);
									$opt.html(obj.address);
									$opt.appendTo($ship);
								}
							});
						}
					}
				}
			});
		});
	});
</script>
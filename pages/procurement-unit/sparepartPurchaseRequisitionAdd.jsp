<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/sparepartpurchaserequisitionview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_entry" style="cursor:pointer;"><span>Save</span></a>
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
                                          	<td width="73%"><input value="Auto Generated" class='input-disabled' disabled size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" class="combobox-ext">
                                                    <c:if test='${not empty requisition_add.organization}'>
                                                        <form:option value='${requisition_add.organization.id}' label='${requisition_add.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" inputId="dateId" name="date" value="<fmt:formatDate value='${requisition_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisition Type :</td>
                                            <td>
                                                <form:select path="requisitionType" class="combobox">
                                                    <form:option value='STOCK' label='STOCK'/>
                                                    <form:option value='ASSET' label='ASSET'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisitioner" class="combobox-ext">
                                                    <c:if test='${not empty requisition_add.requisitioner}'>
                                                        <form:option value='${requisition_add.requisitioner.id}' label='${requisition_add.requisitioner.firstName} ${requisition_add.requisitioner.lastName} ${requisition_add.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openrequisitioner();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" class="combobox-ext">
                                                    <c:if test='${not empty requisition.supplier}'>
                                                        <form:option value='${requisition.supplier.id}' label='${requisition.supplier.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Pemasok" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Requisition Status :</td>
                                            <td>
                                                <form:select id='status' path='status'>
                                                    <form:option value='REGULAR' label='REGULAR'/>
                                                    <form:option value='ADDITIONAL' label='ADDITIONAL'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                <c:forEach items='${currencys}' var='currency'>
                                                <c:if test="${currency.symbol == 'RP' }">
                                                    <form:option value='${currency.id}' label='${currency.symbol}' onclick='display();'/>
                                                </c:if>
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="1" size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='taxType' path='tax'>
                                                	<form:option label='-' value="0" onclick="javascript:document.getElementById('taxRate').value = 0;display();"
                                                    	onkeyup="javascript:document.getElementById('taxRate').value = 0;display();"/>
                                                	<c:forEach items='${taxes}' var='tax'>
                                                	<c:if test="${tax.taxId == 'PPN' }">
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"
                                                    	onkeyup="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                	</c:if>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" value="0" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" class="combobox-ext">
                                                    <c:if test='${not empty requisition_add.approver}'>
                                                        <form:option value='${requisition_add.approver.id}' label='${requisition_add.approver.firstName} ${requisition_add.approver.lastName} ${requisition_add.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                            </td>
                                        </tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Warehouse :</td>
											<td>
												<form:select id="facility" path="shipTo" cssClass="combobox-ext">
		                                           	<c:if test='${not empty requisition_add.shipTo}'>
		                                               	<form:option value='${requisition_add.shipTo.id}' label='${requisition_add.shipTo.name}' />
		                                            </c:if>
												</form:select>
												&nbsp;
												<img src="assets/icons/list_extensions.gif" onclick="openfacility('facility');" style="CURSOR:pointer;" title="Facility" />
											</td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Expired Date :</td>
                                            <td><input id="expiredDate" inputId="expiredDateId" name="expiredDate" value="<fmt:formatDate value='${requisition_add.expiredDate}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchase Reason :</td>
                                            <td><form:textarea path='reason' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="41%" valign="top">
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
                                                <td><input id="purchase" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="purchaseDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Discount 1 : </td>
                                                <td><input id="discAmount1" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="discAmount1Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Discount 2 : </td>
                                                <td><input id="discAmount2" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="discAmount2Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">DPP : </td>
                                                <td><input id="dppAmount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="dppAmountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">PPN : </td>
                                                <td><input id="taxamount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="taxamountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right"><strong>Total : </strong></td>
                                                <td><input id="total" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                                <td><input id="totalDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="address" dojoType="ContentPane" label="Billing & Shipping Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        	<tr>
                                				<td>Billing Address</td>
                                				<td>:
                                					<input id="billingAddress" disabled class='inputbox-ext input-disabled'/>
                                					<input type="hidden" id="billingAddressId" name="billTo"/>
                                				</td>
                                				<td>Shipping Address</td>
                                				<td>:
                                					<input id="shippingAddress" disabled class='inputbox-ext input-disabled'/>
                                					<input type="hidden" id="shippingAddressId" name="shippingAddress"/>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td>City</td>
                                				<td>: <input id="billingCity" disabled class='inputbox-ext input-disabled'/></td>
                                				</td>
                                				<td>City</td>
                                				<td>: <input id="shippingCity" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Postal Code</td>
                                				<td>: <input id="billingPostalCode" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Postal Code</td>
                                				<td>: <input id='shippingPostalCode' disabled class='input-disabled'/></td>
                                			</tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('lineItemTable')"><span>Delete Row</span></a>
                                        	<div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                            <th colspan="2">Product</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1 (Rp)</th>
                                            <th width="8%">Disc 2 (Rp)</th>
                                            <th width="10%">Total</th>
                                        	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="11">&nbsp;</td>
                                        </tr>    
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Purchase Requisition',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.b_entry').click(function(e){		
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/sparepartpurchaserequisitionadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Purchase Requisition data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/sparepartpurchaserequisitionview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason:<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	setBillingAddress($('#org').val());
	//setShippingAddress($('#org').val());

	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&personal=yes&organization='/>"+org.value);
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
	
	function openfacility(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?organization='/>"+org.value+"&target="+target);
	}
	
	function shocurrency()
	{
		var trx = document.getElementById('trx');
		if(trx)
		{
			<c:forEach items='${currencys}' var='c'>
				if('${c.id}' == dojo.byId('currency').value)
					trx.innerHTML = 'Amount (${c.symbol})';
			</c:forEach>
		}
	}
	
	function validation()
	{
		if($('#dateId').val() == null || $('#dateId').val() == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if(!$('#requisitioner').val())
		{
			alert('Please select Requisitioner first !!!');
			return;
		}
		
		if(!$('#supplier').val())
		{
			alert('Please select Supplier first !!!');
			return;
		}
		
		if($('#taxType').val() == '0')
		{
			alert('Please select Tax first !!!');
			return;
		}
		
		if(!$('#approver').val())
		{
			alert('Please select Approver first !!!');
			return;
		}
		
		if(!$('#facility').val())
		{
			alert('Please select Facility first !!!');
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
				var disc1 = parseFloat(t_section.rows[idx].cells[7].firstChild.value);
				var disc2 = parseFloat(t_section.rows[idx].cells[8].firstChild.value);
				
				if(product == '' || product == '0')
				{
					alert('Line Item Product cant be empty!');
					return;
				}

				if(quantity == '' || quantity <= '0')
				{
					alert('Line Item Quantity cannot be empty & must be greater than zero !!!');
					return;
				}
				
				if(disc1 == '' || disc1 < '0')
				{
					disc1 = 0;
				}
				
				if(disc2 == '' || disc2 < '0')
				{
					disc2 = 0;
				}
			}
		}
		
		return true;
	}

	function setBillingAddress(addId)
	{
		$.get("<c:url value='/page/partyremote.getbillingaddress.json'/>",{id:addId},function(json){
			$("#billingAddressId").val(json.addressId);
			$("#billingAddress").val(json.address);
			$("#billingPostalCode").val(json.postalCode);
			$("#billingCity").val(json.city);
		});
	}

	function setShippingAddress(addId)
	{
		$.get("<c:url value='/page/partyremote.getfacilityaddress.json'/>",{id:addId},function(json){
			$("#shippingAddressId").val(json.addressId);
			$("#shippingAddress").val(json.address);
			$("#shippingPostalCode").val(json.postalCode);
			$("#shippingCity").val(json.city);
		});
	}
	
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
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[5].firstChild.value.replace(/,/g,''));
				var amount = t_section.rows[idx].cells[6].firstChild;
				var disc1 = parseFloat(t_section.rows[idx].cells[7].firstChild.value);
				var disc2 = parseFloat(t_section.rows[idx].cells[8].firstChild.value);
				var tAmount = t_section.rows[idx].cells[9].firstChild;
				
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
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genQty(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genPrice(index));
				row.insertCell(6).appendChild(genSubTotal(index));
				row.insertCell(7).appendChild(genDisc1(index));
				row.insertCell(8).appendChild(genDisc2(index));
				row.insertCell(9).appendChild(genTotal(index));
				row.insertCell(10).appendChild(genHiddenPrice(index));
				
				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		
		return check;
	}

	function genProduct(index)
	{
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');

		return itemx;
	}

	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '') {
				alert('Please select Organization first !!!');
				return;
			}
			var target="product["+index+"]";
			openpopup("<c:url value='/page/popupproductview.htm?target='/>"+target+"&index="+index+"&categoryId=2&active=true");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Price';

		return _popup;

	}
	
	function genQty(index)
	{
		var quantity = document.createElement("input");
		quantity.type = "text";
		quantity.name = "quantitys";
		quantity.id = "quantity["+index+"]";
		quantity.setAttribute('size',"6");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');
		
		return quantity;
	}
	
	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+"]";
		uom.setAttribute('size',"20");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;
		
		return uom;
	}
	
	function genPrice(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.id = "price["+index+"]";
		price.name = 'prices';
		price.setAttribute('size',"20");
		price.value = "0";
		price.setAttribute('class','input-disabled');
		price.setAttribute('readonly','readonly');
		//price.disabled = true;
		price.setAttribute('onblur','display();');
		price.setAttribute('onchange','display();');
		
		return price;
	}

	function genHiddenPrice(index)
	{
		var price = document.createElement("input");
		price.type = "hidden";
		//price.name = 'prices';
		price.id = "pricehidden["+index+"]";

		return price;
	}
	
	function genSubTotal(index)
	{
		var sub = document.createElement("input");
		sub.type = "text";
		sub.id = "subTotal["+index+"]";
		sub.setAttribute('size',"20");
		sub.value = "0";
		sub.setAttribute('class','input-disabled');
		sub.disabled = true;
		
		return sub;
	}
	
	function genDisc1(index)
	{
		var disc = document.createElement("input");
		disc.type = "text";
		disc.name = 'discounts1';
		disc.id = "disc1["+index+"]";
		disc.setAttribute('size',"10");
		disc.value = "0";
		disc.setAttribute('onblur','display()');
		
		return disc;
	}
	
	function genDisc2(index)
	{
		var disc = document.createElement("input");
		disc.type = "text";
		disc.name = 'discounts2';
		disc.id = "disc2["+index+"]";
		disc.setAttribute('size',"10");
		disc.value = "0";
		disc.setAttribute('onblur','display()');
		
		return disc;
	}
	
	function genTotal(index)
	{
		var total = document.createElement("input");
		total.type = "text";
		total.id = "total["+index+"]";
		total.setAttribute('size',"20");
		total.value = "0";
		total.setAttribute('class','input-disabled');
		total.disabled = true;
		
		return total;
	}
	
	function setPrice(index)
	{
		var orgId = $("#org").val();
		var productId = $("#product\\["+index+"\\]").val();
		
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId},
		function(json)
		{
			$("#price\\["+index+"\\]").val(new Number(json.price).numberFormat("#,###"));
			$("#pricehidden\\["+index+"\\]").val(new Number(json.priceId));
		});
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/manualinvoiceverificationview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_submit" next='DONE' style="cursor:pointer;"><span>Save</span></a>
								<!-- <a class="item-button-save-new b_submit" next='NEW' style="cursor:pointer;"><span>Save &amp; New</span></a> -->											
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="72%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification_add.organization}'>
                                                        <form:option value='${verification_add.organization.id}' label='${verification_add.organization.firstName} ${verification_add.organization.lastName} ${verification_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" value="<fmt:formatDate value='${verification_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition.supplier}'>
                                                        <form:option value='${requisition.supplier.id}' label='${requisition.supplier.firstName} ${requisition.supplier.lastName} ${requisition.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                            	<form:select id='methodType' path='paymentMethodType'>
                                            		<form:option value='NOTADEBET' label='NOTA DEBET'/>
                                            		<form:option value='CASH' label='CASH'/>
                                            		<form:option value='TRANSFER' label='TRANSFER'/>
                                            	</form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier Invoice :</td>
                                            <td><form:input path='invoice' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Receive Date :</td>
                                            <td><input id="receivedDate" name="receivedDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Due Date :</td>
                                            <td><input id="dueDate" name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
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
                                                	<c:forEach items='${taxes}' var='tax'>
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='extTax1'>
                                                	<option value="" selected>&nbsp;</option>
                                                	<c:forEach items='${taxes}' var='tax'>
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('extTax1Rate').value = ${tax.taxRate};display();"/>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="extTax1Rate" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='extTax2'>
                                                	<option value="" selected>&nbsp;</option>
                                                	<c:forEach items='${taxes}' var='tax'>
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('extTax2Rate').value = ${tax.taxRate};display();"/>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="extTax2Rate" class="input-disabled" disabled/>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                       	  <td width="72%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input id="taxDate" name="taxDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Rounding :</td>
                                            <td><input id="rounding" name="rounding" value="0.00" onchange="display();" onkeyup="separator('rounding');"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Verification Type :</td>
                                            <td>
                                                <form:select id='verificationType' path='verificationType'>
                                                    <form:option value='STD_VERIFICATION' label='STANDARD VERIFICATION'/> 
                                                    <%-- <form:option value='GAS_VERIFICATION' label='GAS VERIFICATION' onclick="setLocation('true');"/> --%>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <%-- <tr>
                                            <td align="right">Gas Distribution Point: </td>
                                            <td>
                                            	<form:select id="warehouse" path="location" cssClass="combobox-ext">
                                                </form:select>
                                            </td>
                                        </tr> --%>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path='note' cols='55' rows='6'/></td>
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
                                            	<td align="right">Transaction : </td>
                                                <td><input id="transaction" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="transactionDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Discount : </td>
                                                <td><input id="discount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Transaction Before Tax: </td>
                                                <td><input id="beforetax" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="beforetaxDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Tax : </td>
                                                <td><input id="taxamount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxamountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <!-- <tr>
                                            	<td align="right">Tax 2 : </td>
                                                <td><input id="tax2amount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="tax2amountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Tax 3 : </td>
                                                <td><input id="tax3amount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="tax3amountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr> -->
                                            <tr>
                                            	<td align="right">Rounding : </td>
                                                <td><input id="round" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="roundDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                      		<tr>
                                            	<td align="right"><strong>Transaction Amount : </strong></td>
                                                <td><input id="total" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div style="overflow:auto;">
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
                                        <th width="5%">Bought</th>                                   
                                        <th width="5%">Received</th>
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
	$(function(){
		//Facility.init();
	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Manual Invoice Verification',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.b_submit').click(function(e){
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
					var quantity = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/g,''));
					
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
				}
			}
				
			$.ajax({
				url:"<c:url value='/page/manualinvoiceverificationadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Manual Invoice Verification data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/manualinvoiceverificationview.htm'/>";
							
							/* if($(e.target).html() == 'SAVE')
								window.location="<c:url value='/page/manualinvoiceverificationview.htm'/>";
							else
								window.location="<c:url value='/page/manualinvoiceverificationpreadd.htm'/>"; */
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
	
	function openfacility(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?type=10&organization='/>"+org.value+"&target="+target);
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
	
	function setLocation(flag)
	{
		if(flag == 'false')
		{
			document.getElementById('location').disabled = true;
			document.getElementById('locationURI').setAttribute('onclick','');
		}
		else
		{
			document.getElementById('location').disabled = false;
			document.getElementById('locationURI').setAttribute('onclick',"openfacility('location');");
		}
	}
	
	function display()
	{
		/* var _date = dojo.widget.byId("date");
		if(_date == null || _date.getDate() == '')
		{
			alert('Please select date first!');
			return;
		}
	
		var curr = document.getElementById('currency');
		var type = document.getElementById('type');
	
		var _event = function(rate)
		{ */
			var trx = 0.0;
			var trxdef = 0.0;
			
			var disc = 0.0;
			var discdef = 0.0;
			
			var taxrate = 0.0;
			var tax2rate = 0.0;
			var tax3rate = 0.0;
			
			var rounding = 0.0;
			//var defcurrrate = parseFloat(rate);
			
			if(document.getElementById('rounding').value != null || document.getElementById('trxrate').value != '')
			{
				rounding = parseFloat(document.getElementById('rounding').value);
				document.getElementById('round').value = rounding.numberFormat('#,###.00');
				//document.getElementById('roundDef').value = (rounding*defcurrrate).numberFormat('#,###.00');
			}			
			
			//document.getElementById('trxrate').value = defcurrrate.numberFormat('#,###.00');
			
			var transaction = document.getElementById('transaction');
			var transactionDef = document.getElementById('transactionDef');
			
			var discount = document.getElementById('discount');
			var discountDef = document.getElementById('discountDef');
			
			var beforetax = document.getElementById('beforetax');
			var beforetaxDef = document.getElementById('beforetaxDef');
			
			var tax = document.getElementById('taxamount');
			var taxDef = document.getElementById('taxamountDef');
			
			/* var tax2 = document.getElementById('tax2amount');
			var tax2Def = document.getElementById('tax2amountDef');
			
			var tax3 = document.getElementById('tax3amount');
			var tax3Def = document.getElementById('tax3amountDef'); */
			
			var total = document.getElementById('total');
			var totalDef = document.getElementById('totalDef');
			
			<c:forEach items='${taxes}' var='c'>
				if('${c.id}' == document.getElementById('tax').value)
					taxrate = parseFloat('${c.taxRate}')/100;
					
				/* if('${c.id}' == document.getElementById('extTax1').value)
					tax2rate = parseFloat('${c.taxRate}')/100;
					
				if('${c.id}' == document.getElementById('extTax2').value)
					tax3rate = parseFloat('${c.taxRate}')/100; */
			</c:forEach>
			
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
					
				for(var idx=len-1;idx>=0;idx--)
				{
					var quantity = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[6].firstChild.value.replace(/,/g,''));
					var uDisc = parseFloat(t_section.rows[idx].cells[8].firstChild.value.replace(/,/g,''));
					var uDiscAmt = parseFloat(t_section.rows[idx].cells[9].firstChild.value.replace(/,/g,''));
					
					if(uDisc == null || uDisc == '')
						uDisc = 0;

					disc = disc+(uDisc/100)*(quantity*price);
					t_section.rows[idx].cells[9].firstChild.value = ((uDisc/100)*(quantity*price)).numberFormat('#,###.00');
					
					/* if(uDisc != '' || uDiscAmt != '')
					{
						if(uDiscAmt >= uDisc)
						{
							disc += uDiscAmt;
							t_section.rows[idx].cells[8].firstChild.value = ((uDiscAmt*100)/(quantity*price));
						}
						else
						{
							disc += (uDisc/100)*(quantity*price);
							t_section.rows[idx].cells[9].firstChild.value = ((uDisc/100)*(quantity*price));
						}
					} */
					
					trx = trx+(quantity*price);
					
					t_section.rows[idx].cells[7].firstChild.value = (quantity*price).numberFormat('#,###.00');
				}
			}
			
			transaction.value = trx.numberFormat('#,###.00');
			transactionDef.value = trx.numberFormat('#,###.00');
			//transactionDef.value = (trx*defcurrrate).numberFormat('#,###.00');
			
			discount.value = disc.numberFormat('#,###.00');
			discountDef.value = disc.numberFormat('#,###.00');
			//discountDef.value = (disc*defcurrrate).numberFormat('#,###.00');
			
			beforetax.value = (trx-disc).numberFormat('#,###.00');
			beforetaxDef.value = (trx-disc).numberFormat('#,###.00');
			//beforetaxDef.value = ((trx-disc)*defcurrrate).numberFormat('#,###.00');
			
			tax.value = ((trx-disc)*taxrate).numberFormat('#,###.00');
			taxDef.value = ((trx-disc)*taxrate).numberFormat('#,###.00');
			//taxDef.value = ((trx-disc)*taxrate*defcurrrate).numberFormat('#,###.00');
			
			/* tax2.value = ((trx-disc)*tax2rate).numberFormat('#,###.00');
			tax2Def.value = ((trx-disc)*tax2rate*defcurrrate).numberFormat('#,###.00');
			
			tax3.value = ((trx-disc)*tax3rate).numberFormat('#,###.00');
			tax3Def.value = ((trx-disc)*tax3rate*defcurrrate).numberFormat('#,###.00'); */
			
			total.value = (trx-disc+((trx-disc)*taxrate)+((trx-disc)*tax2rate)+((trx-disc)*tax3rate)+rounding).numberFormat('#,###.00');
			totalDef.value = (trx-disc+((trx-disc)*taxrate)+((trx-disc)*tax2rate)+((trx-disc)*tax3rate)+rounding).numberFormat('#,###.00');
			//totalDef.value = ((trx-disc+((trx-disc)*taxrate)+((trx-disc)*tax2rate)+((trx-disc)*tax3rate)+rounding)*defcurrrate).numberFormat('#,###.00');
		//}
	
		//ExchangeDWRRemote.loadRate(curr.value,'${default.id}',_date.getValue(),type.value,_event);
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
				row.insertCell(3).appendChild(genBght(index));
				row.insertCell(4).appendChild(genQty(index));
				row.insertCell(5).appendChild(genUom(index));
				row.insertCell(6).appendChild(genPrice(index));
				row.insertCell(7).appendChild(genAmount(index));
				row.insertCell(8).appendChild(genPerc(index));
				row.insertCell(9).appendChild(genPercAmt(index));

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
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');
					
		return itemx;
	}
	
	function popup(target,index)
	{
		/* var org = document.getElementById('org');
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
		var type = document.getElementById('type'); */

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
	
	function genBght(index)
	{
		var bought = document.createElement("input");
		bought.type = "text";
		bought.name = "boughts";
		bought.id = "bought["+index+"]";
		bought.setAttribute('size',"5");
		bought.value = "0";
		bought.setAttribute('onchange','display()');
		
		return bought;
	}
	
	function genQty(index)
	{
		var received = document.createElement("input");
		received.type = "text";
		received.name = "receiveds";
		received.id = "received["+index+"]";
		received.setAttribute('size',"8");
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
		price.setAttribute('onchange','display();');
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
		disc.setAttribute('size',"5");
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
		discamount.setAttribute('readonly','readonly');
		
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
	
	function separator(id)
	{
		var amount = document.getElementById(id);
		
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
		}
	}
</script>
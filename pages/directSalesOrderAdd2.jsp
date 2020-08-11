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
                            <c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
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
                                          	<td width="73%"><input value="Auto Generated" disabled class='input-disabled' size='25'/></td>
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
                                                        <form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.firstName} ${salesOrder_add.organization.lastName} ${salesOrder.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
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
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Credit Term : </td>
                               		  	  	<td width="40%"><input id="creditTerm" class="input-disabled" value="0.00" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                <c:forEach items='${currencys}' var='currency'>
                                                    <form:option value='${currency.id}' label='${currency.symbol}' onclick='showcurrency();display();'/>
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" size="10" class="input-disabled" disabled value="1"/>
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
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_add.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_add.exchange.to.symbol}'/>)</th>
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
                                                        <td align="right">Tax Amount : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.taxAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.taxAmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Rounding : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${salesOrder_add.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${salesOrder_add.rounding*salesOrder.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total Transaction : </strong></td>
                                                        <td><input id="_trx" value="<fmt:formatNumber value='${adapter.total+salesOrder_add.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="trxdef" value="<fmt:formatNumber value='${adapter.totalDef+(salesOrder_add.rounding*salesOrder_add.exchange.rate)}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                        <c:forEach items='${salesOrder_add.items}' var='item'>
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
                                                    <c:if test='${not empty salesOrder_add.warehouse}'>
                                                        <form:option value='${salesOrder_add.warehouse.id}' label='${salesOrder_add.warehouse.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                            	<form:select id="grid" path="grid" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.grid}'>
                                                        <form:option value='${salesOrder_add.grid.id}' label='${salesOrder_add.grid.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                            	<form:select id="container" path="container" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.container}'>
                                                        <form:option value='${salesOrder_add.container.id}' label='${salesOrder_add.container.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
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
  <%@include file='/common/sirius-footer.jsp' %>
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
				url:"<c:url value='/page/directsalesordercopy.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
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

	function openfacility()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupfacilityview.htm?target=gudang&organization='/>"+org.value);
	}

	function opengrid(target)
	{
		var warehouse = document.getElementById('gudang');
		if(warehouse.value == null || warehouse.value == '')
		{
			alert('Please select Warehouse first!');
			return;
		}
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+warehouse.value);
	}

	function opencontainer()
	{
		var grid = document.getElementById('grid');
		if(grid.value == null || grid.value == '')
		{
			alert('Please select grid first!');
			return;
		}

		openpopup("<c:url value='/page/popupcontainerview.htm?target=container&grid='/>"+grid.value);
	}
</script>
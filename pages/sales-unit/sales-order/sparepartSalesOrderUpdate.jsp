<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/sparepartsalesorderview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <a class="item-button-print" href="<c:url value='/page/sparepartsalesorderprint.htm?id=${salesOrder_edit.id}'/>"><span>Print</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${salesOrder_edit.code}" disabled class='input-disabled' size='30'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.organization}'>
                                                        <form:option value='${salesOrder_edit.organization.id}' label='${salesOrder_edit.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" inputId="dateId" disabled class="input-disabled" size="10" value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
										<tr>
											<td align="right">Shift :</td>
											<td><input value="${salesOrder_edit.shift.code}" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
										<tr>
											<td align="right">Cashier :</td>
											<td><input value="${salesOrder_edit.shift.cashierPerson.name}" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.salesPerson}'>
                                                        <form:option value='${salesOrder_edit.salesPerson.id}' label='${salesOrder_edit.salesPerson.firstName} ${salesOrder_edit.salesPerson.lastName} ${salesOrder_edit.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Customer :</td>
                               		  	  	<td>
  												<form:select id='customer' path='customer' cssClass='combobox-ext'>
                                                    <c:if test='${not empty salesOrder_edit.customer}'>
                                                        <form:option value='${salesOrder_edit.customer.id}' label='${salesOrder_edit.customer.firstName} ${salesOrder_edit.customer.middleName} ${salesOrder_edit.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Customer Type :</td>
                                            <td><input id="customerType" value="${salesOrder_edit.customerType}" class="input-disabled" size='30' disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Discount Rate :</td>
                                            <td>
                                            	<input id="discountRate" value="${salesOrder_edit.customerDiscountRate}" class="input-disabled" size="5" disabled/> %
                                            	<input id="taxRate" type="hidden" value="1" size="5"/>
												<input type="hidden" id="currency" name="currency" value="1"/>
												<input type="hidden" id="type" name="exchangeType" value="SPOT"/>
												<input type="hidden" id="trxrate" value="1"/>
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
		                                            	<th width="80%">&nbsp;</th>
		                                           	  <th width="20%"><div id="trx">Amount</div></th>
		                                           	  <%-- <th width="20%">Amount (<c:out value='${saleOrder.currency.symbol}'/>)</th> --%>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Purchase : </td>
		                                                <td><input id="purchase" value="<fmt:formatNumber value='${salesAdapter.purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="20"/></td>
		                                                <%-- <td><input id="purchaseDef" value="<fmt:formatNumber value='${salesAdapter.defPurchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td> --%>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Satuan : </td>
		                                                <td><input id="discAmount1" value="<fmt:formatNumber value='${salesAdapter.discount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="20"/></td>
		                                                <%-- <td><input id="discAmount1Def" value="<fmt:formatNumber value='${salesAdapter.defDiscount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td> --%>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Pelanggan : </td>
		                                                <td><input id="discAmount2" value="<fmt:formatNumber value='${salesAdapter.discountCustomer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="20"/></td>
		                                                <%-- <td><input id="discAmount2Def" value="<fmt:formatNumber value='${salesAdapter.defDiscountCustomer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td> --%>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Pembulatan : </td>
		                                                <td><input id="discAmount3" value="<fmt:formatNumber value='${salesAdapter.sparepartSalesOrder.discountAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="20"/></td>
		                                                <%-- <td><input id="discAmount2Def" value="<fmt:formatNumber value='${salesAdapter.defDiscountCustomer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td> --%>
		                                            </tr>
		                                            <%-- <tr>
		                                            	<td align="right">DPP : </td>
		                                                <td><input id="dppAmount" value="<fmt:formatNumber value='${salesAdapter.dpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="dppAmountDef" value="<fmt:formatNumber value='${salesAdapter.defDpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">PPN : </td>
		                                                <td><input id="taxamount" value="<fmt:formatNumber value='${salesAdapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${salesAdapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr> --%>
		                                            <tr>
		                                            	<td align="right"><strong>Total : </strong></td>
		                                                <td><input id="total" value="<fmt:formatNumber value='${salesAdapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="20"/></td>
		                                                <%-- <td><input id="totalDef" value="<fmt:formatNumber value='${salesAdapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td> --%>
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
                                    <div id="lineItem" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="itemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="20%" nowrap="nowrap">Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%" nowrap="nowrap">Harga</th>                                    
                                            <th width="10%" nowrap="nowrap">Sub Total</th>
                                            <th width="10%" nowrap="nowrap">Diskon Satuan (%)</th>
                                            <th width="40%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
				                            <c:forEach items='${salesOrder_edit.items}' var='item'>
				                            <tr>
				                            	<td nowrap="nowrap">${item.price.product.code} ${item.price.product.name}</td>
				                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
				                            	<td nowrap="nowrap">${item.price.product.unitOfMeasure.name}</td>
				                                <td><fmt:formatNumber value='${item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.quantity*item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.discount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${(item.quantity*item.price.money.amount)-((item.quantity*item.price.money.amount)*(item.discount/100))}' pattern=',##0.00'/></td>
				                            </tr>
				                            </c:forEach>
			                            </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="7">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="Payment" dojoType="ContentPane" label="Payment" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="paymentTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
											<th width="20%">Payment Type</th>
											<th width="15%">Reference</th>
											<th width="60%">Amount</th>
                                        </tr>
                                        </thead>
                                        <tbody>
				                            <c:forEach items='${salesOrder_edit.applications}' var='app'>
				                            <tr>
				                            	<td nowrap="nowrap">${app.unitSalesPaymentProgram.name}</td>
				                            	<td nowrap="nowrap">${app.referenceCode}</td>
				                                <td><fmt:formatNumber value='${app.amount}' pattern=',##0.00'/></td>
				                            </tr>
				                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="3">&nbsp;</td>
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
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sparepart Sales Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e)
		{
			$.ajax({
				url:"<c:url value='/page/sparepartsalesorderedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sparepart Sales Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/sparepartsalesorderview.htm'/>";
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
	
	/* setCustomerType(${salesOrder_edit.customer.id});
	function setCustomerType(cust)
	{
		$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:cust},function(json){
			$("#customerType").val(json.classificationType);
			$("#discountRate").val(json.discount);
		});
	} */

</script>
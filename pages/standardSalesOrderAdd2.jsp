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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/standardsalesordercopy.htm'/>";
			document.addForm.submit();
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
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
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
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="57%" valign="top">
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
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.organization}'>
                                                        <form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.firstName} ${salesOrder_add.organization.lastName} ${salesOrder_add.organization.middleName}' />
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
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                              <form:select id="approver" path="approver" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${salesOrder_add.approver.id}' label='${salesOrder_add.approver.firstName} ${salesOrder_add.approver.lastName} ${salesOrder_add.approver.middleName}' />
                                              </form:select>
                                            </td>
                                        </tr>
                                  		<tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                	<form:option value='${salesOrder_add.currency.id}' label='${salesOrder_add.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="10" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_add.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax'>
                                                	<form:option value='${salesOrder_add.tax.id}' label='${salesOrder.tax.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_add.tax.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='extTax1' path='extTax1'>
                                                	<form:option value='${salesOrder_add.extTax1.id}' label='${salesOrder_add.extTax1.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate2" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_add.extTax1.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='extTax2' path='extTax2'>
                                                	<form:option value='${salesOrder_add.extTax2.id}' label='${salesOrder_add.extTax2.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_add.extTax2.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                            	<form:select id="warehouse" path="facility" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.facility}'>
                                                        <form:option value='${salesOrder_add.facility.id}' label='${salesOrder_add.facility.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  </td>
                       		    	<td width="43%" valign="top">
          								<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="51%">&nbsp;</th>
                                                   	  <th width="26%">Amount (
                                               	      <c:out value='${salesOrder_add.exchange.from.symbol}'/>)</th>
                                                   	  <th width="23%">Amount (
                                               	      <c:out value='${salesOrder_add.exchange.to.symbol}'/>)</th>
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
                                                        <td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.taxAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.taxAmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 2 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax2Amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.tax2AmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax 3 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax3Amount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountdef" value="<fmt:formatNumber value='${adapter.tax3AmountDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total Transaction : </strong></td>
                                                        <td><input id="_trx" value="<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="trxdef" value="<fmt:formatNumber value='${adapter.totalDef}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                            <td width="10%" align="right">Customer : </td>
                               		  	  	<td width="40%">
          										<form:select id='customer' path='customer' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.customer}'>
                                                        <form:option value='${salesOrder_add.customer.id}' label='${salesOrder_add.customer.firstName} ${salesOrder_add.customer.middleName} ${salesOrder_add.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>                                            
                                            <td width="11%" align="right">Billing Address : </td>
                                      		<td width="39%">
          										<form:select id='billingAddress' path='billingAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.billingAddress}'>
                                                        <form:option value='${salesOrder_add.billingAddress.id}' label='${salesOrder_add.billingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Contact Person : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='contact' path='contact' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.contact}'>
                                                        <form:option value='${salesOrder_add.contact.id}' label='${salesOrder_add.contact.firstName} ${salesOrder_add.contact.middleName} ${salesOrder_add.contact.lastName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>                                            
                                          <td width="11%" align="right">Tax Address : </td>
                                      		<td width="39%">
          										<form:select id='taxAddress' path='taxAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.taxAddress}'>
                                                        <form:option value='${salesOrder_add.taxAddress.id}' label='${salesOrder_add.taxAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Mobile No : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='mobile' path='mobile' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.mobile}'>
                                                        <form:option value='${salesOrder_add.mobile.id}' label='${salesOrder_add.mobile.contact}' />
                                                    </c:if>
                                                </form:select>
                                          </td>                                            
                                          <td width="11%" align="right">Shipping Address : </td>
                                      		<td width="39%">
          										<form:select id='shippingAddress' path='shippingAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.shippingAddress}'>
                                                        <form:option value='${salesOrder_add.shippingAddress.id}' label='${salesOrder_add.shippingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Email : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='email' path='email' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_add.email}'>
                                                        <form:option value='${salesOrder_add.email.id}' label='${salesOrder_add.email.contact}' />
                                                    </c:if>
                                                </form:select>
                                          	</td>                                            
                                          	<td width="11%" align="right">&nbsp;</td>
                                      		<td width="39%">&nbsp;</td>
                                        </tr>
                                        </table>
                                    </div>
                                    <div id="items" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="27%">Product</th>
                                          	<th width="7%">Qty</th>
                                          	<th width="6%">UoM</th>
                                          	<th width="9%">Unit Price</th>                                    
                                          	<th width="9%">Discount</th>
                                          	<th width="9%">Amount</th>
                                          	<th width="10%">Tot Disc</th>
                                            <th width="9%">Tot Amount</th>
                                            <th width="12%">Note</th>
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
                                            <td><fmt:formatNumber value='${item.quantity*item.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${item.quantity*item.discount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${(item.quantity*item.unitPrice)-(item.quantity*item.discount)}' pattern=',##0.00'/></td>
                                        	<td><c:out value='${item.note}'/></td>
                                        </tr>
                                        </c:forEach>
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
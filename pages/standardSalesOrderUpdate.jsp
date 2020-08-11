<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Standard Sales Order >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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
			<td width="60%">Sales > Sales Order > Standard Sales Order > Edit</td>
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
                            <c:if test='${access.edit}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.add and access.edit}'>
								<a class="item-button-copy" href="<c:url value='/page/standardsalesorderprecopy.htm?id=${salesOrder_edit.id}'/>"><span>Copy</span></a>
                            </c:if>
                            <c:if test="${access.edit and salesOrder_edit.status == 'CLOSE' and salesOrder_edit.approvable.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
								<a class="item-button-open b_status" style="cursor:pointer;"><span>Open</span></a>
                            </c:if>
                            <c:if test="${access.edit and salesOrder_edit.status == 'OPEN' and salesOrder_edit.closeable and salesOrder_edit.approvable.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
								<a class="item-button-close b_status"style="cursor:pointer;"><span>Close</span></a>
                            </c:if>
                            <c:if test="${access.edit and salesOrder_edit.lockStatus == 'LOCK'}">
								<a class="item-button-unlock b_status" style="cursor:pointer;"><span>Unlock</span></a>
                            </c:if>
                            <c:if test="${access.edit and salesOrder_edit.lockStatus == 'UNLOCK'}">
								<a class="item-button-lock b_status" style="cursor:pointer;"><span>Lock</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="51%" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${salesOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Order Type :</td>
                                            <td>
                                                 <form:select id="salesType" path="salesType" cssClass="combobox" disabled='true'>
                                                	<form:option value='STANDARD' label='Sales from Stock'/>
                                                    <form:option value='PO_REF' label='Sales to Purchase'/>
                                                    <form:option value='TRANSPORTIR' label='Sales Transportir'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.organization}'>
                                                        <form:option value='${salesOrder_edit.organization.id}' label='${salesOrder_edit.organization.firstName} ${salesOrder_edit.organization.lastName} ${salesOrder_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 1 :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.salesPerson}'>
                                                        <form:option value='${salesOrder_edit.salesPerson.id}' label='${salesOrder_edit.salesPerson.firstName} ${salesOrder_edit.salesPerson.lastName} ${salesOrder_edit.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person 2 :</td>
                                            <td>
                                                <form:select id="secondarySales" path="secondarySales" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.secondarySales}'>
                                                        <form:option value='${salesOrder_edit.secondarySales.id}' label='${salesOrder_edit.secondarySales.firstName} ${salesOrder_edit.secondarySales.lastName} ${salesOrder_edit.secondarySales.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                              <form:select id="approver" path="approver" cssClass="combobox-ext" disabled='true'>
                                                    <form:option value='${salesOrder_edit.approver.id}' label='${salesOrder_edit.approver.firstName} ${salesOrder_edit.approver.lastName} ${salesOrder_edit.approver.middleName}' />
                                              </form:select>
                                            </td>
                                        </tr>
                                  <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                	<form:option value='${salesOrder_edit.currency.id}' label='${salesOrder_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="10" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                            	<form:select id='tax' path='tax'>
                                                	<form:option value='${salesOrder_edit.tax.id}' label='${salesOrder_edit.tax.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.tax.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                            	<form:select id='extTax1' path='extTax1'>
                                                	<form:option value='${salesOrder_edit.extTax1.id}' label='${salesOrder_edit.extTax1.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate2" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.extTax1.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                            	<form:select id='extTax2' path='extTax2'>
                                                	<form:option value='${salesOrder_edit.extTax2.id}' label='${salesOrder_edit.extTax2.taxName}'/>
                                              	</form:select>
                                                &nbsp;
                                              	<input size="7" id="taxRate3" class="input-disabled" disabled value="<fmt:formatNumber value='${salesOrder_edit.extTax2.taxRate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Warehouse : </td>
                                            <td>
                                            	<form:select id="warehouse" path="facility" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_edit.facility}'>
                                                        <form:option value='${salesOrder_edit.facility.id}' label='${salesOrder_edit.facility.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
					<tr>
                                            <td align="right">PO Customer No  : </td>
                                            <td><form:input path='poNo' size='25' maxlength='50' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  	</td>
                       		    	<td width="49%" valign="top">
  							  			<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="60%">&nbsp;</th>
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_edit.exchange.from.symbol}'/>)</th>
                                                      	<th width="20%">Amount (<c:out value='${salesOrder_edit.exchange.to.symbol}'/>)</th>
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
                                                <fieldset>
                                                    <legend><strong>Reference</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="45%" align="right">Delivery Planning : </td>
                                                        <td width="55%" align="left"><a href="<c:url value='/page/deliveryplanningpreedit.htm?id=${salesOrder_edit.deliveryPlanning.id}'/>">
                                                      <c:out value='${salesOrder_edit.deliveryPlanning.code}'/></a></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                       	  	<td><%@ include file="/common/approval-history.jsp" %></td>
                                        </tr>
                                        <c:if test="${not empty guest and guest.id == approvalDecision.forwardTo.id and approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH' and approvalDecision.approvalDecisionStatus != 'REJECTED'}">
                                        <tr>
                                       	  	<td>
                                            	<table style="border:none" width="100%">
                                                <tr>
                                                	<td>
                                                    	<fieldset>
                                                            <legend><strong>Credit Limit Information</strong></legend>
                                                            <center>
                                                                <c:if test="${adapter.salesOrder.approvable.approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH' and adapter.usedPlafon+adapter.total > adapter.plafon.plafon}">
                                                                <font color="#FF0000">
                                                                    <strong>Sales Amount (<c:out value='${salesOrder_edit.currency.symbol}'/>&nbsp;<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>) > Credit Limit (<c:out value='${salesOrder_edit.currency.symbol}'/>&nbsp;<fmt:formatNumber value='${adapter.plafon.plafon - adapter.usedPlafon}' pattern=',##0.00'/>).</strong>
                                                                
                                                                </font>
                                                                <br/>
                                                                </c:if>
                                                                <br/>
                                                                Available Credit Limit:&nbsp;
                                                                <input id="plafon" value="<fmt:formatNumber value='${adapter.plafon.plafon-adapter.usedPlafon}' pattern=',##0.00'/>" class="input-disabled" disabled size="15"/>&nbsp;
                                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupplafonview.htm?id=${salesOrder_edit.approvable.plafon.id}'/>');" style="CURSOR:pointer;" title="Plafon" />
                                                            </center>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        </c:if>
                                        <tr>
                                       	  	<td><%@ include file="/common/approval.jsp" %></td>
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
                                                    <c:if test='${not empty salesOrder_edit.customer}'>
                                                        <form:option value='${salesOrder_edit.customer.id}' label='${salesOrder_edit.customer.firstName} ${salesOrder_edit.customer.middleName} ${salesOrder_edit.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>                                            
                                            <td width="11%" align="right">Billing Address : </td>
                                      		<td width="39%">
          										<form:select id='billingAddress' path='billingAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.billingAddress}'>
                                                        <form:option value='${salesOrder_edit.billingAddress.id}' label='${salesOrder_edit.billingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Contact Person : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='contact' path='contact' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.contact}'>
                                                        <form:option value='${salesOrder_edit.contact.id}' label='${salesOrder_edit.contact.firstName} ${salesOrder_edit.contact.middleName} ${salesOrder_edit.contact.lastName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>                                            
                                          <td width="11%" align="right">Tax Address : </td>
                                      		<td width="39%">
          										<form:select id='taxAddress' path='taxAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.taxAddress}'>
                                                        <form:option value='${salesOrder_edit.taxAddress.id}' label='${salesOrder_edit.taxAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Mobile No : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='mobile' path='mobile' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.mobile}'>
                                                        <form:option value='${salesOrder_edit.mobile.id}' label='${salesOrder_edit.mobile.contact}' />
                                                    </c:if>
                                                </form:select>
                                          </td>                                            
                                          <td width="11%" align="right">Shipping Address : </td>
                                      		<td width="39%">
          										<form:select id='shippingAddress' path='shippingAddress' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.shippingAddress}'>
                                                        <form:option value='${salesOrder_edit.shippingAddress.id}' label='${salesOrder_edit.shippingAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right">Email : </td>
                                   		  	<td width="40%">
				  						  		<form:select id='email' path='email' cssClass='combobox-ext' disabled='true'>
                                                    <c:if test='${not empty salesOrder_edit.email}'>
                                                        <form:option value='${salesOrder_edit.email.id}' label='${salesOrder_edit.email.contact}' />
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
                                        <c:forEach items='${salesOrder_edit.items}' var='item'>
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
						<div class="info">Created by : <c:out value='${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Change Status',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.b_status').click(function(e){
			$target = $(e.target);
			
			$uri = "";
			$status = "";
			
			if($target.html() == 'Open')
			{
				$uri = "<c:url value='/page/standardsalesorderterchangestatus.htm'/>"
				$status = 'OPEN';
			}
			else if($target.html() == 'Close')
			{
				$uri = "<c:url value='/page/standardsalesorderterchangestatus.htm'/>"
				$status = 'CLOSE';
			}
			else if($target.html() == 'Lock')
			{
				$uri = "<c:url value='/page/standardsalesorderterchangelockstatus.htm'/>"
				$status = 'LOCK';
			}
			else if($target.html() == 'Unlock')
			{
				$uri = "<c:url value='/page/standardsalesorderterchangelockstatus.htm'/>"
				$status = 'UNLOCK';
			}
			
			$.ajax({
				url:$uri,
				data:{id:'${salesOrder_edit.id}',status:$status},
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Status......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/standardsalesorderpreedit.htm?id=${salesOrder_edit.id}'/>";
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
	
	function save()
	{		
		document.editForm.action = "<c:url value='/page/standardsalesorderedit.htm'/>";
		document.editForm.submit();
	}
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsalesapproverview.htm?target=forwardTo&organization=${salesOrder_edit.organization.id}'/>");
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
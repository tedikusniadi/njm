<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Purchase Preparation >> Edit</title>
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
			<td width="60%">Procurement > Purchase Preparation > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">P20 - Purchase Preparation</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/purchaserequisitionview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.edit}'>
								<a class="item-button-edit" href="<c:url value='/page/purchaserequisitioncopy.htm?id=${requisition_edit.id}'/>"><span>Copy</span></a>
                            </c:if>
                            <c:if test='${access.edit and empty requisition_edit.purchaseOrder}'>
								<a class="item-button-create-delivery-planning" href="<c:url value='/page/purchaseorderpreadd2.htm?id=${requisition_edit.id}'/>"><span>Create PO</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="requisition_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="50%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="73%"><input value="${requisition_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisitionType" cssClass="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='PURCHASE TO STOCK'/>
                                                    <form:option value='ASSET' label='FIXED ASSET ITEM'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.organization}'>
                                                        <form:option value='${requisition_edit.organization.id}' label='${requisition_edit.organization.firstName} ${requisition_edit.organization.lastName} ${requisition_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${requisition_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisitioner" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.requisitioner}'>
                                                        <form:option value='${requisition_edit.requisitioner.id}' label='${requisition_edit.requisitioner.firstName} ${requisition_edit.requisitioner.lastName} ${requisition_edit.requisitioner.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchase Reason :</td>
                                            <td><form:textarea path='reason' cols='45' rows='5'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.approver}'>
                                                        <form:option value='${requisition_edit.approver.id}' label='${requisition_edit.approver.firstName} ${requisition_edit.approver.lastName} ${requisition_edit.approver.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.supplier}'>
                                                        <form:option value='${requisition_edit.supplier.id}' label='${requisition_edit.supplier.firstName} ${requisition_edit.supplier.lastName} ${requisition_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="14%" align="right">Supplier Address : </td>
                                            <td width="35%">
                                            	 <form:select id="supplierAddress" path="supplierAddress" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.supplierAddress}'>
                                                        <form:option value='${requisition_edit.supplierAddress.id}' label='${requisition_edit.supplierAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Contact :</td>
                                            <td>
                                                <form:select id="contact" path="contact" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.contact}'>
                                                        <form:option value='${requisition_edit.contact.id}' label='${requisition_edit.contact.firstName} ${requisition_edit.contact.lastName} ${requisition_edit.contact.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                               		<form:option value='${requisition_edit.currency.id}' label='${requisition_edit.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${requisition_edit.exchange.rate}' pattern=',##0.0000'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 1 :</td>
                                            <td>
                                                <form:select id='tax' path='tax' disabled='true'>
                                                	<form:option value='${requisition_edit.tax.id}' label='${requisition_edit.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${requisition_edit.tax.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 2 :</td>
                                            <td>
                                                <form:select id='extTax1' path='extTax1' disabled='true'>
                                                	<form:option value='${requisition_edit.extTax1.id}' label='${requisition_edit.extTax1.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${requisition_edit.extTax1.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax 3 :</td>
                                            <td>
                                                <form:select id='extTax2' path='extTax2' disabled='true'>
                                                	<form:option value='${requisition_edit.extTax2.id}' label='${requisition_edit.extTax2.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="${requisition_edit.extTax2.taxRate}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payment Method Type : </td>
                                            <td >
                                                <form:select id='methodType' path='paymentMethodType' disabled='true'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Credit Term :</td>
                                            <td><input size="10" class="input-disabled" disabled value="${requisition_edit.creditTerm.term}"/>&nbsp; Days</td>
                                        </tr>
                                        </table>
                                    </td>
                              		<td width="50%" valign="top">
			  							<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                              		<legend><strong>Transaction Recapitulation</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                      <th width="60%">&nbsp;</th>
                                                      <th width="20%">Amount (<c:out value='${requisition_edit.exchange.from.symbol}'/>)</th>
                                                      <th width="20%">Amount (<c:out value='${requisition_edit.exchange.to.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                      <td align="right">Purchase : </td>
                                                        <td><input id="purchase" value="<fmt:formatNumber value='${adapter.purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.defPurchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 1 : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 2 : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.tax1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defTax1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Tax 3 : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.tax2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.defTax2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="right"><strong>Transaction Amount : </strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                              		</table>
                                                </fieldset>
                                                <c:if test='${not empty requisition_edit.purchaseOrder}'>
                                                <fieldset>
                                                	<legend>Reference</legend>
                                                    <a href="<c:url value='/page/purchaseorderpreedit.htm?id=${requisition_edit.purchaseOrder.id}'/>">
                                                    	<c:out value='${requisition_edit.purchaseOrder.code}'/>
                                                    </a>
                                                </fieldset>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td><%@ include file="/common/approval-history.jsp" %></td>
                                        </tr>
                                        <tr>
                                        	<td><%@ include file="/common/approval.jsp" %></td>
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
                                            <td width="14%" align="right">Bill To : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_edit.billTo}'>
                                                        <form:option value='${requisition_edit.billTo.id}' label='${requisition_edit.billTo.party.firstName} ${requisition_edit.billTo.party.middleName} ${requisition_edit.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <c:if test="${requisition_edit.approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH'}">
                                                <img src="assets/icons/list_extensions.gif" onclick="openpostal('billTo');" style="CURSOR:pointer;" title="Address" />
                                            	</c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To : </td>
                                            <td>
                                                <form:select id="shipTo" path="shipTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition_edit.shipTo}'>
                                                        <form:option value='${requisition_edit.shipTo.id}' label='${requisition_edit.shipTo.postalAddress.address}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <c:if test="${requisition_edit.approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH'}">
                                                <img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Address" />
                                                </c:if>
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true" selected='true'>
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="32%">Product</th>
                                            <th width="12%">Qty</th>
                                          	<th width="8%">UoM</th>
                                          	<th width="12%">Std Price</th>                                    
                                          	<th width="12%">Buy Price</th>
                                          	<th width="15%">Amount</th>
                                          	<th width="9%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${requisition_edit.items}' var='line'>
                                        <tr>
                                        	<td><c:out value='${line.productPrice.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.productPrice.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.productPrice.money.amount*line.exchange.rate}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.unitPrice}' pattern=',##0.00'/></td>
                                            <td><fmt:formatDate value='${line.deliveryDate}' pattern='dd-MM-yyyy'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
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
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Purchase Preparation',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/purchaserequisitionedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Purchase Preparation data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/purchaserequisitionview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				},
				error : function(xhr) {
					alert('Request fail,its maybe becouse you dont have permision to access the resources.');
				}
			});		
		});
	});
		
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
	
	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppurchaseapproverview.htm?target=forwardTo&organization=${requisition_edit.organization.id}'/>");
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
</script>
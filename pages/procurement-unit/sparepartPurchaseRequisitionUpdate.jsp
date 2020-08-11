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
                            <c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test="${access.edit and empty requisition_edit.purchaseOrder and requisition_edit.approvalDecision.approvalDecisionStatus == 'APPROVE_AND_FINISH'}">
								<a class="item-button-create-delivery-planning" href="<c:url value='/page/sparepartpurchaseorderpreadd2.htm?id=${requisition_edit.id}'/>"><span>Create PO</span></a>
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
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.organization}'>
                                                        <form:option value='${requisition_edit.organization.id}' label='${requisition_edit.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${requisition_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Type :</td>
                                            <td>
                                                <form:select path="requisitionType" class="combobox" disabled='true'>
                                                    <form:option value='STOCK' label='PURCHASE TO STOCK'/>
                                                    <form:option value='ASSET' label='FIXED ASSET ITEM'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Requisitioner :</td>
                                            <td>
                                                <form:select id="requisitioner" path="requisitioner" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.requisitioner}'>
                                                        <form:option value='${requisition_edit.requisitioner.id}' label='${requisition_edit.requisitioner.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Supplier :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.supplier}'>
                                                        <form:option value='${requisition_edit.supplier.id}' label='${requisition_edit.supplier.firstName} ${requisition_edit.supplier.lastName} ${requisition_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td align="right">Requisition Status :</td>
                                            <td>
                                            	<form:select id='status' path='status' disabled='true'>
                                                    <form:option value='REGULAR' label='REGULAR'/>
                                                    <form:option value='ADDITIONAL' label='ADDITIONAL'/>
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
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${requisition_edit.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='tax' path='tax' disabled='true'>
                                                	<form:option value='${requisition_edit.tax.id}' label='${requisition_edit.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled value="<fmt:formatNumber value='${requisition_edit.tax.taxRate}' pattern=',##0.00'/> %"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Approver :</td>
                                            <td>
                                                <form:select id="approver" path="approver" class="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty requisition_edit.approver}'>
                                                        <form:option value='${requisition_edit.approver.id}' label='${requisition_edit.approver.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Warehouse :</td>
											<td>
												<form:select id="facility" path="shipTo" cssClass="combobox-ext">
		                                           	<c:if test='${not empty requisition_edit.shipTo}'>
		                                               	<form:option value='${requisition_edit.shipTo.id}' label='${requisition_edit.shipTo.name}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Expired Date :</td>
                                            <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${requisition_edit.expiredDate}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Purchase Reason :</td>
                                            <td><form:textarea path='reason' cols='45' rows='5'/></td>
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
                                                      	<td align="right">Discount 1 : </td>
                                                        <td><input id="discAmount1" value="<fmt:formatNumber value='${adapter.discount1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="discAmount1Def" value="<fmt:formatNumber value='${adapter.defDiscount1}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">Discount 2 : </td>
                                                        <td><input id="discAmount2" value="<fmt:formatNumber value='${adapter.discount2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="discAmount2Def" value="<fmt:formatNumber value='${adapter.defDiscount2}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">DPP : </td>
                                                        <td><input id="dppAmount" value="<fmt:formatNumber value='${adapter.dpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="dppAmountDef" value="<fmt:formatNumber value='${adapter.defDpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                      	<td align="right">PPN : </td>
                                                        <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                        <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                                    <a href="<c:url value='/page/sparepartpurchaseorderpreedit.htm?id=${requisition_edit.purchaseOrder.id}'/>">
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
                                            	 <form:select id="billTo" path="billTo" class="combobox-ext">
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
                                                <form:select id="shipTo" path="shipTo" class="combobox-ext">
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
                                    <div id="itemRequisition" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true" selected='true'>
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Product</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1 (Rp)</th>
                                            <th width="8%">Disc 2 (Rp)</th>
                                            <th width="10%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${requisition_edit.items}' var='line'>
                                        <c:if test="${line.requisitionItemType == 'NORMAL'}">
                                        <tr>
                                        	<td>&nbsp;</td>
                                        	<td nowrap="nowrap">
                                        		<c:out value='${line.product.code}'/>
                                        		<c:out value='${line.product.name}'/>
                                        		<c:if test="${not empty guest and guest.id == approvalDecision.forwardTo.id and approvalDecision.approvalDecisionStatus != 'APPROVE_AND_FINISH' and approvalDecision.approvalDecisionStatus != 'REJECTED'}">
	                                            	&nbsp;<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openonhand('${line.product.id}');" style="CURSOR:pointer;" title="On Hand" />
	                                            </c:if>
                                            </td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.discount1}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.discount2}' pattern=',##0.00'/></td>
                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern=',##0.00'/></td> --%>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="itemAdditional" dojoType="ContentPane" label="Transaksi Tambahan" class="tab-pages" refreshOnShow="true" selected='true'>
                                    	<div class="item-navigator">&nbsp;</div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%">&nbsp;</th>
                                            <th width="15%">Product</th>
                                            <th width="8%">Unit</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%">Unit Price</th>                                    
                                            <th width="10%">Sub Total</th>
                                            <th width="8%">Disc 1 (Rp)</th>
                                            <th width="8%">Disc 2 (Rp)</th>
                                            <th width="10%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${requisition_edit.items}' var='line'>
                                        <c:if test="${line.requisitionItemType != 'NORMAL'}">
                                        <tr>
                                        	<td>&nbsp;</td>
                                        	<td nowrap="nowrap"><c:out value='${line.product.code}'/> <c:out value='${line.product.name}'/></td>
                                            <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
                                            <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
                                            <td><fmt:formatNumber value='${line.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.discount1}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${line.discount2}' pattern=',##0.00'/></td>
                                            <%-- <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern=',##0.00'/></td> --%>
                                            <td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${requisition_edit.createdBy.firstName} ${requisition_edit.createdBy.middleName} ${requisition_edit.createdBy.lastName}'/> (<fmt:formatDate value='${requisition_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${requisition_edit.updatedBy.firstName} ${requisition_edit.updatedBy.middleName} ${requisition_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${requisition_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Purchase Preparation',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/sparepartpurchaserequisitionedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Purchase Requisition data......');
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
				},
				error : function(xhr) {
					alert('Request fail,its maybe because you do not have permision to access the resources.');
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
	
	function openonhand(product)
	{
		openpopup("<c:url value='/page/onhandquantitypopupunitview.htm?product='/>"+product);
	}
</script>
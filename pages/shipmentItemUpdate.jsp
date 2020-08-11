<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment Detail >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/shipmentitemedit.htm'/>";
			document.editForm.submit();
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
			<td width="60%">Transport Outsource > Transport Management > Shipment > Shipment Detail > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D12 - Shipment Detail</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/shipmentpreedit.htm?id=${item.shipment.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="item">
								<table width="100%" style="border:none">
                                <tr>
                                	<td nowrap="nowrap" align="right">Shipment ID :</td>
                                    <td><input class="input-disabled" disabled value="${item.shipment.code}" size="35"/></td>
                                </tr>
                                <tr>
									<td width="22%" align="right" nowrap="nowrap">Customer :</td>
							    	<td width="36%">
  								  		<form:select id="customer" path="customer" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${item.customer.id}' label='${item.customer.firstName} ${item.customer.lastName} ${item.customer.middleName}' />
										</form:select>
									</td>
                                    <td width="42%" rowspan="9" valign="top">
                                    	<fieldset>
                                        	<legend>Recapitulation</legend>
                                            <table width="100%">
                                            <tr>
                                            	<th width="26%">&nbsp;</th>
                                              	<th width="36%"><strong>Amount 
                                              	<c:out value='${item.shipment.currency.symbol}'/></strong></th>
                                              	<th width="38%"><strong>Amount 
                                              	<c:out value='${defcurrency.symbol}'/></strong></th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Main Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${item.cost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${item.cost*item.exchange.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Other Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${item.otherCost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${item.otherCost*item.exchange.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${item.otherCost+item.cost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${(item.otherCost+item.cost)*item.exchange.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                        <fieldset>
                                        	<legend>Journal Information</legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${item.journalEntry.id}'/>"><c:out value='${item.journalEntry.code}'/></a>
                                        </fieldset>
                                    </td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Contract :</td>
									<td>
										<form:select id="contract" path="contract" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${item.contract.id}' label='${item.contract.code}' />
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Destination :</td>
									<td><a href="<c:url value='/page/transportoutsourceroutepreedit.htm?id=${item.destination.id}'/>"><c:out value='${item.destination.name}'/></a></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Driver :</td>
									<td>
										<form:select id="driver" path="driver" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty item.driver}'>
                                               	<form:option value='${item.driver.id}' label='${item.driver.firstName} ${item.driver.lastName} ${item.driver.middleName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Currency :</td>
									<td><input size="10" value="${item.destination.price.money.currency.symbol}" id="currency" class="input-disabled" disabled/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Origin :</td>
									<td><input id="origin" value="${item.contract.origin}" class="input-disabled" size="25" disabled/></td>
								</tr>
                                <tr>
                                	<td nowrap="nowrap" align="right">Vehicle ID :</td>
                                    <td><input class="input-disabled" disabled value="${item.shipment.vehicle.name}" size="35"/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">DO No :</td>
									<td><form:input path='doNo' cssClass='input-disabled' size='25' disabled='true'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Rit :</td>
									<td><form:input path='rit' size='5' cssClass='input-disabled' disabled='true'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                            	<div id="bank" dojoType="ContentPane" label="Cash/Bank Account" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <tr>
                                        <td align="right">Bank/Cash Account : </td>
                                        <td>
                                            <form:select id='account' path='bankAccount' cssClass='combobox-ext'>
                                                <c:if test='${not empty item.bankAccount}'>
                                                    <form:option value='${item.bankAccount.id}' label='${item.bankAccount.code}' />
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountview.htm?target=account&type=CASH&organization=${item.shipment.organization.id}'/>');" style="CURSOR:pointer;" title="Bank Account" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Account Name : </td>
                                        <td><input id='accountName' value="${item.bankAccount.accountName}" disabled='true' class='input-disabled' size="30"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Bank Name : </td>
                                        <td><input id='bankName' value="${item.bankAccount.bankName}" disabled='true' class='input-disabled' size="30"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Bank Branch : </td>
                                        <td><input id='bankBranch' value="${item.bankAccount.bankBranch}" disabled='true' class='input-disabled' size="30"/></td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap" align="right">Account No : </td>
                                        <td><input id='accountNo' value="${item.bankAccount.accountNo}" disabled='true' class='input-disabled' size="30"/></td>
                                    </tr>
                                    </table>
                                </div>
                            	<div id="main" dojoType="ContentPane" label="Main Cost" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <c:forEach items='${item.mainCosts}' var='maincost'>
                                    <tr>
                                        <td width="25%" align="right">${maincost.cost.name}</td>          
                                        <td width="75%" align="left"><input value="<fmt:formatNumber value='${maincost.amount*maincost.rate.rate}' pattern=',##0.00'/>" disabled='true' class='input-disabled' size='25'/></td>
                                    </tr>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="other" dojoType="ContentPane" label="Other Cost" class="tab-pages" refreshOnShow="true">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <thead>
                                    <tr>
                                    	<th width="20%">Type</th>
                                      	<th width="18%">Amount</th>
                                      	<th width="42%">Note</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${item.otherCosts}' var='cost' varStatus='status'>
                                    <tr>
                                        <td>
                                        	<select class="combobox-ext" disabled>
                                            	<option>${cost.masterCost.name}</option>
                                            </select>
                                        </td>          
                                        <td><input value="<fmt:formatNumber value='${cost.money.amount}' pattern=',##0.00'/>" disabled='true' cssClass='input-disabled' size='25'/></td>
                                        <td><input value='${cost.masterCost.note}' size="50"/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
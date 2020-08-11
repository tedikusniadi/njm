<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Shipment >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/shipmentedit.htm'/>";
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
			<td width="60%">Transport Outsource > Transport Management > Shipment > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D12 - Shipment</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/shipmentview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
								<a class="item-button-print" href="<c:url value='/page/shipmentprint.htm?id=${shipment_edit.id}'/>"><span>Print</span></a>
                            	<c:if test='${!shipment_edit.locked}'>
                                	<a class="item-button-lock" href="<c:url value='/page/shipmentlock.htm?id=${shipment_edit.id}&lock=true'/>"><span>Lock</span></a>
                                </c:if>
                                <c:if test='${shipment_edit.locked}'>
                                	<a class="item-button-unlock" href="<c:url value='/page/shipmentlock.htm?id=${shipment_edit.id}&lock=false'/>"><span>Unlock</span></a>
                                </c:if>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="shipment_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="35%"><input value="${shipment_edit.code}" disabled class='input-disabled' size='35'/></td>
                                    <td width="45%" rowspan="6" valign="top" align="right">
                                    	<fieldset>
                                        	<legend>Recapitulation</legend>
                                            <table width="100%">
                                            <tr>
                                            	<th width="26%">&nbsp;</th>
                                              	<th width="36%"><strong>Amount 
                                              	<c:out value='${shipment_edit.currency.symbol}'/></strong></th>
                                              	<th width="38%"><strong>Amount 
                                              	<c:out value='${defcurrency.symbol}'/></strong></th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Main Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.totalCost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.defTotalCost}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Other Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.totalOtherCost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.defTotalOtherCost}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Cost</td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.totalOtherCost+adapter.totalCost}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="15" disabled class="input-disabled" value="<fmt:formatNumber value='${adapter.defTotalOtherCost+adapter.defTotalCost}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    </td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                           	<form:option value='${shipment_edit.organization.id}' label='${shipment_edit.organization.firstName} ${shipment_edit.organization.lastName} ${shipment_edit.organization.middleName}' />
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${shipment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
								<tr>
                                	<td align="right">Transaction Currency :</td>
                                    <td>
                                    	<form:select id='currency' path='currency' disabled='true'>
                                        	<form:option value='${shipment_edit.currency.id}' label='${shipment_edit.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='exchangeType' path='exchangeType' disabled='true'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td>
										<form:select id="vehicle" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                               	<form:option value='${shipment_edit.vehicle.type.id}' label='${shipment_edit.vehicle.type.name}' />
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Vehicle :</td>
									<td>
										<form:select id="vehicle" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                           	<c:if test='${not empty shipment_edit.vehicle}'>
                                               	<form:option value='${shipment_edit.vehicle.id}' label='${shipment_edit.vehicle.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
							</form:form>
                            <br/>
                            <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
										<c:if test='${!shipment_edit.locked}'>
                                        	<a class="item-button-new" href="<c:url value='/page/shipmentitempreadd.htm?id=${shipment_edit.id}'/>"><span>New Shipment Detail</span></a>
                                        </c:if>
									</div>
								</td>
								<td width="70%" align="right" height="20">&nbsp;</td>
							</tr>
							</table>
                            <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                            <tr>
               	  	  	  	  	<th width="6%"><div style="width:40px"></div></th>
                   	  	  	  	<th width="14%">Customer</th>
                              	<th width="12%">Destination</th>
                   	  	  	  	<th width="15%">Contract</th>
                           	  	<th width="9%">Del Order</th>
                   	  	  	  	<th width="8%">Main Cost</th>
                           	  	<th width="9%">Other Cost</th>
                           	  	<th width="4%">Rit</th>
                           	  	<th width="10%">Date</th>
                                <th width="13%">Note</th>
                            </tr>
                            <c:forEach items="${shipment_edit.items}" var="item">
                            <tr>
                                <td class="tools">
                                    <c:if test='${access.edit}'>
                                    	<a class="item-button-edit" href="<c:url value='/page/shipmentitempreedit.htm?id=${item.id}'/>"><span>Edit</span></a>
                                    </c:if>
                                    <c:if test='${access.delete and empty item.lineItems and !shipment_edit.locked}'>
                                    	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/shipmentitemdelete.htm?id=${item.id}'/>');"><span>Del</span></a>
                                    </c:if>
                                </td>
                                <td><c:out value='${item.customer.firstName} ${item.customer.middleName} ${item.customer.lastName}'/></td>
                                <td><c:out value='${item.destination.name}'/></td> 
                                <td><c:out value='${item.contract.code}'/></td> 
                                <td><c:out value='${item.doNo}'/></td>
                                <td><fmt:formatNumber value='${item.cost}' pattern=',##0.00'/></td>
                                <td><fmt:formatNumber value='${item.otherCost}' pattern=',##0.00'/></td>
                                <td><c:out value='${item.rit}'/></td>
                                <td><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
                                <td><c:out value='${item.note}'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                            </table>
						</div>
						<div class="info">Created by : <c:out value='${shipment_edit.createdBy.firstName} ${shipment_edit.createdBy.middleName} ${shipment_edit.createdBy.lastName}'/> (<fmt:formatDate value='${shipment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${shipment_edit.updatedBy.firstName} ${shipment_edit.updatedBy.middleName} ${shipment_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${shipment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
<%@ include file="/common/dialog.jsp"%>
</html>
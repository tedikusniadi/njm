<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Contract >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Transport Outsource > Transport Outsource Contract > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D10 - Transport Outsource Contract</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/transportoutsourcecontractview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="contract_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="19%" nowrap="nowrap" align="right">Number :</td>
								  <td width="81%"><input  value="${contract_edit.code}" size="30" disabled/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<select class="combobox-ext">
											<option><c:out value='${contract_edit.organization.firstName} ${contract_edit.organization.lastName} ${contract_edit.organization.middleName}'/></option>
										</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Customer :</td>
									<td>
										<select class="combobox-ext">
                                           	<option><c:out value='${contract_edit.customer.firstName} ${contract_edit.customer.lastName} ${contract_edit.customer.middleName}'/></option>
										</select>
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Sales Person :</td>
                                    <td>
                                        <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                            <c:if test='${not empty contract_edit.salesPerson}'>
                                                <form:option value='${contract_edit.salesPerson.id}' label='${contract_edit.salesPerson.firstName} ${concontracttact.salesPerson.lastName} ${contract_edit.salesPerson.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                      <img src="assets/icons/list_extensions.gif" onclick="opensales();" style="CURSOR:pointer;" title="Sales Person" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer Service :</td>
                                    <td>
                                        <form:select id="customerService" path="customerService" cssClass="combobox-ext">
                                            <c:if test='${not empty contract_edit.customerService}'>
                                                <form:option value='${contract_edit.customerService.id}' label='${contract_edit.customerService.firstName} ${contract_edit.customerService.lastName} ${contract_edit.customerService.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                      <img src="assets/icons/list_extensions.gif" onclick="opencs();" style="CURSOR:pointer;" title="Sales Person" />
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Origin :</td>
									<td><form:input path='origin' cssClass='inputbox'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Contract Start Date :</td>
									<td><input size="10" value="<fmt:formatDate value='${contract_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td>
										<select>
                                           <option><c:out value='${contract_edit.type.name}'/></option>
										</select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Status :</td>
									<td>
										<form:radiobutton path="enabled" value="true" label="Active"/>
										<form:radiobutton path="enabled" value="false" label="Inactive"/>
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
										<a class="item-button-new" href="<c:url value='/page/transportoutsourceroutepreadd.htm?id=${contract_edit.id}'/>"><span>New Route</span></a>
									</div>
								</td>
								<td width="70%" align="right" height="20">&nbsp;</td>
							</tr>
							</table>
                            <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                            <tr>
                       	  	  	<th width="7%"><div style="width:40px"></div></th>
                           	  	<th width="35%">Destination Name</th>
                           	  	<th width="7%">UoM</th>
                           	  	<th width="10%">Fee Before Tax</th>
                                <th width="11%">Cost</th>
                           	  	<th width="9%">Currency</th>
                           	  	<th width="11%">Valid From</th>
                              	<th width="10%">Valid To</th>
                            </tr>
                            <c:forEach items="${contract_edit.routes}" var="route">
                            <tr>
                                <td class="tools">
                                	<c:if test='${access.edit}'>
                                    	<a class="item-button-edit" href="<c:url value='/page/transportoutsourceroutepreedit.htm?id=${route.id}'/>"  title="Edit"><span>Edit</span></a>
                                    </c:if>
                                    <c:if test='${access.delete and empty route.shipmentItems}'>
                                    	<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/transportoutsourceroutedelete.htm?id=${route.id}'/>');" title="Del"><span>Del</span></a>
                                    </c:if>
                                </td>
                                <td>${route.name}</td>
                                <td><c:out value='${route.measure.measureId}'/></td> 
                                <td><fmt:formatNumber value='${route.price.money.amount}' pattern=',##0.00'/></td>
                                <td><fmt:formatNumber value='${route.cost}' pattern=',##0.00'/></td>
                                <td><c:out value='${route.price.money.currency.symbol}'/></td>
                                <td><fmt:formatDate value='${route.price.validFrom}' pattern='dd-MM-yyyy'/></td>
                                <td><fmt:formatDate value='${route.price.validTo}' pattern='dd-MM-yyyy'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                            </table>
						</div>
							<div class="info">Created by : <c:out value='${contract_edit.createdBy.firstName} ${contract_edit.createdBy.middleName} ${contract_edit.createdBy.lastName}'/> (<fmt:formatDate value='${contract_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${contract_edit.updatedBy.firstName} ${contract_edit.updatedBy.middleName} ${contract_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${contract_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
<%@ include file="/common/dialog.jsp"%>
</body>
</html>
<script type="text/javascript" src="assets/dialog.js"></script>
<script type="text/javascript">
	function save()
	{		
		document.addForm.action = "<c:url value='/page/transportoutsourcecontractedit.htm'/>";
		document.addForm.submit();
	}
	
	function opensales(target)
	{
		openpopup("<c:url value='/page/popupsalespersonview.htm?target=salesPerson&organization=${contract_edit.organization.id}'/>");
	}
	
	function opencs()
	{
		openpopup("<c:url value='/page/popupcustomerserviceview.htm?target=customerService&organization=${contract_edit.organization.id}'/>");
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
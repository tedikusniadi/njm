<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Management >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/vehicleedit.htm'/>";
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
			<td width="60%">Transport Outsource > Transport Management > Vehicle Management > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D11 - Vehicle Management</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/vehicleview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="vehicle_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="${vehicle_edit.code}" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Name :</td>
								  <td width="80%"><form:input path='name' size="48" disabled='true' cssClass='input-disabled'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                               	<form:option value='${vehicle_edit.organization.id}' label='${vehicle_edit.organization.firstName} ${vehicle_edit.organization.lastName} ${vehicle_edit.organization.middleName}' />
										</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td>
										<form:select path="type" disabled='true' cssClass='combobox'>
                                          	<form:option value='${vehicle_edit.type.id}' label='${vehicle_edit.type.name}' />
 										</form:select>
									</td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Total Kilometer :</td>
								  	<td width="80%"><form:input path='kilometer' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input size="10" disabled value="<fmt:formatDate value='${vehicle_edit.date}' pattern='dd-MM-yyyy'/>" class='input-disabled'/></td>
								</tr>
								<tr>
                                	<td align="right">Status :</td>
                                    <td>
                                    	<form:radiobutton path='enabled' value='true' label='Active'/>
                                        <form:radiobutton path='enabled' value='false' label='Inactive'/>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
							</form:form>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="component" dojoType="ContentPane" label="Vehicle Component" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/vehiclecomponentpreadd.htm?id=${vehicle_edit.id}'/>"><span>New Component</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <th><div style="width:10px"></div></th>
                                        <th>Valid From</th>
                                        <th>Valid To</th>
                                        <th>Asset Name</th>
                                        <th>Acq Date</th>
                                        <th>Acq Value</th>
                                        <th>Currency</th>
                                        <th>Rate</th>
                                        <th>Depre Method</th>
                                    </tr>
                                    <c:forEach items="${vehicle_edit.components}" var="com">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/vehiclecomponentpreedit.htm?id=${com.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><fmt:formatDate value="${com.validFrom}" pattern="dd-MM-yyyy"/></td> 
                                        <td><fmt:formatDate value="${com.validTo}" pattern="dd-MM-yyyy"/></td>          
                                        <td><c:out value='${com.fixedAsset.name}'/></td>
                                        <td><fmt:formatDate value="${com.fixedAsset.acquisitionDate}" pattern="dd-MM-yyyy"/></td>
                                        <td><fmt:formatNumber value='${com.fixedAsset.acquisitionValue}' groupingUsed='true' maxFractionDigits='0'/></td>
                                        <td><c:out value='${com.fixedAsset.currency.symbol}'/></td>
                                        <td><c:out value='${com.fixedAsset.exchangeType}'/></td>
                                        <td><c:out value='${com.fixedAsset.depreciationMethod}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="maintenance" dojoType="ContentPane" label="Maintenance History" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/vehiclemaintenancepreadd.htm?id=${vehicle_edit.id}'/>"><span>New Maintenance</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <th width="3%" height="20"><div style="width:10px"></div></th>
                                      	<th width="11%">Type</th>
                                      	<th width="27%">Vendor</th>
                                      	<th width="7%">Curr</th>
                                      	<th width="9%">Valid From</th>
                                        <th width="9%">Valid To</th>
                                    </tr>
                                    <c:forEach items="${vehicle_edit.maintenances}" var="main">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/vehiclemaintenancepreedit.htm?id=${main.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><c:out value='${main.maintenanceType}'/></td>
                                        <td><c:out value='${main.supplier.firstName} ${main.supplier.middleName} ${main.supplier.lastName}'/></td>
                                        <td><c:out value='${main.currency.symbol}'/></td>
                                        <td><fmt:formatDate value="${main.date}" pattern="dd-MM-yyyy"/></td> 
                                        <td><fmt:formatDate value="${main.validTo}" pattern="dd-MM-yyyy"/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
                                    </table>
                                </div>
                        	</div>
							<div class="info">Created by : ${vehicle_edit.createdBy.firstName} ${vehicle_edit.createdBy.middleName} ${vehicle_edit.createdBy.lastName} (<fmt:formatDate value='${vehicle_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${vehicle_edit.updatedBy.firstName} ${vehicle_edit.updatedBy.middleName} ${vehicle_edit.updatedBy.lastName} (<fmt:formatDate value='${vehicle_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
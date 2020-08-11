<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Accounting Schema >> Edit</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Setting > Accounting Schema > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F13 - Accounting Schema</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/accountingschemaview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form name="editForm" method="post" modelAttribute="accountingSchema_edit">
							<table style="border:none" width="100%">
							<tr>
								<td width="18%" align="right">Accounting Schema ID</td>
								<td width="1%">:</td>
								<td width="25%"><form:input path="code" cssClass="inputbox" /></td>
			    				<td width="56%"><form:errors path="code" cssClass="error" /></td>
							</tr>	
							<tr>
								<td><div align="right">Accounting Schema Name</div></td>
								<td width="1%">:</td>
								<td width="25%"><form:input path="name" size="50" /></td>
			    				<td width="56%"><form:errors path="name" cssClass="error" /></td>
							</tr>
							<tr>
								<td><div align="right">Organization</div></td>
								<td width="1%">:</td>
								<td>
									<select class="combobox-ext">
										<option><c:out value='${accountingSchema_edit.organization.firstName} ${accountingSchema_edit.organization.middleName} ${accountingSchema_edit.organization.lastName}'/></option>
									</select>
								</td>							
			    				<td><form:errors path="organization" cssClass="error" /></td>
							</tr>
							<tr>
								<td align="right">Note</td>
								<td width="1%">:</td>
								<td><form:textarea path="note" cols="55" rows="6"/></td>							
			    				<td>&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">&nbsp;</td>
							</tr>
							<tr>
								<td align="right"><strong>Main Setting</strong></td>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td align="right">Chart of Account</td>
								<td width="1%">:</td>
								<td>
									<select id="coa" class="combobox-ext">
										<option value="${accountingSchema_edit.chartOfAccount.id}"><c:out value='${accountingSchema_edit.chartOfAccount.code} ${accountingSchema_edit.chartOfAccount.name}'/></option>
									</select>
								</td>							
			    				<td><form:errors path="chartOfAccount" cssClass="error" /></td>
							</tr>
							<tr>
								<td align="right">Accounting Period</td>
								<td width="1%">:</td>
								<td>
									<select class="combobox-ext">
										<option><c:out value='${accountingSchema_edit.accountingPeriod.code} ${accountingSchema_edit.accountingPeriod.name}'/></option>
									</select>
								</td>							
			    				<td><form:errors path="accountingPeriod" cssClass="error" /></td>
							</tr>
							<tr><td colspan="4">&nbsp;</td></tr>
                            </table>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                            	<div id="distribution" dojoType="ContentPane" label="Distibution" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <c:if test="${distributable and not empty accountingSchema_edit.closingDistribution}">
                                    <tr><td colspan="4">&nbsp;</td></tr>
                                    <tr>
                                        <td align="right"><strong>Distribution Setting</strong></td>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <c:forEach items="${accountingSchema_edit.closingDistribution.destinations}" var="distribution" varStatus="status">
                                    <tr>
                                        <td align="right">To</td>
                                        <td width="1%">:</td>
                                        <td colspan="2">
                                            <select class="combobox-ext">
                                                <option><c:out value='${distribution.organization.firstName} ${distribution.organization.middleName} ${distribution.organization.lastName}'/></option>
                                            </select>
                                            &nbsp;
                                            <form:input id='distribution_rate[${distribution.id}]' path="closingDistribution.destinations[${status.index}].rate" size="7"/> %
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    <tr><td colspan="4">&nbsp;</td></tr>
                                    <tr>
                                        <td align="right"><strong>Transfer Account</strong></td>
                                        <td colspan="3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">Account</td>
                                        <td width="1%">:</td>
                                        <td colspan="2">
                                            <form:select id="distibutionAcc" path="closingDistribution.account" cssClass="combobox-ext">
                                                <c:if test='${not empty accountingSchema_edit.closingDistribution.account}'>
                                                    <option value="${accountingSchema_edit.closingDistribution.account.id}"><c:out value='${accountingSchema_edit.closingDistribution.account.code} ${accountingSchema_edit.closingDistribution.account.name}'/></option>
                                                </c:if>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('distibutionAcc');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                    </tr>
                                    </c:if>
                                    </table>
                                </div>
                                <div id="closing" dojoType="ContentPane" label="Closing" class="tab-pages" refreshOnShow="true">
                                    <table>
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'NONASSET'}">
                                    <tr>
                                        <td align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="receivAndpayable" dojoType="ContentPane" label="AR & AP" class="tab-pages" refreshOnShow="true">
                                    <table>
                                    <tr>
                                    	<td align="right"><strong>Receivables GL Account</strong></td>
                                    	<td colspan="3">&nbsp;</td>
                                    </tr>
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'RECEIVABLES'}">
                                    <tr>
                                        <td align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    <tr><td colspan="4">&nbsp;</td></tr>
                                    <tr>
                                    	<td align="right"><strong>Payables GL Account</strong></td>
                                    	<td colspan="3">&nbsp;</td>
                                    </tr>
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'PAYABLES'}">
                                    <tr>
                                        <td align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                        <td width="1%">:</td>
                                        <td>
                                            <form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                        <td><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="product" dojoType="ContentPane" label="Product Category" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'INVENTORY'}">
                                    <tr>
                                        <td width="39%" align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                      	<td width="1%">:</td>
                                        <td width="59%">
                                      		<form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                      <td width="1%"><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                    <br/>
                                    <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productcategoryaccountingschemapreadd.htm?id=${accountingSchema_edit.id}'/>"><span>New Product Category Account Setting</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <tr>
                                      	<th width="5%"><div style="width:40px"></div></th>
                                        <th width="20%">Product Category</th>
                                        <th width="20%">Note</th>
                                    </tr>
                                    <c:forEach items='${accountingSchema_edit.products}' var='product'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/productcategoryaccountingschemapreedit.htm?id=${product.id}'/>"  title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><c:out value='${product.category.code} ${product.category.name}'/></td>
                                        <td><c:out value='${product.note}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="mastercost" dojoType="ContentPane" label="Transport Outsource" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'TRANSPORT_OUTSOURCE'}">
                                    <tr>
                                        <td width="39%" align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                      	<td width="1%">:</td>
                                        <td width="59%">
                                      		<form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                      <td width="1%"><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    </table>
                                    <br/>
                                    <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/transportoutsourcemastercostaccountingschemapreadd.htm?id=${accountingSchema_edit.id}'/>"><span>New Transport Outsource Account Setting</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <tr>
                                   	  	<th width="5%"><div style="width:40px"></div></th>
                                        <th width="35%">Name</th>
                                        <th width="35%">GL Account</th>
                                      	<th width="42%">Note</th>
                                    </tr>
                                    <c:forEach items='${accountingSchema_edit.transports}' var='transport'>
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/transportoutsourcemastercostaccountingschemapreedit.htm?id=${transport.id}'/>"  title="Edit"><span>Edit</span></a>
                                        </td>
                                        <td><c:out value='${transport.name}'/></td>
                                        <td><c:out value='${transport.account.code} ${transport.account.name}'/></td> 
                                        <td><c:out value='${transport.note}'/></td> 
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="procurementschema" dojoType="ContentPane" label="Procurement" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <c:forEach items="${accountingSchema_edit.closingAccounts}" var="closing" varStatus="status">
                                    <c:if test="${closing.closingAccountType.groupType == 'PROCUREMENT'}">
                                    <tr>
                                        <td width="39%" align="right"><c:out value='${closing.closingAccountType.name}'/></td>
                                      	<td width="1%">:</td>
                                        <td width="59%">
                                      		<form:select id="glaccount[${status.index}]" path="closingAccounts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${closing.account.id}"><c:out value='${closing.account.code} ${closing.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('glaccount[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                      <td width="1%"><form:errors path="closingAccounts[${status.index}].account" cssClass="error" /></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                    <c:forEach items="${accountingSchema_edit.procurementSchemas}" var="procurement" varStatus="status">
                                    <tr>
                                        <td width="39%" align="right"><c:out value='${procurement.cost.name}'/></td>
                                      	<td width="1%">:</td>
                                        <td width="59%">
                                      		<form:select id="procurement[${status.index}]" path="procurementSchemas[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${procurement.account.id}"><c:out value='${procurement.account.code} ${procurement.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('procurement[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                      	<td width="1%">&nbsp;</td>
                                    </tr>
                                    </c:forEach>
                                    </table>
                                </div>
                                <div id="taxschema" dojoType="ContentPane" label="Tax Schema" class="tab-pages" refreshOnShow="true">
                                    <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/taxaccountschemapreadd.htm?id=${accountingSchema_edit.id}'/>"><span>New Tax Account Schema</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                               	  	  <th width="4%"><div style="width:40px"></div></th>
                                        <th width="96%">Tax Name</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${accountingSchema_edit.taxSchemas}" var="tax" varStatus="status">
                                   	<tr>
                                    	<td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/taxaccountschemapreedit.htm?id=${tax.id}'/>" title="Edit"><span>Edit</span></a>
                                        </td>
                                      <td width="96%" align="right"><c:out value='${tax.tax.taxId}'/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
                                <div id="salesCost" dojoType="ContentPane" label="Sales Master Cost" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    <tbody>
                                    <c:forEach items="${accountingSchema_edit.salesMasterCosts}" var="salesCost" varStatus="status">
                                    <tr>
                                        <td width="28%" align="right"><c:out value='${salesCost.cost.name}'/></td>
                                      	<td width="1%">:</td>
                                  		<td width="70%">
                   		  					<form:select id="salesCost[${status.index}]" path="salesMasterCosts[${status.index}].account" cssClass="combobox-ext">
                                                <option value="${salesCost.account.id}"><c:out value='${salesCost.account.code} ${salesCost.account.name}'/></option>
                                            </form:select>
                                            &nbsp;
                                            <img src="assets/icons/list_extensions.gif" onclick="javascript:popup('salesCost[${status.index}]');" style="CURSOR:pointer;" title="Search Account" />
                                        </td>							
                                   	  <td width="1%">&nbsp;</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                                <div id="workUnitSchema" dojoType="ContentPane" label="Work Unit" class="tab-pages" refreshOnShow="true">
                                    <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productionworkunitschemapreadd.htm?schema=${accountingSchema_edit.id}'/>"><span>New Work Unit Schema</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                               	  	  	<th width="4%"><div style="width:40px"></div></th>
                                        <th width="96%">Name</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${accountingSchema_edit.workUnits}" var="unit" varStatus="status">
                                   	<tr>
                                    	<td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/productionworkunitschemapreedit.htm?id=${unit.id}'/>"><span>Edit</span></a>
                                        </td>
                                      	<td width="96%" align="right"><c:out value='${unit.workUnit.name}'/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
                                <div id="resource" dojoType="ContentPane" label="Resource" class="tab-pages" refreshOnShow="true">
                                    <table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/productionresourceschemapreadd.htm?schema=${accountingSchema_edit.id}'/>"><span>New Resource Schema</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                               	  	  	<th width="4%"><div style="width:40px"></div></th>
                                        <th width="96%">Name</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${accountingSchema_edit.resources}" var="resource" varStatus="status">
                                   	<tr>
                                    	<td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/productionresourceschemapreedit.htm?id=${resource.id}'/>"><span>Edit</span></a>
                                        </td>
                                      	<td width="96%" align="right"><c:out value='${resource.productionResource.name}'/></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
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
	function save()
	{
		<c:if test='${not empty accountingSchema_edit.closingDistribution.destinations}'>
			var rate = 0.0;
			
			<c:forEach items="${accountingSchema_edit.closingDistribution.destinations}" var="distribution">
				if(dojo.byId('distribution_rate[${distribution.id}]').value != null && dojo.byId('distribution_rate[${distribution.id}]').value != '')
					rate += parseFloat(dojo.byId('distribution_rate[${distribution.id}]').value);
			</c:forEach>
	
			if(rate != 0 && rate != 100)
			{
				alert('Total Distribution rate must equal to 100%.');
				return;
			}
				
			if(dojo.byId('distibutionAcc').value == null || dojo.byId('distibutionAcc').value == '')
			{
				alert('Distribution account cannot be empty!');
				return;
			}
		</c:if>
	
		document.editForm.action = "<c:url value='/page/accountingschemaedit.htm'/>";
		document.editForm.submit();
	}
		
	function popup(target)
	{
		var coa = document.getElementById('coa');
		if(!coa && !coa.value)
		{
			alert('Please select valid Chart of Account first!');
			return;
		}
			
		openpopup("<c:url value='/page/popupglaccountview.htm?level=ACCOUNT&coa='/>"+coa.value+"&target="+target);
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Contract >> Add</title>
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
			<td width="60%">Transport Outsource > Transport Outsource Contract > Add</td>
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
							<form:form id="addForm" name="addForm" method="post" modelAttribute="contract_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="16%" nowrap="nowrap" align="right">Number :</td>
								  	<td colspan="2"><input value="Auto Number" size="30" disabled/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td width="43%">
		  								<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty contract_add.organization}'>
                                               	<form:option value='${contract_add.organization.id}' label='${contract_add.organization.firstName} ${contract_add.organization.lastName} ${contract_add.organization.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
                                  <td width="41%"><form:errors path='organization' cssClass='error'/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Customer :</td>
									<td>
										<form:select id="customer" path="customer" cssClass="combobox-ext">
                                           	<c:if test='${not empty contact.customer}'>
                                               	<form:option value='${contact.customer.id}' label='${contact.customer.firstName} ${contact.customer.lastName} ${contact.customer.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="opencustomerpopup();" style="CURSOR:pointer;" title="Customer" />
									</td>
                                    <td><form:errors path='customer' cssClass='error'/></td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Sales Person :</td>
                                    <td>
                                        <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                            <c:if test='${not empty contact.salesPerson}'>
                                                <form:option value='${contact.salesPerson.id}' label='${contact.salesPerson.firstName} ${contact.salesPerson.lastName} ${contact.salesPerson.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                      	<img src="assets/icons/list_extensions.gif" onclick="opensales();" style="CURSOR:pointer;" title="Sales Person" />
                                    </td>
                                    <td><form:errors path='salesPerson' cssClass='error'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer Service :</td>
                                    <td>
                                        <form:select id="customerService" path="customerService" cssClass="combobox-ext">
                                            <c:if test='${not empty contact.customerService}'>
                                                <form:option value='${contact.customerService.id}' label='${contact.customerService.firstName} ${contact.customerService.lastName} ${contact.customerService.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                      <img src="assets/icons/list_extensions.gif" onclick="opencs();" style="CURSOR:pointer;" title="Sales Person" />
                                    </td>
                                    <td><form:errors path='customerService' cssClass='error'/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Origin :</td>
									<td><form:input path='origin' cssClass='inputbox'/></td>
                                    <td><form:errors path='origin' cssClass='error'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Contract Start Date :</td>
									<td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <td><form:errors path='date' cssClass='error'/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td colspan="2">
										<form:select path="type">
                                           	<c:if test='${not empty contact.type}'>
                                              	<form:option value='${contact.type.id}' label='${contact.type.name}' />
                                            </c:if>
                                        	<form:options items="${types}" itemValue="id" itemLabel="name"/>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Status :</td>
									<td colspan="2">
										<form:radiobutton path="enabled" value="true" label="Active"/>
										<form:radiobutton path="enabled" value="false" label="Inactive"/>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td colspan="2"><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>			
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
<script type="text/javascript">
	function save()
	{		
		if(dojo.byId('org').value == null || dojo.byId('org').value == '')
		{
			alert('Company cannot be empty!');
			return;
		}
		
		if(dojo.byId('customer').value == null || dojo.byId('customer').value == '')
		{
			alert('Customer cannot be empty!');
			return;
		}
		
		if(dojo.byId('salesPerson').value == null || dojo.byId('salesPerson').value == '')
		{
			alert('Sales Person cannot be empty!');
			return;
		}
		
		if(dojo.byId('customerService').value == null || dojo.byId('customerService').value == '')
		{
			alert('Customer Service cannot be empty!');
			return;
		}
		
		if(dojo.byId('origin').value == null || dojo.byId('origin').value == '')
		{
			alert('Origin cannot be empty!');
			return;
		}
		
		if(dojo.widget.byId('date').getValue() == null || dojo.widget.byId('date').getValue() == '')
		{
			alert('Date cannot be empty!');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/transportoutsourcecontractadd.htm'/>";
		document.addForm.submit();
	}
	
	function opencustomerpopup()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
	}
	
	function opensales(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsalespersonview.htm?target=salesPerson&organization='/>"+org.value);
	}
	
	function opencs()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcustomerserviceview.htm?target=customerService&organization='/>"+org.value);
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
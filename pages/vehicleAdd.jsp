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
							<a class="item-button-list" href="<c:url value='/page/vehicleview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="vehicle_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="15%" nowrap="nowrap" align="right">ID :</td>
						  	  	  	<td colspan="2"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td width="15%" nowrap="nowrap" align="right">Name :</td>
							  	  	<td width="44%"><form:input id="name" path='name' size="48"/></td>
								  	<td width="41%"><form:errors path='name' cssClass='error'/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty vehicle_add.organization}'>
                                               	<form:option value='${vehicle_add.organization.id}' label='${vehicle_add.organization.firstName} ${vehicle_add.organization.lastName} ${vehicle_add.organization.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
                                    <td><form:errors path='organization' cssClass='error'/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Vehicle Type :</td>
									<td>
										 <form:select id='vehicleType' path="type" cssClass='combobox'>
                                           	<c:if test='${not empty vehicle_add.type}'>
                                               	<form:option value='${vehicle_add.type.id}' label='${vehicle_add.type.name}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupvehicletypeview.htm?target=vehicleType'/>');" style="CURSOR:pointer;" title="Vehicle Type" />
									</td>
                                    <td><form:errors path='type' cssClass='error'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input inputId="dateId" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    <td><form:errors path='date' cssClass='error'/></td>
								</tr>
								<tr>
                                	<td align="right">Status :</td>
                                    <td colspan="2">
                                    	<form:radiobutton path='enabled' value='true' label='Active'/>
                                        <form:radiobutton path='enabled' value='false' label='Inactive'/>
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
		if($("#name").val() == '')
		{
			alert('Name cannot be empty!');
			return;
		}
		
		if($("#org").val() == null || $("#org").val() == '')
		{
			alert('Company cannot be empty!');
			return;
		}
		
		if($("#vehicleType").val() == null || $("#vehicleType").val() == '')
		{
			alert('Vehicle Type cannot be empty!');
			return;
		}
		
		if($("#dateId").val() == null || $("#dateId").val() == '')
		{
			alert('Date cannot be empty!');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/vehicleadd.htm'/>";
		document.addForm.submit();
	}
	
	function opengrouppopup()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfixedassetgroupview.htm?target=group&organization='/>"+org.value);
	}
			
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
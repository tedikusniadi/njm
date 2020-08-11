<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>siriusERP</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/partyrelationshipadd.htm'/>";
			document.addForm.submit();
		}
		
		function showrole()
		{
			var party = document.getElementById('org');
			if(party.value == null || party.value == '')
			{
				alert("Please select Party first!");
				return;
			}
			
			openpopup("<c:url value='/page/popuppartyroleview.htm?target=toRole&party='/>"+party.value);
		}
	</script>
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
			<td width="60%">Company Administration > Party > Party Relationship > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
					<h1 class="page-title">A02 - Party Relationship</h1>
						
					<div class="toolbar">
						<a class="item-button-list" href="<c:url value='/page/partypreedit.htm?id=${party.id}'/>"><span>List</span></a>
						<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					</div>					  
					  
					<div class="main-box">
						<form:form  name="addForm" method="post" modelAttribute="partyRelationship">
						<table width="100%">
 						<tr><td colspan="3">&nbsp;</td></tr>
 						<tr> 	
 							<td width="296" align="right">From Party :</td>
					  	  	<td width="707"><input value="${party.firstName} ${party.middleName} ${party.lastName}" readonly="readonly" size="35" class="input-disabled"/></td>
					  	  	<td width="225">&nbsp;</td>
 						</tr>
 						<tr> 	
 							<td align="right">From Role :</td>
							<td width="707">
  				  <form:select path="fromRole" cssClass="combobox">
									<form:options items="${party.partyRoles}" itemValue="id" itemLabel="partyRoleType.name"/>
 								</form:select>
							</td>
						  <td width="225">&nbsp;</td>
 						</tr>
 						<tr> 	
 							<td align="right">To Party :</td>
							<td width="707">
                           	  <select id="org" class="combobox-ext">
								</select>
								<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructureview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
							</td>
						  <td width="225">&nbsp;</td>
 						</tr>
 						<tr> 	
 							<td align="right">To Role :</td>
							<td width="707">
							  <form:select id="toRole" path="toRole" cssClass="combobox-ext">
 								</form:select>
								<img src="assets/icons/list_extensions.gif" onclick="showrole();" style="CURSOR:pointer;" title="Party Role" />
							</td>
						  <td width="225">&nbsp;</td>
 						</tr>
						<tr>
 							<td align="right">Relationship Type :</td>
							<td>
	    						<form:select path="relationshipType" cssClass="combobox-ext">
									<form:options items="${relationshipTypes}" itemValue="id" itemLabel="name"/>
 								</form:select>
							</td>
							<td>&nbsp;</td>
 						</tr>
 						<tr>
							<td align="right">From Date :</td>
							<td><input name="fromDate" saveformat="dd-MM-yyyy" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
						</tr>
						<tr>
							<td align="right">To Date :</td>
							<td><input name="toDate" saveformat="dd-MM-yyyy" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
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
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>

</html>

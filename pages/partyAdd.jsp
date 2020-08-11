<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Party >> Add</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>

	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/partyadd.htm'/>";
			document.addForm.submit();
		}
	</script>
</head>

<body>

	<%@ include file="/common/sirius-header.jsp"%>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Company Administration > Party > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A01 - Party</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/partyview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="party_add" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Party Type</td>
                                    <td width="1%" align="center">:</td>
							  		<td width="64%">
			  					  		<select name="type" class="combobox">
											<option value="group">ORGANIZATION/GROUPS</option>
											<option value="personal">PERSON/PERSONAL</option>
										</select>
									</td>
							  	  <td width="1%">&nbsp;</td>
 								</tr>
 								<tr>
 									<td align="right">Party Code</td>
                                    <td width="1%" align="center">:</td>
									<td><input class="inputbox" value="Auto Number" disabled/></td>
									<td><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Party First Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="firstName" cssClass="inputbox" /></td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Middle Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="middleName" cssClass="inputbox" /></td>
									<td><form:errors path="middleName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Last Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="lastName" cssClass="inputbox" /></td>
									<td><form:errors path="lastName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Party Tax Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="taxCode" cssClass="inputbox" /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr>
                                <tr>
				  <tr>
 									<td align="right">Other Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="otherCode" cssClass="inputbox" /></td>
									<td><form:errors path="otherCode"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Legend</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="legend" size='30'/></td>
									<td><form:errors path="legend"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Salutation</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="salutation" cssClass="inputbox" /></td>
									<td><form:errors path="salutation"/></td>
	 							</tr>
	 							<tr>
	 							  <td align="right">NPPKP</td>
	 							  <td align="center">:</td>
	 							  <td><form:input path="nppkp" cssClass="inputbox" /></td>
	 							  <td><form:errors path="nppkp"/></td>
	 							  </tr>
	 							<tr>
 									<td align="right">Party PKP Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="pkpDate" name="pkpDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Birth/Startup Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="birthDate" name="dateOfBirth" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td><input type="file" name="file" value=""/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
 									<td align="right">Note</td>
                                    <td width="1%" align="center">:</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
 								</tr>
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>

</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Contact Mechanism >> Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/contactmechanismedit.htm'/>";
			document.editForm.submit();
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
			<td width="60%">Company Administration > Party > Contact Mechanism > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
					<h1 class="page-title">A15 - Contact Mechanism</h1>
						
					<div class="toolbar">
						<a class="item-button-list" href="<c:url value='/page/partypreedit.htm?id=${contactMechanism.party.id}'/>"><span>List</span></a>
						<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					</div>					  
					  
					<div class="main-box">
						<form:form name="editForm" method="post" modelAttribute="contactMechanism" cssClass="edit-form">
						<table>
 						<tr><td colspan="3">&nbsp;</td></tr>
 						<tr> 	
 							<td align="right">Party :</td>
							<td width="230"><input class="inputbox" value="${contactMechanism.party.firstName} ${contactMechanism.party.middleName} ${contactMechanism.party.lastName}"/></td>
							<td width="331">&nbsp;</td>
 						</tr>
						<tr>
							<td align="right">Contact :</td>
							<td><form:input path="contact" cssClass="inputbox"/></td>
						</tr>
						<tr>
 							<td align="right">Contact Type :</td>
							<td>
	    						<div class="form-value">
  									<form:select path="contactMechanismType" cssClass="selectbox">
										<form:option value="PHONE" label="PHONE"/>
										<form:option value="MOBILE" label="MOBILE"/>
										<form:option value="FAX" label="FAX"/>
										<form:option value="EMAIL" label="EMAIL"/>
										<form:option value="WEBSITE" label="WEBSITE"/>
 									</form:select>
 								</div>
							</td>
							<td>&nbsp;</td>
 						</tr>
 						<tr>
							<td align="right">Status :</td>
							<td>
								<form:radiobutton path="active" value="true" label="Active"/>
								<form:radiobutton path="active" value="false" label="Inactive"/>
							</td>
						</tr>
                        <tr>
							<td align="right">Note :</td>
							<td><form:textarea path='note' cols='55' rows='6'/></td>
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

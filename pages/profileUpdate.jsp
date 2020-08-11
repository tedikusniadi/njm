<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName()+":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Profile >> Edit</title>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/userprofileedit.htm'/>";
			document.editForm.submit();
		}

		function openbank()
		{
			var org = dojo.byId('org').value;
			if(org == '')
			{
				alert('Please select default organization first!');
				return
			}

			openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&organization='/>"+org);
		}

		function opencontainer()
		{
			var org = dojo.byId('org').value;
			if(org == '')
			{
				alert('Please select default organization first!');
				return
			}

			openpopup("<c:url value='/page/popupcontainerbyorganizationview.htm?target=container&organization='/>"+org);
		}
	</script>
</head>

<body>

	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Tools > User Profile > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">T20 - User Profile</h1>
						<div class="toolbar">
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
							<!--a class="item-button-next" href="javascript:test();"><span>Test</span></a-->
					  	</div>

						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>

				 			<form:form cssClass="edit-form" id="editForm" name="editForm" method="post" modelAttribute="profile">
					 		<table width="87%" cellpadding="2" cellspacing="0">
				 		  <tr>
								<td width="35%" align="right">Row/Page(Normal Grid)</td>
							<td>:</td>
								<td width="63%"><form:input path="rowperpage" cssClass="inputbox" maxlength="30"/></td>
							<td width="1%"><form:errors cssClass="error" path="rowperpage" /></td>
						 	</tr>
					 		<tr>
								<td align="right">Row/Page(Popup)</td>
								<td>:</td>
								<td><div class="form-value"><form:input path="popuprow" cssClass="inputbox" maxlength="50"/></div></td>
								<td><form:errors cssClass="error" path="popuprow"/></td>
					 		</tr>
					 		<tr>
								<td align="right">Locale</td>
								<td>:</td>
								<td>
									<div class="form-value">
					  					<form:select path="locale" cssClass="combobox">
					  						<form:options items="${locales}" itemLabel="name" itemValue="id"/>
					  					</form:select>
					 				</div>
								</td>
								<td><form:errors cssClass="error" path="locale"/></td>
					 		</tr>
					 		<tr>
								<td align="right">Organization</td>
								<td width="1%">:</td>
  				  				<td>
									<form:select id="org" path="organization" cssClass="combobox-ext">
										<c:if test="${not empty profile.organization}">
											<form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
										</c:if>
									</form:select>
									&nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
								</td>
							</tr>
					 		<%-- <tr>
								<td align="right">Accessible Showroom</td>
								<td width="1%">:</td>
  				  				<td>
									<form:select id="showroom" path="showroom" cssClass="combobox-ext">
										<c:if test="${not empty profile.showroom}">
											<form:option value='${profile.showroom.id}' label='${profile.showroom.firstName} ${profile.showroom.middleName} ${profile.showroom.lastName}'/>
										</c:if>
									</form:select>
									&nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=showroom'/>');" style="CURSOR:pointer;" title="Company Structure" />
								</td>
							</tr> --%>
					 		<tr>
								<td align="right">Company Name</td>
								<td>:</td>
								<td><div class="form-value"><form:input path="companyName" cssClass="inputbox" maxlength="50"/></div></td>
								<td><form:errors cssClass="error" path="companyName"/></td>
					 		</tr>
					 		<tr>
								<td align="right">Workshop Name</td>
								<td>:</td>
								<td><div class="form-value"><form:input path="workshopName" cssClass="inputbox" maxlength="50"/></div></td>
								<td><form:errors cssClass="error" path="workshopName"/></td>
					 		</tr>
                            <tr>
								<td align="right">Container</td>
								<td width="1%">:</td>
  				  				<td>
									<form:select id="container" path="container" cssClass="combobox-ext">
										<c:if test="${not empty profile.container}">
											<form:option value='${profile.container.id}' label='${profile.container.code} - ${profile.container.name}'/>
										</c:if>
									</form:select>
									&nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:opencontainer();" style="CURSOR:pointer;" title="Container" />
								</td>
							</tr>
                            <tr>
								<td align="right">Bank/Cash Account</td>
								<td width="1%">:</td>
  				  				<td>
									<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext">
										<c:if test="${not empty profile.bankAccount}">
											<form:option value='${profile.bankAccount.id}' label='${profile.bankAccount.code} - ${profile.bankAccount.bankName} - ${profile.bankAccount.accountName}'/>
										</c:if>
									</form:select>
									&nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openbank();" style="CURSOR:pointer;" title="Bank/Cash Account" />
								</td>
							</tr>
					 		</table>
						  </form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
</html>

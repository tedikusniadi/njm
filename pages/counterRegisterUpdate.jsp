<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
	</style>
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
							<a class="item-button-list" href="<c:url value='/page/counterregisterview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:updateCounterRegister();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="counterRegister">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="606">
											<table width="100%" style="border:none">
												<tr>
													<td width="23%" align="right">Counter ID :</td>
													<td width="73%">
														<input type="hidden" name="id" value="${counterRegister.id}" />
														<input type="text" name="code" id="counterCode" class="inputbox" value="${counterRegister.code}" readonly="true" />
													</td>
												</tr>
												<tr>
													<td align="right">Organisasi :</td>
													<td>
														<select id="companyFacility" class="combobox-ext input-disabled" disabled>
															<option>${counterRegister.organization.name}</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Default Cash :</td>
													<td>
														<select id="bankAccount" class="combobox-ext input-disabled" disabled>
															<option>${counterRegister.bankAccount.bankName}</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Default KPB Account :</td>
													<td>
														<select id="glAccountKPB" class="combobox-ext input-disabled" disabled>
															<option>${counterRegister.glAccountKPB.name}</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Default Claim Account :</td>
													<td>
														<select id="glAccountClaim" class="combobox-ext input-disabled" disabled>
															<option>${counterRegister.glAccountClaim.name}</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Default AR Account :</td>
													<td>
														<select id="glAccountAR" class="combobox-ext input-disabled" disabled>
															<option>${counterRegister.glAccountAR.name}</option>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Status :</td>
													<td>
														<input type="radio" id="counterStatus" name="status" value="true" <c:if test="${counterRegister.status == true}">checked</c:if> /> Aktif
														<input type="radio" id="counterStatus" name="status" value="false" <c:if test="${counterRegister.status == false}">checked</c:if> /> Tidak Aktif
													</td>
												</tr>
												<tr>
												  <td align="right">Note :</td>
												  <td><textarea rows="3" cols="35" id="note" name="note" class="inputbox">${counterRegister.note}</textarea></td>
												</tr>
												<tr>
												  <td align="right">&nbsp;</td>
												  <td>&nbsp;</td>
												</tr>
										  	</table>
										</td>
										<td width="357" align="left" valign="top"></td>
										<td width="10" style="width:10px;">&nbsp;</td>
									</tr>
								</table>
	  						</form:form>
						</div>
						<div class="info">Created by : <c:out value='${counterRegister.createdBy.firstName} ${counterRegister.createdBy.middleName} ${counterRegister.createdBy.lastName}'/> (<fmt:formatDate value='${counterRegister.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${counterRegister.updatedBy.firstName} ${counterRegister.updatedBy.middleName} ${counterRegister.updatedBy.lastName}'/> (<fmt:formatDate value='${counterRegister.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	function updateCounterRegister()
	{
		var url = "<c:url value='/page/counterregisteredit.htm'/>";
		document.editForm.action = url;
		document.editForm.submit();
	}
</script>

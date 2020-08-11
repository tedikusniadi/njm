<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>User >> Edit</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function edit()
		{
			document.editForm.action = "<c:url value='/page/useredit.htm'/>";
			document.editForm.submit();
		}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->

	<!-- tips & page navigator -->
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Tools > User Management > User > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">T12 - User</h1>

						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/userview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:edit();"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form name="editForm" id="editForm" method="post" modelAttribute="user_edit">
							<table width="100%" style="border:none">
					 		<tr>
                                <td width="170" align="right" valign="top" style="WIDTH:170px;">User ID :</td>
                                <td width="244" valign="top"><form:input cssClass="inputbox" id="username" path="username" size="35" maxlength="15"/></td>
                                <td width="330" valign="top"><form:errors path="username" cssClass="error"/></td>
                            </tr>
                            <tr>
                                <td valign="top" align="right">Person :</td>
                                <td valign="top">
                                    <form:select id="person" path="person" cssClass="combobox">
                                    	<c:if test='${not empty user_edit.person}'>
                                        	<form:option value='${user_edit.person.id}' label='${user_edit.person.firstName} ${user_edit.person.middleName} ${user_edit.person.lastName}'/>
                                        </c:if>
                                    </form:select>
                                </td>
                                <td valign="top"><form:errors path="person" cssClass="error"/></td>
                            </tr>
                            <tr>
                                <td valign="top" align="right">Role :</td>
                                <td valign="top">
                                    <form:select id="role" path="role" cssClass="combobox">
                                    	<form:options items='${roles}' itemLabel='name' itemValue='id'/>
                                    </form:select>
                                </td>
                                <td valign="top"><form:errors path="role" cssClass="error"/></td>
                            </tr>
					 		<tr>
								<td valign="top" align="right">Accessible Showroom :</td>
  				  				<td valign="top">
									<form:select id="showroom" path="profile.showroom" cssClass="combobox-ext">
										<c:if test="${not empty user_edit.profile.showroom}">
											<form:option value='${user_edit.profile.showroom.id}' label='${user_edit.profile.showroom.firstName} ${user_edit.profile.showroom.middleName} ${user_edit.profile.showroom.lastName}'/>
										</c:if>
									</form:select>
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=showroom'/>');" style="CURSOR:pointer;" title="Company Structure" />
								</td>
                                <td valign="top"></td>
							</tr>
                            <tr>
                                <td valign="top" align="right">Status :</td>
                                <td valign="top"><form:checkbox path="enabled" value="true" label="Active"/>
                                <td valign="top"><form:errors path="enabled" cssClass="error"/></td>
                            </tr>
				  			</table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

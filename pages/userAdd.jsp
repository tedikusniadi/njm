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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function add()
		{
			document.addForm.action = "<c:url value='/page/useradd.htm'/>";
			document.addForm.submit();
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
							<a class="item-button-list" href="<c:url value='/page/userview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:add();"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form name="addForm" id="addForm" method="post" modelAttribute="user_add">
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
                                        <c:forEach items="${persons}" var="person">
                                            <option value="${person.id}">${person.firstName} ${person.lastName}</option>
                                        </c:forEach>
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
					 		<%-- <tr>
								<td valign="top" align="right">Accessible Showroom :</td>
  				  				<td valign="top">
									<form:select id="showroom" path="profile.showroom" cssClass="combobox-ext">
										<c:if test="${not empty profile.showroom}">
											<form:option value='${profile.showroom.id}' label='${profile.showroom.firstName} ${profile.showroom.middleName} ${profile.showroom.lastName}'/>
										</c:if>
									</form:select>
									&nbsp;
									<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=showroom'/>');" style="CURSOR:pointer;" title="Company Structure" />
								</td>
                                <td valign="top"><form:errors path="person" cssClass="error"/></td>
							</tr> --%>
                            <tr>
                                <td valign="top" align="right">Status :</td>
                                <td valign="top"><form:checkbox path="enabled" value="true" label="Active"/>&nbsp;&nbsp;<form:checkbox path="enabled" value="false" label="Not Active"/></td>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

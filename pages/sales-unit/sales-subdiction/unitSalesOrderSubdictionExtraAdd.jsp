<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

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

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/unitsalesordersubdictionextraview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="subdiction">
			 				<table width="100%" style="border:none" class="space">
							<tr>
								<td align="right">Name</td>
								<td width="1%">:</td>
								<td><form:input id="name" path="name" cssClass='inputbox'/></td>
							</tr>
							<tr>
						  		<td align="right">Tipe </td>
						  		<td>:</td>
						  		<td>
						  			<form:select path="type">
						  				<c:forEach items="${types}" var="type">
						  				<c:if test="${type == 'EXTRA'}">
											<form:option value="${type}"/>
										</c:if>
										</c:forEach>
									</form:select>
                          		</td>
					  		</tr>
							<tr>
						  		<td align="right">Currency </td>
						  		<td>:</td>
						  		<td>
						  			<form:select path="money.currency">
										<form:options items="${currencies}" itemLabel="symbol" itemValue="id"/>
									</form:select>
									<form:select path="money.exchangeType">
										<form:options items="${exchangeTypes}"/>
									</form:select>
                          		</td>
					  		</tr>
					  		<tr>
					  			<td align="right">Status </td>
						  		<td>:</td>
						  		<td>
						  			<form:radiobutton path="active" value="TRUE" label="Aktif"/>
						  			<form:radiobutton path="active" value="FALSE" label="Non-Aktif"/>
                          		</td>
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
<script type="text/javascript">
	function save()
	{
		if($("#amount").val()=="")
			alert("Silahkan isi amount");
		else if($("#name").val()=="")
			alert("Silahkan isi nama");
		else{
			document.addForm.action="<c:url value='/page/unitsalesordersubdictionextraadd.htm'/>";
			document.addForm.submit();
		}
	}
</script>
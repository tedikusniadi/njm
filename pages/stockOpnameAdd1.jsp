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
	<script type="text/javascript">
		function save()
		{
			var date = document.getElementById('dateId');
			if(date.value == '')
			{
				alert('Date cannot be empty !!!');
				return;
			}
			
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			var fac = document.getElementById('facility');
			if(fac.value == '')
			{
				alert('Please select Facility first!');
				return;
			}
			
			var cat = document.getElementById('cat');
			if(cat.value == '')
			{
				alert('Please select Product Category first!');
				return;
			}
			
			document.addForm.action = "<c:url value='/page/stockopnamepreadd2.htm'/>";
			document.addForm.submit();
		}

		function openfacility()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}

			openpopup("<c:url value='/page/popupfacilityview.htm?target=facility&organization='/>"+org.value);
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
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
							<a class="item-button-list" href="<c:url value='/page/stockopnameview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-next" href="javascript:save();"><span><spring:message code="next"/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="opname_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right"><spring:message code="id"/> :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="date"/> :</td>
									<td><input id="date" value="${opname_add.date}" inputId="dateId" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="company"/> :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
											<c:if test='${not empty opname_add.organization}'>
                                               	<form:option value='${opname_add.organization.id}' label='${opname_add.organization.firstName} ${opname_add.organization.lastName} ${opname_add.organization.middleName}' />
                                          </c:if>
                                               	<form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right"><spring:message code="facility"/> :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext">
                                           	<c:if test='${not empty opname_add.facility}'>
                                               	<form:option value='${opname_add.facility.id}' label='${opname_add.facility.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Facility" />
									</td>
								</tr>
                                <tr>
 									<td align="right"><spring:message code="productcategory.htmltitle"/> :</td>
									<td>
                                    	<form:select id="cat" path="productCategory" cssClass="combobox-ext">
                                            <%-- <c:if test='${not empty opname_add.productCategory}'>
                                                <form:option value='${opname_add.productCategory.id}' label='${opname_add.productCategory.name}' />
                                            </c:if> --%>
                                            <form:option value='2' label='Sparepart' />
                                        </form:select>
										<%-- <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=cat'/>');" style="CURSOR:pointer;" title="Product Category" /> --%>
                                    </td>
									<td><form:errors path="productCategory"/></td>
	 							</tr>
                                <tr>
									<td nowrap="nowrap" align="right"><spring:message code="reason"/> :</td>
									<td><form:textarea path="reason" cols="55" rows="7"/></td>
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
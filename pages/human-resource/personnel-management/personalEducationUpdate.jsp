<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-back" href="<c:url value='/page/personnelmanagementpreedit.htm?id=${education_edit.personnelManagement.id}'/>"><span>Back</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="education_edit">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Employee ID</td>
                                    <td width="1%" align="center">:</td>
									<td width="65%"><input disabled="disabled" size='25' class="input-disabled" value="${education_edit.personnelManagement.code}"/></td>
 								</tr>
 								<tr>
 									<td align="right">Employee Name</td>
                                    <td width="1%" align="center">:</td>
									<td><input disabled="disabled" size='25' class="input-disabled" value="${education_edit.personnelManagement.name}"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Start Date</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input inputId="startDateId" id="startDate" path="startDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
	 							</tr>
 								<tr>
 									<td align="right">End Date</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input inputId="endDateId" id="endDate" path="endDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Education Level</td>
                                    <td width="1%" align="center">:</td>
									<td>
										<form:select id="educationLevel" path="educationLevel" class="combobox">
			  					  		<c:forEach items="${educationLevels}" var="edu">
			  					  			<c:if test="${education_edit.educationLevel eq edu}">
												<form:option value="${edu}" label="${edu}" selected="selected"/>
											</c:if>
											<c:if test="${education_edit.educationLevel ne edu}">
												<form:option value="${edu}" label="${edu}"/>
											</c:if>
										</c:forEach>
										</form:select>
									</td>
	 							</tr>
 								<tr>
 									<td align="right">Institution Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="institutionName" path="institutionName" size="35"/></td>
 								</tr>
 								<tr>
 									<td align="right">Major</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="major" path="major" size="35"/></td>
 								</tr>
 								<tr>
 									<td align="right">GPA/Equal</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="gpa" path="gpa" size="10"/></td>
 								</tr>
 								</table>
 							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${education_edit.createdBy.firstName} ${education_edit.createdBy.middleName} ${education_edit.createdBy.lastName}'/> (<fmt:formatDate value='${education_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${education_edit.updatedBy.firstName} ${education_edit.updatedBy.middleName} ${education_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${education_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
<script type="text/javascript">

	function validation()
	{
		if($("#startDateId").val() == '' || $("#startDateId").val() == null)
		{
			alert('Start Date cannot be empty !!!');
			return;
		}

		if($("#endDateId").val() == '' || $("#endDateId").val() == null)
		{
			alert('End Date cannot be empty !!!');
			return;
		}
		
		if($("#institutionName").val() == '')
		{
			alert('Institution Name cannot be empty !!!');
			return;
		}
		
		/* if($("#major").val() == '')
		{
			alert('Major cannot be empty !!!');
			return;
		} */
		
		return true;
	}

	$(function()
	{
		$('.item-button-save').click(function()
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/personaleducationedit.htm'/>",
					data:$('#editForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Personal Education data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/personnelmanagementpreedit.htm?id='/>"+json.id;
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
</script>
</html>
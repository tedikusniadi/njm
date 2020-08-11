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
							<a class="item-button-list" href="<c:url value='/page/unitinvoiceverificationdiscountview.htm'/>"><span><spring:message code="list"/></span></a>
					  	</div>

						<div class="main-box">
			 				<table width="100%" style="border:none" class="space">
							<tr>
								<td align="right">Name</td>
								<td>: <input class="input-disabled" disabled value="${discount.name}" size="50"/></td>
							</tr>
                            <tr>
								<td align="right">Organization</td>
								<td>: <input class="input-disabled" disabled value="${discount.organization.name}" size="50"/></td>
							</tr>
							<tr>
								<td align="right">Dari</td>
								<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${discount.dateFrom}' pattern='dd-MM-yyyy'/>"/></td>
							</tr>
							<tr>
								<td align="right">Hingga</td>
								<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${discount.dateTo}' pattern='dd-MM-yyyy'/>"/></td>
							</tr>
                            <tr>
								<td align="right">Amount</td>
								<td>: <input class="input-disabled" disabled value="${discount.amount}" size="5"/>%</td>
							</tr>
							</table>
						</div>
						<div class="info">Created by : <c:out value='${discount.createdBy.firstName} ${discount.createdBy.middleName} ${discount.createdBy.lastName}'/> (<fmt:formatDate value='${discount.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${discount.updatedBy.firstName} ${discount.updatedBy.middleName} ${discount.updatedBy.lastName}'/> (<fmt:formatDate value='${discount.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
			document.addForm.action="<c:url value='/page/unitinvoiceverificationcomponentadd.htm'/>";
			document.addForm.submit();
		}
	}
</script>
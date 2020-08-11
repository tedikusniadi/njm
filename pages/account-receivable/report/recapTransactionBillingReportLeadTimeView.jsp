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
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css">@import "assets/css/report-normal.css";</style>
</head>
<body>
<div class="area" dojoType="Container" id="quick_link_container">
</div>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>
	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
				<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
			</tr>
			</table>
    	</div>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<div class="area" dojoType="Container" id="quick_link_container">
							<h1 class="page-title">${pageTitle}<br></h1>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/recaptransactionbillingreportleadtimepre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<%-- <a class="item-button-export-xls" href="<c:url value='/page/recaptransactionbillingreportleadtimeviewexcel.xls?organization=${organization.id}&billingType=${billingType}&customer=${customer}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy' />&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy' />"><span>Export</span></a> --%>
								<a class="item-button-export-xls" download="kwitansileadtimeexcell.xls" href="#" onclick="return ExcellentExport.excel(this, 'tableData', 'Kwitansi Lead Time Report');"><span>Export</span></a>
					  		</div>
					  	</div>
						<div class="main-box">
							<%-- <%@include file="recapTransactionBillingReportLeadTimePrint.jsp" %> --%>
							<%@include file="recapTransactionBillingReportLeadTimePrintNew.jsp" %>
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

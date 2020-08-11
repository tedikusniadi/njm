<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css">@import "assets/css/report-normal.css";</style>
</head>
<body>
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
							<h1 class="page-title">${pageTitle}</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/distributionandstockreporttodaypre.htm'/>"><span>Back</span></a>
								<%-- <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/bbnreportexcel.xls'/>"><span>Export</span></a> --%>
					  		</div>
					  	</div>
						<div class="main-box">
							<table width="100%" cellpadding="0" border="0" style="border:none">
								<tr>
							   		<td colspan="3"><h1 class="title">Distribution And Stock Today</h1></td>
								</tr>
								<tr>	
									<td nowrap="nowrap" valign="top">
										<table width="20%" class="table-list" cellpadding="0" style="max-width: 20%;">
											<tr>
												<th style="text-align: center;">BULAN</strong></th>
												<th style="text-align: center;"><fmt:formatDate value="${date}" pattern="MMMM"/></th>
											</tr>
											<tr>
												<td><strong>TOTAL HARI KERJA</strong></td>
												<td><strong><c:out value="${totalWorkingDay}"/></strong></td>
											</tr>
											<tr>
												<td><strong>TANGGAL</strong></td>
												<td><strong><fmt:formatDate value="${date}" pattern="dd"/></strong></td>
											</tr>
											<tr>
												<td><strong>HARI KERJA</strong></td>
												<td><strong><c:out value="${workingDay}"/></strong></td>
											</tr>
										</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">
										<table width="40%" class="table-list" cellpadding="0" style="max-width: 40%;">
										<thead>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th colspan="2" style="text-align: center;" nowrap="nowrap">DISTRIBUSI</th>
											</tr>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">TODAY</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.organization.name}"/></td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.invoiceTotal}' pattern=',##0'/></td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.invoiceCumulative}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalInvoiceToday}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalInvoiceCumulative}' pattern=',##0'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<c:forEach items='${report.datas}' var='dat'>
								<tr>
									<td colspan="3"><strong><c:out value="${dat.organization.name}"/></strong></td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 60%;">
										<thead>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">TIPE</th>
												<th style="text-align: center;" colspan="2" nowrap="nowrap">DISTRIBUSI</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL SALES SJ</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">STOCK DAYS</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">UNDV TODAY</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL STOCK</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${dat.items}' var='adap'>
											<tr>
												<td nowrap="nowrap"><c:out value="${adap.unitType}"/></td>
												<td><fmt:formatNumber value='${adap.invoiceToday}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.totalStock}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.totalSales}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.dailySales}' pattern=',##0.00'/></td>
												<td><fmt:formatNumber value='${adap.stockDays}' pattern=',##0.00'/></td>
											</tr>
											</c:forEach>
										</tbody><tfoot>
											<tr>
												<td><strong><c:out value="TOTAL"/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.invoiceTotal}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.stockTotal}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.deliveryOrderTotal}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.dailySalesTotal}' pattern=',##0.00'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.stockDaysTotal}' pattern=',##0.00'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								</c:forEach>
							</table>
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

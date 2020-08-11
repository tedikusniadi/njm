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
								<a class="item-button-back" href="<c:url value='/page/trackingsalesreportcumulativepre.htm'/>"><span>Back</span></a>
								<%-- <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/bbnreportexcel.xls'/>"><span>Export</span></a> --%>
					  		</div>
					  	</div>
						<div class="main-box">
							<table width="100%" cellpadding="0" border="0" style="border:none">
								<tr>
							   		<td colspan="3"><h1 class="title">Tracking Sales Cumulative</h1></td>
								</tr>
								<tr>	
									<td style="width: 25%" nowrap="nowrap" valign="top">
										<table width="100%" class="table-list" cellpadding="0">
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
									<td colspan="2" style="width: 75%">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 80%;">
										<thead>
											<tr>
												<th style="width: 200px;text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">SURAT JALAN</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">GROWTH SALES</th>
												<th style="text-align: center;" nowrap="nowrap">PREDIKSI CLOSING</th>
												<th style="text-align: center;" colspan="2" nowrap="nowrap">PENGAJUAN</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">CREDIT</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">CREDIT</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th style="text-align: center;" nowrap="nowrap">FAKTUR VS SJ</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalDO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySales}' pattern=',##0.00'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthTotal}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.closingForecasting}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.cabang}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.invoiceDO}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDO}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySales}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSales}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalClosingForecasting}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCabang}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalInvoiceDO}' pattern=',##0'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 70%;">
										<thead>
											<tr>
												<th style="width: 200px;text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">AVERAGE DISCOUNT</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">GROWTH AVERAGE DISCOUNT</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">CREDIT</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">CREDIT</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalAvgDisc}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthAvgDiscCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthAvgDiscCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthAvgDiscTotal}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDisc}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthAvgDiscCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthAvgDiscCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthAvgDisc}' pattern=',##0'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 90%;">
										<thead>
											<tr>
												<th style="width: 200px;text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">FIF</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">OTO</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">ADIRA</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitFIF}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareFIF}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditFif}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesFIF}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthFIF}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitOTO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareOTO}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditOto}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesOTO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthOTO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitADIRA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareADIRA}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditAdira}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesADIRA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthADIRA}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareFif}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareOto}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareAdira}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesFif}' pattern=',##0'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 90%;">
										<thead>
											<tr>
												<th style="width: 200px;text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">MEGA</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">OTHER</th>
												<th style="text-align: center;" colspan="5" nowrap="nowrap">TOTAL</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">GROWTH</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitMEGA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareMEGA}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditMega}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesMEGA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthMEGA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitOTHER}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareOTHER}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditOther}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesOTHER}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthOTHER}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitTotal}' pattern=',##0'/></td>
												<td>
													<c:if test="${report.totalCredit > 0}">
														<fmt:formatNumber value='${dat.adapter.unitTotal/report.totalCredit*100}' pattern=',##0.00'/>%
													</c:if>
													<c:if test="${report.totalCredit == 0}">
														<fmt:formatNumber value='0' pattern=',##0.00'/>%
													</c:if>
												</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.dailySalesLeasingTotal}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.growthLeasingTotal}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareMega}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareOther}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShare}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDailySalesLeasing}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalGrowthSalesLeasing}' pattern=',##0'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
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

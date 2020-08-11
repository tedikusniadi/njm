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
								<a class="item-button-back" href="<c:url value='/page/trackingsalesreporttodaypre.htm'/>"><span>Back</span></a>
								<%-- <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/bbnreportexcel.xls'/>"><span>Export</span></a> --%>
					  		</div>
					  	</div>
						<div class="main-box">
							<table width="100%" cellpadding="0" border="0" style="border:none">
								<tr>
							   		<td colspan="3"><h1 class="title">Tracking Sales Today</h1></td>
								</tr>
								<tr>	
									<td nowrap="nowrap" valign="top">
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
									<td style="width: 5px;">&nbsp;</td>
									<td>
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 60%;">
										<thead>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" nowrap="nowrap">TARGET DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">TARGET UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">TARGET M/S</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.adapter.targetDaily}' pattern=',##0'/></td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.adapter.targetUnit}' pattern=',##0'/></td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.adapter.targetMS}' pattern=',##0.00'/>%</td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalTargetDaily}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalTargetUnit}' pattern=',##0'/></strong></td>
												<td>&nbsp;</td>
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
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 60%;">
										<thead>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="2" nowrap="nowrap">PENGAJUAN FAKTUR</th>
												<th style="text-align: center;" nowrap="nowrap">M/S</th>
												<th style="text-align: center;" nowrap="nowrap">TARGET M/S</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" nowrap="nowrap">AREA</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.cabang}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.area}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.MSToday}' pattern=',##0.00'/>%</td>
												<td nowrap="nowrap"><fmt:formatNumber value='${dat.adapter.targetMS}' pattern=',##0.00'/>%</td>
											</tr>
											</c:forEach>
										</tbody><tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCabang}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalArea}' pattern=',##0'/></strong></td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
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
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">SURAT JALAN</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">AVERAGE DISCOUNT</th>
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
												<td><fmt:formatNumber value='${dat.adapter.totalCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalDO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCredit}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.totalAvgDisc}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalDO}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCredit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDisc}' pattern=',##0'/></strong></td>
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
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">FIF</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">OTO</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">ADIRA</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitFIF}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareFIF}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditFif}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitOTO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareOTO}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditOto}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitADIRA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareADIRA}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditAdira}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareFif}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareOto}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareAdira}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditAdira}' pattern=',##0'/></strong></td>
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
												<th style="text-align: center;" nowrap="nowrap">CABANG</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">MEGA</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">OTHER</th>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">TOTAL</th>
											</tr>
											<tr>
												<th>&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
												<th style="text-align: center;" nowrap="nowrap">UNIT</th>
												<th style="text-align: center;" nowrap="nowrap">KREDIT SHARE</th>
												<th style="text-align: center;" nowrap="nowrap">AVG DISCOUNT</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${report.datas}' var='dat'>
											<tr>
												<td nowrap="nowrap"><c:out value="${dat.adapter.organization.name}"/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitMEGA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareMEGA}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditMega}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitOTHER}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.shareOTHER}' pattern=',##0.00'/>%</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCreditOther}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${dat.adapter.unitTotal}' pattern=',##0'/></td>
												<td>
													<c:if test="${report.totalCredit gt 0}">
														<c:set var="unit"><fmt:formatNumber value='${dat.adapter.unitTotal}' pattern=',##0'/></c:set>
														<c:set var="total"><fmt:formatNumber value='${report.totalDO}' pattern=',##0'/></c:set>
														<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value='${unit/total*100}'/>%
													</c:if>
													<c:if test="${report.totalCredit le 0}">
														<fmt:formatNumber value='0' pattern=',##0.00'/>%
													</c:if>
												</td>
												<td><fmt:formatNumber value='${dat.adapter.avgDiscCredit}' pattern=',##0'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td><strong><c:out value="TOTAL NJM"/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareMega}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnitOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShareOther}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCreditOther}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalUnit}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${report.totalShare}' pattern=',##0.00'/>%</strong></td>
												<td><strong><fmt:formatNumber value='${report.totalAvgDiscCredit}' pattern=',##0'/></strong></td>
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

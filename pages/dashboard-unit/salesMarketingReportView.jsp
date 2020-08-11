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
								<a class="item-button-back" href="<c:url value='/page/salesmarketingreporttodaypre.htm'/>"><span>Back</span></a>
								<%-- <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/bbnreportexcel.xls'/>"><span>Export</span></a> --%>
					  		</div>
					  	</div>
						<div class="main-box">
							<table width="100%" cellpadding="0" border="0" style="border:none">
								<tr>
							   		<td colspan="3"><h1 class="title">Sales And Marketing Report</h1></td>
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
								<c:forEach items='${report.datas}' var='dat'>
								<c:if test="${dat.dataSize > 0}">
								<tr>
									<td colspan="3"><strong><c:out value="${dat.organization.name}"/></strong></td>
								</tr>
								<tr>	
									<td colspan="3">
										<table width="50%" class="table-list" cellpadding="0" style="max-width: 100%;">
										<thead>
											<tr>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">&nbsp;</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">TODAY</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">CUMULATIVE</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">GROWTH SALES</th>
												<th style="text-align: center;" nowrap="nowrap">&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">&nbsp;</th>
											</tr>
											<tr>
												<th style="text-align: center;" colspan="3" nowrap="nowrap">&nbsp;</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">SURAT JALAN</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">SURAT JALAN</th>
												<th style="text-align: center;" colspan="6" nowrap="nowrap">SURAT JALAN</th>
												<th style="text-align: center;" nowrap="nowrap">DAILY SALES</th>
												<th style="text-align: center;" nowrap="nowrap">PREDIKSI CLOSING</th>
											</tr>
											<tr>
												<th style="text-align: center;" nowrap="nowrap">NO</th>
												<th style="text-align: center;" nowrap="nowrap">NAMA MARKETING</th>
												<th style="text-align: center;" nowrap="nowrap">JABATAN</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">FIF</th>
												<th style="text-align: center;" nowrap="nowrap">OTO</th>
												<th style="text-align: center;" nowrap="nowrap">ADIRA</th>
												<th style="text-align: center;" nowrap="nowrap">MEGA</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">FIF</th>
												<th style="text-align: center;" nowrap="nowrap">OTO</th>
												<th style="text-align: center;" nowrap="nowrap">ADIRA</th>
												<th style="text-align: center;" nowrap="nowrap">MEGA</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th style="text-align: center;" nowrap="nowrap">CASH</th>
												<th style="text-align: center;" nowrap="nowrap">FIF</th>
												<th style="text-align: center;" nowrap="nowrap">OTO</th>
												<th style="text-align: center;" nowrap="nowrap">ADIRA</th>
												<th style="text-align: center;" nowrap="nowrap">MEGA</th>
												<th style="text-align: center;" nowrap="nowrap">TOTAL</th>
												<th style="text-align: center;" nowrap="nowrap">&nbsp;</th>
												<th style="text-align: center;" nowrap="nowrap">&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items='${dat.items}' var='adap' varStatus="stat">
											<tr>
												<td><c:out value="${stat.index+1}"/></td>
												<td nowrap="nowrap"><c:out value="${adap.person.name}"/></td>
												<td nowrap="nowrap"><c:out value="${adap.person.personInformation.position}"/></td>
												<td><fmt:formatNumber value='${adap.cash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.fif}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.oto}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.adira}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.mega}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.total}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.cashCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.fifCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.otoCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.adiraCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.megaCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.totalCumulative}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthCash}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthFIF}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthOTO}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthADIRA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthMEGA}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.growthTotal}' pattern=',##0'/></td>
												<td><fmt:formatNumber value='${adap.dailySalesTotal}' pattern=',##0.00'/></td>
												<td><fmt:formatNumber value='${adap.prediksiClosing}' pattern=',##0.00'/></td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="3"><strong><c:out value="TOTAL"/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.total}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalCashCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalFifCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalOtoCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalAdiraCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalMegaCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalCumulative}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowthCash}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowthFif}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowthOto}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowthAdira}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowthMega}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalGrowth}' pattern=',##0'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalDailySales}' pattern=',##0.00'/></strong></td>
												<td><strong><fmt:formatNumber value='${dat.totalPrediksiClosing}' pattern=',##0.00'/></strong></td>
											</tr>
										</tfoot>
										</table>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								</c:if>
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

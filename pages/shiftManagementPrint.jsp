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
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
	</style>
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>

</head>
<body>
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
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
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/shiftmanagementview.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="0" cellspacing="0" >
										<tr>
											<td colspan="3" align="center"><strong>Berita Acara </strong></td>
										</tr>
										<tr>
											<td colspan="3" align="center">Penyerahan Kas </td>
									  	</tr>
										<tr>
											 <td style="height:6px;"></td>
										</tr>
										<tr style="HEIGHT:10px;">
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td width="100">Tanggal</td>
											<td width="7">:</td>
											<td><fmt:formatDate value='${shiftManagement_edit.shiftDate}' pattern='yyyy-MM-dd' />&nbsp;</td>
										</tr>
										<tr>
											<td>Kasir</td>
											<td>:</td>
											<td>
												<c:out value='${shiftManagement_edit.cashierPerson.name}' />
											</td>
										</tr>
										<tr>
											<td>Lokasi</td>
											<td>:</td>
											<td>
												<c:out value='${shiftManagement_edit.counterRegister.code}' />
											</td>
										</tr>							
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>Waktu Mulai </td>
											<td>:</td>
											<td><c:out value='${shiftManagement_edit.shiftStart}' /></td>
										</tr>
										<tr>
											<td>Waktu Tutup </td>
											<td>:</td>
											<td><c:out value='${shiftManagement_edit.shiftEnd}' /></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
										  	<td><strong>Rincian</strong></td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
										  	<td colspan="3">
										  		<table width="99%" align="center" cellpadding="2" cellspacing="0">
												<tr>
							    					<td width="1%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;border-left:solid 1px #000000;">No</td>
							    					<td width="24%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="center">No. SO</td>
							    					<td width="10%" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-top:solid 1px #000000;" align="right">Total</td>
												</tr>
												<c:set var="no" value="0"/>
												<c:forEach items="${adapters}" var="adapter">
												<c:set var="no" value="${no+1}"/>
												<tr>
													<td align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;border-left:solid 1px #000000;">&nbsp;<fmt:formatNumber value="${no}" pattern="#,###"/>.</td>
					       							<td nowrap="nowrap" align="left" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><c:out value="${adapter.sparepartSalesOrder.code}"/></td>
													<td align="right" style="padding-left: 6px; border-bottom:solid 1px #000000;border-right:solid 1px #000000;"><fmt:formatNumber value="${adapter.sparepartSalesOrder.amount}" pattern="#,###"/></td>
												</tr>
												</c:forEach>
												</table>
										  	</td>
										</tr>
										<tr>
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td><strong>Saldo Awal </strong></td>
											<td>:</td>
											<td align="right"><strong>Rp. <fmt:formatNumber value='${shiftManagement_edit.fundStart}' /></strong></td>
										</tr>
										<tr>
											<td>Total Tunai </td>
											<td>:</td>
											<td align="right">Rp. <fmt:formatNumber value='${shiftManagement_edit.realCalculateFund-shiftManagement_edit.fundStart}'/></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td><strong>Saldo Akhir </strong></td>
											<td>:</td>
											<td align="right"><strong>Rp. <fmt:formatNumber value='${shiftManagement_edit.fundEnd}'/></strong></td>
										</tr>
										<tr>
											<td><strong>Selisih</strong></td>
											<td>:</td>
											<td align="right"><strong>Rp. <fmt:formatNumber value='${shiftManagement_edit.discrepancy}'/></strong></td>
										</tr>
										<tr>
											<td colspan="3">&nbsp;</td>
										</tr>
										<tr>
											<td><strong>KPB</strong></td>
											<td>:</td>
											<td align="right"><strong>Rp. <fmt:formatNumber value='${shiftManagement_edit.realCalculateKPB}'/></strong></td>
										</tr>
										<tr>
											<td><strong>Claim</strong></td>
											<td>:</td>
											<td align="right"><strong>Rp. <fmt:formatNumber value='${shiftManagement_edit.realCalculateClaim}'/></strong></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td align="center">Penyetor</td>
											<td>&nbsp;</td>
											<td align="center">Yang Menerima </td>
										</tr>
										<tr>
											<td style="height:25px;">&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td align="center" nowrap="nowrap">						  
												(&nbsp;<c:out value='${shiftManagement_edit.cashierPerson.name}'/>&nbsp;)
											</td>
											<td>&nbsp;</td>
											<td align="center">					  
												(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)							  
											</td>
										</tr>
										<tr>
											<td align="center">Kasir</td>
											<td>&nbsp;</td>
											<td align="center">Supervisor</td>
										</tr>
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
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
</html>

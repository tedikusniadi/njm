<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
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
		@import url("<c:url value='/assets/goodsReceipt.css'/>");
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
                                <a class="item-button-back" href="<c:url value='/page/paymentmanualpreedit.htm?id=${payment_edit.id}'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            </div>
                        </div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="in">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td colspan="6"><div align="center" class="CSS3" valign="middle"><strong>KWITANSI</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><strong><c:out value='${profile.companyName}'/></strong></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="10%">Nomor</td>
                                    <td width="25%">: <c:out value='${payment_edit.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Tanggal</td>
                                    <td>: <fmt:formatDate value='${payment_edit.date}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="6">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="6" style="border-top:solid 1px black;">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="15%">Bayar kepada</td>
                                    <td colspan="5">: <c:out value='${payment_edit.supplier.name}'/></td>
                                  </tr>
                                  <tr>
                                    <td>Bank/No Rek</td>
                                    <td colspan="5">: <c:out value='${payment_edit.paymentInformation.bankAccount.accountNo}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="6">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Uang Sejumlah</td>
                                    <td colspan="5">: Rp. <fmt:formatNumber value='${payment_edit.paymentInformation.amount}' pattern='#,###'/></td>
                                  </tr>
                                  <tr>
                                    <td>Terbilang</td>
                                    <td colspan="5">: ## <c:out value='${said}'/> ##</td>
                                  </tr>
                                  <tr>
                                    <td>Keterangan</td>
                                    <td colspan="5">:
	                                    <c:if test="${payment_edit.referenceDetail == 'BBN'}">
	                                    	BBN
	                                    </c:if>
	                                    <c:if test="${payment_edit.referenceDetail == 'SPECIAL_NUMBER'}">
	                                    	Nomor Cantik
	                                    </c:if>
	                                    <c:if test="${payment_edit.referenceDetail == 'PROGRESSIVE_TAX'}">
	                                    	Pajak Progresif
	                                    </c:if>
	                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'MEDIATOR'}">
	                                    	Mediator
	                                    </c:if>
	                                    <c:if test="${payment_edit.referenceDetail == 'CROSS_DISTRICT'}">
	                                    	Pelanggaran Wilayah
	                                    </c:if>
	                                    <c:if test="${payment_edit.referenceDetail == 'FINES_INVOICE'}">
	                                    	Loksus
	                                    </c:if>
	                                    <c:if test="${payment_edit.referenceDetail == 'TEMPORARY'}">
	                                    	Ompang
	                                    </c:if>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td width="71">&nbsp;</td>
                                    <td width="359">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">${profile.organization.legend}, <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">Homat Kami</div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                  </tr>
                                </table>
							  	<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
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
<script type="text/javascript">
</script>
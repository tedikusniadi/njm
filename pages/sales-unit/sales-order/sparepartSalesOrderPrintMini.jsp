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

	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>
	<style type="text/css" media="screen,print"><!-- @import url("assets/css/report-dotmatrix.css"); --></style>
	<style type="text/css" media="screen,print">.table-desc{width: 80% !important;}</style>
</head>
<body>
	<%@ include file="/common/sirius-header.jsp"%>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>
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
							<c:if test="${empty temp}">
								<a class="item-button-back" href="<c:url value='/page/retailsalesorderpreedit.htm?id=${salesOrder.id}'/>"><span><spring:message code="back"/></span></a>
							</c:if>
				  			<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
				  		</div>
						<div class="main-box">
							<div class="main_container">
								<div dojoType="Container" id="accounting_period_grid">
								<table width="20%" border="0" cellspacing="0" cellpadding="2">
								  <tr>
								    <th colspan="3" scope="col" align="left">BRAGA MUSIC</th>
								  </tr>
								  <tr>
								    <td colspan="3" scope="row" align="left" class="border-bottom"><c:out value="${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}"/></td>
								  </tr>
								  <tr>
								    <td width="39%" scope="row" align="left">Tanggal</td>
								    <td width="3%">:</td>
								    <td width="58%"><fmt:formatDate value="${salesOrder.date}" pattern="dd MMM yyyy"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="left">Sales Counter</td>
								    <td>:</td>
								    <td>${visitor}</td>
								  </tr>
								  <tr>
								    <td scope="row" align="left">No</td>
								    <td>:</td>
								    <td>${salesOrder.code}</td>
								  </tr>
								  <tr>
								    <td scope="row" align="left" >Player</td>
								    <td>:</td>
								    <td>${salesOrder.salesPerson.name}</td>
								  </tr>
								  <tr>
								  <td class="border-bottom" colspan="3"></td>
								  </tr>
								</table>
								<table width="20%" border="0" cellspacing="0" cellpadding="2">
								<c:set var="diskonMember" value="0"/>
								<c:forEach items="${items}" var="item">
									<tr>
									
									    <td width="70%" align="left" scope="col">${item.orderItem.product.name}<c:forEach items="${item.orderItem.retailItemDetails}" var="detail">(${detail.serialNumber.serial})</c:forEach>
									    <fmt:formatNumber value="${item.orderItem.quantity}" pattern="#,###"/>x&nbsp;@&nbsp;<fmt:formatNumber value="${item.orderItem.money.amount}" pattern="#,###"/>
									    </td>
									    <td width="30%" scope="col" align="right"><fmt:formatNumber value="${item.orderItem.money.amount*item.orderItem.quantity}" pattern="#,###"/></td>
								  	</tr>
									<c:set var="diskonMember" value="${diskonMember+item.orderItem.money.amount*item.orderItem.quantity - (item.orderItem.amount+item.orderItem.discount)}"/>
								</c:forEach>
								  
								  <!-- <tr>
								    <td scope="row" align="left">Tab Contact Mechanism Tab (12131232) 1x @ 40000</td>
								    <td align="right">45008000</td>
								  </tr> -->
								</table>
								<table width="20%" border="0" cellspacing="0" cellpadding="0">
								<tr>
								 <td scope="row" align="right" class="border-top" colspan="2"></td>
								</tr>
								  <tr>
								    <td width="62%" scope="row" align="right">Total Discount :</td>
								    <td width="38%" align="right"><fmt:formatNumber value="${adapter.paymentDiscount}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="right">Discount Member:</td>
								    <td align="right">&nbsp;<fmt:formatNumber value="${diskonMember}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="right">Penjualan :</td>
								    <td align="right">&nbsp;<fmt:formatNumber value="${adapter.total}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="right">Return/Tukar Tambah :</td>
								    <c:set var="return" value="0"/>
									 <c:if test="${not empty salesOrder.itemReturns}">
										<c:forEach items="${salesOrder.itemReturns}" var="returnItem">
											<c:set var="return" value="${(returnItem.amount*returnItem.serialNumber.quantity)+return}"/>
										</c:forEach>
									</c:if>
								    <td align="right">${return}</td>
								  </tr>
								  <tr>
								    <td scope="row" align="right">Biaya Kredit Card :</td>
								    <c:set var="chargeAmount" value="0"/>
									<c:forEach items="${salesOrder.programApplication}" var="app">
										<c:set var="chargeAmount" value="${(app.amount*app.salesProgram.bankCharge)/100}"/>
									</c:forEach>
								    <td align="right"><fmt:formatNumber value="${adapter.charge}" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="right">Biaya Kirim :</td>
								    <td align="right"><fmt:formatNumber value="00.0" pattern="#,###"/></td>
								  </tr>
								  <tr>
								    <td scope="row" align="right" ><strong>Total :</strong></td>
								    <td align="right" class="border-top"><strong><fmt:formatNumber value="${adapter.paidAmount-return}" pattern="#,###"/></strong></td>
								  </tr>
								  <c:forEach items="${salesOrder.programApplication}" var="app">
								  <tr>
								    <td scope="row" align="right"><strong>${app.salesProgram.name} :</strong></td>
								    <td align="right"><strong><fmt:formatNumber value="${app.amount}" pattern="#,###"/></strong></td>
								  </tr>
								  </c:forEach>
								  
								  <tr>
								    <td scope="row" align="right">&nbsp;</td>
								    <td align="right">&nbsp;</td>
								  </tr>
								  <tr>
								    <td colspan="2" align="left" scope="row"><strong><label>Note:</label> <strong/> ${salesOrder.note}</td>
								  </tr>
								  <tr>
								    <td colspan="2" align="left" scope="row">Barang yang sudah di beli tidak dapat ditukar atau di kembalikan.</td>
								  </tr>
								  <tr>
								    <td colspan="2" align="center" scope="row">Terima kasih atas kunjungan Anda</td>
								  </tr>
								</table>
									<%-- <table cellpadding="2" border="0" style="font-family:'Courier New', Courier, monospace; font-size:12px;" width="18%">
									<tr>
									<td colspan="2"><strong>BRAGA MUSIC</strong></td></td>
									</tr>
									<tr><td colspan="2"><c:out value="${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}"/></td></tr>
									<tr><td colspan="2">_______________________________________</td></tr>
									<tr><td colspan="1">Tanggal</td>
									<td width="60%">:&nbsp;<fmt:formatDate value="${salesOrder.date}" pattern="dd MMM yyyy"/></td></tr>
									<tr><td colspan="1">Sales Counter</td>
									<td>:&nbsp;${visitor}</td></tr>
									<tr><td colspan="1">No</td>
									<td>:&nbsp;${salesOrder.code}</td></tr>
									<tr><td colspan="1">Player</td>
									<td>:&nbsp;${salesOrder.salesPerson.name}</td></tr>
									<tr><td colspan="2">_______________________________________</td></tr>
									</table >
									
									<table border="0" style="font-family:'Courier New', Courier, monospace; font-size:12px;" width="23%">
									<c:forEach items="${items}" var="item">
									<tr><td>${item.orderItem.product.name}<c:forEach items="${item.orderItem.retailItemDetails}" var="detail">(${detail.serialNumber.serial})</c:forEach>
									<fmt:formatNumber value="${item.orderItem.quantity}" pattern="#,###"/>x&nbsp;@&nbsp;<fmt:formatNumber value="${item.orderItem.money.amount}" pattern="#,###"/></td>
									<td align="right"><fmt:formatNumber value="${item.orderItem.money.amount*item.orderItem.quantity}" pattern="#,###"/></td>
									</tr>
									</c:forEach>
									</table>
									<table border="0" style="font-family:'Courier New', Courier, monospace; font-size:12px;" width="18%">
									<tr><td>_______________________________________</td><td></td></tr>
									<tr>
									<td align="left">Penjualan</td>
									<td align="right">:&nbsp;9056000</td>
									</tr>
									
									</table> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
</div><!-- /main containers -->
</body>
<!-- END OF BODY -->
</html>
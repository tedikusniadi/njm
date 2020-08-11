<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PDI Motor >> Print</title>
	<%@ include file="/common/sirius-header.jsp" %>
		<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen,print">
			@import url("<c:url value='/assets/sirius.css'/>");
			@import url("<c:url value='/css/report-normal.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
		</style>
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
			<td width="60%">Inventory > Warehouse Management > PDI Motor > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I25 - PDI Motor</h1>

							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/goodsreceiptitemverificationpreedit.htm?id=${verification.id}'/>"><span><spring:message code='back'/></span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							</div>
							<div class="main-box">
							<img id="njm-logo" src="<c:url value='/assets/images/logo_njm.png'/>" width="180" height="30"/>
							<c:set var="prod" value="${verification.goodsReceiptItemDetail.inventoryItemDetail.inventoryItem.product}"/>
							<h3>Pre Delivery Inspection</h3>
							<h1>${prod.typePDI}</h1>
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<c:forEach items="${terms}" var="term" varStatus="status">
									<c:if test="${status.index%2==0}"><tr></c:if>
										<td valign="top">
											<c:if test="${term.name!=' '}">
												<span style='display:inline-block;vertical-align:top;font-size:15px;'>${(term.checked)?'&#9745;':'&#9744;'}</span>
												<!-- &#9746; -->
											</c:if>
											<span style="display:inline-block;width:90%;">${term.name}</span>
										</td>
									<c:if test="${status.index%2==1}"></tr></c:if>
								</c:forEach>
								<tr>
									<td valign="bottom">*Sering dilakukan bila perlu<br/><b>Periksa=cek,stel. kencangkan atau lumasi</b></td>
									<td>
										<table>
											<tr><td>No.Rangka</td><td>${(prod.typeNames!='')?'Tipe:':''}</td><td>${(prod.colors!='')?'Warna:':''}</td></tr>
											<tr><td>${rangka}</td><td>${(prod.typeNames!='')?prod.typeNames:'' }</td><td>${(prod.colors!='')?prod.colors:'' }</td></tr>
											<tr><td>No.Mesin</td><td><span style='display:inline-block;vertical-align:top;font-size:15px;'>${(verification.status)?'&#9745;':'&#9744;'}</span>Oke</td></tr>
											<tr><td>${mesin}</td><td><span style='display:inline-block;vertical-align:top;font-size:15px;'>${(verification.status)?'&#9744;':'&#9745;'}</span>Tidak Oke</td></tr>
											<tr><td colspan="3"><b>Periksa=cek,stel.kencangankan atau lumasi</b></td></tr>
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td><td valign="top" align="center">Tanggal PDI: <fmt:formatDate value='${verification.date}' pattern='dd-MM-yyyy'/></td></tr>
											<tr><td>&nbsp;</td><td></td></tr>
											<tr><td>&nbsp;</td><td align="center" >_<u>${user}</u>_<br/>Nama Mekanik dan Stampel Dealer</td></tr>
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
	<%@include file="/common/sirius-footer.jsp" %>

</div>
</body>
</html>
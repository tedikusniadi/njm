<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html><head>
<title>${title}</title>
<%@ include file="/common/sirius-header.jsp" %>
<style type="text/css" media="screen">
	@import url("<c:url value='/assets/sirius.css'/>");
</style>
<style type="text/css" media="print">
	@import url("<c:url value='/css/report-normal.css'/>");
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
					  	<div class="clears">&nbsp;</div>
				  		<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/unitinvoicemaindealerapprovalpreedit.htm?id=${dealer_edit.id}'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
				  		</div>
						<div class="main-box">
							<div class="main_container">
								<h2 align="center">Printout Faktur</h2>
								<table width="100%" border="0" cellpadding="4" cellspacing="0">
                                  <tr>
                                    <td>Kode Dealer</td>
                                    <td>: <c:out value="${dealer.organizationCode}"/></td>
                                    <td>Tanggal Cetak</td>
                                    <td>: <fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td>Nama Dealer</td>
                                    <td>: <c:out value="${dealer.name}"/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="11%">Alamat Dealer</td>
                                    <td>: <c:forEach items="${dealer.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
                                    <td width="13%">&nbsp;</td>
                                    <td width="20%">&nbsp;</td>
                                  </tr>
                                  <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td align="right">
									<c:if test="${listsize >=2}">
										<a href="<c:url value='/page/unitinvoicemaindealerapprovalprint.htm?id=${param.id}&begin=${param.end+1}&end=${param.end+2}'/>"><strong>Next<strong/></a>
									</c:if>
                                  </td>
                                  </tr>
                                  <tr>
                                    <td colspan="4"><strong>KODE PENGAJUAN : 
                                    <c:out value="${dealer_edit.code}"/>
                                    </strong></td>
                                  </tr>
                                  <c:forEach items="${dealerDetails}" var="detail" begin="${param.begin}" end="${param.end}">
	                                  <c:forEach items="${detail.unitSalesOrder.items}" var="item">
	                                  <tr>
	                                    <td colspan="4">
	                                    <table width="100%" border="0" cellpadding="4" cellspacing="0">
	                                      <tr>
	                                        <td width="17%" style="border-top:solid 1px black;border-left:solid 1px black;"><strong>NOMOR MESIN</strong></td>
	                                        <td width="83%" style="border-top:solid 1px black;border-right:solid 1px black;">: 
                                            <c:out value="${item.price.serial}"/></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>NOMOR RANGKA</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:out value="${item.price.serialExt1}"/></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>NAMA STNK</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:out value="${item.unitSalesOrder.customerUnit.name}"/></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>ALAMAT STNK</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>KODE POS</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.postalCode}'/></c:forEach></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>KODYA/KAB</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.city.name}'/></c:forEach></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-left:solid 1px black;"><strong>KECAMATAN</strong></td>
	                                        <td style="border-right:solid 1px black;">: <c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.subdistrict.name}'/></c:forEach></td>
	                                      </tr>
	                                      <tr>
	                                        <td style="border-bottom:solid 1px black;border-left:solid 1px black;"><strong>KELURAHAN</strong></td>
	                                        <td style="border-bottom:solid 1px black;border-right:solid 1px black;">: <c:forEach items="${item.unitSalesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.village}'/></c:forEach></td>
	                                      </tr>
	                                      <tr>
	                                        <td>&nbsp;</td>
	                                        <td>&nbsp;</td>
	                                      </tr>
                                    	</table>
                                    	</td>
                                  	</tr>
                                  	</c:forEach>
                                  </c:forEach>
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
<script type="text/javascript">
</script>
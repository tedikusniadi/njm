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
                                <a class="item-button-back" href="<c:url value='/page/unitsalesorderpreedit.htm?id=${salesOrder_edit.id}'/>"><span>Back</span></a>
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
                                    <td colspan="6"><div align="center" class="CSS3" valign="middle"><strong>SURAT PESANAN KENDARAAN</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><strong><c:out value='${profile.companyName}'/></strong></td>
                                    <td width="70">&nbsp;</td>
                                    <td width="75">&nbsp;</td>
                                    <td width="405">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Nomor</td>
                                    <td>: <c:out value='${salesOrder_edit.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Tanggal</td>
                                    <td>: <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Sales</td>
                                    <td>:
                                      <c:out value='${salesOrder_edit.salesPerson.name}'/></td>
                                  </tr>
                                  
                                  <tr>
                                    <td colspan="6" style="border-bottom:solid 1px black;">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="6">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="95">Nama</td>
                                    <td colspan="2">: <c:out value='${salesOrder_edit.customer.name}'/></td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">/ <c:out value='${salesOrder_edit.customerUnit.name}'/></td>
                                  </tr>
                                  <tr>
                                    <td>Alamat</td>
                                    <td colspan="2" align="left" valign="top">: <c:forEach items="${salesOrder_edit.customer.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
                                    <td>&nbsp;</td>
                                    <td colspan="2" valign="top">/ <c:forEach items="${salesOrder_edit.customerUnit.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
                                  </tr>
                                  
                                  <tr>
                                    <td>Telepon</td>
                                    <td colspan="2">:
                                    	<c:forEach items="${salesOrder_edit.customer.contactMechanisms}" var="con">
                                    	<c:if test="${con.contactMechanismType == 'MOBILE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                    			<c:out value='${con.contact}'/>
                                   			</c:if>
                                   		</c:if>
                                    	</c:forEach>
                                    	/
                                    	<c:forEach items="${salesOrder_edit.customer.contactMechanisms}" var="con">
                                    	<c:if test="${con.contactMechanismType == 'PHONE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                    			<c:out value='${con.contact}'/>
                                   			</c:if>
                                   		</c:if>
                                    	</c:forEach>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">/
                                    	<c:forEach items="${salesOrder_edit.customerUnit.contactMechanisms}" var="con">
                                    	<c:if test="${con.contactMechanismType == 'MOBILE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                    			<c:out value='${con.contact}'/>
                                   			</c:if>
                                   		</c:if>
                                    	</c:forEach>
                                    	/
                                    	<c:forEach items="${salesOrder_edit.customerUnit.contactMechanisms}" var="con">
                                    	<c:if test="${con.contactMechanismType == 'PHONE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                    			<c:out value='${con.contact}'/>
                                   			</c:if>
                                   		</c:if>
                                    	</c:forEach>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>Tipe</td>
                                    <td colspan="2">: <c:forEach items="${salesOrder_edit.items}" var="item"><c:out value='${item.product.types} (${item.product.typeNames})'/></c:forEach></td>
                                    <td>&nbsp;</td>
                                    <td>Warna</td>
                                    <td>: <c:forEach items="${salesOrder_edit.items}" var="item"><c:out value='${item.product.colors}'/></c:forEach></td>
                                  </tr>
                                  <tr>
                                    <td>Harga</td>
                                    <td colspan="2">: <fmt:formatNumber value='${salesAdapter.OTR}' pattern='#,###'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="5">### <c:out value='${salesAdapter.OTRTerbilang}'/> ###</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td width="290">&nbsp;</td>
                                    <td width="107">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Cara Bayar</td>
                                    <td colspan="2">: <c:out value='${salesOrder_edit.unitPayment}'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Discount</td>
                                    <td colspan="2">: <fmt:formatNumber value="${salesAdapter.discDealerCustomer+salesAdapter.programCustomer}" pattern='#,###'/></td>
                                    <td>&nbsp;</td>
                                    <td>Subsidi</td>
                                    <td>: <fmt:formatNumber value="${salesAdapter.subdictionLeasingCustomer+salesAdapter.mainDealerCustomer}" pattern='#,###'/></td>
                                  </tr>
                                  <tr>
                                    <td>Bayar Tunai</td>
                                    <td colspan="2">: <fmt:formatNumber value="${salesAdapter.unitPrepayment}" pattern='#,###'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Kredit Via</td>
                                    <td colspan="2">: <c:out value='${leasing.partyLeasing.name}'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>UM Murni</td>
                                    <td colspan="2">: <fmt:formatNumber value='${(not empty leasing)?salesOrder_edit.prepayment:0}' pattern='#,###'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>UM PO</td>
                                    <td colspan="2">: <fmt:formatNumber value="${salesAdapter.poPrepayment}" pattern='#,###'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Tenor / TOP</td>
                                    <td colspan="2">:
                                    <c:if test="${not empty leasing.tenor}">
                                    	<fmt:formatNumber value='${leasing.tenor}' pattern='#,###'/> bulan @ Rp <fmt:formatNumber value='${leasing.installment}' pattern='#,###'/>
                                    </c:if></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Keterangan</td>
                                    <td colspan="2">: <c:out value='${salesOrder_edit.note}'/></td>
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
                                    <td colspan="6"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td colspan="3"><div align="center">${profile.organization.legend}, <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></div></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3"><div align="center">Pemesan</div></td>
                                        <td colspan="3"><div align="center">Penjualan</div></td>
                                        <td colspan="3"><div align="center">Pimpinan</div></td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
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
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</td>
                                        <td colspan="3" align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</td>
                                        <td colspan="3" align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                </table>
							  <table style="border:none" width="100%" cellspacing="0" cellpadding="5">
								<thead>
								</thead>
								<c:forEach items="${bbn_edit.details}" var="detail" varStatus="status">
								<tbody>
								</tbody>
								</c:forEach>
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
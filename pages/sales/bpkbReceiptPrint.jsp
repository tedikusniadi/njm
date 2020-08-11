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
								<a class="item-button-back" href="<c:url value='/page/bpkbreceiptpreedit.htm?id=${bpkbReceipt.id}'/>"><span>Back</span></a>
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
                                    <td colspan="8"><div align="center" class="CSS3" valign="middle"><strong>BUKTI PENYERAHAN BPKB</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><strong><c:out value='${profile.companyName}'/></strong></td>
                                    <td width="254">&nbsp;</td>
                                    <td width="106">Nomor</td>
                                    <td width="337">: 
                                    <c:out value='${bpkbReceipt.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Tanggal</td>
                                    <td>: <fmt:formatDate value='${bpkbReceipt.dateFrom}' pattern='dd-MM-yyyy'/> s/d <fmt:formatDate value='${bpkbReceipt.dateTo}' pattern='dd-MM-yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Kepada</td>
                                    <td>: <c:out value='${bpkbReceipt.leasing.name}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="133">&nbsp;</td>
                                    <td width="232">&nbsp;</td>
                                    <td width="226">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="6" style="border-top:solid 1px black;">&nbsp;</td>
                                  </tr>
                                  

                                  <tr>
                                    <td colspan="6"><table cellspacing="0" cellpadding="2" width="100%">
                                      <thead>
                                        <tr>
                                          <th width="15%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">NO SPK</th>
                                          <th width="20%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">NAMA PEMESAN</th>
                                          <th width="16%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">ALAMAT</th>
                                          <th width="13%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">NO MESIN</th>
                                          <th width="14%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">NO RANGKA</th>
                                          <th width="11%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">NO POLISI</th>
                                          <th width="11%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">NO BPKB</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                      <c:set var="total" value="0"/>
                                        <c:forEach items="${adapters}" var="receipt">
                                      	<c:set var="total" value="${total+1}"/>
                                            <tr>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;"><c:out value='${receipt.unitSalesOrder.code}'/></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${receipt.unitSalesOrder.customer.name}'/></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:forEach items="${receipt.unitSalesOrder.customer.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${receipt.serial}'/></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${receipt.serialExt1}'/></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${receipt.policeNo}'/></td>
                                              <td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${receipt.bpkbNo}'/></td>
                                            </tr>
                                        </c:forEach>
                                      </tbody>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td colspan="6">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>Pengambil</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>Jumlah</td>
                                    <td>: ${total}</td>
                                  </tr>
                                  <tr>
                                    <td>Nama</td>
                                    <td colspan="2">:
                                    <input type="text" name="textfield" id="textfield" size="35" style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/></td>
                                    <td>&nbsp;</td>
                                    <td>NIP</td>
                                    <td>:
                                    <input type="text" name="textfield5" id="textfield5" size="35" style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/></td>
                                  </tr>
                                  <tr>
                                    <td>Alamat</td>
                                    <td colspan="2">:
                                    <input type="text" name="textfield2" id="textfield2" size="35" style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/></td>
                                    <td>&nbsp;</td>
                                    <td>Jabatan</td>
                                    <td>:
                                    <input type="text" name="textfield6" id="textfield6" size="35" style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/></td>
                                  </tr>
                                  <tr>
                                    <td>Keterangan</td>
                                    <td colspan="2">:
                                    <input type="text" name="textfield3" id="textfield3" size="35" style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                  	<td colspan="5">&nbsp;</td>
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
                                    <td colspan="2"><div align="center">Penerima</div></td>
                                    <td>&nbsp;</td>
                                    <td><div align="center">Mengetahui 1</div></td>
                                    <td colspan="2"><div align="center">Mengetahui 2</div></td>
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
                                    <td colspan="2"><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;)</div></td>
                                    <td>&nbsp;</td>
                                    <td>
                                    	<div align="center"><strong>${bpkbReceipt.organization.headOffice.name}</strong></div>
                                    	<div align="center">Kepala Cabang</div>
                                    </td>
                                    <td colspan="2">
                                    	<div align="center"><strong>${bpkbReceipt.organization.adminHead.name}</strong></div>
                                    	<div align="center">Admin Head</div>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                </table>
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
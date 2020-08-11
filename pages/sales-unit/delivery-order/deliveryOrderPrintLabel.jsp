<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<style type="text/css">
<!--
.style1 {font-size: 8px}
.style2 {font-size: 8px}
.style3 {font-size: 10px}
.style4 {font-size: 12px}
.style5 {font-size: 9px}
-->
</style>
<head>
	<title>${title}</title>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/css/print-normal.css'/>");
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
                                <a class="item-button-back" href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${deliveryOrder.id}'/>"><span>Back</span></a>
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
                                    <td colspan="8"><div align="center" class="CSS3" valign="middle"><strong>LABEL</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="8"><table width="661" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed">
                                      <tr>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" valign="top" class="style1" style="border-left:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" valign="top" class="style1" style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" valign="top" class="style1" style="border-left:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" valign="top" class="style1" style="border-left:solid 1px black;border-right:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td width="170" height="132" valign="top" class="style1" style="border-left:solid 1px black;border-top:solid 1px black;border-bottom:solid 1px black;"><table width="168" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td>${customer.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.address}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.village}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.subdistrict.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${address.city.name}</td>
                                          </tr>
                                          <tr>
                                            <td>${product.types}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serial}</td>
                                          </tr>
                                          <tr>
                                            <td>${itemDetail.serialExt1}</td>
                                          </tr>
                                          <tr>
                                            <td><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></td>
                                          </tr>
                                          <tr>
                                            <td>${bukuService}</td>
                                          </tr>
                                        </table>
                                        </td>
                                        <td colspan="3" rowspan="2" valign="top" style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;border-bottom:solid 1px black;"><table width="100%" border="0">
                                          <tr>
                                            <td width="28%"><span class="style4">Nama</span></td>
                                            <td width="72%"><span class="style4">${customer.name}</span></td>
                                          </tr>
                                          <tr>
                                            <td valign="top"><span class="style4">Alamat</span></td>
                                            <td valign="top"><span class="style4">${address.address} ${address.village} ${address.subdistrict.name} ${address.city.name}</span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">Tipe</span></td>
                                            <td><span class="style4">${product.types}</span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">No. Rangka</span></td>
                                            <td><span class="style4">${itemDetail.serial} Warna : ${product.colors}</span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">No. Mesin</span></td>
                                            <td><span class="style4">${itemDetail.serialExt1}</span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">Tgl. Pembelian</span></td>
                                            <td><span class="style4"><fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MMM-yyyy'/></span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">Nama Toko Penjual</span></td>
                                            <td><span class="style4">${profile.companyName}</span></td>
                                          </tr>
                                          <tr>
                                            <td><span class="style4">Alamat</span></td>
    <td><span class="style4">
                                            	<c:forEach items="${profile.organization.postalAddresses}" var="add">
			                                      <c:out value='${add.address}'/>
			                                    </c:forEach>
			                                    </span>			                                </td>
                                          </tr>
                                          <tr>
                                            <td>&nbsp;</td>
    <td><span class="style4">
                                            	<c:forEach items="${profile.organization.contactMechanisms}" var="con">
		                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
		                                            <c:out value='${con.contact} '/>
		                                          </c:if>
		                                        </c:forEach>
		                                        -
		                                        <c:forEach items="${profile.organization.contactMechanisms}" var="con">
			                                      <c:if test="${con.contactMechanismType == 'FAX'}">
			                                      	<c:out value='${con.contact} '/>
												  </c:if>
			                                      </c:forEach>
		                                        </span>		                                    </td>
                                          </tr>
                                        </table>                                        </td>
                                      </tr>
                                      <tr>
                                      	<td valign="top" height="95">&nbsp;</p>                                        </td>
                                   	  </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                    <td colspan="8">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="8"><table width="454" border="0" cellspacing="0" cellpadding="1">
                                      <tr>
                                        <td colspan="3" style="border-left:solid 1px black;border-top:solid 1px black;"><span class="style5">${profile.companyName}</span></td>
                                        <td colspan="2" style="border-right:solid 1px black;border-top:solid 1px black;"><span class="style5">${profile.workshopName}</span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" style="border-left:solid 1px black;"><span class=" style5">Dealer Resmi Sepeda Motor HONDA</span></td>
                                        <td colspan="2" style="border-right:solid 1px black;"><span class="style5">Bengkel Resmi Sepeda Motor HONDA</span></td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" style="border-left:solid 1px black;">
                                        	<span class="style5">
                                           	<c:forEach items="${profile.organization.postalAddresses}" var="add">
		                                      <c:out value='${add.address}'/>
		                                    </c:forEach>
		                                    </span>
			                            </td>
                                        <td colspan="2" style="border-right:solid 1px black;">
                                        	<span class="style5">
                                           	<c:forEach items="${profile.organization.postalAddresses}" var="add">
		                                      <c:out value='${add.address}'/>
		                                    </c:forEach>
		                                    </span>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td colspan="3" style="border-left:solid 1px black;">
                                        	<span class="style5">
                                       		<c:forEach items="${profile.organization.contactMechanisms}" var="con">
	                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
	                                            <c:out value='${con.contact} '/>
	                                          </c:if>
	                                        </c:forEach>
	                                        -
	                                        <c:forEach items="${profile.organization.contactMechanisms}" var="con">
		                                      <c:if test="${con.contactMechanismType == 'FAX'}">
		                                      	<c:out value='${con.contact} '/>
											  </c:if>
		                                    </c:forEach>
                                        	</span>
                                        </td>
                                        <td colspan="2" style="border-right:solid 1px black;">
                                        	<span class="style5">
                                       		<c:forEach items="${profile.organization.contactMechanisms}" var="con">
	                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
	                                            <c:out value='${con.contact} '/>
	                                          </c:if>
	                                        </c:forEach>
	                                        -
	                                        <c:forEach items="${profile.organization.contactMechanisms}" var="con">
		                                      <c:if test="${con.contactMechanismType == 'FAX'}">
		                                      	<c:out value='${con.contact} '/>
											  </c:if>
		                                    </c:forEach>
                                        	</span>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td height="25" colspan="5" style="border-left:solid 1px black;border-right:solid 1px black;"><div align="center"><span class="style3">PERCAYAKAN PERAWATAN SEPEDA MOTOR ANDA PADA KAMI</span></div></td>
                                      </tr>
                                      <tr>
                                        <td width="45" align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style5">Service</span></div></td>
                                        <td width="82" align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style5">Warna Kartu</span></div></td>
                                        <td width="67" align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style5">Tanggal</span></div></td>
                                        <td width="42" align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style5">KM</span></div></td>
                                        <td width="193" align="center" style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style5">Keterangan</span></div></td>
                                      </tr>
                                      <c:forEach items="${services}" var="service" varStatus="status">
	                                      <tr>
	                                        <td align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><span class="style5">${status.count}</span></td>
	                                        <td align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><span class="style5">${service.warna}</span></td>
	                                        <td align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><span class="style5"><fmt:formatDate value='${service.tanggal}' pattern='dd/MM/yyyy'/></span></td>
	                                        <td align="center" style="border-left:solid 1px black;border-top:solid 1px black;"><span class="style5">${service.km}</span></td>
	                                        <td style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;"><span class="style2">${service.keterangan}</span></td>
	                                      </tr>
	                                  </c:forEach>
                                      <tr>
                                        <td colspan="5" style="border-left:solid 1px black;border-right:solid 1px black;border-top:solid 1px black;"><div align="center"><span class="style3">NB: BATAS WAKTU SERVICE MAKSIMAL BERDASARKAN TANGGAL DAN KM</span></div></td>
                                      </tr>
                                      <tr>
                                        <td colspan="5" style="border:solid 1px black;"><div align="center"><span class="style3">TERGANTUNG MANA YANG TERLEBIH DAHULU DICAPAI</span></div></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                  <tr>
                                  	<td height="0" colspan="8">&nbsp;</td>
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
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
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
    @import url("<c:url value='/assets/unitDeliveryOrder.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/assets/unitDeliveryOrder.css'/>");
	</style>
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>
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
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${deliveryOrder.id}'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            </div>
                        </div>
						<div class="main-box">
							<div class="main_container">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td colspan="8"><div align="center" class="CSS3" valign="middle"><strong>SURAT JALAN</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><strong>
                                      <c:out value='${profile.companyName}'/>
                                    </strong></td>
                                    <td width="210">&nbsp;Nomor</td>
                                    <td width="400">: <c:out value='${deliveryOrder.code}'/></td>
                                    <td width="31" colspan="3">
                                      </td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>&nbsp;Tanggal</td>
                                    <td>: <fmt:formatDate value='${deliveryOrder.date}' pattern='dd MMMM yyyy'/></td>
                                    <td colspan="3">
                                      </td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                    <td>&nbsp;No SPK</td>
                                    <td>: <c:out value='${salesOrder.code}'/></td>
                                    <td colspan="3">
                                      </td>
                                  </tr>
                                  <tr>
                                    <td colspan="3" class="border-bottom">Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                    <td class="border-bottom">&nbsp;Sales</td>
                                    <td class="border-bottom">: <c:out value='${salesOrder.salesPerson.name}'/></td>
                                    <td colspan="3" class="border-bottom">
                                      </td>
                                  </tr>
                                  <tr>
                                    <td colspan="8">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="8">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="12%">Nama</td>
    <td width="36%">: <c:out value='${salesOrder.customer.name}'/></td>
    <td colspan="5">/ <c:out value='${salesOrder.customerUnit.name}'/></td>
    </tr>
  <tr>
    <td>Alamat</td>
    <td>: <c:forEach items="${salesOrder.customer.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
    <td colspan="5">/ <c:forEach items="${salesOrder.customerUnit.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;<c:forEach items="${salesOrder.customer.postalAddresses}" var="add">
                                        <c:out value='${add.village} ${add.subdistrict.name}'/>
                                      </c:forEach></td>
    <td colspan="5">&nbsp;<c:forEach items="${salesOrder.customerUnit.postalAddresses}" var="add">
                                        <c:out value='${add.village} ${add.subdistrict.name}'/>
                                      </c:forEach></td>
  </tr>
  <tr>
    <td>Telepon</td>
    <td>: <c:forEach items="${salesOrder.customer.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'MOBILE' and con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                          </c:if>
                                      </c:forEach>
                                      /
                                      <c:forEach items="${salesOrder.customer.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE' and con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                          </c:if>
                                      </c:forEach></td>
    <td colspan="5">/ <c:forEach items="${salesOrder.customerUnit.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'MOBILE' and con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                          </c:if>
                                      </c:forEach>
                                      /
                                      <c:forEach items="${salesOrder.customerUnit.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE' and con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                          </c:if>
                                      </c:forEach></td>
    </tr>
  <tr>
    <td colspan="2"><strong>1 (UNIT) SEPEDA MOTOR MERK HONDA</strong></td>
    <td width="10%">Jam Penyerahan</td>
    <td width="17%">: <fmt:formatDate value='${now}' pattern='hh:mm'/></td>
    <td width="25%">&nbsp;</td>
  </tr>
  <tr>
    <td>Tipe</td>
    <td>: <c:forEach items="${salesOrder.items}" var="item">
                                        <c:out value='${item.product.types} (${item.product.name})'/>
                                      </c:forEach></td>
    <td>Perlengkapan</td>
    <td>: <input type="checkbox" name="checkbox2" id="checkbox2" checked="checked"/> Kunci Kontak</td>
    <td><input type="checkbox" name="checkbox" id="checkbox" /> Buku Pedoman Pemilik</td>
  </tr>
  <tr>
    <td>Warna</td>
    <td>: <c:forEach items="${salesOrder.items}" var="item">
                                        <c:out value='${item.product.colors}'/>
                                      </c:forEach></td>
    <td>&nbsp;</td>
    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox4" id="checkbox4" ${checkSpion}/> Spion</td>
    <td><input type="checkbox" name="checkbox5" id="checkbox5" ${checkKey}/> Tool Kit</td>
  </tr>
  <tr>
    <td>Tahun</td>
    <td>: <c:forEach items="${deliveryOrder.items}" var="line" varStatus='status'>
	                                        <c:forEach items="${line.details}" var="detail">
	                                        <c:if test="${line.sequenced}">
                                              <c:out value='${detail.year}'/>
                                            </c:if>
                                          </c:forEach>
                                        </c:forEach></td>
    <td>&nbsp;</td>
    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox" id="checkbox" ${checkHelm}/> Helm</td>
    <td><input type="checkbox" name="checkbox" id="checkboxother1" /> 
      <input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;"/></td>
  </tr>
  <tr>
    <td>No. Mesin</td>
    <td>: <c:forEach items="${deliveryOrder.items}" var="line" varStatus='status'>
	                                        <c:forEach items="${line.details}" var="detail">
	                                        <c:if test="${line.sequenced}">
                                              <c:out value='${detail.serial}'/>
                                            </c:if>
                                          </c:forEach>
                                        </c:forEach></td>
    <td>&nbsp;</td>
    <!-- <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox" id="checkbox" ${checkJacket}/> Jaket</td> -->
    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox3" id="checkbox3" ${checkBook}/> Buku Service</td>
    <td><input type="checkbox" name="checkbox" id="checkboxother1" /> 
      <input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;" /></td>
  </tr>

  <tr>
    <td>No. Rangka</td>
    <td>: <c:forEach items="${deliveryOrder.items}" var="line" varStatus='status'>
	                                        <c:forEach items="${line.details}" var="detail">
	                                        <c:if test="${line.sequenced}">
                                            	<c:out value='${detail.serialExt1}'/>
                                            </c:if>
                                          </c:forEach>
                                        </c:forEach></td>
    <td>&nbsp;</td>
    <td><!-- &nbsp;&nbsp;<input type="checkbox" name="checkbox3" id="checkbox3" ${checkBook}/> Buku Service --></td>
    <td><!-- <input type="checkbox" name="checkbox" id="checkboxother1" /> 
      <input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" /> --></td>
  </tr>
  <tr>
    <td>No. Buku Service</td>
    <td>: <c:out value='${serviceBook}'/></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom"><strong>Keterangan</strong></td>
    <td valign="bottom">: 
    <c:if test="${salesOrder.unitPayment=='CREDIT'}">
    	<c:forEach items="${salesOrder.leasingApps}" var="leasing">
    	
			<strong>K.V.<c:out value="${leasing.partyLeasing.name}"/></strong>
			<c:set var="leasingnote" value="${leasing.note}"/>
		</c:forEach>
    	
    </c:if>
    </td>
    <td colspan="3"><table width="70%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" class="border-left border-top border-right">Catatan :</td>
        </tr>
      <tr>
        <td width="10%" class="border-left">1.</td>
        <td width="89%" class="border-right">Harap diperiksa dan dicocokan No. Mesin dan No. Rangka unit yang diterima dengan SURAT JALAN</td>
      </tr>
      <tr>
        <td class="border-left">2.</td>
        <td class="border-right">Barang di atas telah diterima &amp; diperiksa dengan baik</td>
      </tr>
      
      <tr>
      <c:if test="${not empty leasingNote}">
        <td class="border-left">3.</td>
        <td class="border-right border-bottom">&nbsp;<c:out value="${leasingNote}"/></td>
      </c:if>
      <c:if test="${empty leasingNote}">
        <td width="0%" class="border-left border-bottom"></td>
        <td width="1%" class="border-right border-bottom">&nbsp;</td>
      </c:if>
      </tr>
      
    </table></td>
  </tr>
	  <tr>
    <td colspan="5"><strong>Konsumen tidak di kenakan biaya penambahan BBN untuk pengurusan STNK dan BPKB</strong></td>
  </tr>
</table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td colspan="8"><table width="100%" border="0" cellpadding="0">
                                        <tr>
                                          <td width="18%">&nbsp;</td>
                                          <td width="14%">&nbsp;</td>
                                          <td width="15%">&nbsp;</td>
                                          <td width="15%">&nbsp;</td>
                                          <td width="14%">&nbsp;</td>
                                          <td colspan="2"><div align="center">${profile.organization.legend},
                                            <fmt:formatDate value='${deliveryOrder.date}' pattern='dd MMMM yyyy'/>
                                          </div></td>
                                          <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td><div align="center">Pembeli / Penerima</div></td>
                                          <td><div align="center">Pengirim</div></td>
                                          <td><div align="center">Supervisor</div></td>
                                          <td><div align="center">Kasir</div></td>
                                          <td><div align="center">Admin</div></td>
                                          <td colspan="2"><div align="center">Hormat kami</div></td>
                                          <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                          <td>&nbsp;</td>
                                          <td>&nbsp;</td>
                                          <td>&nbsp;</td>
                                          <td>&nbsp;</td>
                                          <td>&nbsp;</td>
                                          <td width="13%">&nbsp;</td>
                                          <td width="9%">&nbsp;</td>
                                          <td width="2%">&nbsp;</td>
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
                                        </tr>
                                        <tr>
                                          <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                          <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                          <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                          <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                          <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                          <td colspan="2"><div align="center">(${deliveryOrder.createdBy.name})</div></td>
                                          <td>&nbsp;</td>
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
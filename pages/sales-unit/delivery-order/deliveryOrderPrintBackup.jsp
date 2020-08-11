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
                                    <td colspan="8"><div align="center" class="CSS3" valign="middle"><strong>SURAT JALAN</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><strong>
                                      <c:out value='${profile.companyName}'/>
                                    </strong></td>
                                    <td width="173">&nbsp;</td>
                                    <td width="187">Nomor</td>
                                    <td colspan="3">:
                                      <c:out value='${deliveryOrder.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:forEach items="${profile.organization.postalAddresses}" var="add">
                                      <c:out value='${add.address}'/>
                                    </c:forEach></td>
                                    <td>&nbsp;</td>
                                    <td>Tanggal</td>
                                    <td colspan="3">:
                                      <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp.
                                      <c:forEach items="${profile.organization.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
                                            <c:out value='${con.contact} '/>
                                          </c:if>
                                        </c:forEach>                                    </td>
                                    <td>&nbsp;</td>
                                    <td>No SPK</td>
                                    <td colspan="3">:
                                      <c:out value='${salesOrder.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3" style="border-bottom:solid 1px black;">Fax.
                                      <c:forEach items="${profile.organization.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'FAX'}">
                                            <c:out value='${con.contact} '/>
                                          </c:if>
                                        </c:forEach>                                    </td>
                                    <td style="border-bottom:solid 1px black;">&nbsp;</td>
                                    <td style="border-bottom:solid 1px black;">Sales</td>
                                    <td colspan="3" style="border-bottom:solid 1px black;">:
                                      <c:out value='${salesOrder.salesPerson.name}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="8">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td width="112">Nama</td>
                                    <td colspan="2">:
                                      <c:out value='${salesOrder.customer.name}'/></td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">/
                                      <c:out value='${salesOrder.customerUnit.name}'/></td>
                                  </tr>
                                  <tr>
                                    <td>Alamat</td>
                                    <td colspan="3" align="left" valign="top">:
                                      <c:forEach items="${salesOrder.customer.postalAddresses}" var="add">
                                        <c:out value='${add.address}'/>
                                      </c:forEach></td>
                                    <td colspan="4" valign="top">/
                                      <c:forEach items="${salesOrder.customerUnit.postalAddresses}" var="add">
                                        <c:out value='${add.address}'/>
                                      </c:forEach></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;
                                      <c:forEach items="${salesOrder.customer.postalAddresses}" var="add">
                                        <c:out value='${add.subdistrict.name} ${add.village}'/>
                                      </c:forEach></td>
                                    <td colspan="4">&nbsp;
                                      <c:forEach items="${salesOrder.customerUnit.postalAddresses}" var="add">
                                        <c:out value='${add.subdistrict.name} ${add.village}'/>
                                      </c:forEach></td>
                                  </tr>
                                  <tr>
                                    <td>Telepon</td>
                                    <td colspan="2">:
                                      <c:forEach items="${salesOrder.customer.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'MOBILE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                            </c:if>
                                          </c:if>
                                      </c:forEach>
                                      /
                                      <c:forEach items="${salesOrder.customer.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                            </c:if>
                                          </c:if>
                                      </c:forEach>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">/
                                      <c:forEach items="${salesOrder.customerUnit.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'MOBILE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                            </c:if>
                                          </c:if>
                                      </c:forEach>
                                      /
                                      <c:forEach items="${salesOrder.customerUnit.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
                                    		<c:if test="${con.contact != '01234'}">
                                            	<c:out value='${con.contact}'/>
                                            </c:if>
                                          </c:if>
                                      </c:forEach>
                                   </td>
                                  </tr>
                                  <tr>
                                    <td colspan="4"><strong>1 (UNIT) SEPEDA MOTOR MERK HONDA</strong></td>
                                    <td width="400" rowspan="6">
                                    <table>
                                    <tr><td style="width: auto;">Jam Penyerahan</td>
                                    <td>&nbsp;:&nbsp;<fmt:formatDate value='${now}' pattern='hh:mm'/>
                                    </td>                  	
                                    </tr>
                                    <tr>
                                    <td>Perlengkapan</td> 
                                    &nbsp;<td style="width: 80;"> :<label>&nbsp;<input type="checkbox" name="checkbox2" id="checkbox2" checked="checked"/>
                                        Kunci Kontak</label></td>
                                        <td><label>
                                      <input type="checkbox" name="checkbox" id="checkbox" />
                                      Buku Pedoman Pemilik</label></td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                    
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox4" id="checkbox4" ${checkSpion}/>
                                      Spion</label></td>
                                      <td><input type="checkbox" name="checkbox5" id="checkbox5" ${checkKey}/>
                                      Toolkit </td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox" id="checkbox" ${checkHelm}/>
                                      Helm</label></td>
                                      <td>
                                      <label>
                                      <input type="checkbox" name="checkbox" id="checkboxother1" />
                                      </label>
                                        <label>
                                        <input name="other1" size="17" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" />
                                        </label> 
                                      </td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                    <td>
                                    	<label>&nbsp;
                                        <input type="checkbox" name="checkbox" id="checkbox" ${checkJacket}/>
                                      Jaket</label>
                                    </td>
                                    <td>
                                    <label>
                                      <input type="checkbox" name="checkbox" id="checkboxother2" />
                                      </label>
                                    	<label>
                                        <input type="text" name="other2" size="17" id="other2" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/>
                                        </label> 
                                    </td>
                                    </tr>
                                    <tr>
                                    <td></td>
                                    <td>
                                    <label>&nbsp;
                                        <input type="checkbox" name="checkbox3" id="checkbox3" ${checkBook}/>
                                      Buku Service</label>
                                    </td>
                                    </tr>
                                    </table>
                                    
                                    </td>
                                    <%-- <td width="147">Jam Penyerahan</td>
                                    <td width="155">:<fmt:formatDate value='${now}' pattern='hh:mm'/></td> --%>
                                  </tr>
                                  <tr>
                                  
                                  </tr>
                                  
                                  <tr>
                                    <td style="height: 1px">Tipe</td>
                                    <td colspan="7">:
                                      <c:forEach items="${salesOrder.items}" var="item">
                                        <c:out value='${item.product.types} (${item.product.name})'/>
                                      </c:forEach></td>
                                  </tr>
                                  <tr>
                                  <td style="height: 1px">Warna</td>
                                    <td colspan="3">:
                                      <c:forEach items="${salesOrder.items}" var="item">
                                        <c:out value='${item.product.colors}'/>
                                      </c:forEach></td>
                                  
                                  </tr>
                                  <tr>
                                    <td style="height: 1px">Tahun</td>
                                    <td colspan="2">:
                                      <c:forEach items="${deliveryOrder.items}" var="item">
                                          <c:forEach items="${item.details}" var="detail">
                                            <c:if test="${not empty detail.serial && not empty detail.serialExt1}">
                                              <c:out value='${detail.year}'/>
                                            </c:if>
                                          </c:forEach>
                                        </c:forEach>                                    </td>
                                    <td>&nbsp;</td>
                                    
                                  </tr>
                                  <tr>
                                    <td style="height: 1px">No. Mesin</td>
                                    <td colspan="3">:
                                      <c:forEach items="${deliveryOrder.items}" var="item">
                                          <c:forEach items="${item.details}" var="detail">
                                            <c:if test="${not empty detail.serial && not empty detail.serialExt1}">
                                              <c:out value='${detail.serial}'/>
                                            </c:if>
                                          </c:forEach>
                                        </c:forEach>                                    </td>
                                    <td>&nbsp;</td>

                                  </tr>
                                  <tr>
                                  <td style="height: 1px">No. Rangka</td>
                                    <td colspan="3">:
                                      <c:forEach items="${deliveryOrder.items}" var="item">
                                          <c:forEach items="${item.details}" var="detail">
                                            <c:out value='${detail.serialExt1}'/>
                                          </c:forEach>
                                        </c:forEach>
                                        </td>
                                  
                                  </tr>
                                    <td style="height: 1px">No Buku Service</td>
                                    <td colspan="3">:
                                     <c:out value='${serviceBook}'/></td>
                                  </tr>

                                  <tr>
                                    <td>Perlengkapan</td>
                                        <td width="190">:
                                <label>
                                        <input type="checkbox" name="checkbox2" id="checkbox2" checked="checked"/>
                                        Kunci Kontak</label></td>
                              <td colspan="2"><label>
                                      <input type="checkbox" name="checkbox" id="checkbox" />
                                      Buku Pedoman Pemilik</label>                                    </td>
                                    <td colspan="3" rowspan="6"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td colspan="2" style="border-top:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">Catatan :</td>
                                        </tr>
                                        <tr>
                                          <td width="18" style="border-left:solid 1px black;">1.</td>
                                          <td width="465" style="border-right:solid 1px black;">Harap diperiksa dan dicocokan No. Mesin dan</td>
                                        </tr>
                                        <tr>
                                          <td style="border-left:solid 1px black;">&nbsp;</td>
                                          <td style="border-right:solid 1px black;">No. Rangka unit yang diterima dengan SURAT JALAN</td>
                                        </tr>
                                        
                                        <tr>
                                          <td style="border-left:solid 1px black;">2.</td>
                                          <td style="border-right:solid 1px black;">Barang di atas telah diterima &amp; diperiksa dengan baik</td>
                                        </tr>
                                        
                                        <c:if test="${not empty note}">
                                          <tr>
                                            <td style="border-left:solid 1px black;">3.</td>
                                            <td style="border-right:solid 1px black;">${note}</td>
                                          </tr>
                                        </c:if>
                                        <tr>
                                          <td colspan="2" style="border-left:solid 1px black;border-right:solid 1px black;border-bottom:solid 1px black;">&nbsp;</td>
                                        </tr>
                                    </table></td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox4" id="checkbox4" ${checkSpion}/>
                                      Spion</label></td>
                                    <td colspan="2"><input type="checkbox" name="checkbox5" id="checkbox5" ${checkKey}/>
                                      Toolkit </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox" id="checkbox" ${checkHelm}/>
                                      Helm</label>                                    </td>
                                    <td colspan="2"><label>
                                      <input type="checkbox" name="checkbox" id="checkboxother1" />
                                      </label>
                                        <label>
                                        <input name="other1" size="25" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" />
                                        </label>                                    </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox" id="checkbox" ${checkJacket}/>
                                      Jaket</label></td>
                                    <td colspan="2"><label>
                                      <input type="checkbox" name="checkbox" id="checkboxother2" />
                                      </label>
                                        <label>
                                        <input type="text" name="other2" size="25" id="other2" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;"/>
                                        </label>                                    </td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td><label>&nbsp;
                                        <input type="checkbox" name="checkbox3" id="checkbox3" ${checkBook}/>
                                      Buku Service</label></td>
                                    <td colspan="2"><label></label></td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td><label>&nbsp;&nbsp;</label>                                      <label></label></td>
                                    <td>&nbsp;</td>
                                    <td colspan="2">&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                  <td>Tambahan:</td>
                                        <td width="190">:
                                <label>
                                	<c:set var="subdic" value=""/>
                                	<c:forEach items="${salesOrder.subdictions}" var="sub">
                                		<c:if test='${sub.subdiction.type=="EXTRA"}'>
                                			<c:set var="subdic" value="${subdic}${sub.name}"/>
                                				<c:out value="${subdic}"/>,
                                		</c:if>
                                	
                                	</c:forEach>
                                
                                </label>
                                
                                </td>
                                  <tr/>
                                  <tr>
                                    <td>Keterangan</td>
                                    <td colspan="7">: Konsumen tidak dikenakan biaya penambahan BBN untuk pengurusan STNK dan BPKB</td>
                                  </tr>
                                  
                                  
                                  <tr>
                                    <td colspan="8"><table width="100%" border="0" cellpadding="0">
                                        <tr>
                                          <td width="18%">&nbsp;</td>
                                          <td width="14%">&nbsp;</td>
                                          <td width="15%">&nbsp;</td>
                                          <td width="15%">&nbsp;</td>
                                          <td width="14%">&nbsp;</td>
                                          <td colspan="2"><div align="center">Bandung,
                                            <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/>
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
                                          <td colspan="2"><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
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
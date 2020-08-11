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
                                <a class="item-button-back" href="<c:url value='page/goodsissueprintoutoption.htm?id=${goodsIssue_edit.id}'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            </div>
                        </div>
						<div class="main-box">
						  <div class="main_container">
                       		<c:forEach items="${objs}" var="detail">
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="in">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								</tr>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="10"><div align="center" class="CSS3" valign="middle"><strong>SURAT JALAN</strong></div></td>
                                </tr>
                                <tr>
                                  <td width="153">&nbsp;</td>
                                  <td colspan="2">&nbsp;</td>
                                  <td width="858" colspan="5">&nbsp;</td>
                                  </tr>
                                <tr>
                                  <td colspan="8">
                                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
									  <tr style="height: 20px;">
									    <td width="13%">Nama</td>
									    <td width="33%">:</td>
									    <td width="13%">&nbsp;</td>
									    <td width="14%">&nbsp;</td>
									    <td width="27%">&nbsp;</td>
									  </tr>
									  <tr style="height: 20px;">
									    <td>Alamat</td>
									    <td>:</td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr >
									  <tr style="height: 20px;">
									    <td>Telepon</td>
									    <td>: </td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr style="height: 20px;">
									    <td colspan="2"><strong>1 (UNIT) SEPEDA MOTOR MERK HONDA</strong></td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr>
									    <td>Tipe</td>
									    <td>: <c:out value='${detail.real.goodsIssueItem.product.types}'/></td>
									    <td>Jam Penyerahan</td>
									    <td>: <fmt:formatDate value='${now}' pattern='hh:mm'/></td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr>
									    <td>&nbsp;</td>
									    <td>: (<c:out value='${detail.real.goodsIssueItem.product.name}'/>)</td>
									    <td>Perlengkapan</td>
									    <td>: <input type="checkbox" name="checkbox" id="checkbox" />Kunci Kontak</td>
									    <td><input type="checkbox" name="checkbox" id="checkbox" />Buku Pedoman Pemilik</td>
									  </tr>
									  <tr>
									    <td>Warna</td>
									    <td>: <c:out value='${detail.real.goodsIssueItem.product.colors}'/></td>
									    <td>&nbsp;</td>
									    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox" id="checkbox" ${checkSpion}/>Spion</td>
									    <td><input type="checkbox" name="checkbox" id="checkbox" ${checkToolKit}/>Tool Kit</td>
									  </tr>
									  <tr>
									    <td>Tahun</td>
									    <td>: <c:if test="${not empty detail.real.serial && not empty detail.real.serialExt1}">
									                                		<c:out value='${detail.real.year}'/>
									                                	</c:if></td>
									    <td>&nbsp;</td>
									    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox2" id="checkbox2" checked="checked"/>Helm</td>
									    <td><input type="checkbox" name="checkbox" id="checkbox" /><input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" /></td>
									  </tr>
									  <tr>
									    <td>No. Mesin</td>
									    <td>: <c:if test="${not empty detail.real.serial && not empty detail.real.serialExt1}">
									                                  		<c:out value='${detail.real.serial}'/>
									                                 	</c:if></td>
									    <td>&nbsp;</td>
									    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox" id="checkbox" ${checkJacket}/>Jaket</td>
									    <td><input type="checkbox" name="checkbox" id="checkbox" /><input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" /></td>
									  </tr>
									
									  <tr>
									    <td>No. Rangka</td>
									    <td>: <c:out value='${detail.real.serialExt1}'/></td>
									    <td>&nbsp;</td>
									    <td>&nbsp;&nbsp;<input type="checkbox" name="checkbox" id="checkbox" ${detail.checkBukuService}/>Buku Service</td>
									    <td><input type="checkbox" name="checkbox" id="checkbox" /><input name="other1" size="20" type="text" id="other1" value=".........." style="border:none;font-family:Verdana, Arial, Helvetica, sans-serif;font-size:10px;letter-spacing : 2.95px;" /></td>
									  </tr>
									  <tr>
									    <td>No. Buku Service</td>
									    <td>:
									    	<c:out value='${detail.acc.serial}'/>
									    </td>
									    <td>&nbsp;</td>
									    <td>&nbsp;&nbsp;</td>
									    <td>&nbsp;</td>
									  </tr>
									  <tr style="height: 30px;">
									    <td>Catatan</td>
									    <td colspan="4">: HARAP DIPERIKSA &amp; DICOCOKKAN NO.MESIN DAN NO. RANGKA UNIT YANG DITERIMA DENGAN SURAT JALAN INI</td>
									    </tr>
									  <tr>
									    <td>Via</td>
									    <td colspan="4">: ${detail.real.goodsIssueItem.goodsIssue.warehouseTransaction.issuedFacility.name} ${detail.real.goodsIssueItem.goodsIssue.note}(${detail.real.goodsIssueItem.goodsIssue.warehouseTransaction.code} - 
									      <fmt:formatDate value='${detail.real.goodsIssueItem.goodsIssue.date}' pattern='dd-MM-yyyy'/>
									      )</td>
									    </tr>
									</table>
                                  
                                  </td>
                                  </tr>
                                <tr>
                                  <td colspan="8"><table width="100%" border="0" cellpadding="0">
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td width="18%">&nbsp;</td>
                                      <td width="15%">&nbsp;</td>
                                      <td width="14%"><div align="center">Bandung,
                                        <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/>
                                      </div></td>
                                    </tr>
                                    <tr>
                                      <td><div align="center">Pembeli / Penerima</div></td>
                                      <td><div align="center">Pengirim</div></td>
                                      <td><div align="center">
                                        <div align="center">Hormat kami</div>
                                      </div></td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td><div align="center"></div></td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                      <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                      <td><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
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
                            <br>&nbsp;</br>
                            <br>&nbsp;</br>
                            <br>&nbsp;</br>
                            <br>&nbsp;</br>
                            </c:forEach>
							
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
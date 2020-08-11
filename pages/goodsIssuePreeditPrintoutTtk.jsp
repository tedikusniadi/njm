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
                                <a class="item-button-back" href="<c:url value='/page/goodsissueprintoutoption.htm?id=${goodsIssue_edit.id}'/>"><span>Back</span></a>
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
                                    <td colspan="10"><div align="center" class="CSS3" valign="middle"><strong>TANDA TERIMA KENDARAAN</strong></div></td>
                                </tr>
                                <tr>
                                  <td width="450"><strong><c:out value='${profile.companyName}'/></strong></td>
                                  <td width="156">&nbsp;</td>
                                  <td width="199"></td>
                                  <td width="134"></td>
                                  <td width="156"></td>
                                  <td width="205"></td>
                                </tr>
                                <tr>
                                  <td colspan="2"><c:out value='${profile.organization.fixAddress}'/></td>
                                  <td>&nbsp;</td>
                                  <td>Nomor</td>
                                  <td colspan="2">: <c:out value='${goodsIssue_edit.warehouseTransaction.code}'/></td>
                                  </tr>
                                  
                                <tr>
                                  <td>Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>Tanggal</td>
                                  <td colspan="2">: <fmt:formatDate value='${goodsIssue_edit.warehouseTransaction.date}' pattern='dd-MM-yyyy'/></td>
                                  </tr>
                                <tr>
                                  <td>Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>Kepada</td>
                                  <td colspan="2">: <c:out value='${goodsIssue_edit.warehouseTransaction.issuedFacility.name} ${goodsIssue_edit.warehouseTransaction.note}'/></td>
                                  </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                                </tr>
                                <tr>
                                  <td colspan="6"><table width="100%" border="0" cellspacing="0">
								      <tr>
								        <th width="15%" height="25" class="style1" style="border-left:1px solid black; border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">NO. RANGKA</th>
								        <th width="15%" class="style1" style="border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">NO. MESIN</th>
								        <th width="12%" class="style1" style="border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">TIPE</th>
								        <th width="30%" class="style1" style="border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">NAMA</th>
								        <th width="16%" class="style1" style="border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">WARNA</th>
								        <th width="12%" class="style1" style="border-bottom:1px solid black;border-top:1px solid black; border-right:1px solid black;">TAHUN</th>
								      </tr>
								      <c:forEach items='${goodsIssue_edit.items}' var='item' varStatus='status'>
								      <c:forEach items="${item.details}" var="detail">
								      <c:if test="${item.warehouseTransactionItem.product.productCategory.id == 1}">
								      <tr>
								      
								        <td style="border-left:1px solid black; border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${detail.serialExt1}</span></td>
								        <td style="border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${detail.serial}</span></td>
								        <td style="border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${item.product.types}</span></td>
								        <td style="border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${item.product.names}</span></td>
								        <td style="border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${item.product.colors}</span></td>
								        <td style="border-bottom:1px solid black;border-right:1px solid black;"><span class="style2">&nbsp;${detail.year}</span></td>
								      </tr>
								      </c:if>
								      </c:forEach>
                               		  </c:forEach>
								      
								    </table></td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                                  <td></td>
                                </tr>
                                <tr>
                                  <td colspan="6"><table width="100%" border="0" cellpadding="0">
                                    
                                    <tr>
                                      <td width="18%">&nbsp;</td>
                                      <td width="15%">&nbsp;</td>
                                      <td width="14%"><div align="center">${profile.organization.legend},
                                        <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/>
                                      </div></td>
                                    </tr>
                                    <tr>
                                      <td><div align="center">Penerima</div></td>
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
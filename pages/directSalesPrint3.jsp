<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Direct Sales Order Print</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/deliveryOrderReport.css"); -->
	</style>
	<style type="text/css" media="print">
		<!-- @import url("assets/deliveryOrderReport.css"); -->
	</style>
</head>
<!-- BEGIN OF BODY -->
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

        <div id="se-navigator">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td width="60%">
					Sales > Sales Order > Direct Sales Order > Edit
                </td>
                <td width="40%" align="right">
                    <%@ include file="/common/welcome.jsp"%>
                </td>
            </tr>
            </table>
        </div>
	</div>
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

					<div class="area" dojoType="Container" id="quick_link_container">
						<!-- Top toolbar -->
							  <div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/deliveryorderpreedit.htm?id=${order.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							  </div>
					</div>

					<div class="main-box">
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr>
					  	<td width="96">&nbsp;</td>
					  	<td width="21">&nbsp;</td>
					  	<td width="451">&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right" class="CSS3"><strong>SURAT JALAN</strong></td>
				  	</tr>
					<tr>
						<td colspan="3">Jl. Diponegoro KM 43 No.62 Tambun - Bekasi, Jawa-Barat </td>
						<td width="205">&nbsp;</td>
					    <td width="472" align="right" class="CSS3"><strong>DELIVERY ORDER (DO)</strong></td>
					</tr>
					<tr>
						<td colspan="3">Telp.021-8808619 Fax. 021-88354785 </td>
						<td>&nbsp;</td>
					    <td align="right">&nbsp;</td>
					</tr>
					<tr>
					  	<td colspan="3">&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>Kepada </td>
					  	<td>:</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					<tr>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td>&nbsp;</td>
					  	<td align="right">&nbsp;</td>
				  	</tr>
					</table>
					<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black; border-right:none; border-left:none; border-bottom:none;">
					<tr class="CSS" style="height:28px;">
						<td width="5%" align="center" valign="middle" class="bottom_left_right">No</td>
						<td width="45%" align="center" valign="middle" class="bottom_right">Nama Barang </td>
					    <td width="23%" align="center" valign="middle" class="bottom_right">Kemasan</td>
						<td width="27%" align="center" valign="middle" class="bottom_right2">Jumlah</td>
					</tr>
					<c:forEach items="${order.items}" var="line" varStatus='status'>
					<tr>
						<td align="center" valign="top" class="bottom_left_right">${status.index+1}</td>
						<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${line.product.code}'/>-${line.product.name}</td>
						<td align="left" valign="top" class="bottom_right">&nbsp;<c:out value='${line.product.unitOfMeasure.measureId}'/>&nbsp;</td>
						<td align="right" valign="top" class="bottom_right">&nbsp;<fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/>&nbsp;</td>
					</tr>
					 </c:forEach>
					<tr class="CSS">
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="left" valign="top" class="">&nbsp;</td>
						<td align="right" valign="top" style="border-right:none;"></td>
					</tr>
					</table>

					<table border="0" cellpadding="0" cellspacing="0" class="CSS1" width="100%">
					<tr>
						<td>Barang telah diterima dalam keadaan baik dan sesuai jumlahnya</td>
					</tr>
					<tr>
						<td>Keluhan setelah barang diterima tidak dilayani</td>
					</tr>
					</table>
					<br>
					<table border="0" cellpadding="0" cellspacing="0" width="100%" class="CSS1">
					<tr>
					  <td width="25%" align="left" valign="top">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Penerima Barang </td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="left" nowrap>&nbsp;&nbsp;paraf, nama jelas &amp; stempel perusahaan </td>
								  </tr>
					  </table>					  </td>
						<td width="25%">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr  class="CSS">
										<td align="center">Supir</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>

											<td align="center">(.........................................)</td>


									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No. Pol -

									  </td>
								  </tr>
						</table>
						</td>
						<td width="25%">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Gudang</td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
								</table>
						</td>
						<td width="25%" align="left" valign="top">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr class="CSS">
										<td align="center">Hormat Kami </td>
									</tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
										<td align="center">&nbsp;</td>
									</tr>
									<tr>
										<td align="center">(.........................................)</td>
									</tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
									<tr>
									  <td align="center">&nbsp;</td>
								  </tr>
						</table>
					</td>
					</tr>
					</table>


                  </div>
			    </div>
		     </div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

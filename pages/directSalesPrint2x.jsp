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
		<!-- @import url("assets/invoice3Report.css"); -->
	</style>

	<style type="text/css" media="print">	
		<!-- @import url("assets/invoice3Report.css"); -->
	</style>
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>

<style type="text/css">
</style>

</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
	<div class="area" dojoType="Container" id="quick_link_container">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">
				Sales > Sales Order > Direct Sales Order > Edit</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
	</table>
    </div>
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

						<div class="area" dojoType="Container" id="quick_link_container">
						
						<h1 class="page-title">S01 - Direct Sales Order<br>
						</h1>
						
						<!-- Top toolbar -->
					  <div class="toolbar">
						<a class="item-button-back" href="<c:url value='/page/directsalesorderprintoption.htm?id=${salesOrder.id}'/>"><span>Back</span></a>

						  <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
						  <%--	
						  <a class="item-button-export-xls" href=""><span>Export Excel</span></a>
						  --%>
					  </div>
					</div>
	<div class="main-box">
		<br>
			<div class="main_container"><br><br>
							<table height="843" border="0" cellpadding="0" cellspacing="0" style="border-left:1px solid black; border-bottom:1px solid black; border-right:1px solid black;" align="center" class="stdWidth">
							  <tr>
								<td colspan="2" style="border-top:1px solid black;"><br>&nbsp;&nbsp;<font class="CSS1">Kode dan Nomor Seri Faktur Pajak : 	
								&nbsp;</font><br>
								<br>
								</td>
							  </tr>
							  <tr>
									<td height="94" colspan="2">
										<table width="100%" border="0" class="borderTopBottom">
                                    	<tr>
                                      		<td height="21" align="left" valign="top">&nbsp;&nbsp;<font class="content_heading_bold">Pengusaha Kena Pajak</font></td>
                                    	</tr>
                                  		</table>								  
                                        <table width="100%" style="border:none">
                                        <tr>                                
                                          	<td width="25%" class="CSS1">&nbsp;&nbsp;Nama</td>
                                          	<td width="1%" class="CSS1">:</td>
                                          	<td width="74%" class="CSS1">&nbsp;${salesOrder.organization.firstName} ${salesOrder.organization.lastName} ${salesOrder.organization.middleName}</td>
                                        </tr>
                                        <tr>
                                          	<td class="CSS1">&nbsp;&nbsp;Alamat</td>
                                          	<td class="CSS1">:</td>							
                                          	<td class="CSS1"></td>
                                        </tr>
                                        <tr>
                                          	<td class="CSS1">&nbsp;&nbsp;N.P.W.P</td>
                                          	<td class="CSS1">:</td>
                                          	<td class="CSS1">${salesOrder.organization.taxCode}<span class="CSS1"></span></td>
                                        </tr>                                
                                        <tr>
                                          	<td class="CSS1">&nbsp;&nbsp;Tanggal Pengukuhan PKP </td>
                                          	<td class="CSS1">:</td>
                                          	<td class="CSS1"><fmt:formatDate value='${salesOrder.organization.pkpDate}' pattern='dd-MM-yyyy'/></td>
                                        </tr>
                                        </table>								
                                	</td>
						  	  </tr>							
							  	<tr>
									<td height="76" colspan="2" align="left" valign="top">
										<table width="100%%" border="0" class="borderTopBottom">
                                    	<tr>
                                      		<td height="21" align="left" valign="top">&nbsp;&nbsp;<font class="content_heading_bold">Pembeli Barang Kena Pajak/Penerima Jasa Kena Pajak</font></td>
                                    	</tr>
                                  		</table>
								
                                        <table width="100%" style="border:none">
                                        <tr>
                                          <td width="25%" class="CSS1">&nbsp;&nbsp;Nama</td>
                                          <td width="1%" class="CSS1">:</td>
                                          <td colspan="74%" class="CSS1"><c:out value='${salesOrder.customer.salutation} ${salesOrder.customer.firstName}'/></td>
                                
                                        </tr>
                                        <tr>
                                          <td class="CSS1">&nbsp;&nbsp;Alamat</td>
                                          <td class="CSS1">:</td>
                                          <td colspan="4" class="CSS1"></td>
                                        </tr>
                                        <tr>
                                
                                          <td class="CSS1">&nbsp;&nbsp;N.P.W.P</td>
                                          <td class="CSS1">:</td>
                                          <td width="26%" class="CSS1"><c:out value='${salesOrder.customer.taxCode}'/></td>
                                          <td width="7%" class="CSS1">N.P.P.K.P</td>
                                          <td width="1%" class="CSS1">:</td>
                                          <td width="38%" class="CSS1"><c:out value='${salesOrder.customer.nppkp}'/><span class="CSS1"></span></td>
                                        </tr>
                                        </table>
                              		</td>
							  	</tr>
							  <tr>
							    <td height="342" colspan="2" align="left" valign="top">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" topmargin="0"  style="border-top:1px solid black; border-bottom:1px solid black;">
                                  <tr>
                                    <td width="51" align="center" valign="middle" class="borderRightBottom" style="WIDTH:50px;"><br><font class="CSS">No.<br>Urut</font><br><br></td>
                                    <td width="364" align="center" valign="middle" class="borderRightBottom"><br><font class="CSS">Nama Barang Kena Pajak / Jasa Kena Pajak</font><br><br> </td>
                                    <td width="463" align="center" valign="middle" class="borderBottom"><br><font class="CSS">Harga Jual/Penggantian/Uang Muka/Termin (Rp.)</font><br><br> </td>
                                  </tr>
								  <c:forEach items='${daftar}' var='item' varStatus="idx">		
                                  <tr>
                                    <td class="borderRightBottom" align="center" valign="top"><font class="CSS1">&nbsp;<c:out value='${idx.index+1}'/></font>&nbsp;</td>
                                    <td class="borderRightBottom" align="left" valign="top"><font class="CSS1">&nbsp;<c:out value='${item.barang}'/></font>&nbsp;</td>                                    
									<td class="borderBottom" align="right" valign="top"><font class="CSS1"><fmt:formatNumber value='${item.harga}' pattern=',##0.00'/></font>&nbsp;&nbsp;</td>
                                  </tr>
								  </c:forEach>
                                  <tr>
                                    <td colspan="2" class="borderRightBottom">&nbsp;&nbsp;<font class="CSS1">Harga Jual/<s>Penggantian/Uang Muka/Termin</s> *) </font></td>
                                    <td class="borderBottom" align="right"><font class="CSS1"><fmt:formatNumber value='${adapter.totalSalesDef}' pattern=',##0.00'/>
									</font>&nbsp;
									</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="borderRightBottom">&nbsp;&nbsp;<font class="CSS1">Dikurangi Potongan Harga</font> </td>
                                    <td class="borderBottom" align="right"><font class="CSS1"><fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/>
									</font>&nbsp;
									</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="borderRightBottom">&nbsp;&nbsp;<font class="CSS1">Dikurangi Uang Muka yang telah diterima</font> </td>
                                    <td class="borderBottom" align="right"><font class="CSS1">

									</font>&nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="borderRightBottom">&nbsp;&nbsp;<font class="CSS1">Dasar Pengenaan Pajak</font> </td>
                                    <td class="borderBottom" align="right"><font class="CSS1">
									</font>&nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="borderRight">&nbsp;&nbsp;<font class="CSS1">PPN = % X Dasar Pengenaan Pajak </font></td>
                                    <td  align="right"><font class="CSS1"></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                  </tr>
                                </table>				</td>
			<tr>
				<td width="52%" align="center" bordercolor="#000000" style="border-right: hidden;">
				<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font class="CSS1">Pajak Penjualan Atas Barang Mewah</font></p>
				<table width="80%" border="0" cellspacing="0" class="borderTable">
				<tr>
					<td width="105" align="center" class="borderRightBottom"><font class="CSS1">TARIF</font></td>
					<td width="127" align="center" class="borderRightBottom"><font class="CSS1">DPP</font></td>
					<td width="219" align="center" class="borderBottom"><font class="CSS1">PPn BM</font> </td>
				</tr>
				<tr>
					<td align="right" style="HEIGHT:5px;" class="borderRightBottom"><font class="CSS1">........%&nbsp;</font></td>
					<td align="right" class="borderRightBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
					<td align="right" class="borderBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
				</tr>
				<tr>
					<td align="right" class="borderRightBottom"><font class="CSS1">........%&nbsp;</font></td>
					<td align="right" class="borderRightBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
					<td align="right" class="borderBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
				</tr>
				<tr>
					<td align="right" class="borderRightBottom"><font class="CSS1">........%&nbsp;</font></td>
					<td align="right" class="borderRightBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
					<td align="right" class="borderBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
				</tr>
				<tr>
					<td align="right" class="borderRightBottom"><font class="CSS1">........%&nbsp;</font></td>
					<td align="right" class="borderRightBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
					<td align="right" class="borderBottom"><font class="CSS1">Rp....................&nbsp;</font></td>
				</tr>
				<tr>
					<td colspan="2" align="left" class="borderRight"><font class="CSS1">&nbsp;&nbsp;Jumlah&nbsp;&nbsp;</font></td>
					<td align="right" class="CSS1">Rp....................&nbsp;</td>
				</tr>
				</table>

				</td>
				<td width="48%" bordercolor="#000000" style=" border-left: hidden;" valign="top">
							
			<table width="100%" height="100%" border="0" cellspacing="0">
			<tr>
				<td height="15" align="left" valign="top"></td>
		    </tr>
			<tr>
			  <td height="15" align="left" valign="top"></td>
		   </tr>

			<tr>
				<td align="center" nowrap="nowrap" class="CSS1">,&nbsp;</td>
			</tr>
			<tr>
				<td height="75" align="center" valign="bottom">&nbsp;<br><br>
					
				</td>
			</tr>
			<tr>
				<td height="28" align="left" valign="bottom">&nbsp;</td>
			</tr>
			<tr>
			  <td height="28" align="left" valign="top">&nbsp;</td>
			  </tr>
			<tr>
			  <td height="28" align="left" valign="top">&nbsp;</td>
			  </tr>
			<tr>
			  <td height="28" align="center" valign="top"></td>
			  </tr>
			<tr>
			  <td height="60" align="left" valign="top">&nbsp;</td>
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
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Form Pinjaman Antar Cabang</title>
	<style type="text/css" media="screen,print">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/loanAcknowledgementPrint.css"); -->
	</style>
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>

</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/minimal-header.jsp"%>
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

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">&nbsp;
				
				</td>
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
								<a class="item-button-back" href="<c:url value='/page/directPurchaseOrderView.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
							<div class="main_container">
								<table border="0" cellpadding="0" cellspacing="0" style="border:1px solid black;">
					<tr>
					  <td>


								<center>
									<div class="pageTitle">FORM PINJAMAN ANTAR CABANG / INTERCOMPANY</div>
								</center><br>
							   	
		    					<table width="100%" class="CSS1" cellpadding="4" cellspacing="0" style="border-bottom:3px double black;">	
			   						<tr>	
			    						<td width="220" class="CSS1"><u><strong>PEMINJAM : </strong></u></td>
										<td width="3" class="CSS1">&nbsp;</td>
										<td width="210" class="CSS1"></td>			  
										<td colspan="2" class="CSS1">&nbsp;</td>
										<td width="23" class="CSS1"></td>
									</tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">NAMA PT </td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1"></td>
									  <td colspan="2" class="CSS1">&nbsp;</td>
									  <td class="CSS1">&nbsp;</td>
								    </tr>
			   						<tr>
			   						  <td class="CSS1">CABANG</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1"></td>
									  <td colspan="2" class="CSS1">&nbsp;</td>
									  <td class="CSS1"></td>
								    </tr>
			   						<tr>
			   						  <td class="CSS1">LAMANYA PINJAMAN</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1"></td>
									  <td colspan="2" class="CSS1">&nbsp;</td>
									  <td class="CSS1"></td>
								    </tr>
			   						<tr>
			   						  <td class="CSS1">JUMLAH</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1"></td>
			   						  <td colspan="2" class="CSS1">( <em>Terbilang</em> : </td>
									  <td class="CSS1"></td>
								    </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1"></td>
			   						  <td width="93" class="CSS1">&nbsp; </td>
			   						  <td width="456" class="CSS1">_____________________________________________________ )</td>
			   						  <td class="CSS1"></td>
		   						    </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">KEPERLUAN</td>
			   						  <td class="CSS1">:</td>
			   						  <td colspan="3" class="CSS1"></td>
			   						  <td class="CSS1"></td>
		   						    </tr>
			   						<tr>
			   						  <td class="CSS1">RENCANA PEMBAYARAN </td>
			   						  <td class="CSS1">:</td>

			   						  <td colspan="3" class="CSS1"></td>
			   						  <td class="CSS1"></td>
		   						    </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						    </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1" align="right">Diisi oleh Debitur </td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1" style="border-bottom:3px double black;">&nbsp;</td>
			   						  <td class="CSS1" style="border-bottom:3px double black;">&nbsp;</td>
			   						  <td class="CSS1" style="border-bottom:3px double black;">&nbsp;</td>
			   						  <td colspan="2" class="CSS1" style="border-bottom:3px double black;">&nbsp;</td>
			   						  <td class="CSS1" style="border-bottom:3px double black;">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1"><strong><u>DIKELUARKAN DARI : </u></strong></td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">NAMA PT </td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">CABANG</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">BUNGA</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;% /</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">JUMLAH YANG DISETUJUI</td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1">Rp</td>
			   						  <td colspan="2" class="CSS1"><em>( Terbilang :</em> </td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">_____________________________________________________ )</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">TANGGAL DICAIRKAN </td>
			   						  <td class="CSS1">:</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1"> TANGGAL JATUH TEMPO : .............................................................*) </td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" align="right" class="CSS1">Diisi oleh Kreditur </td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
			   						<tr>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
			   						  <td colspan="2" align="right" class="CSS1">&nbsp;</td>
			   						  <td class="CSS1">&nbsp;</td>
		   						  </tr>
		    					</table>
		    					
								<br/>	
								<table border="0" cellpadding="0" cellspacing="0" width="100%" class="approver">
									<tr>
										<td width="458" align="center" style="border-top:1px solid black; border-right:1px solid black; border-left:none; border-bottom:1px solid black"><strong>DEBITUR</strong></td>
										<td width="43" align="right" style="border-top:1px solid black;">&nbsp;</td>
									    <td width="554" align="center" style="border-top:1px solid black; border-right:none; border-left:1px solid black; border-bottom:1px solid black"><strong>KREDITUR</strong></td>
									</tr>
									<tr>
									  <td align="left" valign="top" style="border-right:1px solid black;">
												<table border="0" width="100%" cellpadding="0" cellspacing="0">
													<tr>
														<td width="49%" style="border-right:1px solid black;">&nbsp;&nbsp;Dept / Div : </td>
														<td width="51%">&nbsp;&nbsp;<u>Disetujui oleh :</u></td>
													</tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;&nbsp;Dibuat oleh , </td>
													  <td>&nbsp;</td>
												  </tr>
													<tr>
													  <td height="24" style="border-right:1px solid black;">&nbsp;</td>
													  <td>&nbsp;</td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;</td>
													  <td>&nbsp;</td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;</td>
													  <td>&nbsp;</td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;</td>
													  <td>&nbsp;</td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;&nbsp;Nama : </td>
													  <td align="center">( Branch Manager ) </td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;</td>
													  <td align="center">&nbsp;</td>
												  </tr>
													<tr>
													  <td style="border-right:1px solid black;">&nbsp;</td>
													  <td align="center">&nbsp;</td>
												  </tr>
										</table>								  
									  </td>
										<td align="left" valign="top" style="border-bottom:none;">&nbsp;									  
										</td>
								        <td align="left" valign="top" style="border-left:1px solid black; "><table border="0" width="100%" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td width="33%" style="border-bottom:1px solid black;">&nbsp;&nbsp;<strong><u>Disetujui oleh :</u></strong></td>
                                            <td width="33%" style="border-bottom:1px solid black;">&nbsp;</td>
                                            <td width="34%" style="border-bottom:1px solid black;">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td height="24" style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;" align="center">( Manager Finance ) </td>
                                            <td style="border-right:1px solid black;" align="center">( General Manager ) </td>
                                            <td align="center">( Direktur ) </td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td align="center">&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td style="border-right:1px solid black;">&nbsp;</td>
                                            <td align="center">&nbsp;</td>
                                          </tr>
                                        </table></td>
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
			<div class="CSSbottom">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
				<strong>Harus diisi dengan lengkap</strong> <br> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				*) diisi sejak tanggal dicairkannya pinjaman (+) lama pinjaman 
			</div><br><br>

		</div>
	</div>
	<!-- /rounded -->

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

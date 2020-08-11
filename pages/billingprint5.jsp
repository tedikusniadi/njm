<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Print Faktur Pajak Standar</title>
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

<style type="text/css">
</style>

</head>
<!-- BEGIN OF BODY  SIMPLE INVOICE TAX-->
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
				Financial Accounting &gt; Account Receivables &gt; Billing &gt; Edit &gt; Print
			</td>
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
						
						<h1 class="page-title">F21 - Billing<br>
						</h1>
						
						<!-- Top toolbar -->
					  <div class="toolbar">
						<a class="item-button-back" href="<c:url value='/page/billingprintoption.htm?id=${billing_edit.id}'/>"><span>Back</span></a>

						  <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  </div>
					</div>
					<div class="main-box">
						<div class="main_container"><br><br>
                <table border="0" cellpadding="0" cellspacing="0" class="border-bottom border-right border-left" align="center" class="stdWidth">
                        <tr>
                                <td height="35" colspan="2" align="center" style="border-top:1.5px solid black;font-size:18px;font-weight:bold">FAKTUR PAJAK</td>
                        </tr>
                        <tr>
                                <td colspan="2" class="border-top" height="20" valign="middle">
                                        &nbsp;&nbsp;Kode dan Nomor Seri Faktur Pajak : <c:out value='${billing_edit.simpleTaxNumber}'/>
                                </td>          
                        </tr>
                        <tr>
									<td colspan="2">
										<table width="100%" border="0" class="border-top border-bottom">
                                    	<tr>
                                      		<td height="21" align="left" valign="top">&nbsp;&nbsp;<font class="content_heading_bold">Pengusaha Kena Pajak</font></td>
                                    	</tr>
                                  		</table>								  
                                        <table width="100%" style="border:none">
                                        <tr>                                
                                          	<td width="25%" class="CSS1">&nbsp;&nbsp;Nama</td>
                                          	<td width="1%" class="CSS1">:</td>
                                          	<td width="74%" class="CSS1"><c:out value='${billing_edit.organization.salutation} ${billing_edit.organization.firstName}'/></td>
                                        </tr>
                                        <tr>
                                          	<td class="CSS1">&nbsp;&nbsp;Alamat</td>
                                          	<td class="CSS1">:</td>							
                                          	<td class="CSS1">${billing_edit.taxAddress.address}</td>
                                        </tr>
                                        <tr>
                                          	<td class="CSS1">&nbsp;&nbsp;N.P.W.P</td>
                                          	<td class="CSS1">:</td>
                                          	<td class="CSS1"><span class="CSS1">${billing_edit.organization.taxCode}</span></td>
                                        </tr>                                
                                        </table>								
                                	</td>
							  	</tr>							
							  	<tr>
									<td colspan="2" align="left" valign="top">
										<table width="100%%" border="0" class="border-top border-bottom">
                                    	<tr>
                                      		<td height="21" align="left" valign="top">&nbsp;&nbsp;<font class="content_heading_bold">Pembeli Barang Kena Pajak/Penerima Jasa Kena Pajak</font></td>
                                    	</tr>
                                  		</table>
								
                                        <table width="100%" style="border:none">
                                        <tr>
                                          <td width="25%" class="CSS1">&nbsp;&nbsp;Nama</td>
                                          <td width="1%" class="CSS1">:</td>
                                          <td colspan="74%" class="CSS1"><c:out value='${billing_edit.customer.salutation} ${billing_edit.customer.firstName}'/></td>
                                
                                        </tr>
                                        <tr>
                                          <td class="CSS1">&nbsp;&nbsp;Alamat</td>
                                          <td class="CSS1">:</td>
                                          <td colspan="4" class="CSS1">${billing_edit.customerTaxAddress.address}</td>
                                        </tr>
                                        <tr>
                                
                                          <td class="CSS1">&nbsp;&nbsp;N.P.W.P</td>
                                          <td class="CSS1">:</td>
                                          <td width="26%" class="CSS1">${billing_edit.customer.taxCode}</td>
                                          <td width="7%" class="CSS1">&nbsp;</td>
                                          <td width="1%" class="CSS1">&nbsp;</td>
                                          <td width="38%" class="CSS1">&nbsp;</td>
                                        </tr>
                                        </table>
                              		</td>
							  	</tr>
							  <tr>
							    <td colspan="2" align="left" valign="top">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" topmargin="0"  class="border-bottom border-top">
                                  <tr>
                                    <td width="51" align="center" valign="middle " class="border-bottom border-right"><br><font class="CSS">No.<br>Urut</font><br><br></td>
                                    <td width="527" align="center" valign="middle" class="border-bottom border-right"><br><font class="CSS">Nama Barang Kena Pajak / Jasa Kena Pajak</font><br><br> </td>
                                    <td width="300" align="center" valign="middle" class="border-bottom"><br><font class="CSS">Harga Jual/Penggantian/Uang Muka/Termin (Rp.)</font><br><br> </td>
                                  </tr>
                                   <tr>     
                                        <td colspan="3" valign="top">
                                                <table width="880" border="0" cellpadding="0" cellspacing="0" topmargin="0">
                                                <c:set var="count" value="${0}"/>
                                                <c:forEach items="${billing_edit.lineItems}" var="line" varStatus='status'>
                                                  <tr height="15">
                                                    <td valign="top" width="51" class="border-right" align="center" valign="top">
                                                        <font class="CSS1"><c:out value="${status.index+1}"/></font>&nbsp;
                                                    </td>
                                                    <td valign="top" width="528" class="border-right" align="left" valign="top">
                                                        <font class="CSS1">&nbsp;<c:out value='${line.line.self}'/></font>&nbsp;
                                                    </td>
                                                    <td valign="top" width="300" align="right" valign="top">
                                                        <font class="CSS1">
                                                                <fmt:formatNumber value='${line.line.quantity*line.line.unitPrice.amount}' pattern=',##0.00'/>
                                                        </font>
                                                        &nbsp;&nbsp;</td>
                                                  </tr>
                                                </c:forEach>
                                                </table>
                                        </td>
                                  </tr>
                                  <tr height="<c:out value="${564-(count*15)}"/>">
                                        <td colspan class="border-right border-bottom">&nbsp;</td>
                                        <td colspan class="border-right border-bottom">&nbsp;</td>
                                        <td colspan class="border-bottom">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="border-bottom border-right">&nbsp;&nbsp;<font class="CSS1">Harga Jual/<s>Penggantian</s>/<s>Uang Muka</s>/<s>Termin</s>*) </font></td>
                                    <td class="border-bottom" align="right">
                                    <font class="CSS1">
                                        <fmt:formatNumber value='${adapter.totalLineAmountMinusDiscount}' pattern=',##0.00'/>
                                    </font>
                                    &nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="border-bottom border-right">&nbsp;&nbsp;<font class="CSS1">Dikurangi Potongan Harga</font> </td>
                                    <td class="border-bottom" align="right">
                                    <font class="CSS1">
                                        <fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/>
                                    </font>
                                    &nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="border-bottom border-right">&nbsp;&nbsp;<font class="CSS1">Dikurangi Uang Muka yang telah diterima</font> </td>
                                    <td class="border-bottom" align="right">
                                    <font class="CSS1">
                                    </font>
                                    &nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="border-bottom border-right">&nbsp;&nbsp;<font class="CSS1">Dasar Pengenaan Pajak</font> </td>
                                    <td class="border-bottom" align="right">
                                    <font class="CSS1">
                                        <fmt:formatNumber value='${adapter.totalLineAmountMinusDiscount - adapter.totalDiscount}' pattern=',##0.00'/>
                                    </font>
                                    &nbsp;&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="2" class="border-right">&nbsp;&nbsp;<font class="CSS1">PPN = <fmt:formatNumber value='${adapter.billing.tax.taxRate}' pattern='0'/> % X Dasar Pengenaan Pajak </font></td>
                                    <td  align="right">
                                    <font class="CSS1">
                                        <fmt:formatNumber value='${adapter.defTaxAmount}' pattern=',##0.00'/>
                                    </font>
                                    &nbsp;&nbsp;</td>
                                  </tr>
                                </table>				
                        </td>
                        <tr>
                                <td colspan="2">&nbsp;</td>
                        </tr>
                      <tr>
                        <td width="52%" align="left" bordercolor="#000000" style="border-right: hidden;" valign="top">
                      <table width="80%" border="0" cellspacing="0">
                    <tr>
                        <td align="left" colspan="4"><font class="CSS1">&nbsp;&nbsp;Pajak Penjualan Atas Barang Mewah</font></td>
                    <tr>
                    <tr>
                        <td width="2%">&nbsp;</td>
                        <td width="25%" align="center" class="bordered"><font class="CSS1">TARIF</font></td>
                        <td width="25%" align="center" class="border-top border-bottom border-right"><font class="CSS1">DPP</font></td>
                        <td width="48%" align="center" class="border-top border-bottom border-right"><font class="CSS1">PPn BM</font> </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="right" class="border-bottom border-left border-right"><font class="CSS1">........%&nbsp;</font><!--0%--></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font><!--Rp. 38,500,000--></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font><!--Rp. 0--></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="right" class="border-bottom border-left border-right"><font class="CSS1">........%&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="right" class="border-bottom border-right border-left"><font class="CSS1">........%&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="right" class="border-bottom border-left border-right"><font class="CSS1">........%&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                        <td align="right" class="border-bottom border-right"><font class="CSS1">Rp....................&nbsp;</font></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" align="left"  class="border-bottom border-left border-right"><font class="CSS1">&nbsp;&nbsp;Jumlah&nbsp;&nbsp;</font></td>
                        <td class="border-bottom border-right" align="right"><font class="CSS1">Rp....................&nbsp;</font></td>
                    </tr>
                    </table>
				</td>
				<td width="48%" bordercolor="#000000" style=" border-left: hidden;" valign="bottom">
        <table width="100%" border="0" cellspacing="0">
			 <tr>
				<td align="center" nowrap="nowrap" class="CSS1" valign="bottom" height="20">
                	<c:forEach items='${billing_edit.organization.postalAddresses}' var='postal'>
                    <c:if test='${postal.selected}'>
                      <c:forEach items='${postal.geographics}' var='geo'>
                        <c:if test='${geo.geographic.geographicType.id == 2}'> ${geo.geographic.name},
                          <fmt:formatDate value='${_date}' pattern='dd MMMM yyyy'/>
                        </c:if>
                      </c:forEach>
                    </c:if>
                    </c:forEach>
                </td>
			 <tr>
                <td height="85" valign="bottom" align="center"><c:out value='${billing_edit.signer.firstName} ${billing_edit.signer.middleName} ${billing_edit.signer.lastName}'/></td>
                    </tr>
                    <tr>
                        <td height="35" valign="top" align="center"><c:out value='${billing_edit.activeRole.partyRoleType.name}'/></td>
                    </tr>
			</table>

		  </td>
		</tr>
      <tr>
       <td colspan="2">
        &nbsp;
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

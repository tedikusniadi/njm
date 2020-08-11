	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Billing Print</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/invoiceReport.css"); -->
	</style>

	<style type="text/css" media="print">	
		<!-- @import url("assets/invoiceReport.css"); -->
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


							<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
<%--
							<a class="item-button-export-xls" href=""><span>Export Excel</span></a>
--%>				
					  </div>
					</div>
	<div class="main-box">
		<br>
			<div class="main_container">			

							<table width="100%"  border="0" class="CSS1" bgcolor="white">
                              <tr>
                              	<td colspan="3" align="left" valign="top">
                    	<table width="100%"  border="0" cellpadding="4" cellspacing="0">
                        <tr>
                        	<td align="left">
                            	<strong>
                                	<c:out value='${billing_edit.organization.firstName} ${billing_edit.organization.middleName} ${billing_edit.organization.lastName}'/>
                                </strong>                            </td>
                        </tr>
                        <tr>
                        	<td align="left">
                            	<c:forEach items='${billing_edit.organization.postalAddresses}' var='postal'>
                                <c:if test='${postal.selected}'>
                                	<c:out value='${postal.address}'/>&nbsp;
                                  	<c:forEach items='${postal.geographics}' var='geo'>
                                        <c:if test='${geo.geographic.geographicType.id == 3}'> 
                                            ${geo.geographic.name}&nbsp;                                        </c:if>
										<c:if test='${geo.geographic.geographicType.id == 2}'> 
                                    		${geo.geographic.name}&nbsp;                                    	</c:if>
                                        <c:if test='${geo.geographic.geographicType.id == 1}'> 
                                    		${geo.geographic.name}&nbsp;                                    	</c:if>             
                                  	</c:forEach>
                                </c:if>
                                </c:forEach>                            </td>
                        </tr>
                        </table>                              </tr>
                              <tr>
                                <td colspan="3"><div align="center">INVOICE</div></td>
                              </tr>
                              <tr>
                                <td colspan="5">&nbsp;</td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>Kepada Yth. </td>
                                <td width="34%">&nbsp;</td>
                                <td width="51%"><c:out value='${billing_edit.organization.salutation} ${billing_edit.organization.firstName} ${billing_edit.organization.middleName} ${billing_edit.organization.lastName}'/></td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>${namaperusahaan}</td>
                                <td>:&nbsp;</td>
                                <td><c:out value='${billing_edit.customer.salutation} ${billing_edit.customer.firstName} ${billing_edit.customer.lastName} ${billing_edit.customer.middleName}'/></td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>${alamatperusahaan} </td>
                                <td>:&nbsp;</td>
                                <td><c:out value='${billing_edit.customerTaxAddress.address}'/></td>
                              </tr>
                              <tr class="CSS1">
                                <td align="left" valign="top">${alamatkotaperusahaan} </td>
                                <td valign="top">:&nbsp;</td>
                                <td valign="top"><c:out value='${billing_edit.customerContactPerson.firstName}${billing_edit.customerContactPerson.middleName}${billing_edit.customerContactPerson.lastName}'/></td>
                              </tr>
                              <tr class="CSS1">
                                <td align="left" valign="top">Telp/Fax No </td>
                                <td valign="top">:&nbsp;</td>
                                <td valign="top"></td>
                              </tr>
                              <tr>
                                <td colspan="3">&nbsp;</td>
                              </tr>
							  <tr>
                                <td colspan="3">Dengan ini kami tagihkan jasa angkut sparepart bulan ${keteranganBulan} dengan perincian sbb : </td>
                              </tr>
                              <tr>
                                <td colspan="3" class="CSS">
                                  <table width="100%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#000000" style="border:1px solid black;">
                                    <tr class="CSS">
                                      <td width="3%" class="borderRightBottom"><div align="center">No</div></td>
                                      <td width="19%" class="borderRightBottom"><div align="center">No. Truck </div></td>
                                      <td width="13%" class="borderRightBottom"><div align="center">Jumlah Rit </div></td>
                                      <td width="17%" class="borderBottom"><div align="center">Ongkos / Rit </div></td>
                                      <td width="36%" class="borderBottom"><div align="center">Lokasi</div></td>
                                      <td width="12%" class="borderBottom"><div align="center">Total</div></td>
                                    </tr>
                                    
                                    <c:forEach items="${adapter.grouped}" var="line" varStatus='status'>
                                    <tr class="CSS1" style="font-weight:normal;">
                                      <td class="borderRightBottom">&nbsp;<c:out value="${status.index+1}"/></td>
                                      <td class="borderRightBottom">&nbsp;<c:out value='${line.name}'/></td>
                                      <td align="right" class="borderRightBottom">&nbsp;<fmt:formatNumber value='${line.price}' pattern=',##0.00'/>&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${line.amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:forEach>
									
									 <tr class="CSS1" style="font-weight:normal;">
                                      <td class="borderRightBottom">&nbsp;<c:out value="${status.index+1}"/></td>
                                      <td class="borderRightBottom">&nbsp;<c:out value='${line.name}'/></td>
                                      <td align="right" class="borderRightBottom">&nbsp;<fmt:formatNumber value='${line.price}' pattern=',##0.00'/>&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${line.amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
									
									 <tr class="CSS1">
                                   	   <td colspan="2" valign="top" class="borderRightBottom" align="right">
                                        	<c:out value='${billing_edit.extTax2.taxId}'/>
                                            <fmt:formatNumber value='${billing_edit.extTax2.taxRate}' pattern=',##0'/></td>
                                      	<td align="right" class="borderRightBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defTax3Amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
									                                   
                                    <tr class="CSS1">
                                   	  <td colspan="2" valign="top" class="borderRightBottom" align="right">
                                        	<c:out value='${billing_edit.extTax2.taxId}'/>
                                            <fmt:formatNumber value='${billing_edit.extTax2.taxRate}' pattern=',##0'/></td>
                                      	<td align="right" class="borderRightBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;</td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defTax3Amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                                                                               
                                    <tr style="font-weight:normal;">
                                      <td colspan="6" valign="top">SUB TOTAL: <br />
                                          <c:out value='${said}'/> </td>
                                    </tr>
									
									 <tr class="CSS1">
                                   	  <td colspan="6" valign="top" class="borderRightBottom" align="right">
                                        	<c:out value='${billing_edit.extTax2.taxId}'/>
                                            <fmt:formatNumber value='${billing_edit.extTax2.taxRate}' pattern=',##0'/>&nbsp;
                                        <fmt:formatNumber value='${adapter.defTax3Amount}' pattern=',##0.00'/>                                        &nbsp;</td>
                                   	</tr>
									 <tr class="CSS1">
									   <td colspan="2" valign="top" class="borderRightBottom" align="right">TOTAL</td>
									   <td colspan="3" align="right" class="borderRightBottom">&nbsp;</td>
									   <td align="right" class="borderBottom">&nbsp;</td>
								    </tr>
									 <tr>
									   <td height="60" colspan="2" valign="top" class="borderRightBottom" align="right">TERBILANG</td>
									   <td colspan="4" align="right" class="borderRightBottom">&nbsp;</td>
								    </tr>
                                	</table>
								</td>
                              </tr>
                              <tr>
                                	<td width="15%">&nbsp;</td>
                                	<td colspan="2">&nbsp;</td>
                              </tr>
                              <tr>
                              	<td colspan="3">
                                	<table style="border:none" width="100%">
                                    <tr>
                                      	<td rowspan="6" valign="top">
                                        	<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="" style="border:1px solid black;">
                                            <tr>
                                                <td>
                                                    <table width="100%"  border="0" cellpadding="5" cellspacing="5" class="CSS1">
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2" class="CSS">Bank Note</td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2" class="CSS1"> 
                                                            Please return by fax, confirming delivery order, <br />
                                                            quantity and price.<br />
                                                            If not accepted, please make necessary changes.<br />                                                        </td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td class="CSS1">Date : </td>
                                                        <td class="CSS1"><div align="center">Name &amp; Signature : </div></td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2">Receiving Slip No : </td>
                                                    </tr>
                                                    </table>                                                </td>
                                            </tr>
                                            </table>                                        </td>
                                        <td width="43%" align="center">
                                        	<c:forEach items='${billing_edit.organization.postalAddresses}' var='postal'>
                                            	<c:if test='${postal.selected}'>
                                                	<c:forEach items='${postal.geographics}' var='geo'>
                                                        <c:if test='${geo.geographic.geographicType.id == 2}'>
                                                        	${geo.geographic.name}, <fmt:formatDate value='${_date}' pattern='dd-MM-yyyy'/>
                                                        </c:if>
                                                    </c:forEach>    
                                                </c:if>
                                            </c:forEach>                                        </td>
                                  </tr>
                                  <tr><td>&nbsp;</td></tr>
                                  <tr class="CSS"><td>&nbsp;</td></tr>
                                  <tr class="CSS"><td>&nbsp;</td></tr>
                                  <tr>
                                      <td height="79" valign="bottom" align="center"><c:out value='${billing_edit.signer.firstName} ${billing_edit.signer.middleName} ${billing_edit.signer.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td height="25" valign="bottom" align="center"><c:out value='${billing_edit.activeRole.partyRoleType.name}'/></td>
                                    </tr>
                                  </table>                                </td>
                              </tr>
                              <tr>
                                <td colspan="3">&nbsp;</td>
                              </tr>
                            </table>
							<br>
							<br>			
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

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html><head>
	<title>Invoice Summary</title>
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
						
						<h1 class="page-title">F21 - Billing</h1>

					  	<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/billingprintoption.htm?id=${billing_edit.id}'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
					  	</div>
					</div>
            		<div class="main-box">
						<div class="main_container">			
							<table width="100%"  border="0" class="CSS1" bgcolor="white">
                            <tr>
                            	<td colspan="4" align="left" valign="top">
                                <table width="100%"  border="0" cellpadding="4" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <c:forEach items='${billing_edit.organization.postalAddresses}' var='postal'>
                                        <c:if test='${postal.selected}'>
                                            <c:out value='${postal.address}'/>&nbsp;
                                            <c:forEach items='${postal.geographics}' var='geo'>
                                                <c:if test='${geo.geographic.geographicType.id == 3}'> 
                                                    ${geo.geographic.name}&nbsp;
                                                </c:if>
                                                <c:if test='${geo.geographic.geographicType.id == 2}'> 
                                                    ${geo.geographic.name}&nbsp;
                                                </c:if>
                                                <c:if test='${geo.geographic.geographicType.id == 1}'> 
                                                    ${geo.geographic.name}&nbsp;
                                                </c:if>             
                                            </c:forEach>
                                        </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
                                </td>
                                <td align="right"><strong>${billing_edit.code}</strong></td>
                            </tr>
                            <tr>
                                <td colspan="8"><div align="right">Date : <fmt:formatDate value='${billing_edit.date}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
                            </tr>
                            <tr>
                                <td colspan="8"><div align="center"><strong>INVOICE</strong></div></td>
                            </tr>
                            <tr>
                                <td colspan="8">&nbsp;</td>
                            </tr>
                              <tr align="left" valign="top" class="CSS1">
                              <td>Customer</td>
                                <td>:&nbsp;</td>
                                <td><c:out value='${billing_edit.customer.salutation} ${billing_edit.customer.firstName} ${billing_edit.customer.middleName} ${billing_edit.customer.lastName}'/></td>
                                <td colspan="2">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                              	<td>Address </td>
                                <td>:&nbsp;</td>
                                <td><c:out value='${billing_edit.customerTaxAddress.address}'/></td>
                                <td colspan="3" rowspan="3">&nbsp;</td>
                              </tr>
                              <tr class="CSS1">
                                <td align="left" valign="top">Attention To</td>
                                <td valign="top">:&nbsp;</td>
                                <td valign="top"><c:out value='${billing_edit.customerContactPerson.firstName}${billing_edit.customerContactPerson.middleName}${billing_edit.customerContactPerson.lastName}'/></td>
                              </tr>
                              <tr class="CSS1">
                                <td align="left" valign="top">Telp/Fax No </td>
                                <td valign="top">:&nbsp;</td>
                                <td valign="top"></td>
                              </tr>
                              <tr>
                                <td colspan="6">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="6" class="CSS">
                                  <table width="100%"  border="0" cellpadding="3" cellspacing="0" bordercolor="#000000" style="border:1px solid black;">
                                    <tr class="CSS">
                                      <td width="3%" class="borderRightBottom"><div align="center">No</div></td>
                                      <td width="47%" class="borderRightBottom"><div align="center">Description</div></td>
                                      <td width="19%" class="borderBottom"><div align="center">Amount (IDR)</div></td>
                                    </tr>
                                    
                                    <tr class="CSS1" style="font-weight:normal;">
                                      <td class="borderRightBottom">&nbsp;1</td>
                                      <td class="borderRightBottom">&nbsp;<c:out value='${billing_edit.note}'/></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalLineAmountMinusDiscount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total Line Amount</div></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalLineAmountMinusDiscount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <c:if test='${adapter.totalDiscount > 0}'>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Discount</div></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/></td>
                                    </tr>
                                    </c:if>
                                    <tr class="CSS1">
                                      	<td colspan="2" valign="top" class="borderRightBottom" align="right">
                                            <c:out value='${billing_edit.tax.taxId}'/>
                                            <fmt:formatNumber value='${billing_edit.tax.taxRate}' pattern=',##0'/>%                                      	</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defTaxAmount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <c:if test='${adapter.defTax2Amount > 0}'>
                                    <tr class="CSS1">
                                    	<td colspan="2" valign="top" class="borderRightBottom" align="right">
	                                       	<c:out value='${billing_edit.extTax1.taxId}'/>
                                        	<fmt:formatNumber value='${billing_edit.extTax1.taxRate}' pattern=',##0'/>%                                        </td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defTax2Amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <c:if test='${adapter.defTax3Amount > 0}'>
                                    <tr class="CSS1">
                                      	<td colspan="2" valign="top" class="borderRightBottom" align="right">
                                    		<c:out value='${billing_edit.extTax2.taxId}'/>
                                            <fmt:formatNumber value='${billing_edit.extTax2.taxRate}' pattern=',##0'/>%                                        </td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defTax3Amount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total After Tax </div></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defAfterTaxAmount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <c:if test='${adapter.totalDefCreditMemo > 0}'>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Credit Memo Amount </div></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalDefCreditMemo}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      	<td colspan="2" valign="top" class="borderRightBottom"><div align="right">Returned Memo Tax 1 </div></td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defCreditMemoTax}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      	<td colspan="2" valign="top" class="borderRightBottom"><div align="right">Returned Memo Tax 2 </div></td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defCreditMemoTax2}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      	<td colspan="2" valign="top" class="borderRightBottom"><div align="right">Returned Memo Tax 3 </div></td>
                                      	<td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.defCreditMemoTax3}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total Billing Amount</div></td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalDefAmount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight:normal;">
                                      <td colspan="3" valign="top">Said : <br />
                                          <c:out value='${said}'/> </td>
                                    </tr>
                                </table></td>
                              </tr>
                              <tr>
                                <td width="16%">&nbsp;</td>
                                <td colspan="5">&nbsp;</td>
                              </tr>
                              <tr>
                              	<td colspan="6">
                                	<table style="border:none" width="100%">
                                    <tr>
                                      	<td rowspan="6" valign="top">
                                        	<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <c:if test='${billing_edit.bankAccount != null}'>
                                                        <fieldset class="CSS1">
                                                        <legend> For Bank transfer / clearing, please refer to </legend>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="CSS1">
                                                        <tr>
                                                            <td width="27%" align="left">Bank Name</td>
                                                            <td width="73%"><c:out value='${billing_edit.bankAccount.bankName}'/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">Bank Account No</td>
                                                            <td><c:out value='${billing_edit.bankAccount.accountNo}'/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">Account Holder</td>
                                                            <td> <c:out value='${billing_edit.bankAccount.holder.firstName}${billing_edit.bankAccount.holder.middleName}${billing_edit.bankAccount.holder.lastName}'/></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">Please fax your transfer / clearing receipt to ( )</td>
                                                        </tr>
                                                        </table>
                                                        </fieldset>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            </table>
                                        </td>
                                        <td width="43%" align="center">
                                        	<c:forEach items='${billing_edit.organization.postalAddresses}' var='postal'>
                                            	<c:if test='${postal.selected}'>
                                                	<c:forEach items='${postal.geographics}' var='geo'>
                                                        <c:if test='${geo.geographic.geographicType.id == 2}'>
                                                        	${geo.geographic.name}, <fmt:formatDate value='${_date}' pattern='dd-MM-yyyy'/>
                                                        </c:if>
                                                    </c:forEach>    
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                  </tr>
                                  <tr><td>&nbsp;</td></tr>
                                  <tr class="CSS"><td>&nbsp;</td></tr>
                                  	<tr>
                                      <td height="79" valign="bottom" align="center"><c:out value='${billing_edit.signer.firstName} ${billing_edit.signer.middleName} ${billing_edit.signer.lastName}'/></td>
                                    </tr>
                                    <tr>
                                        <td height="25" valign="bottom" align="center"><c:out value='${billing_edit.activeRole.partyRoleType.name}'/></td>
                                    </tr>
                                  </table>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="6">&nbsp;</td>
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

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
		<!-- @import url("assets/invoiceReport.css"); -->
	</style>

	<style type="text/css" media="print">	
		<!-- @import url("assets/invoiceReport.css"); -->
	</style>

	<script type="text/javascript" src="assets/main.js"></script>
		<!-- Calendar Script -->
	<script type="text/javascript" src="assets/calendar.js"></script>
	<script type="text/javascript" src="assets/listform.js"></script>
	
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
                                <td colspan="3">
                                  <div id="logo_part">
                                    <table width="100%"  border="0">
                                      <tr>
                                        <td width="119">&nbsp;</td>
                                      </tr>
                                    </table>
                                </div></td>
                                <td colspan="3" rowspan="3" align="left" valign="top">
                                  <table width="100%"  border="0" cellpadding="4" cellspacing="0" bordercolor="#CCCCCC">
                                    <tr>
                                      <td colspan="3" bgcolor="#CCCCCC" class="CSS3" align="left" valign="top"><center>
                                          SALES ORDER
                                      </center></td>
                                    </tr>
                                    <tr>
                                      <div id="letterNo2">
                                        <td width="48%"  align="right" nowrap>Sales Order No : </td>
                                        <td width="49%"  align="left" nowrap><strong>${salesOrder.code}</strong></td>
                                        <td width="3%"></td>
                                      </div>
                                    </tr>
                                    <tr>
                                      <td align="center" colspan="3"></td>
                                    </tr>
                                </table></td>
                              </tr>
                              <tr>
                                <td colspan="3">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="8">&nbsp; </td>
                              </tr>                             
                              <tr>
                                <td colspan="8">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="8">&nbsp;</td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>Organization</td>
                                <td width="1%">:&nbsp;</td>
                                <td width="35%">${salesOrder.organization.firstName} ${salesOrder.organization.lastName} ${salesOrder.organization.middleName}</td>
                                <td colspan="2">&nbsp;</td>
                                <td width="35%" align="left">&nbsp;&nbsp;&nbsp;</td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>Customer</td>
                                <td>:&nbsp;</td>
                                <td><c:out value='${salesOrder.customer.salutation} ${salesOrder.customer.firstName}'/></td>
                                <td colspan="2">&nbsp;</td>
                                <td align="left">&nbsp;</td>
                              </tr>
                              <tr align="left" valign="top" class="CSS1">
                                <td>Address </td>
                                <td>:&nbsp;</td>
                                <td></td>
                                <td colspan="3" rowspan="3">
                                    	<fieldset class="CSS1">
                                        <legend> For Bank transfer / clearing, please refer to </legend>
                                          <table border="0" cellpadding="0" cellspacing="0" width="100%" class="CSS1">
                                            <tr>
                                              <td width="32%" align="left">Bank Name</td>
                                              <td width="68%">:&nbsp;${salesOrder.cashAccount.bankName}&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left">Bank Account No</td>
                                              <td>:&nbsp;${salesOrder.cashAccount.accountNo}&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left">Account Holder</td>
                                              <td>:&nbsp;${salesOrder.cashAccount.accountName}&nbsp;</td>
                                            </tr>
                                            <tr>
                                              <td align="left" colspan="2">Please fax your transfer / clearing receipt to ( )</td>
                                            </tr>
                                          </table>
                                        </fieldset>
                                </td>
                              </tr>
                              <tr class="CSS1">
                                <td align="left" valign="top">Attention To </td>
                                <td valign="top">:&nbsp;</td>
                                <td valign="top"></td>
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
                                      <td width="3%" rowspan="2" class="borderRightBottom"><div align="center">No</div></td>
                                      <td width="47%" rowspan="2" class="borderRightBottom"><div align="center">Description</div></td>
                                      <td colspan="2" class="borderRightBottom"><div align="center">Quantity </div></td>
                                      <td width="10%" rowspan="2" class="borderRightBottom"><div align="center">Unit Price (UoM)</div></td>
                                      <td width="19%" rowspan="2" class="borderBottom"><div align="center">Amount (IDR)</div></td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td width="10%" align="center" class="borderRightBottom">UoM</td>
                                      <td width="10%" align="center" class="borderRightBottom">Amount</td>
                                    </tr>
                                    <c:forEach items='${salesOrder.items}' var='item' varStatus="idx">									
                                    <tr class="CSS1" style="font-weight:normal;">
                                      <td class="borderRightBottom">&nbsp;<c:out value='${idx.index+1}'/></td>
                                      <td class="borderRightBottom">&nbsp;<c:out value='${item.product.code} ${item.product.name}'/></td>
                                      <td align="center" class="borderRightBottom">&nbsp;<c:out value='${item.product.unitOfMeasure.measureId}'/></td>
                                      <td align="right" class="borderRightBottom">&nbsp;<fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/>&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;<fmt:formatNumber value='${item.unitPrice}' pattern=',##0.00'/>&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${item.quantity*item.unitPrice}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>   
									</c:forEach>
									<tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total Line Amount</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom"> <font style="font-weight:normal;"></font>&nbsp;&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalSales}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Discount</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalDiscount}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Tax Amount 1</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.taxAmountDef}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <c:if test='${adapter.tax2AmountDef > 0}'>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Tax Amount 2</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.tax2AmountDef}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <c:if test='${adapter.tax3AmountDef > 0}'>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Tax Amount 3</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.tax3AmountDef}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    </c:if>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total After Tax </div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.totalSales - adapter.totalDiscount + adapter.taxAmountDef +adapter.tax2AmountDef + adapter.tax3AmountDef}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Rounding</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${salesOrder.rounding}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr class="CSS1">
                                      <td colspan="2" valign="top" class="borderRightBottom"><div align="right">Total Sales Order Amount</div></td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderRightBottom">&nbsp;</td>
                                      <td align="right" class="borderBottom">&nbsp;<fmt:formatNumber value='${adapter.total+salesOrder.rounding}' pattern=',##0.00'/>&nbsp;</td>
                                    </tr>
                                    <tr style="font-weight:normal;">
                                      <td colspan="6" valign="top">Said : <br />
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
                                        	<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="" style="border:1px solid black;">
                                            <tr>
                                                <td>
                                                    <table width="100%"  border="0" cellpadding="5" cellspacing="5" class="CSS1">
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2" class="CSS">Customer Receiving Confirmation</td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2" class="CSS1"> 
                                                            Please return by fax, confirming delivery order, <br />
                                                            quantity and price.<br />
                                                            If not accepted, please make necessary changes.<br />
                                                        </td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td class="CSS1">Date : </td>
                                                        <td class="CSS1"><div align="center">Name &amp; Signature : </div></td>
                                                    </tr>
                                                    <tr bordercolor="#000000">
                                                        <td colspan="2">Receiving Slip No : </td>
                                                    </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            </table>
                                        </td>
                                        <td width="43%" align="center">Created by,</td>
                                  </tr>
                                  <tr><td>&nbsp;</td></tr>
                                  <tr class="CSS"><td>&nbsp;</td></tr>
                                  <tr class="CSS"><td>&nbsp;</td></tr>
                                  <tr><td>&nbsp;</td></tr>
                                  <tr>
                                    	<td height="35" valign="bottom" align="center"><c:out value='${salesOrder.createdBy.firstName} ${salesOrder.createdBy.middleName} ${salesOrder.createdBy.lastName}'/></td>
                                    
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

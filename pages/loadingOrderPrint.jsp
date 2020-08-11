<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loading Order &gt;&gt; Print</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("assets/suratJalanReport.css"); -->
	</style>

	<style type="text/css" media="print">
		<!-- @import url("assets/suratJalanReport.css"); -->
	</style>
</head>
<!-- BEGIN OF BODY -->
<body>
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-header.jsp"%>
	</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
			<!-- main menu -->
			<%@ include file="/common/sirius-menu.jsp"%>
			<!-- /main menu -->
			
			<!-- tips & page navigator -->
			<div id="se-navigator">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tr>
						<td width="60%">
		
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
								<a class="item-button-back" href="<c:url value='/page/loadingorderpreedit.htm?id=${order_edit.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							  </div>
					  </div>

                    <div class="main-box">
                        <div id="main_container">
                            <table width="44%" border="0" cellpadding="0" cellspacing="0" align="right">
                                    <tr>
                                        <td width="49%" class="CSS3" nowrap>
                                            <div align="left"><br><br>
                                                Loading Order
                                            </div>								
                                        </td>
                                        <td width="51%" align="right">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="CSS3">
                                            <div align="left">
                                            </div>								
                                        </td>
                                        <td class="CSS1" align="right" nowrap>
                                            <div align="right">
                                                Plan GI Date : 24-04-2009
                                            </div>								
                                        </td>
                                    </tr>
                                    <tr>
                                      <td class="CSS3">&nbsp;</td>
                                      <td>&nbsp;</td>
                                  </tr>
                            </table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr class="CSS" style="height:24px;">
						<td colspan="4">Company</td>
						<td width="13" class="bgheader"></td>
					    <td width="161" class="bgheader">Shipping Information</td>
					    <td width="12"  class="bgheader">&nbsp;</td>
					    <td width="252" class="bgheader">&nbsp;</td>
					</tr>
					<tr>
<%--						<td colspan="4"><c:out value='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}'/></td>--%>
						<td colspan="4">${order_edit.organization.salutation} ${order_edit.organization.firstName}</td>
						<td>&nbsp;</td>
					    <td>Delivery Note </td>
					    <td>:</td>
					    <td>&nbsp;</td>
					</tr>
					<tr>
					  <td colspan="4">JL.PINANGSIA TIMUR NO.4A TAMANSARI ${no}</td>
					  <td>&nbsp;</td>
					  <td>Number / Date</td>
					  <td>:</td>
					  <td align="right">&nbsp;</td>
				  </tr>
					<tr>
					  <td colspan="4">JAKARTA BARAT </td>
					  <td>&nbsp;</td>
					  <td>Customer's PO </td>
					  <td>:</td>
					  <td align="left">&nbsp;</td>
				  </tr>
					<tr>
					  <td colspan="4">&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Number / Date </td>
					  <td>:</td>
					  <td align="right">&nbsp;</td>
				  </tr>
					<tr>
					  <td colspan="4">&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Order Number / Date </td>
					  <td>:</td>
					  <td align="right">&nbsp;</td>
				  </tr>
					<tr>
					  <td colspan="4">&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Customer Number </td>
					  <td>:</td>
					  <td align="right">&nbsp;</td>
				  </tr>
					<tr>
					  <td colspan="4">&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
				  </tr>
				  </table>
				  <c:forEach items="${order_edit.plans}" var="plan" varStatus='status'>
				  <c:if test='${plan.no == no}'>
				  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr>
					  <td colspan="4">&nbsp;</td>
					  <td width="59">&nbsp;</td>
					  <td width="228">&nbsp;</td>
					  <td width="14">&nbsp;</td>
					  <td width="397">&nbsp;</td>
				  </tr>
					<tr class="bgheader">
					  <td width="159">&nbsp;Condition</td>
					  <td width="16">&nbsp;</td>
					  <td width="329">&nbsp;</td>
					  <td width="26">&nbsp;</td>
					  <td>&nbsp;</td>
					  <td style="height:24px;">Vehicle Driver </td>
					  <td>&nbsp;</td>
					  <td>&nbsp;${plan.driverName}</td>
				  </tr>
					<tr>
					  <td>&nbsp;Shipping</td>
					  <td>:</td>
					  <td>&nbsp;${plan.shipping}</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Vehicle Number </td>
					  <td>:</td>
					  <td>&nbsp;${plan.vehicleNo}</td>
				  </tr>
					<tr>
					  <td>&nbsp;Delivery</td>
					  <td>:</td>
					  <td>&nbsp;${plan.delivery}</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Driver Number </td>
					  <td>:</td>
					  <td>&nbsp;${plan.driverName}</td>
				  </tr>
					<tr>
					  <td>&nbsp;Ship From </td>
					  <td>:</td>
					  <td>&nbsp;${plan.loadingOrder.purchaseOrder.shipTo.code} - ${plan.loadingOrder.purchaseOrder.shipTo.name}</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Filling Point </td>
					  <td>:</td>
					  <td>&nbsp;${plan.fillingPoint}</td>
				  </tr>
					<tr>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>&nbsp;</td>
					  <td>Sesi Number </td>
					  <td>:</td>
					  <td align="left">&nbsp;${plan.no}</td>
				  </tr>
				</table>
				
				<br>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CSS1">
					<tr class="bgheader">
						<td width="111">&nbsp;Shipping details </td>
						<td width="13">&nbsp;</td>
						<td width="401">&nbsp;</td>
					    <td width="83">&nbsp;</td>
					    <td width="13">&nbsp;</td>
					    <td width="246">&nbsp;</td>
					</tr>
				</table>				
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="border">
					<tr class="CSS">
						<td width="40%" align="center" style="height:24px;" class="bottom_right">Item</td>
						<td width="45%" align="center" class="bottom_right">Material Description </td>
						<td width="15%" align="center" class="bottom">Quantity</td>
					</tr>
					  <tr class="CSS">
					<c:forEach items="${plan.items}" var="line" varStatus='status'>
					  <td align="left" class="right">&nbsp;<c:out value='${line.item.product.code} ${line.item.product.name}'/></td>
					  <td align="left" class="right">&nbsp;<c:out value='${line.note}'/></td>
					  <td align="right">&nbsp;<fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/>&nbsp;</td>
					  </c:forEach>
				  </tr>
				</table>	
				 </c:if>			
				</c:forEach>
			  </div>

					<br>
					

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

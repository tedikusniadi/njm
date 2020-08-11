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
                                <a class="item-button-back" href="<c:url value='/page/unitbillingpreedit.htm?id=${billing.id}'/>"><span>Back</span></a>
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
                                    <td colspan="4"><div align="center" class="CSS3" valign="middle"><strong>TANDA TERIMA TAGIHAN</strong></div></td>
                                  </tr>
                                  <tr>
                                    <td><strong><c:out value='${profile.companyName}'/></strong></td>
                                    <td width="15%">&nbsp;</td>
                                    <td width="10%">Nomor</td>
                                    <td width="25%">: <c:out value='${billingGroup.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>&nbsp;</td>
                                    <td>Tanggal</td>
                                    <td>: <fmt:formatDate value='${billingGroup.date}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td>Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                    <td>&nbsp;</td>
                                    <td>No. Kontrak</td>
                                    <td>:</td>
                                  </tr>
                                  <tr>
                                    <td>Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="4">&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td colspan="4" style="border-top:solid 1px black;">&nbsp;</td>
                                  </tr>
                                  
                                  <tr>
                                    <td colspan="4">
                                    <table cellspacing="0" cellpadding="2" align="center" width="100%">
                              			<thead>
                              				<tr>
                              					<th width="18%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">Nama Pemesan</th>
                           					  	<th width="15%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Tipe</th>
                           					  	<th width="12%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Warna</th>
                           					  	<th width="12%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">No Mesin</th>
                           					  	<th width="12%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">No Rangka</th>
                           					  	<th width="15%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Leasing</th>
                           					  	<th width="15%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Subsidi Leasing</th>
                           					  	<th width="20%" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Total</th>
                           				  </tr>
                              			</thead>
                              			<tbody>
                              				<c:set var="total" value="0"/>
		                                    <c:forEach items="${adapter.salesOrders}" var="line">
		                                    <tr>
		                                        <td style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;"><c:out value='${line.unitSalesOrder.customer.name}'/></td>
		                                        <c:forEach items="${line.unitSalesOrder.items}" var="item">
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${item.price.product.types}'/></td>
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${item.price.product.colors}'/></td>
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${item.price.serial}'/></td>
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${item.price.serialExt1}'/></td>
		                                        </c:forEach>
	                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.leasing}' pattern=',##0'/></td>
	                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.subdictionLeasing}' pattern=',##0'/></td>
	                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.leasing+line.subdictionLeasing}' pattern=',##0'/></td>
		                                        <%-- <c:if test="${adapter.billing.billingType.id==6}">
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.leasing}' pattern=',##0.00'/></td>
		                                        </c:if>
		                                        <c:if test="${adapter.billing.billingType.id==7}">
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.totalAfterPrepayment}' pattern=',##0.00'/></td>
		                                        </c:if>
		                                        <c:if test="${adapter.billing.billingType.id==8}">
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.subdictionLeasing}' pattern=',##0.00'/></td>
		                                        </c:if>
		                                        <c:if test="${adapter.billing.billingType.id==9}">
		                                        	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${line.mainDealer}' pattern=',##0.00'/></td>
		                                        </c:if> --%>
                              				<c:set var="total" value="${total+line.leasing+line.subdictionLeasing}"/>
		                                    </tr>
		                                    </c:forEach>
                              			</tbody>
	                                    <tr>
	                                    	<td colspan="7" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;"><strong>Total</strong></td>
	                                    	<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${total}' pattern=',##0'/></td>
	                                    </tr>
                              		</table>
                              		</td>
                                  </tr>
                                  
                                  <tr>
                                    <td colspan="4">&nbsp;</td>
                                  </tr>
                                  
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">${profile.organization.legend}, <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></div></td>
                                  </tr>
                                  
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">Hormat Kami</div></td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="2"><div align="center">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</div></td>
                                  </tr>
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
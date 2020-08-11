<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
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
		@import url("<c:url value='/assets/deliveryOrderReport.css'/>");
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
								<a class="item-button-back" href="<c:url value='/page/sparepartpurchaseorderpreedit.htm?id=${purchaseOrder_edit.id}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="in">
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td colspan="6" width="96%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td style="background: black" width="1%">&nbsp;</td>
								<tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="2" width="2%">&nbsp;</td>
									<td colspan="6" align="left" class="CSS3" width="96%"><strong>PURCHASE ORDER</strong></td>
									<td colspan="2" width="2%">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="40">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6">
									<table border="0" width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td width="16%" align="left">Date</td>
											<td width="1%">:</td>
											<td width="33"><fmt:formatDate value='${purchaseOrder_edit.date}' pattern='dd - MM - yyyy'/></td>
											<td width="16%" align="left">Shipping Method</td>
											<td width="1%">:</td>
											<td width="33"></td>
										</tr>
										<tr>
											<td align="left"> PO Number</td>
											<td width="1%">:</td>
											<td width="33"><c:out value='${purchaseOrder_edit.code}'/></td>
											<td align="left">Shipping Term</td>
											<td width="1%">:</td>
											<td width="33"><c:out value='${purchaseOrder_edit.shippingMethodType}'/></td>
										</tr>
										<tr>
											<td align="left">Payment Term</td>
											<td width="1%">:</td>
											<td width="33"><c:out value='${purchaseOrder_edit.paymentMethodType}'/></td>
											<td align="left">Insurance</td>
											<td width="1%">:</td>
											<td width="33"><c:out value='${purchaseOrder_edit.insuranceType}'/></td>
										</tr>
										<tr>
											<td align="left">Delivery Date</td>
											<td width="1%">:</td>
											<td width="33"></td>
											<td align="left">&nbsp;</td>
											<td width="1%">&nbsp;</td>
											<td width="33">&nbsp;</td>
										</tr>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6">
									<table border="0" width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<th align="left" width="33%">VENDOR : </th>
											<th align="left" width="33%">SHIP TO : </th>
											<th align="left" width="33%">BILL TO : </th>
										</tr>
										<tr valign="top">
											<td><c:out value='${purchaseOrder_edit.supplier.firstName} ${purchaseOrder_edit.supplier.middleName} ${purchaseOrder_edit.supplier.lastName}'/></td>
											<td><c:out value='${purchaseOrder_edit.requisition.shipTo.name}'/></td>
											<td><c:out value='${purchaseOrder_edit.requisition.billTo.party.firstName} ${purchaseOrder_edit.requisition.billTo.party.middleName} ${purchaseOrder_edit.requisition.billTo.party.lastName}'/></td>
										</tr>
										<tr valign="top">
											<td><c:out value='${purchaseOrder_edit.supplierAddress.address}'/></td>
											<td><c:out value='${purchaseOrder_edit.requisition.shipTo.postalAddress.address}'/></td>
											<td><c:out value='${purchaseOrder_edit.requisition.billTo.address}'/></td>
										</tr>
										<tr valign="top">
											<td><c:out value='${purchaseOrder_edit.supplierPhone.contact}'/></td>
										</tr>
										<tr valign="top">
											<td><c:out value='${purchaseOrder_edit.supplierFax.contact}'/></td>
										</tr>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10">&nbsp;</td></tr>
								<tr>
								<td colspan="2">&nbsp;</td>
								<td colspan="6">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<thead>
										<tr>
											<th align="center" style="border-right:solid 1px black; border-left:solid 1px black; border-bottom:solid 1px black; border-top:solid 1px black;">PRODUCT CODE</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">DESCRIPTION</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">QTY</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">UNIT</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">PRICE</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">SUB TOTAL</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">DISCOUNT 1</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">DISCOUNT 2</th>
											<th align="center" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;">AMOUNT</th>
										</tr>
										</thead>
										</tbody>
											<c:set var='t_sub' value='${0}'/>
											<c:forEach items='${purchaseOrder_edit.requisition.items}' var='item' varStatus='status'>
											<tr>
												<td width="12%" style="border-bottom:solid 1px black; border-left:solid 1px black; border-right:solid 1px black;">&nbsp;
											  <c:out value='${item.product.code}'/></td>
											  <td width="16%" style="border-bottom:solid 1px black; border-right:solid 1px black;">&nbsp;
										      <c:out value='${item.product.name}'/></td>
											  <td width="8%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><fmt:formatNumber value='${item.quantity}' pattern='#,###'/></td>
											  <td width="8%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="center"><c:out value='${item.productStandardPrice.product.unitOfMeasure.measureId}'/></td>
											  <td width="10%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount}' pattern='#,###'/></td>
											  <td width="11%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount*item.quantity}' pattern='#,###'/></td>
											  <td width="11%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount*item.quantity*item.discount1/100}' pattern='#,###'/></td>
											  <td width="13%" style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount*item.quantity*item.discount2/100}' pattern='#,###'/></td>
											  <td width="11%"style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount*item.quantity-(item.quantity*item.discount1+item.quantity*item.discount2)}' pattern='#,###'/></td>
											  <%-- <td width="11%"style="border-bottom:solid 1px black; border-right:solid 1px black;" align="right"><fmt:formatNumber value='${item.money.amount*item.quantity-(item.money.amount*item.quantity*item.discount1/100+item.money.amount*item.quantity*item.discount2/100)}' pattern='#,###'/></td> --%>
											</tr>
											<c:set var='t_sub' value='${t_sub+(item.money.amount*item.quantity-(item.quantity*item.discount1+item.quantity*item.discount2))}'/>
											<%-- <c:set var='t_sub' value='${t_sub+(item.money.amount*item.quantity-(item.money.amount*item.quantity*item.discount1/100+item.money.amount*item.quantity*item.discount2/100))}'/> --%>
											</c:forEach>
											<tr>
												<td colspan="8" align="right" style="border-right:solid 1px black;">Sub total&nbsp;</td>
												<td align="right" style="border-right:solid 1px black;"><fmt:formatNumber value='${t_sub}' pattern='#,###'/></td>
											</tr>
											<c:set var='tax' value='${0}'/>
											<c:if test='${not empty purchaseOrder_edit.tax}'>
											<tr>
												<td colspan="8" align="right" style="border-right:solid 1px black;"><c:out value='${purchaseOrder_edit.tax.taxName}'/>&nbsp;<fmt:formatNumber value='${purchaseOrder_edit.tax.taxRate}' pattern='##0'/> %&nbsp;</td>
												<td align="right" style="border-top:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${t_sub*purchaseOrder_edit.tax.taxRate*0.01}' pattern='#,###'/></td>
											</tr>
											<c:set var='tax' value='${t_sub*purchaseOrder_edit.tax.taxRate*0.01}'/>
											</c:if>
											<tr>
												<td colspan="8" align="right" style="border-right:solid 1px black;">Grand Total&nbsp;</td>
												<td align="right" style="border-right:solid 1px black; border-top:solid 1px black; border-bottom:solid 1px black;"><fmt:formatNumber value='${t_sub+tax}' pattern='#,###'/></td>
											</tr>
											<tr>
												<td colspan="4">
													<table class="CSS1" style="border:solid 1px black;" width="100%" border="0" cellpadding="0" cellspacing="0">
														<thead>
														<tr>
															<td align="center">Notes and Instructions</td>
														</tr>
														</thead>
														<tbody>
														<tr>
															<td>&nbsp;</td>
														</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr><td colspan="10">&nbsp;</td></tr>
											<tr>
												<td colspan="10">
													<table border="0" cellpadding="0" cellspacing="0" width="100%">
														<tr>
															<td align="left">Signature Approval :</td>
															<td>&nbsp;</td>
															<td align="left">Vendor's Aproval :</td>
														</tr>
														<tr>
															<td width="15%" height="66" style="border-bottom:solid 1px black;" valign="bottom" align="center" ></td>
															<td width="70">&nbsp;</td>
															<td width="15%" style="border-bottom:solid 1px black;" valign="bottom" align="center"></td>
														</tr>
														<tr>
															<td align="center"><c:out value='${purchaseOrder_edit.requisition.approver.firstName} ${purchaseOrder_edit.requisition.approver.middleName} ${purchaseOrder_edit.requisition.approver.lastName}'/></td>
															<td>&nbsp;</td>
															<td align="center"><c:out value='${purchaseOrder_edit.supplier.firstName} ${purchaseOrder_edit.supplier.middleName} ${purchaseOrder_edit.supplier.lastName}'/></td>
														</tr>
														<tr>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr><td colspan="9">&nbsp;</td></tr>
											<tr><td colspan="9" align="center">If you have any questions about your order, please contact <c:out value='${purchaseOrder_edit.createdBy.firstName} ${purchaseOrder_edit.createdBy.lastName} ${purchaseOrder_edit.createdBy.middleName}'/></td></tr>
										</tbody>
									</table>
									</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
								</table>
								<table border="0" width="100%" cellpadding="0" cellspacing="0" class="out">
								<tr>
									<td colspan="2">&nbsp;</td>
									<td colspan="6">Original : Vendor / Yellow : Finance / Blue : File / Red : Warehouse</td>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr><td colspan="10" height="22">&nbsp;</td></tr>
								<tr>
									<td style="background: black" width="1%">&nbsp;</td>
									<td width="1%">&nbsp;</td>
									<td colspan="6" width="94%">&nbsp;</td>
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

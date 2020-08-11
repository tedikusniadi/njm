<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html><head>
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
                                <a class="item-button-back" href="<c:url value='/page/refunddealerreportpreedit.htm?id=${refundDealerGroup.id}'/>"><span>Back</span></a>
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
								<div class="clears">&nbsp;</div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td colspan="7"><div align="center" class="CSS3" valign="middle"><strong>REFUND DEALER</strong></div></td>
                                </tr>
                                <tr>
                                	<td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3"><strong>
                                      <c:out value='${refundDealerGroup.organization.name}'/>
                                    </strong></td>
                                    <td>Nomor</td>
                                    <td colspan="2">:
                                    <c:out value='${refundDealerGroup.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3"><c:forEach items="${refundDealerGroup.organization.postalAddresses}" var="add">
                                      <c:out value='${add.address}'/>
                                    </c:forEach></td>
                                    <td>Tanggal</td>
                                    <td colspan="2">:
                                    <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="3">Telp.
                                      <c:forEach items="${refundDealerGroup.organization.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'PHONE'}">
                                            <c:out value='${con.contact} '/>
                                          </c:if>
                                        </c:forEach>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td colspan="7" style="border-bottom:solid 1px black;">Fax.
                                      <c:forEach items="${profile.organization.contactMechanisms}" var="con">
                                          <c:if test="${con.contactMechanismType == 'FAX'}">
                                            <c:out value='${con.contact} '/>
                                          </c:if>
                                      </c:forEach>
                                    </td>
                                  </tr>
                                  <tr><td colspan="5">&nbsp;</td></tr>
                                
                                <c:set var="total" value="0"/>
								<c:forEach items="${refundDealerGroup.details}" var="data" varStatus="status">
                                <c:set var="total" value="${total+data.unitSalesOrder.refundDealer.amount}"/>
								<tr>
									<th width="5%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;">No</th>
									<th width="17%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">No SPK</th>
									<th width="13%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Tanggal Surat Jalan</th>
									<th width="20%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Nama Konsumen</th>
									<th width="15%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Leasing</th>
									<th width="15%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Total</th>
									<th width="25%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">Tanggal Cair</th>
								</tr>
								<tr>
									<td align="left" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;"><c:out value='${status.count}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${data.unitSalesOrder.code}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatDate value="${data.deliveryOrder.date}" pattern='dd-MM-yyyy'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${data.unitSalesOrder.customer.name}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><c:out value='${data.unitSalesOrder.refundDealer.leasing.name}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatNumber value='${data.unitSalesOrder.refundDealer.amount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;"><fmt:formatDate value="${data.refundDealerGroup.date}" pattern='dd-MM-yyyy'/></td>
								</tr>
								<tr>
									<td colspan="5">&nbsp;</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="5" align="left"><strong>Total</strong></td>
									<td><strong><fmt:formatNumber value='${total}' pattern='#,###'/></strong></td>
									<td>&nbsp;</th>
								</tr>
								<tr>
									<th colspan="5">&nbsp;</th>
								</tr>
								<tr>
									<th colspan="5">
									<table width="100%" border="0">
                                      <tr>
                                        <td><div align="center">Penerima</div></td>
                                        <td><div align="center">Mengetahui</div></td>
                                        <td><div align="center">Hormat Kami</div></td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                      </tr>
                                      <tr>
                                        <td><div align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div></td>
                                        <td><div align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div></td>
                                        <td><div align="center">(&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;)</div></td>
                                      </tr>
                                    </table>
                                    </th>
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
								<c:remove var="total"/>
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
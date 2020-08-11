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
                                <a class="item-button-back" href="<c:url value='/page/bbnprintoutview.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <%-- <a class="item-button-export-xls" href="<c:url value='/page/bbnprintexcel.xls?id=${bbn_edit.id}'/>"><span>Export</span></a> --%>
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
                                    <td colspan="13"><div align="center" class="CSS3" valign="middle"><strong>PENGAJUAN BBN</strong></div></td>
                                </tr>
                                <tr>
                                    <td colspan="9"><strong>
                                      <c:out value='${profile.companyName}'/>
                                    </strong></td>
                                    <td>Nomor</td>
                                    <td colspan="3">:
                                    <c:out value='${bbn_edit.code}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="9"><c:out value='${profile.organization.fixAddress}'/></td>
                                    <td>Tanggal</td>
                                    <td colspan="3">:
                                    <fmt:formatDate value='${now}' pattern='dd MMMM yyyy'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="13">Telp. <c:out value='${profile.organization.fixPhone}'/></td>
                                  </tr>
                                  <tr>
                                    <td colspan="13" style="border-bottom:solid 1px black;">Fax. <c:out value='${profile.organization.fixFax}'/></td>
                                  </tr>
                                  <tr><td colspan="13">&nbsp;</td></tr>
								<c:set var="total" value="0"/>
								<c:set var="count" value="0"/>
								<c:forEach items="${datas}" var="data" varStatus="status">
								<tr>
									<th colspan="13" align="left" style="font-size: 11px"><c:out value="${data.salesItem.unitSalesOrder.customer.name}"/> - <c:forEach items="${data.salesItem.unitSalesOrder.customer.postalAddresses}" var="add"><c:out value='${add.address}'/></c:forEach></th>
								</tr>
								<tr>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;" nowrap="nowrap">No SPK</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Nama STNK</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Wilayah Samsat</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Tipe</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">No Mesin</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">No Rangka</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Notice</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Jasa</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Acc Tahun</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Stck</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Biaya 1</th>
									<th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Biaya 2</th>
									<th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap">Total</th>
								</tr>
								<tr>
									<td align="left" style="border-bottom:solid 1px black;border-right:solid 1px black;border-left:solid 1px black;" nowrap="nowrap"><c:out value='${data.salesItem.unitSalesOrder.code}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><c:out value='${data.salesItem.unitSalesOrder.customerUnit.name}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><c:forEach items="${data.salesItem.unitSalesOrder.customer.postalAddresses}" var="add"><c:out value='${add.subdistrict.parent.name}'/></c:forEach></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><c:out value='${data.salesItem.product.types}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><c:out value='${data.itemDetail.serial}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><c:out value='${data.itemDetail.serialExt1}'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.noticeAmount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.serviceAmount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.accAmount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.stckAmount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.otherAmount}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.otherAmountTwo}' pattern='#,###'/></td>
									<td style="border-bottom:solid 1px black;border-right:solid 1px black;" nowrap="nowrap"><fmt:formatNumber value='${data.bbnDetail.noticeAmount+data.bbnDetail.serviceAmount+data.bbnDetail.accAmount+data.bbnDetail.otherAmount+data.bbnDetail.stckAmount+data.bbnDetail.otherAmountTwo}' pattern='#,###'/></td>
									<c:set var="total" value="${total+data.bbnDetail.noticeAmount+data.bbnDetail.serviceAmount+data.bbnDetail.accAmount+data.bbnDetail.otherAmount+data.bbnDetail.stckAmount+data.bbnDetail.otherAmountTwo}"/>
									<c:set var="count" value="${count+1}"/>
								</tr>
								<tr>
									<td colspan="13">&nbsp;</td>
								</tr>
								</c:forEach>
								<tr>
									<th colspan="13"><div align="right">Total&nbsp;:&nbsp;<fmt:formatNumber value='${total}' pattern='#,###'/></div></th>
								</tr>
								<tr>
								  <td colspan="13" align="left">&nbsp;</td>
								  </tr>
								<tr>
									<td colspan="13" align="left">Telah diterima ${count} <b id='count'></b> <script>var num = new Number(${count});num.toText();document.getElementById('count').innerHTML = '('+num.toText()+')';</script> buah faktur dan uang sejumlah <fmt:formatNumber value='${total}' pattern='#,###'/> <b id='total'></b> <script>var numTotal = new Number(${total});numTotal.toText();document.getElementById('total').innerHTML = '('+numTotal.toText()+')';</script> untuk biaya pengurusan STNK dan BPKB</td>
								</tr>
								<tr>
									<th colspan="13">&nbsp;</th>
								</tr>
								<tr>
									<th colspan="13"><table width="100%" border="0">
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
                                    </table></th>
								</tr>
								
								
								
								<c:remove var="total"/>
								<c:remove var="count"/>
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
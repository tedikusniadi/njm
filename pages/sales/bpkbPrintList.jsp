<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Printout</title>
	<style type="text/css" media="screen">
		@import url("css/report-normal.css");
    </style>
    
    <style type="text/css" media="print">
		@import url("<c:url value='/css/print-normal.css'/>");
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
							<h1 class="page-title">${pageTitle}<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/bpkbprintoption.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/bpkbprintexcelview.xls?status=${status}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy' />&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy' />"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
	                            <c:if test="${status == '1'}">
	                            	<div class="report" align="center"><strong>LAPORAN PENYERAHAN BPKB</strong></div>
	                            </c:if>
	                            <c:if test="${status == '2'}">
	                            	<div class="report" align="center"><strong>LAPORAN PENERIMAAN BPKB</strong></div>
	                            </c:if>
                                <div class="clears">&nbsp;</div>
                                <table width="100%"  cellpadding="4" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;">Tgl SPK</th>
                                  	<th align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
                                  	<th align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
                                  	<th align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;">No SJ</th>
                                  	<th align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;">Tgl SJ</th>
                               	  	<th align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
                               	  	<th align="left" width="12%" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
                               	  	<th align="left" width="15%" style="border-bottom:1px solid black;border-top:1px solid black;">Alamat STNK</th>
                               	  	<th align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;">Telp STNK</th>
                               	  	<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
                               	  	<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
                               	  	<th align="left" width="10%" style="border-bottom:1px solid black;border-top:1px solid black;">No Polisi</th>
                               	  	<th align="left" width="8%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">No BPKB</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='bpkb'>
                                <tr>
                               		<td style="border-bottom:1px solid black;border-left:1px solid black;"><fmt:formatDate value='${bpkb.sales.date}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.sales.code}'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.sales.salesPerson.name}'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.deliveryItemDetail.deliveryOrderItem.deliveryOrder.code}'/></td>
                                    <td style="border-bottom:1px solid black;"><fmt:formatDate value='${bpkb.deliveryItemDetail.deliveryOrderItem.deliveryOrder.date}' pattern='dd-MM-yyyy'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.sales.customer.name}'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.sales.customerUnit.name}'/></td>
                                    <td style="border-bottom:1px solid black;">
                                    	<c:forEach items="${bpkb.sales.customerUnit.postalAddresses}" var="address">
                                    		<c:out value='${address.address}'/>
                                    	</c:forEach>
                                    </td>
                                    <td style="border-bottom:1px solid black;">
                                    	<c:forEach items="${bpkb.sales.customerUnit.contactMechanisms}" var="contact">
                                    		<c:if test="${contact.contactMechanismType == 'PHONE'}">
                                    			<c:out value='${contact.contact}'/>
                                    		</c:if>
                                    	</c:forEach>
                                    </td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.deliveryItemDetail.serial}'/></td>
                                    <td style="border-bottom:1px solid black;"><c:out value='${bpkb.deliveryItemDetail.serialExt1}'/></td>
                                    <c:forEach items='${bpkb.priceDetail}' var='detail'>
                                    	<c:if test="${detail.referenceType == 'PLAT'}"><td style="border-bottom:1px solid black;"><c:out value='${detail.referenceNo}'/></td></c:if>
                                    </c:forEach>
                                    <c:forEach items='${bpkb.priceDetail}' var='detail'>
                                    	<c:if test="${detail.referenceType == 'BPKB'}"><td style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${detail.referenceNo}'/></td></c:if>
                                    </c:forEach>
                                </tr>
                                </c:forEach>
                                </tbody>
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

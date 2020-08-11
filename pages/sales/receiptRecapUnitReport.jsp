<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${param.ho eq 'true'?title:fn:substring(title, 0,fn:length(title)-2)}</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
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
				<td width="60%">${param.ho eq 'true'?breadcrumb:fn:substring(breadcrumb, 0,fn:length(breadcrumb)-2)}</td>
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
							 <h1 class="page-title">${param.ho eq 'true'?pageTitle:fn:substring(pageTitle, 0,fn:length(pageTitle)-2)}<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/receiptrecapunitreportprepare.htm?ho=${param.ho}'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/receiptrecapunitreportexcel.xls?ho=${param.ho}&org=${organization.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy' />&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy' />"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>PROCUREMENT FROM UNDV (UNIT NOTA DEBET VERIFICATION) REPORT</strong></div>
                            	</br>
                                <div class="report">
                                   <table width="498">	
                                    <tr>	
                                        <td width="100"><strong>Company</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100"><strong>Period</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344"><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <div style="overflow:auto;">
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table" style="WIDTH:100%;">
                                <thead>
                                <tr style="height: 30px">
                                  <th width="8%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal</th>
                                  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Supplier</th>
                                  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nomor</th>
                                  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No. Nota Debet</th>
                                  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No. Sales Order</th>
                                  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
                               	  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
                               	  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
                               	  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
                               	  <th width="15%" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun Rakit</th>
                               	  <c:if test="${param.ho==true}">
                            	  	<th width="15" nowrap="nowrap" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Harga Beli</th>
                               	  </c:if>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'> 
                                	<tr>
                                		<td colspan="11" nowrap="nowrap"><strong><c:out value='${report.org.name}'/></strong></td>
                                	</tr>
	                                <c:forEach items='${report.datas}' var='data'>
		                                <c:forEach items="${data.items}" var="item">
			                                <c:forEach items="${item.details}" var="detail">
			                                <tr>
				                                <td nowrap="nowrap" align="left"><fmt:formatDate value='${data.invoice.date}' pattern='dd-MM-yyyy'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${data.invoice.purchaseOrder.supplier.name}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${data.invoice.code}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${data.invoice.invoice}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${data.invoice.salesOrderNo}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${item.warehouseTransactionItem.product.types}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${detail.serial}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${detail.serialExt1}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${item.warehouseTransactionItem.product.colors}'/></td>
				                                <td nowrap="nowrap" align="left"><c:out value='${detail.year}'/></td>
			                                	<c:if test="${param.ho==true}">
	                                				<td align="left"><fmt:formatNumber value='${item.product.buyingPrice.money.amount}' pattern='#,###.00'/></td>
	                                			</c:if>
			                                </tr>
			                                </c:forEach>
										</c:forEach>
									</c:forEach>
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
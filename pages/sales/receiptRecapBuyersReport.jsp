<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
								<a class="item-button-back" href="<c:url value='/page/receiptrecapreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/receiptrecapreportexcel.xls?org=${organization.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy' />&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy' />&billingType=${type}&receipt=${receipt}"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>UNIT BILLING REPORT</strong></div>
                            	</br>
                                <div class="report">
                                   <table width="498">	
                                    <tr>	
                                        <td width="100"><strong>Company</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/>
                                        </td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100"><strong>Period</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344"><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' />
                                        </td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <div style="overflow:auto;">
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table" style="WIDTH:2100px;">
                                <thead>
                                <tr style="height:30px">
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Date</th>
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Number</th>
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama Pemesan</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama STNK</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tipe</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Warna</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Rangka</th>
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No Mesin</th>
                                  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tahun</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Jumlah Bayar</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal Receipt</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Referensi</th>
                               	  <th width="10" nowrap="true" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='rep'>
                                	<tr>
                                		<td colspan="15" nowrap="nowrap" style="border-bottom:1px solid black;"><strong><c:out value='${rep.org.name}'/></strong></td>
                                	</tr>
                                	<c:forEach items='${rep.datas}' var='report'>
	                                <tr>
		                                <c:if test="${report.billing.status == 'PAID'}">
			                                <td align="left" nowrap="true"><fmt:formatDate value='${report.billing.date}' pattern='dd-MM-yyyy'/></td>
			                                <td align="left" nowrap="true"><c:out value='${report.billing.code}'/></td>
			                                <td align="left" nowrap="true"><c:out value='${report.do.deliveryPlanningSequence.deliveryPlanning.planable.code}'/></td>
			                                <td align="left" nowrap="true"><c:out value='${report.do.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${report.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${report.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}'/></td>
			                                <td align="left" nowrap="true"><c:out value='${report.billing.unitSalesOrder.customerUnit.name}'/></td>
			                                <td align="left" nowrap="true"><c:out value='${report.billing.unitSalesOrder.salesPerson.name}'/></td>
			                                <c:forEach items="${report.do.items}" var="line">
			                                	<c:forEach items="${line.details}" var="detail">
			                                		<c:if test="${line.sequenced}">
				                                    	<td align="left" nowrap="true"><c:out value='${line.item.sequenceable.product.types}'/></td>
				                                    	<td align="left" nowrap="true"><c:out value='${line.item.sequenceable.product.colors}'/></td>
				                                    	<td align="left" nowrap="true"><c:out value='${detail.serialExt1}'/></td>
				                                    	<td align="left" nowrap="true"><c:out value='${detail.serial}'/></td>
				                                    	<td align="left" nowrap="true"><c:out value='${detail.year}'/></td>
				                                    </c:if>
				                                </c:forEach>
				                            </c:forEach>
			                                <td align="left" nowrap="true"><fmt:formatNumber value='${report.billing.amount}' pattern='#,###'/></td>
			                                <td colspan="3">&nbsp;</td>
		                                	<c:if test="${receipt}">
			                                    <c:forEach items="${report.billing.payments}" var="payment">
			                                    <tr>
			                                    	<td colspan="12" style="border-bottom:1px solid black;">&nbsp;</td>
			                                     	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><fmt:formatDate value='${payment.receipt.date}' pattern='dd-MM-yyyy'/></td>
			                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${payment.receipt.code}'/></td>
		                                			<td align="left" nowrap="true" style="border-bottom:1px solid black;"><fmt:formatNumber value='${payment.paidAmount}' pattern='#,###'/></td>
			                                    </c:forEach>
		                                	</c:if>
		                                </c:if>
		                                <c:if test="${report.billing.status == 'UNPAID'}">
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><fmt:formatDate value='${report.billing.date}' pattern='dd-MM-yyyy'/></td>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${report.billing.code}'/></td>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${report.do.deliveryPlanningSequence.deliveryPlanning.planable.code}'/></td>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${report.do.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${report.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${report.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}'/></td>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${report.billing.unitSalesOrder.customerUnit.name}'/></td>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${report.billing.unitSalesOrder.salesPerson.name}'/></td>
			                                <c:forEach items="${report.do.items}" var="line">
			                                	<c:forEach items="${line.details}" var="detail">
			                                		<c:if test="${line.sequenced}">
				                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${line.item.sequenceable.product.types}'/></td>
				                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${line.item.sequenceable.product.colors}'/></td>
				                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${detail.serialExt1}'/></td>
				                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${detail.serial}'/></td>
				                                    	<td align="left" nowrap="true" style="border-bottom:1px solid black;"><c:out value='${detail.year}'/></td>
				                                    </c:if>
				                                </c:forEach>
				                            </c:forEach>
			                                <td align="left" nowrap="true" style="border-bottom:1px solid black;"><fmt:formatNumber value='${report.billing.amount}' pattern='#,###'/></td>
			                                <td colspan="3" style="border-bottom:1px solid black;">&nbsp;</td>
		                                </c:if>
	                                </tr>
	                                </c:forEach>
                                <tr colspan="15" style="border-bottom:1px solid black;">&nbsp;</tr>
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

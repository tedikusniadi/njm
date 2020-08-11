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
								<a class="item-button-back" href="<c:url value='/page/receiptrecapotherreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/receiptrecapotherreportexcel.xls?org=${organization.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy' />&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy' />&referenceFrom=${referenceFrom}&referenceDetail=${referenceDetail}"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>MANUAL BILLING REPORT</strong></div>
                            	</br>
                                <div class="report">
                                   <table width="498">	
                                   <c:choose>
                                   <c:when test="${referenceFrom!='0'}">
                                   <tr>	
                                        <td width="100"><strong>Reference Type</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${referenceFrom}'/></td>
                                    </tr>
                                    <tr>
                                    <td width="100"><strong>Type</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                    	<td width="344" ><c:out value='${referenceDetail}'/></td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    <tr>	
                                        <td width="100"><strong>Reference Type</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='All'/></td>
                                    </tr>
                                    <tr>
                                    <td width="100"><strong>Type</strong></td>
                                        <td width="11">:&nbsp;&nbsp;</td>
                                    	<td width="344" ><c:out value='All'/></td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
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
                                  <th width="10" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal</th>
                                  <th width="70" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Sales</th>
                                  <th width="70" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nomor</th>
                                  <th width="70" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Jenis</th>
                               	  <th width="60" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">No SPK</th>
                               	  <th width="70" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Nama</th>
                               	  <th width="40" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Jumlah Bayar</th>
                               	  <th width="60" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Tanggal Bayar</th>
                               	  <th width="60" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Keterangan</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='report'> 
                                <tr>
                                <td align="left"><fmt:formatDate value='${report.date}' pattern='dd-MM-yyyy'/></td>
                                <td align="left"><c:out value='${report.sales.name}'/></td>
                                <td align="left"><c:out value='${report.code}'/></td>
                                <td align="left"><c:out value='${report.referenceFrom}'/></td>
                                <td align="left"><c:out value=''/></td>
                                <td align="left"><c:out value='${report.customer.name}'/></td>
                                <td align="left"><fmt:formatNumber value='${report.amount}' pattern='#,###.00'/></td>
                                <td align="left"><fmt:formatDate value='${report.date}' pattern='dd-MM-yyyy'/></td>
                                <td align="left"><c:out value='${report.note}'/></td>
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

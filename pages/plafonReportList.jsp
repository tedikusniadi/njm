<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Plafon Account</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		@import url("css/report-normal.css");
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
				<td width="60%">Financial Accounting > Report > Financial Accounting > Plafon Account Report</td>
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
							<h1 class="page-title">RF83 - Plafon Account<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/plafonreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/plafonreportexcell.xls?org=${organization.id}&plafon=${plafon.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report" align="center"><strong>PLAFON ACCOUNT REPORT</strong></div>
                                <div class="report">
                                    <table width="498">	
                                    <tr>	
                                        <td width="100" >Company</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" >Plafon</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${plafon.name}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" >Period</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><fmt:formatDate value='${from}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${to}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="10%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;border-left:1px solid black;border-right:1px solid black;">Date</th>
                                  	<th width="20%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Description</th>
                                  	<th width="25%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Reference No</th>
                                  	<th width="15%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Debit</th>
                               	  	<th width="15%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Credit</th>
                               	  	<th width="15%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="total" value="0"/>
                                <tr>
                                    <td align="left" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${plafon.validFrom}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left" style="border-bottom:1px solid black;" colspan="4">Opening Limit Plafon</td>
                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${plafon.plafon}' pattern=',##0.00'/></td>
                                </tr>
                                <c:forEach items='${reports}' var='report'>
                                	<c:forEach items='${report.verifications}' var='ver'>
                                	<tr>
                                		<td align="left" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${ver.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td align="left" style="border-bottom:1px solid black;border-right:1px solid black;">Unit Invoice Verification</td>
	                                    <td align="left" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${ver.code}'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='0' pattern=',##0.00'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${ver.amount}' pattern=',##0.00'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='-${ver.amount}' pattern=',##0.00'/></td> 
                                    </tr>
                                    </c:forEach>
                                    <c:forEach items='${report.plafonDebits}' var='plaf'>
                                	<tr>
                                		<td align="left" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${plaf.date}' pattern='dd-MM-yyyy'/></td>
	                                    <td align="left" style="border-bottom:1px solid black;border-right:1px solid black;">Plafon Debit</td>
	                                    <td align="left" style="border-bottom:1px solid black;border-right:1px solid black;"><c:out value='${plaf.code}'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${plaf.amount}' pattern=',##0.00'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='0' pattern=',##0.00'/></td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${plaf.amount}' pattern=',##0.00'/></td> 
                                    </tr>
                                    </c:forEach>
	                                <tr>
	                                    <td align="left" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
	                                    <td align="left" style="border-bottom:1px solid black;" colspan="4">Plafon Account</td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${report.plafonAccount}' pattern=',##0.00'/></td>
	                                </tr>
	                                <tr>
	                                    <td align="left" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;"><fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
	                                    <td align="left" style="border-bottom:1px solid black;" colspan="4">Available</td>
	                                    <td align="right" style="border-bottom:1px solid black;border-right:1px solid black;"><fmt:formatNumber value='${report.available}' pattern=',##0.00'/></td>
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

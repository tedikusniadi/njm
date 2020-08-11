<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>AP Ageing Detail</title>
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
				<td width="60%">Financial Accounting > Account Payable > Report > AP Ageing Detail </td>
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
							<h1 class="page-title">F55 - AP Ageing Detail<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/apageingdetailpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/apageingdetailexcell.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<div class="report"><strong>REPORT AP AGEING DETAIL</strong></div>
                                <div class="clears">&nbsp;</div>
                                <div class="report">
                                    <table width="498">	
                                    <tr>	
                                        <td width="100" >Company</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
                                    </tr>
                                    <tr>	
                                        <td width="100" >Period</td>
                                        <td width="11" >:&nbsp;&nbsp;</td>
                                        <td width="344" ><fmt:formatDate value='${criteria.date}' pattern='dd MMM yyyy' /></td>			  
                                    </tr>
                                    </table>
                                </div>
                                <div class="clears">&nbsp;</div>
								<c:forEach items='${reports}' var='report'>
                                <table border="0" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th width="9%" align="left"><c:out value='${report.supplier.code} - ${report.supplier.firstName} ${report.supplier.middleName} ${report.supplier.lastName}'/></th>
                                </tr>
                                </thead>
                                </table>
                                <table width="100%"  cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th width="9%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Date</th>
                                    <th width="18%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Ref No.</th>
                                    <th width="9%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Due Date</th>
                               	 	<th width="10%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Balance</th>
           	  	  	  	  	  	  <th width="11%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;" rowspan="2">Not Yet Due</th>
                   	  	  	  	  	<th align="center" style="border-top:1px solid black;" colspan="4">Over Due</th>
                                </tr>
                                <tr>
                                    <th width="11%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">0-30 Days</th>
                           	  	  	<th width="11%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">31-60 Days</th>
                   	  	 	  	  	<th width="11%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">61-90 Days</th>
                       	  	  	  	<th width="10%" align="right" style="border-bottom:1px solid black;border-top:1px solid black;">&#8250; 90 Days</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var='t_balance' value='${0}'/>    
                                <c:set var='t_not' value='${0}'/>
                                <c:set var='t_one' value='${0}'/>
                                <c:set var='t_two' value='${0}'/>
                                <c:set var='t_three' value='${0}'/>
                                <c:set var='t_more' value='${0}'/>
                                <c:forEach items='${report.verifications}' var='ver'>
                                <tr>
                                    <td align="left"><fmt:formatDate value='${ver.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${ver.code}'/></td>
                                    <td align="left"><fmt:formatDate value='${ver.dueDate}' pattern='dd-MM-yyyy'/></td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                        <c:set var='t_balance' value='${t_balance+ver.unpaid}'/>    
                                    </td>
                                    <td align="right">
                                    	<c:if test='${ver.dueDate >= criteria.date}'>
                                        	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                            <c:set var='t_not' value='${t_not+ver.unpaid}'/>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${ver.dueDate >= start30 and ver.dueDate <= end30}'>
                                        	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                            <c:set var='t_one' value='${t_one+ver.unpaid}'/>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${ver.dueDate >= start60 and ver.dueDate <= end60}'>
                                        	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                            <c:set var='t_two' value='${t_two+ver.unpaid}'/>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${ver.dueDate >= start90 and ver.dueDate <= end90}'>
                                        	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                            <c:set var='t_three' value='${t_three+ver.unpaid}'/>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${ver.dueDate <= start120}'>
                                        	<fmt:formatNumber value='${ver.unpaid}' pattern=',##0.00'/>
                                            <c:set var='t_more' value='${t_more+ver.unpaid}'/>
                                        </c:if>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                	<td style="border-top:1px solid black;" colspan="3"><strong>Total</strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_balance}' pattern=',##0.00'/></strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_not}' pattern=',##0.00'/></strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_one}' pattern=',##0.00'/></strong></td>
                                   	<td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_two}' pattern=',##0.00'/></strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_three}' pattern=',##0.00'/></strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_more}' pattern=',##0.00'/></strong></td>
                                </tr>
                                <tr>
                                	<td style="border-top:1px solid black;" colspan="4"><strong>Percentage</strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_not/t_balance*100}' pattern=',##0.00'/>%</strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_one/t_balance*100}' pattern=',##0.00'/>%</strong></td>
                                   	<td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_two/t_balance*100}' pattern=',##0.00'/>%</strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_three/t_balance*100}' pattern=',##0.00'/>%</strong></td>
                                    <td style="border-top:1px solid black;" align="right"><strong><fmt:formatNumber value='${t_more/t_balance*100}' pattern=',##0.00'/>%</strong></td>
                                </tr>
                                </tfoot>
                                </table>
                                <c:remove var='t_balance'/>    
                                <c:remove var='t_not'/>
                                <c:remove var='t_one'/>
                                <c:remove var='t_two'/>
                                <c:remove var='t_three'/>
                                <c:remove var='t_more'/>
                                <div class="clears">&nbsp;</div>
                                </c:forEach>
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

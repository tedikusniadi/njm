<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Pre Posting Trial Balance</title>
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
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
	<div class="area" dojoType="Container" id="quick_link_container">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Reports > Financial Accounting > Accounting > Pre Posting Trial Balance Report</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
		</table>
	 </div>
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

						<div class="area" dojoType="Container" id="quick_link_container">
						
							<h1 class="page-title">RF68 - Pre Posting Trial Balance Report<br></h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/prepostingtrialbalancereportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  			<a class="item-button-export-xls" href="<c:url value='/page/prepostingtrialbalancereportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
                                <div class="pageTitle">Pre Posting Trial Balance</div>
                                <br/>
                                <table width="481">
                                <tr >
                                    <td width="100">Period</td>
                                    <td width="10">:</td>
                                    <td width="355">
                                        <c:forEach items='${criteria.accountingPeriods}' var='period'>
                                            <c:out value='${period.name}'/>,
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr >			  
                                    <td>Company</td>
                                    <td>:</td>
                                    <td>
                                        <c:forEach items='${criteria.organizations}' var='org'>
                                            <c:out value='${org.firstName} ${org.middleName} ${org.lastName}'/>,
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
                                <br/>

                                <table cellpadding="3" width="100%" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <td rowspan="2" colspan="2" align="center" valign="top" style="border:1px solid black;height:28px;">Account</td>
                                  	<td width="15%" rowspan="2" align="center" valign="top" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black; height:28px;">Opening Balance</td>
                                	<td style="border-bottom:1px solid black;border-top:1px solid black;" colspan="2" align="center" ><div class="adjust">Trial Balance</div></td>
                                    <td width="15%" rowspan="2" align="center" valign="top" style="border:1px solid black;height:28px;">Ending Balance</td>
                                </tr>                               
                          		<tr >
                                    <td width="15%" align="center" style="border-bottom:1px solid black;border-right:1px solid black;" class="tenPersen1">Debit</td>	
                               	  	<td width="15%" align="center" style="border-bottom:1px solid black;" class="tenPersen2">Credit</td>
                                </tr>
                                </thead>
                                <c:set var='opening' value='${0}'/>
                                <c:set var='ending' value='${0}'/>
                                <tbody>
                                <c:forEach items='${adapter.reports}' var='report'>
                                <tr>
                                    <td width="7%"><c:out value="${report.account.code}"/></td>
                                    <td width="33%"><c:out value="${report.account.name}"/></td>
<td align="right" >
                                        <c:if test='${report.opening >= 0}'>
                                        	<fmt:formatNumber value='${report.opening}' groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${report.opening < 0}'>
                                        	(<fmt:formatNumber value='${report.opening*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>	
                                    <td align="right" >
                                    	<fmt:formatNumber value='${report.debet}' groupingUsed='true' pattern=',##0.00'/>
                                    </td>
                                    <td align="right" >
                                    	<fmt:formatNumber value='${report.credit}' groupingUsed='true' pattern=',##0.00'/>
                                  	</td>
                                    <td align="right" >
                                        <c:if test='${report.opening+report.debet-report.credit >= 0}'>
                                        	<fmt:formatNumber value='${report.opening+report.debet-report.credit}' groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${report.opening+report.debet-report.credit < 0}'>
                                        	(<fmt:formatNumber value='${(report.opening+report.debet-report.credit)*-1}' groupingUsed='true' pattern=',##0.00'/>)                                        </c:if>
                                    </td>
                                </tr>
                                <c:set var='opening' value='${opening+report.opening}'/>
                                <c:set var='ending' value='${ending+(report.opening+report.debet-report.credit)}'/>
                                </c:forEach> 
                                </tbody>
                                <tfoot>                
                                <tr>
                                    <td height="29" align="right" colspan="2"><strong>Total :</strong></td>
	  								<td  align="right">
                                    	<strong>
                                    	<c:if test='${opening >= 0}'>
                                        	<fmt:formatNumber value="${opening}" groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${opening < 0}'>
                                        	(<fmt:formatNumber value="${opening*-1}" groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                    </td>
                                    <td  align="right">
                                    	<strong>
                                    	<fmt:formatNumber value="${adapter.totalDebet}" groupingUsed='true' pattern=',##0.00'/>
                                    	</strong>
                                    </td>	
                                    <td  align="right">
                                    	<strong>
                                    	<fmt:formatNumber value="${adapter.totalCredit}" groupingUsed='true' pattern=',##0.00'/>
                                    	</strong>
                                    </td>
                                    <td align="right">
                                    	<strong>
                                    	<c:if test='${ending >= 0}'>
                                        	<fmt:formatNumber value="${ending}" groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${ending < 0}'>
                                        	(<fmt:formatNumber value="${ending*-1}" groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>  
                                        </strong>                                  	
                                    </td>
                                </tr>
                                </tfoot>
                                </table>
                                <br>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Post Closing Trial Balance</title>
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
			<td width="60%">Reports > Financial Accounting > Accounting > Post Closing Trial Balance Report</td>
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
						
							<h1 class="page-title">RF63 - Post Closing Trial Balance Report<br></h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/postclosingtrialbalancereportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
					  			<a class="item-button-export-xls" href="<c:url value='/page/postclosingtrialbalancereportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
                                <div class="pageTitle"><strong class="margin-left">Post Closing Trial Balance</strong></div>
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
                                <div class="clears">&nbsp;</div>
                                <table width="100%" border="0" cellpadding="1" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th rowspan="2" colspan="2" align="center" valign="top" style="border:1px solid black;height:28px;">Account</th>
                               	  	<th width="15%" rowspan="2" align="center" valign="top" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black; height:28px;">Opening Balance</th>
                               	  	<th style="border-bottom:1px solid black;border-top:1px solid black;" colspan="2" align="center" >Trial Balance</th>
                                    <th width="15%" rowspan="2" align="center" valign="top" style="border:1px solid black;height:28px;">Ending Balance</td>
                                </tr>                               
                          		<tr>
                                    <th width="15%" align="center" style="border-bottom:1px solid black;border-right:1px solid black;">Debit</th>	
                                	<th width="15%" align="center" style="border-bottom:1px solid black;">Credit</th>
                                </tr>
                                </thead>
                                <c:set var='opening' value='${0}'/>
                                <c:set var='ending' value='${0}'/>
                                <c:forEach items='${adapter.reports}' var='rp'>
                                <tr>
                                	<td width="7%"><c:out value="${rp.account.code}"/></td>	
                                  	<td width="33%"><c:out value="${rp.account.name}"/></td>
	  								<td align="right" >
                                    	<c:if test='${rp.opening >= 0}'>
                                        	<fmt:formatNumber value='${rp.opening}' groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${rp.opening < 0}'>
                                        	(<fmt:formatNumber value='${rp.opening*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>                                    
                                    <td align="right" >
                                    	<fmt:formatNumber value='${rp.debet}' pattern=',##0.00'/>
                                  	</td>
                                    <td align="right" >
                                    	<fmt:formatNumber value='${rp.credit}' pattern=',##0.00'/>
                                  	</td>
                                    <td align="right" >
                                    	<c:if test='${rp.opening+(rp.debet-rp.credit) >= 0}'>
                                        	<fmt:formatNumber value='${rp.opening+(rp.debet-rp.credit)}' pattern=',##0.00'/>
                                        </c:if>
                                    	<c:if test='${rp.opening+(rp.debet-rp.credit) < 0}'>
                                        	(<fmt:formatNumber value='${(rp.opening+rp.debet-rp.credit)*-1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                <c:set var='opening' value='${opening+rp.opening}'/>
                                <c:set var='ending' value='${ending+(rp.opening+rp.debet-rp.credit)}'/>
                                </c:forEach>                    
                                <tr>
                                    <td colspan="2" align="right"><strong>Total :</strong></td>
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
                                    </td>	
                                    <td  align="right">
                                    	<strong>
                                    	<fmt:formatNumber value="${adapter.totalCredit}" groupingUsed='true' pattern=',##0.00'/>
                                        </strong>
                                    </td>
                                    <td  align="right">
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
                                </table>
                                <c:remove var='opening'/>
                                <c:remove var='ending'/>
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

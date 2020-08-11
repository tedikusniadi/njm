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
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
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
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

						<div class="area" dojoType="Container" id="quick_link_container">
						
							<h1 class="page-title">${pageTitle}<br></h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/trialbalancereportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/trialbalancereportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
                                <div class="pageTitle"><strong class="margin-left">Trial Balance</strong></div>
                                <div class="clears">&nbsp;</div>
                                <table width="481">
                                <tr >
                            		<td width="100">Period</td>
                                	<td width="10">:</td>
                                	<td width="355"><c:forEach items='${criteria.accountingPeriods}' var='period'>${period.name},</c:forEach></td>
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

                                <table width="100%" border="0" cellpadding="3" cellspacing="0" class="report-table">
                              	<tr>
                                    <td rowspan="2" colspan="2" align="center" valign="top" style="border:1px solid black;">Account</td>
           	  	  	    	  	  	<td align="center" style="border-right:1px solid black;border-top:1px solid black;">Begining Balance</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black; border-right:1px solid black;border-top:1px solid black;">Trial Balance</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black;border-top:1px solid black;">Adjustment</td>				
                                	<td align="center" style="border-left:1px solid black;border-top:1px solid black;border-right:1px solid black;">Ending Balance</td>
                                </tr>
                                <tr>
                                	<td width="13%" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>	
                           	  	  	<td width="12%" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>	
                                  	<td width="12%" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Credit</td>
                               	  	<td width="12%" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>
                                    <td width="12%" align="center" style="border-bottom:1px solid black;">Credit</td>
                           	  	  	<td width="13%" align="center" style="border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">&nbsp;</td>
                                </tr>       
                                <c:set var='__opening__' value='0'/>
                                <c:set var='d_non' value='0'/>
                                <c:set var='c_non' value='0'/>
                                <c:set var='d_adj' value='0'/>
                                <c:set var='c_adj' value='0'/>
                                <c:set var='__closing__' value='0'/>
                                <c:forEach items='${adapter.reports}' var='report'>                                
                                <tr>
                               	  	<td width="6%"><c:out value='${report.account.code}'/></td>
                               	  	<td width="20%"><c:out value='${report.account.name}'/></td>	
                                    <td align="right">
                                        <c:if test='${report.opening >= 0}'>
                                          <fmt:formatNumber value='${report.opening}' pattern=",##0.00"/>
                                        </c:if>
                                        <c:if test='${report.opening < 0}'>
                                          (<fmt:formatNumber value='${report.opening*-1}' pattern=",##0.00"/>)
                                        </c:if>
                                    </td>
                                    <td align="right">
                                        <fmt:formatNumber value='${report.debet}' pattern=",##0.00"/>
                                        <c:set var='d_non' value='${d_non+report.debet}'/>
                                    </td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${report.credit}' pattern=",##0.00"/>
                                        <c:set var='c_non' value='${c_non+report.credit}'/>
                                    </td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${report.adjustmentdebet}' pattern=",##0.00"/>
                                        <c:set var='d_adj' value='${d_adj+report.adjustmentdebet}'/>
                                    </td>
                                    <td align="right">
                                    	<fmt:formatNumber value='${report.adjustmentcredit}' pattern=",##0.00"/>
                                        <c:set var='c_adj' value='${c_adj+report.adjustmentcredit}'/>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${report.closing >= 0}'>
	                                    	<fmt:formatNumber value='${report.closing}' pattern=",##0.00"/>
                                        </c:if>
                                    	<c:if test='${report.closing < 0}'>
	                                    	(<fmt:formatNumber value='${report.closing*-1}' pattern=",##0.00"/>)
                                      </c:if>
                                    </td>                                    
                                    <c:set var='__opening__' value='${__opening__ + report.opening}'/>
                                    <c:set var='__closing__' value='${__closing__+ report.closing}'/>
                                </tr>
                                </c:forEach>         
                                <tr>
                                    <td align="right" colspan="2"><strong>Total :</strong></td>
                                    <td align="right"><strong><fmt:formatNumber value="${__opening__}" pattern=",##0.00"/></strong></td>	
                                    <td align="right"><strong><fmt:formatNumber value="${d_non}" pattern=",##0.00"/></strong></td>	
                                    <td align="right"><strong><fmt:formatNumber value="${c_non}" pattern=",##0.00"/></strong></td>
                                    <td align="right"><strong><fmt:formatNumber value="${d_adj}" pattern=",##0.00"/></strong></td>
                                    <td align="right"><strong><fmt:formatNumber value="${c_adj}" pattern=",##0.00"/></strong></td>
                                    <td align="right"><strong><fmt:formatNumber value="${__closing__}" pattern=",##0.00"/></strong></td>	
                                </tr>
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
			<span>&copy; 2007 siriusERP v1.0GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

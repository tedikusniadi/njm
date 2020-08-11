<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Trial Balance</title>
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
			<td width="60%">Reports > Financial Accounting > Accounting > Advance Trial Balance Report</td>
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
						
							<h1 class="page-title">RF64 - Advance Trial Balance Report<br></h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/trialbalanceadvancereportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/trialbalanceadvancereportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container">
                                <div class="pageTitle"><strong >Advance Trial Balance</strong></div>
                                <br/>
                                <table width="481" >
                                <tr >
                            		<td width="100">Period</td>
                                	<td width="10">:</td>
                                	<td width="355">
                                		<c:forEach items='${criteria.accountingPeriods}' var='period'>
                                    		${period.name},
                                    	</c:forEach>
                                	</td>
                            	</tr>
                            	<tr >			  
                                	<td>Company</td>
                                	<td>:</td>
                                	<td>
                                		<c:forEach items='${criteria.organizations}' var='org'>
                                    		${org.firstName} ${org.middleName} ${org.lastName},
                                    	</c:forEach>
                                	</td>
                            	</tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                
                                <table width="100%" border="0" cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                              	<tr>
                                    <th width="40%" style="border:1px solid black;">Account</th>
       	  	  	    	  	  		<th width="15%" style="border-bottom:1px solid black; border-right:1px solid black;border-top:1px solid black;">Begining Balance</th>
                                    <th width="15%" style="border-bottom:1px solid black; border-right:1px solid black;border-top:1px solid black;">Debet</th>
                                    <th width="15%" style="border-bottom:1px solid black;border-top:1px solid black;border-right:1px solid black;">Credit</th>				
                                	<th width="15%" style="border-bottom:1px solid black; border-right:1px solid black;border-top:1px solid black;">Ending Balance</th>
                                </tr>
                                </thead>
                                <c:set var='t_g_opening' value='${0}'/>
                                <c:set var='t_g_debet' value='${0}'/>
                                <c:set var='t_g_credit' value='${0}'/>
                                <c:set var='t_g_ending' value='${0}'/>
                                <tbody>
                                <c:forEach items='${reports}' var='report'>
                                <tr>
                                    <td colspan="5" valign="middle">
                                        <strong><c:out value='${report.parent.code} - ${report.parent.name}'/></strong>
                                    </td>
                                </tr>
                                <c:set var='t_opening' value='${0}'/>
                                <c:set var='t_debet' value='${0}'/>
                                <c:set var='t_credit' value='${0}'/>
                                <c:set var='t_ending' value='${0}'/>
                                <c:forEach items='${report.data}' var='data'>
                                <tr >
                                    <td nowrap><c:out value='${data.account.code} - ${data.account.name}'/></td>	
                                    <td align="right" >
                                    	<c:if test='${data.opening < 0}'>
                                        	(<fmt:formatNumber value='${data.opening*-1}' groupingUsed='true' pattern=",##0.00"/>)
                                        </c:if>
                                        <c:if test='${data.opening >= 0}'>
                                        	<fmt:formatNumber value='${data.opening}' groupingUsed='true' pattern=",##0.00"/>
                                        </c:if>
                                        <c:set var='t_opening' value='${t_opening+data.opening}'/>
                                    </td>
                                    <td align="right" >
                                    	<fmt:formatNumber value='${data.debet}' groupingUsed='true' pattern=",##0.00"/>
                                        <c:set var='t_debet' value='${t_debet+data.debet}'/>
                                    </td>
                                    <td align="right" >
                                    	<fmt:formatNumber value='${data.credit}' groupingUsed='true' pattern=",##0.00"/>
                                        <c:set var='t_credit' value='${t_credit+data.credit}'/>
                                    </td>
                                    <td align="right" >
                                    	<c:if test='${data.opening+data.debet-data.credit < 0}'>
                                        	(<fmt:formatNumber value='${(data.opening+data.debet-data.credit) * -1}' groupingUsed='true' pattern=",##0.00"/>)                                        </c:if>
                                        <c:if test='${data.opening+data.debet-data.credit >= 0}'>
                                        	<fmt:formatNumber value='${data.opening+data.debet-data.credit}' groupingUsed='true' pattern=",##0.00"/>
                                        </c:if>
                                        <c:set var='t_ending' value='${t_ending+data.opening+data.debet-data.credit}'/>
                                    </td>
                                </tr>
                                </c:forEach>
                                <tr >
                                    <td width="40%" align="right" ><strong>Total :</strong></td>
                                    <td  align="right">
                                    	<c:if test='${t_opening < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_opening*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_opening >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_opening}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                        <c:set var='t_g_opening' value='${t_g_opening+t_opening}'/>
                                    </td>	
                                    <td align="right">
                                    	<c:if test='${t_debet < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_debet*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_debet >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_debet}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                        <c:set var='t_g_debet' value='${t_g_debet+t_debet}'/>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${t_credit < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_credit*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_credit >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_credit}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                        <c:set var='t_g_credit' value='${t_g_credit+t_credit}'/>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${t_ending < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_ending*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_ending >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_ending}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                        <c:set var='t_g_ending' value='${t_g_ending+t_ending}'/>
                                    </td>
                                </tr>
                                <tr >
                                    <td width="40%" colspan="5" align="right">&nbsp;</td>
                                </tr>
                                </c:forEach>
                                <tbody>
                                <tfoot>
                                <tr >
                                    <td width="40%" align="right" ><strong>Total :</strong></td>
                                    <td  align="right">
                                    	<c:if test='${t_g_ending < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_g_ending*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_g_ending >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_g_ending}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                    </td>	
                                    <td align="right">
                                    	<c:if test='${t_g_debet < 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_g_debet*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_g_debet >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_g_debet}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${t_g_credit< 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_g_credit*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_g_credit >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_g_credit}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                    </td>
                                    <td align="right">
                                    	<c:if test='${t_g_ending< 0}'>
                                        	<strong>(<fmt:formatNumber value="${t_g_ending*-1}" groupingUsed='true' pattern=",##0.00"/>)</strong>
                                        </c:if>
                                        <c:if test='${t_g_ending >= 0}'>
                                        	<strong><fmt:formatNumber value="${t_g_ending}" groupingUsed='true' pattern=",##0.00"/></strong>
                                        </c:if>
                                    </td>
                                </tr>
                                </tfoot>
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

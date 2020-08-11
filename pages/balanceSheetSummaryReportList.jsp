<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Balance Sheet Report</title>
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
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	
		<div id="se-navigator">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Reports > Financial Accounting > Accounting > Balance Sheet</td>
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
							<h1 class="page-title">RF78 - Accounting Balance Sheet Summary</h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/balancesheetsummaryreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/balancesheetsummaryreportexcelview.xls'/>"><span>Export</span></a>
							</div>
						</div>

						<div class="main-box">
                        	<div class="pageTitle"><strong>Balance Sheet Summary</strong> </div>	<br/>		
			    			<br/>
                            <table width="481">
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
                            <br/>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr><td colspan="2" align="left" ><strong>Assets</strong></td></tr>
							</table>
							<table width="85%" border="0" cellpadding="3" cellspacing="0" class="report-table">
                            <c:set var='sum_asset' value='${0}'/>
							<c:forEach items='${adapter.assets}' var='asset'>
							<tr >
								<td>${asset.account.code} - ${asset.account.name}</td>
                                <td align="right">
                                	<c:if test='${asset.amount < 0}'>
                                        (<fmt:formatNumber value='${asset.amount*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                    </c:if>
                                    <c:if test='${asset.amount >= 0}'>
                                        <fmt:formatNumber value='${asset.amount}' groupingUsed='true' pattern=',##0.00'/>
                                    </c:if>
                                    
                                    <c:set var='sum_asset' value='${sum_asset+asset.amount}'/>
                                </td>
                                <td width="22%" align="right" >&nbsp;</td>
							</tr>
							</c:forEach>
                            <tr >
                            	<td>&nbsp;</td>
								<td colspan="2"><hr/></td>
							</tr>
							<tr >
								<td width="58%" align="right" ><strong>Total Assets</strong>&nbsp;</td>
							  	<td>&nbsp;</td>
                                <td align="right" >
                                	<strong>
                                    	<c:if test='${sum_asset >= 0}'>
                                        	<fmt:formatNumber value='${sum_asset}' groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>                                        	
                                        <c:if test='${sum_asset < 0}'>
                                        	(<fmt:formatNumber value='${sum_asset*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>
                                    </strong>
                                </td>
							</tr>
                            <tr><td height="20" valign="bottom" colspan="3"><hr/></td></tr>
						  	</table>
							<br/>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr><td colspan="2" align="left" ><strong>Liabilities</strong></td></tr>
							</table>
							<table width="85%" border="0" cellpadding="3" cellspacing="0" class="report-table">
                            <c:set var='sum_liability' value='${0}'/>
							<c:forEach items='${adapter.liabilities}' var='liability'>
							<tr >
								<td><c:out value='${liability.account.code} - ${liability.account.name}'/></td>
								<td width="20%" align="right">
                                	<c:if test='${liability.amount >= 0}'>
                                        <fmt:formatNumber value='${liability.amount}' groupingUsed='true' pattern=',##0.00'/>
                                    </c:if>
                                    <c:if test='${liability.amount < 0}'>
                                        (<fmt:formatNumber value='${liability.amount*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                    </c:if>
                                    
                                    <c:set var='sum_liability' value='${sum_liability+liability.amount}'/>
                                </td>
                          		<td width="22%" align="right" >&nbsp;</td>
                            </tr>
							</c:forEach>
                            <tr >
								<td>&nbsp;</td>
								<td><hr/></td>
                                <td>&nbsp;</td>
							</tr>
                            <tr >
								<td width="58%" align="right" ><strong>Total Liabilities</strong>&nbsp;</td>
							  	<td align="right">
                                	<strong>
                                    	<c:if test='${sum_liability >= 0}'>
                                        	<fmt:formatNumber value='${sum_liability}' groupingUsed='true' pattern=',##0.00'/>
                                        </c:if>                                        	
                                        <c:if test='${sum_liability < 0}'>
                                        	(<fmt:formatNumber value='${sum_liability*-1}' groupingUsed='true' pattern=',##0.00'/>)
                                        </c:if>
                                    </strong>
                                </td>
                                <td width="22%" align="right" >&nbsp;</td>
							</tr>
						  	</table>
							<br/>
							<table width="85%" border="0" cellpadding="0" cellspacing="0">
								<tr><td colspan="2" align="left" ><strong>Equity</strong></td></tr>
							</table>
							<table width="85%" border="0" cellpadding="3" cellspacing="0" class="report-table">
                            <c:set var='sum_equity' value='${0}'/>
							<c:forEach items='${adapter.equitys}' var='equity'>
							<tr >
								<td><c:out value='${equity.account.code} - ${equity.account.name}'/></td>
								<td width="20%" align="right" >
                                	<c:if test='${equity.amount < 0}'>
                                    	<fmt:formatNumber value='${equity.amount*-1}' groupingUsed='true' pattern=',##0.00'/>
                                    </c:if>
                                    <c:if test='${equity.amount >= 0}'>
                                    	(<fmt:formatNumber value='${equity.amount}' groupingUsed='true' pattern=',##0.00'/>)
                                    </c:if>
                                    <c:set var='sum_equity' value='${sum_equity+(equity.amount*-1)}'/>
                                </td>
                           	  	<td width="22%" align="right">&nbsp;</td>
                            </tr>
							</c:forEach>
                            <tr >
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr >
								<td width="58%" align="right" ><strong>Net Income</strong>&nbsp;&nbsp;</td>
								<td align="right">
                                	<strong>
                               	  	<c:if test='${loss.income  < 0}'>
                                    	(<fmt:formatNumber value='${(loss.income)*-1}' pattern=',##0.00'/>)
                                    </c:if>
                                    <c:if test='${loss.income >= 0}'>
                                    	<fmt:formatNumber value='${loss.income}' pattern=',##0.00'/>
                                    </c:if>    
                                  	</strong>
                                </td>
                                <td width="22%" align="right" >&nbsp;</td>
							</tr>
                            <tr >
								<td width="58%" align="right" >&nbsp;</td>
								<td><hr/></td>
								<td>&nbsp;</td>
                            </tr>
							<tr >
								<td width="58%" align="right" ><strong>Total Equity</strong>&nbsp;&nbsp;</td>
								<td align="right">
                                	<strong>
                                        <c:if test='${sum_equity+loss.income < 0}'>
                                            (<fmt:formatNumber value='${(sum_equity+loss.income)*-1}' pattern=',##0.00'/>)
                                        </c:if>
                                        <c:if test='${sum_equity+loss.income >= 0}'>
                                            <fmt:formatNumber value='${sum_equity+loss.income}' pattern=',##0.00'/>
                                        </c:if>
                                  	</strong>
                                </td>
                                <td width="22%" align="right" >&nbsp;</td>
							</tr>
						  	</table>
							<br/>
							<table width="85%" border="0" cellpadding="3" cellspacing="0" class="report-table">
                            <tr >
								<td width="58%">&nbsp;</td>
							  <td colspan="2"><hr/></td>
							</tr>
							<tr >
								<td width="58%" align="right"  ><strong>Total Liabilities + Equity</strong>&nbsp;&nbsp;</td>
                              	<td width="20%">&nbsp;</td>
								<td width="22%" align="right" >
                                	<strong>
                              			<c:if test='${sum_liability + sum_equity + loss.income < 0}'>
                                            (<fmt:formatNumber value='${(sum_liability + sum_equity + loss.income)*-1}' pattern=',##0.00'/>)
                                        </c:if>
                                        <c:if test='${sum_liability + sum_equity + loss.income >= 0}'>
                                            <fmt:formatNumber value='${sum_liability + sum_equity + loss.income}' pattern=',##0.00'/>
                                        </c:if>
                                  </strong>
							  </td>
							</tr>
							</table>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

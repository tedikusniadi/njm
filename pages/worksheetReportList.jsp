<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Worksheet</title>
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
            <table border="0" cellpadding="0" cellspacing="0" width="80%">
            <tr>
                <td width="60%">Reports > Financial Accounting > Accounting > Worksheet</td>
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
							<h1 class="page-title">RF64 - Worksheet<br></h1>						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/worksheetreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/worksheetreportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container" style="overflow:auto;">
                                <div class="pageTitle">Worksheet</div>
                                <br/>
                                <table width="481" class="margin-left">
                                <tr>
                                    <td width="80">Period</td>
                                    <td width="10">:</td>
                                    <td width="355">
                                        <c:forEach items='${criteria.accountingPeriods}' var='period'>
                                            ${period.name},
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr class="CSS">			  
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
                                <table cellpadding="3" cellspacing="0" style="border:1px solid black;" class="report-table" width="1200">
                              	<tr>
                                    <td rowspan="2" align="center" valign="top" colspan="2" style="border-bottom:1px solid black;border-right:1px solid black;">Account			</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Trial Balance</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Adjustment</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Adjusted Trial Balance</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Income Statement</td>
                                    <td colspan="2" align="center" style="border-bottom:1px solid black;">Balance Sheet</td>
                                </tr>
                                <tr>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>	
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Credit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Credit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Credit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Credit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black; border-right:1px solid black;">Debit</td>
                                    <td width="80" align="center" style="border-bottom:1px solid black;">Credit</td>
                                </tr>
                                <c:forEach items='${adapter.worksheets}' var='report'>
                                <tr>
                                  <td width="20" align="left" style="border-right:1px solid black; border-bottom:1px solid black;"><c:out value='${report.account.code}'/></td>
                                  <td width="80" align="left" style="border-right:1px solid black; border-bottom:1px solid black;"><c:out value='${report.account.name}'/></td>	
<td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.debet}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.credit}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.adjustmentdebet}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.adjustmentcredit}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.adjusteddebet}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.adjustedcredit}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.statementdebet}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                      <fmt:formatNumber value='${report.statementcredit}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                  <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                    <fmt:formatNumber value='${report.balancesheetdebet}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                  </td>
                                    <td align="right" style="border-bottom:1px solid black;">
                                        <fmt:formatNumber value='${report.balancesheetcredit}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                    </td>
                                </tr>
                                </c:forEach>
                                <tr>
                                    <td height="27" colspan="2" style="border-bottom:1px solid black; border-right:1px solid black;"><strong>Subtotal</strong>&nbsp;</td>
                                  <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalDWSTrialBalance}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>	
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalCWSTrialBalance}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adaptor.totalDWSAdjutment}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adaptor.totalCWSAdjutment}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalDWSTrialBalance+adaptor.totalDWSAdjutment}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalCWSTrialBalance+adaptor.totalCWSAdjutment}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalDWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalCWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${adapter.totalDWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black;"><fmt:formatNumber value='${adapter.totalCWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="border-bottom:1px solid black; border-right:1px solid black;"><strong>Net Income/Loss</strong>&nbsp;</td>
                                  	<td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>	
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSIS < adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSIS - adapter.totalDWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSIS > adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSIS - adapter.totalCWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black; border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSBS < adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSBS - adapter.totalDWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right" style="border-bottom:1px solid black;">
                                        <c:if test='${adapter.totalDWSBS > adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSBS - adapter.totalCWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>				 	
                                </tr > 	
                                <tr>
                                    <td colspan="2" style="border-right:1px solid black; text-align:right" ><strong>Totals :</strong>&nbsp;</td>
                                  	<td align="right" style="border-right:1px solid black;">&nbsp;</td>	
                                    <td align="right" style="border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-right:1px solid black;">&nbsp;</td>
                                    <td align="right" style="border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSIS < adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                        <c:if test='${adapter.totalDWSIS > adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right" style="border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSIS <= adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                        <c:if test='${adapter.totalDWSIS > adapter.totalCWSIS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSIS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right" style="border-right:1px solid black;">
                                        <c:if test='${adapter.totalDWSBS <= adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                        <c:if test='${adapter.totalDWSBS > adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
                                    <td align="right">
                                        <c:if test='${adapter.totalDWSBS <= adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalCWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                        <c:if test='${adapter.totalDWSBS > adapter.totalCWSBS}'>
                                            <fmt:formatNumber value='${adapter.totalDWSBS}' groupingUsed='true' pattern=',##0.00'/>&nbsp;
                                        </c:if>
                                    </td>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Profit And Loss Summary Report >> List</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
    </style>
	<script type="text/javascript">
		function printPage(){print();}
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

<div id="se-containers">

	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	</div>

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Reports > Financial Accounting > Accounting > Advance Profit And Loss Summary</td>
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
						
							<h1 class="page-title">RF77 - Advance Profit And Loss Summary<br></h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/advanceprofitlosssummaryreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/advanceprofitlosssummaryreportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
                        <div class="main-box">
							<div class="main_container">		
			    				<div class="pageTitle">Advance Profit And Loss Summary</div><br>	
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
                                            <c:out value='${org.firstName} ${org.middleName} ${org.lastName}'/>,
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <table cellpadding="5" cellspacing="0" class="report-table">
                                <thead>
                                <tr>
                                    <th colspan="2" align="right">&nbsp;</th>
                                    <th width="219" align="right" >This Period</th>
                                  	<th width="192" align="right" >Year to Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr><td colspan="4" nowrap >&nbsp;</td></tr>
                        		<tr>
                                	<td colspan="4" nowrap ><strong>Revenue</strong></td>
                                </tr>
                                <c:set var='totalstd' value='${0}'/>
                                <c:set var='totalsmy' value='${0}'/>
                                <c:forEach items='${revenues}' var='revenue'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${revenue.parent.code} ${revenue.parent.name}'/></td>
                                    <td width="219" align="right" >
						  				<c:if test='${revenue.amount >= 0}'>
                                            <fmt:formatNumber value='${revenue.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${revenue.amount < 0}'>
                                            (<fmt:formatNumber value='${revenue.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                       		  		<td width="192" align="right" >
					  					<c:if test='${revenue.last3Month >= 0}'>
                                            <fmt:formatNumber value='${revenue.last3Month}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${revenue.last3Month < 0}'>
                                            (<fmt:formatNumber value='${revenue.last3Month * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                <c:set var='totalstd' value='${totalstd+revenue.amount}'/>
                                <c:set var='totalsmy' value='${totalsmy+revenue.last3Month}'/>
                                </c:forEach>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total Revenue</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${totalstd >= 0}'>
                                                <fmt:formatNumber value='${totalstd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalstd < 0}'>
                                                (<fmt:formatNumber value='${(totalstd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${totalsmy >= 0}'>
                                                <fmt:formatNumber value='${totalsmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalsmy < 0}'>
                                                (<fmt:formatNumber value='${(totalsmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap >&nbsp;</td></tr>
                        		<tr>
                                	<td colspan="4" nowrap ><strong >COGS</strong></td>
                                </tr>
                                <c:set var='totalcogs' value='${0}'/>
                                <c:set var='totalsmycogs' value='${0}'/>
                                <c:forEach items='${cogses}' var='cogs'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${cogs.parent.code} ${cogs.parent.name}'/></td>
                                    <td width="219" align="right" >
						  				<c:if test='${cogs.amount > 0}'>
                                            <fmt:formatNumber value='${cogs.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${revenue.amount < 0}'>
                                            (<fmt:formatNumber value='${cogs.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                       		  		<td width="192" align="right" >
					  					<c:if test='${cogs.last3Month > 0}'>
                                            <fmt:formatNumber value='${cogs.last3Month}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${revenue.last3Month < 0}'>
                                            (<fmt:formatNumber value='${cogs.last3Month * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                <c:set var='totalcogs' value='${totalcogs+cogs.amount}'/>
                                <c:set var='totalsmycogs' value='${totalsmycogs+cogs.last3Month}'/>
                                </c:forEach>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total COGS</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${totalcogs >= 0}'>
                                                <fmt:formatNumber value='${totalcogs}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalcogs < 0}'>
                                                (<fmt:formatNumber value='${(totalcogs) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${totalsmycogs >= 0}'>
                                                <fmt:formatNumber value='${totalsmycogs}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalsmycogs < 0}'>
                                                (<fmt:formatNumber value='${(totalsmycogs) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr >
                                    <td colspan="2" align="right"><strong>Gross Profit</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${totalstd+totalcogs >= 0}'>
                                                <fmt:formatNumber value='${totalstd+totalcogs}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalstd+totalcogs < 0}'>
                                                (<fmt:formatNumber value='${(totalstd+totalcogs) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${totalsmy+totalsmycogs >= 0}'>
                                                <fmt:formatNumber value='${totalsmy+totalsmycogs}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalsmy+totalsmycogs< 0}'>
                                                (<fmt:formatNumber value='${(totalsmy+totalsmycogs) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr>
                                	<td colspan="4" nowrap ><strong >Expense</strong></td>
                                </tr>
                                <c:set var='allexpensestd' value='${0}'/>
                                <c:set var='allexpensesmy' value='${0}'/>
                                <c:forEach items='${expenses}' var='expense'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${expense.parent.code} ${expense.parent.name}'/></td>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                <c:set var='expensestd' value='${0}'/>
                                <c:set var='expensesmy' value='${0}'/>
                                <c:forEach items='${expense.members}' var='member'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${member.parent.code} ${member.parent.name}'/></td>
                                    <td width="219" align="right" >
								  		<c:if test='${member.amount > 0}'>
                                            <fmt:formatNumber value='${member.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${member.amount < 0}'>
                                            (<fmt:formatNumber value='${member.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                               	  </td>
                              		<td width="192" align="right" >
										<c:if test='${member.last3Month > 0}'>
                                            <fmt:formatNumber value='${member.last3Month}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${member.last3Month < 0}'>
                                            (<fmt:formatNumber value='${member.last3Month * -1}' pattern=',##0.00'/>)
                                        </c:if>
                               	  </td>
                                </tr>
                                <c:set var='expensestd' value='${expensestd+member.amount}'/>
                                <c:set var='expensesmy' value='${expensesmy+member.last3Month}'/>
                                </c:forEach>
                                <tr >
                                    <td colspan="2" align="right">&nbsp;</td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${expensestd >= 0}'>
                                                <fmt:formatNumber value='${expensestd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${expensestd < 0}'>
                                                (<fmt:formatNumber value='${(expensestd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${expensesmy >= 0}'>
                                                <fmt:formatNumber value='${expensesmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${expensesmy < 0}'>
                                                (<fmt:formatNumber value='${(expensesmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <c:set var='allexpensestd' value='${allexpensestd+expensestd}'/>
                                <c:set var='allexpensesmy' value='${allexpensesmy+expensesmy}'/>
                                
                                <c:remove var='expensestd'/>
                                <c:remove var='expensesmy'/>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                </c:forEach>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total Expense</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${allexpensestd >= 0}'>
                                                <fmt:formatNumber value='${allexpensestd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${allexpensestd < 0}'>
                                                (<fmt:formatNumber value='${(allexpensestd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${allexpensesmy >= 0}'>
                                                <fmt:formatNumber value='${allexpensesmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${allexpensesmy < 0}'>
                                                (<fmt:formatNumber value='${(allexpensesmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr>
                                	<td colspan="4" nowrap ><strong >Other Revenue</strong></td>
                                </tr>
                                <c:set var='otherstd' value='${0}'/>
                                <c:set var='othersmy' value='${0}'/>
                                <c:forEach items='${otherrevenues}' var='other'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${other.parent.code} ${other.parent.name}'/></td>
                                    <td width="219" align="right" >
						  				<c:if test='${other.amount > 0}'>
                                            <fmt:formatNumber value='${other.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.amount < 0}'>
                                            (<fmt:formatNumber value='${other.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                       		  		<td width="192" align="right" >
					  					<c:if test='${other.last3Month > 0}'>
                                            <fmt:formatNumber value='${other.last3Month}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.last3Month < 0}'>
                                            (<fmt:formatNumber value='${other.last3Month * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                <c:set var='otherstd' value='${otherstd+other.amount}'/>
                                <c:set var='othersmy' value='${othersmy+other.last3Month}'/>
                                </c:forEach>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total Other Revenue</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${otherstd >= 0}'>
                                                <fmt:formatNumber value='${otherstd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${otherstd < 0}'>
                                                (<fmt:formatNumber value='${(otherstd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${othersmy >= 0}'>
                                                <fmt:formatNumber value='${othersmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${othersmy < 0}'>
                                                (<fmt:formatNumber value='${(othersmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr>
                                	<td colspan="4" nowrap ><strong >Other Expense</strong></td>
                                </tr>
                                <c:set var='expensestd' value='${0}'/>
                                <c:set var='expensesmy' value='${0}'/>
                                <c:forEach items='${otherexpenses}' var='other'>
                                <tr>                                    
                                  	<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${other.parent.code} ${other.parent.name}'/></td>
                                    <td width="219" align="right" >
						  				<c:if test='${other.amount > 0}'>
                                            <fmt:formatNumber value='${other.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.amount < 0}'>
                                            (<fmt:formatNumber value='${other.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                       		  		<td width="192" align="right" >
					  					<c:if test='${other.last3Month > 0}'>
                                            <fmt:formatNumber value='${other.last3Month}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.last3Month < 0}'>
                                            (<fmt:formatNumber value='${other.last3Month * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                <c:set var='expensestd' value='${expensestd+other.amount}'/>
                                <c:set var='expensesmy' value='${expensesmy+other.last3Month}'/>
                                </c:forEach>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total Other Expense</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${expensestd >= 0}'>
                                                <fmt:formatNumber value='${expensestd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${expensestd < 0}'>
                                                (<fmt:formatNumber value='${(expensestd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${expensesmy >= 0}'>
                                                <fmt:formatNumber value='${expensesmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${expensesmy < 0}'>
                                                (<fmt:formatNumber value='${(expensesmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr >
                                    <td colspan="2" align="right"><strong>Total Expense/Others Revenue</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${(allexpensestd+expensestd+other) > 0}'>
                                                <fmt:formatNumber value='${(allexpensestd+expensestd+other)}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${(allexpensestd+expensestd+other) < 0}'>
                                                (<fmt:formatNumber value='${(allexpensestd+expensestd+other) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${(allexpensesmy+expensesmy+othersmy) > 0}'>
                                                <fmt:formatNumber value='${(allexpensesmy+expensesmy+othersmy)}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${(allexpensesmy+expensesmy+othersmy) < 0}'>
                                                (<fmt:formatNumber value='${(allexpensesmy+expensesmy+othersmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr><td colspan="4" nowrap ><span >&nbsp;</span></td></tr>
                                <tr >
                                    <td colspan="2" align="right"><strong>Net Income</strong></td>
                                    <td align="right" >
                                        <strong>
                                            <c:if test='${totalstd+totalcogs+allexpensestd+otherstd+expensestd > 0}'>
                                                <fmt:formatNumber value='${totalstd+totalcogs+allexpensestd+otherstd+expensestd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalstd+totalcogs+allexpensestd+otherstd+expensestd < 0}'>
                                                (<fmt:formatNumber value='${(totalstd+totalcogs+allexpensestd+otherstd+expensestd) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                  	<td align="right" >
                                        <strong>
                                            <c:if test='${totalsmy+totalsmycogs+allexpensesmy+othersmy+expensesmy > 0}'>
                                                <fmt:formatNumber value='${totalsmy+totalsmycogs+allexpensesmy+othersmy+expensesmy}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalsmy+totalsmycogs+allexpensesmy+othersmy+expensesmy < 0}'>
                                                (<fmt:formatNumber value='${(totalsmy+totalsmycogs+allexpensesmy+othersmy+expensesmy) * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                </tbody>
                                </table>
							</div>
            			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<div class="area" dojoType="Container" id="quick_link_container">
			<span>&copy; 2011 siriusERP v1.6-GA</span>
			</div>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>

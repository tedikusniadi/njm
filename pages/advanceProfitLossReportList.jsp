<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Profit And Lost Report >> List</title>
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
			<td width="60%">Reports > Financial Accounting > Accounting > Advance Profit And Loss</td>
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
						
							<h1 class="page-title">RF64 - Advance Profit And Loss<br></h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/advanceprofitlossreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:printPage();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/advanceprofitlossreportexcelview.xls'/>"><span>Export</span></a>
					  		</div>
						</div>
						
                        <div class="main-box">
							<div class="main_container">		
			    				<div class="pageTitle">Advance Profit And Loss </div><br>	
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
                                <div class="clears">&nbsp;</div>
                                <table cellpadding="5" cellspacing="0" class="report-table" width="100%">
                                <thead>
                                <tr>
                                    <th width="50%" align="right">&nbsp;</td>
                                  <th width="25%" align="right" >This Period</th>
                                  <th width="25%" align="right" >Year to Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td align="left"><strong>Revenue</strong></td>
                                    <td align="right" >&nbsp;</td>
                                    <td align="right" >&nbsp;</td>
                                </tr>

                                <c:set var='totalstd' value='${0}'/>
                                <c:set var='totalsmy' value='${0}'/>
                                <c:forEach items='${revenues}' var='revenue'>

                                <tr>
                                    <td align="left">&nbsp;&nbsp;<c:out value='${revenue.parent.code} ${revenue.parent.name}'/></td>
                                    <td align="right" >&nbsp;</td>
                                    <td align="right" >&nbsp;</td>
                                </tr>
                                <c:forEach items='${revenue.details}' var='detail'>
                                <tr>
                                  	<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code} - ${detail.account.name}'/></td>
                                  	<td align="right" >
                                        <c:if test='${detail.standard.amount > 0}'>
                                            <fmt:formatNumber value='${detail.standard.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.standard.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.standard.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                  	<td align="right" >
                                        <c:if test='${detail.summary.amount > 0}'>
                                            <fmt:formatNumber value='${detail.summary.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.summary.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.summary.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                </c:forEach>
                                <c:set var='totalstd' value='${totalstd + revenue.groupsum}'/>
                                <c:set var='totalsmy' value='${totalsmy + revenue.last3sum}'/>
                                </c:forEach>


                                <tr>
                                  	<td  align="right"><strong>TOTAL REVENUE</strong></td>
                                  	<td  align="right" >
                                        <strong>
                                          <c:if test='${totalstd > 0}'>
                                                <fmt:formatNumber value='${totalstd}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalstd < 0}'>
                                                (<fmt:formatNumber value='${totalstd * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  
                                 	</td>
                                  	<td  align="right">
										 <strong>
                                      	<c:if test='${totalsmy > 0}'>
                                            <fmt:formatNumber value='${totalsmy}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmy < 0}'>
                                            (<fmt:formatNumber value='${totalsmy * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                  	</td>
                                </tr>
                                <tr >
                                  	<td  align="left">&nbsp;</td>
                                  	<td  align="left">&nbsp;</td>
                                  	<td  align="right" >&nbsp;</td>
                                </tr>
                                <tr >
                                  	<td  align="left"><strong>COGS</strong></td>
                                  	<td  align="left">&nbsp;</td>
                                  	<td  align="right" >&nbsp;</td>
                                </tr>

                                <c:set var='totalcogs' value='${0}'/>
                                <c:set var='totalsmycogs' value='${0}'/>
                                <c:forEach items='${cogses}' var='cogs'>

                                <tr >
                                	<td  align="left">&nbsp;&nbsp;<c:out value='${cogs.parent.code} ${cogs.parent.name}'/></td>
                                  	<td  align="right" >&nbsp;</td>
                                  	<td  align="right" >&nbsp;</td>
                                </tr>
                                <c:forEach items='${cogs.details}' var='detail'>
                                <tr >
                                  	<td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code} - ${detail.account.name}'/></td>
                                  	<td  align="right" >
                                        <c:if test='${detail.standard.amount > 0}'>
                                            <fmt:formatNumber value='${detail.standard.amount}' pattern=',##0.00'/>
                                       </c:if>
                                       <c:if test='${detail.standard.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.standard.amount * -1}' pattern=',##0.00'/>)
                                       </c:if>                                  
                                  	</td>
                                  	<td  align="right" >
                                        <c:if test='${detail.summary.amount > 0}'>
                                            <fmt:formatNumber value='${detail.summary.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.summary.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.summary.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  	</td>
                                </tr>
                                </c:forEach>
                                <c:set var='totalcogs' value='${totalcogs + cogs.groupsum}'/>
                                <c:set var='totalsmycogs' value='${totalsmycogs + cogs.last3sum}'/>
                                </c:forEach>


                                <tr >
                                  	<td  align="right"><strong>TOTAL COGS</strong></td>
                                  	<td  align="right" >
                                   		<strong>
                                        	<c:if test='${totalcogs > 0}'>
                                            	<fmt:formatNumber value='${totalcogs}' pattern=',##0.00'/>
                                          	</c:if>
                                          	<c:if test='${totalcogs < 0}'>
                                            	(<fmt:formatNumber value='${totalcogs * -1}' pattern=',##0.00'/>)
                                          	</c:if>
                                   		</strong>
                                  	</td>
                                  	<td  align="right" >
                                        <strong>
                                            <c:if test='${totalsmycogs > 0}'>
                                                <fmt:formatNumber value='${totalsmycogs}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${totalsmycogs < 0}'>
                                                (<fmt:formatNumber value='${totalsmycogs * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                  	</td>
                                </tr>
                                <tr >
                                  <td  align="right"><strong>GROSS PROFIT</strong></td>
                                  <td  align="right" >
                                        <strong>
                                        <c:if test='${totalcogs+totalstd > 0}'>
                                            <fmt:formatNumber value='${totalstd+totalcogs}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalcogs+totalstd < 0}'>
                                            (<fmt:formatNumber value='${(totalstd+totalcogs) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                 	</td>
                                    <td  align="right" >
                                    	<strong>
                                        <c:if test='${totalsmy-totalsmycogs > 0}'>
                                            <fmt:formatNumber value='${totalsmy+totalsmycogs}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmy-totalsmycogs < 0}'>
                                            (<fmt:formatNumber value='${(totalsmy+totalsmycogs) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                    </td>
                                </tr>
                                <tr >
                                  <td  align="left">&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <tr >
                                  <td  align="left"><strong>Expense</strong></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>

                                <c:set var='totalexpense' value='${0}'/>
                                <c:set var='totalsmyexpense' value='${0}'/>
                                <c:forEach items='${expenses}' var='expense'>

                                <tr >
                                  	<td  align="left">&nbsp;&nbsp;<c:out value='${expense.engkong.code} ${expense.engkong.name}'/></td>
                                  	<td  align="right" >&nbsp;</td>
                                  	<td  align="right" >&nbsp;</td>
                                </tr>
                                <c:set var='totalbokap' value='${0}'/>
                                <c:set var='totalsmybokap' value='${0}'/>
                                
                                <c:forEach items='${expense.anakengkong}' var='bokap'>

                                <tr >
                                  <td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${bokap.parent.code} ${bokap.parent.name}'/></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <c:forEach items='${bokap.details}' var='detail'>

                                <tr >
                                  <td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code} - ${detail.account.name}'/></td>
                                  <td  align="right" >
                                        <c:if test='${detail.standard.amount > 0}'>
                                            <fmt:formatNumber value='${detail.standard.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.standard.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.standard.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  
                                  </td>
                                  <td  align="right" >
                                        <c:if test='${detail.summary.amount > 0}'>
                                            <fmt:formatNumber value='${detail.summary.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.summary.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.summary.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  
                                  </td>
                                    <c:set var='totalbokap' value='${totalbokap + detail.standard.amount}'/>
                                    <c:set var='totalsmybokap' value='${totalsmybokap + detail.summary.amount}'/>

                                    </tr>
                                </c:forEach>
                                </c:forEach>

                                <tr >
                                  <td  align="right">&nbsp;</td>
                                  <td  align="right" >&nbsp;									  
                                        <c:if test='${totalbokap > 0}'>
                                            <fmt:formatNumber value='${totalbokap}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalbokap < 0}'>
                                            (<fmt:formatNumber value='${totalbokap * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                  </td>
                                  <td  align="right" >&nbsp;
                                        <c:if test='${totalsmybokap > 0}'>
                                            <fmt:formatNumber value='${totalsmybokap}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmybokap < 0}'>
                                            (<fmt:formatNumber value='${totalsmybokap * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                  </td>
                                </tr>
                                <c:set var='totalexpense' value='${totalexpense+totalbokap}'/>
                                <c:set var='totalsmyexpense' value='${totalsmyexpense+totalsmybokap}'/>
                                <c:remove var='totalbokap' />
                                <c:remove var='totalsmybokap'/>
                                </c:forEach>

                                <tr>
                                    <td  align="right"><strong>TOTAL EXPENSE</strong></td>
                                    <td  align="right" >
                                    	<strong>
                                        <c:if test='${totalexpense > 0}'>
                                            <fmt:formatNumber value='${totalexpense}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalexpense < 0}'>
                                            (<fmt:formatNumber value='${totalexpense * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                	</td>
                                    <td  align="right" >
                                    	<strong>
                                        <c:if test='${totalsmyexpense > 0}'>
                                            <fmt:formatNumber value='${totalsmyexpense}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmyexpense < 0}'>
                                            (<fmt:formatNumber value='${totalsmyexpense * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                      	</strong>
                                    </td>
                                </tr>
                                <tr >
                                  <td  align="left"></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>


                                <tr >
                                  <td  align="left"><strong>Other Revenue</strong></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <c:set var='totalotherrevenue' value='${0}'/>
                                <c:set var='totalsmyotherrevenue' value='${0}'/>
                                <c:forEach items='${otherrevenues}' var='other'>

                                <tr >
                                  <td  align="left">&nbsp;&nbsp;<c:out value='${other.parent.code} ${other.parent.name}'/></span>
                                  </td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <c:forEach items='${other.details}' var='detail'>
                                <tr >
                                  	<td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code} - ${detail.account.name}'/></td>
                                  	<td  align="right" >
                                    	<c:if test='${detail.standard.amount > 0}'>
                                            <fmt:formatNumber value='${detail.standard.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.standard.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.standard.amount * -1}' pattern=',##0.00'/>)
                                    	</c:if>                                  
                                  	</td>
                                  <td  align="right" >
                                      <c:if test='${detail.summary.amount > 0}'>
                                            <fmt:formatNumber value='${detail.summary.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.summary.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.summary.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                  
                                  </td>
                                </tr>
                                </c:forEach>
                                <tr >
                                  <td  align="right">&nbsp;</td>
                                  <td  align="right" >                                  
                                        <c:if test='${other.groupsum > 0}'>
                                            <fmt:formatNumber value='${other.groupsum}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.groupsum < 0}'>
                                            (<fmt:formatNumber value='${other.groupsum * -1}' pattern=',##0.00'/>)
                                        </c:if>                                  
                                  </td>
                                  <td  align="right" >
                                        <c:if test='${other.last3sum > 0}'>
                                            <fmt:formatNumber value='${other.last3sum}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${other.last3sum < 0}'>
                                            (<fmt:formatNumber value='${other.last3sum * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  
                                  </td>
                                </tr>
                                <c:set var='totalotherrevenue' value='${totalotherrevenue + other.groupsum}'/>
                                <c:set var='totalsmyotherrevenue' value='${totalsmyotherrevenue + other.last3sum}'/>
                                </c:forEach>

                                <tr >
                                  	<td  align="right"><strong>TOTAL OTHER REVENUE</strong></td>
                                  	<td  align="right" >
                                  		<strong>
                                        <c:if test='${totalotherrevenue > 0}'>
                                            <fmt:formatNumber value='${totalotherrevenue}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalotherrevenue < 0}'>
                                            (<fmt:formatNumber value='${totalotherrevenue * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  		</strong>
                                    </td>
                                  	<td  align="right" >
                                    	<strong>
                                        <c:if test='${totalsmyotherrevenue > 0}'>
                                            <fmt:formatNumber value='${totalsmyotherrevenue}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmyotherrevenue < 0}'>
                                            (<fmt:formatNumber value='${totalsmyotherrevenue * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                  		</strong>
                                  	</td>
                                </tr>

                                <tr >
                                  <td  align="left"></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                
                                <tr >
                                  <td  align="left"><strong>Other Expense</strong></td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <c:set var='totalotherexpense' value='${0}'/>
                                <c:set var='totalsmyotherexpense' value='${0}'/>
                                <c:forEach items='${otherexpenses}' var='otherexpense'>

                                <tr >
                                  	<td  align="left">&nbsp;&nbsp;<c:out value='${otherexpense.parent.code} ${otherexpense.parent.name}'/></td>
                                  	<td  align="right" >&nbsp;</td>
                                  	<td  align="right" >&nbsp;</td>
                                </tr>
                                <c:forEach items='${otherexpense.details}' var='detail'>
                                <tr >
                                  <td  align="left">&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code} - ${detail.account.name}'/></td>
                                  <td  align="right" >&nbsp;

                                        <c:if test='${detail.standard.amount > 0}'>
                                            <fmt:formatNumber value='${detail.standard.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.standard.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.standard.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  
                                  </td>
                                  <td  align="right" >
                                        <c:if test='${detail.summary.amount > 0}'>
                                            <fmt:formatNumber value='${detail.summary.amount}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${detail.summary.amount < 0}'>
                                            (<fmt:formatNumber value='${detail.summary.amount * -1}' pattern=',##0.00'/>)
                                        </c:if>

                                  
                                  </td>
                                </tr>
                                </c:forEach>
                                <tr >
                                  <td  align="right">&nbsp;</td>
                                  <td  align="right" >&nbsp;
                                        <c:if test='${otherexpense.groupsum > 0}'>
                                            <fmt:formatNumber value='${otherexpense.groupsum}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${otherexpense.groupsum < 0}'>
                                            (<fmt:formatNumber value='${otherexpense.groupsum * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                  
                                  
                                  </td>
                                  <td  align="right" >&nbsp;
                                        <c:if test='${otherexpense.last3sum > 0}'>
                                            <fmt:formatNumber value='${otherexpense.last3sum}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${otherexpense.last3sum < 0}'>
                                            (<fmt:formatNumber value='${otherexpense.last3sum * -1}' pattern=',##0.00'/>)
                                        </c:if>										  
                                  
                                  </td>
                                </tr>
                                <c:set var='totalotherexpense' value='${totalotherexpense + otherexpense.groupsum}'/>
                                <c:set var='totalsmyotherexpense' value='${totalsmyotherexpense + otherexpense.last3sum}'/>
                                </c:forEach>


                                <tr >
                                  <td  align="right"><strong>TOTAL OTHER EXPENSE</strong></td>
                                  <td  align="right" >&nbsp;
                                        <strong>
                                        <c:if test='${totalotherexpense > 0}'>
                                            <fmt:formatNumber value='${totalotherexpense}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalotherexpense < 0}'>
                                            (<fmt:formatNumber value='${totalotherexpense * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>										  
                                  </td>
                                  <td  align="right" >&nbsp;
                                        <strong>
                                        <c:if test='${totalsmyotherexpense > 0}'>
                                            <fmt:formatNumber value='${totalsmyotherexpense}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmyotherexpense < 0}'>
                                            (<fmt:formatNumber value='${totalsmyotherexpense * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                  
                                  
                                  </td>
                                </tr>
                                <tr >
                                  <td  align="left">&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <tr >
                                  <td  align="right"><strong>TOTAL EXPENSE/OTHERS REVENUE</strong></td>
                                  <td  align="right" >
                                        <strong>
                                        <c:if test='${(totalotherrevenue+totalexpense+totalotherexpense) > 0}'>
                                            <fmt:formatNumber value='${(totalotherrevenue+totalexpense+totalotherexpense)}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${(totalotherrevenue+totalexpense+totalotherexpense) < 0}'>
                                            (<fmt:formatNumber value='${(totalotherrevenue+totalexpense+totalotherexpense) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                  
                                  
                                  </td>
                                  <td  align="right" >
                                        <strong>
                                        <c:if test='${(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense) > 0}'>
                                            <fmt:formatNumber value='${(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense)}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense) < 0}'>
                                            (<fmt:formatNumber value='${(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>

                                  
                                  </td>
                                </tr>
                                <tr >
                                  <td  align="left">&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                  <td  align="right" >&nbsp;</td>
                                </tr>
                                <tr >
                                  <td  align="right">&nbsp;<strong>NET INCOME</strong></td>
                                  <td  align="right" >&nbsp;
                                        <strong>
                                        <c:if test='${totalstd+totalcogs+(totalexpense+totalotherexpense+totalotherrevenue) > 0}'>
                                            <fmt:formatNumber value='${totalstd+totalcogs+(totalexpense+totalotherexpense+totalotherrevenue)}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalstd+totalcogs+(totalexpense+totalotherexpense+totalotherrevenue) < 0}'>
                                            (<fmt:formatNumber value='${(totalstd+totalcogs+(totalexpense+totalotherexpense+totalotherrevenue)) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                  </td>
                                  <td  align="right" >
                                        <strong>
                                        <c:if test='${totalsmy+totalsmycogs+(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense) > 0}'>
                                            <fmt:formatNumber value='${totalsmy+totalsmycogs+(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense)}' pattern=',##0.00'/>
                                        </c:if>
                                        <c:if test='${totalsmy+totalsmycogs+(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense) < 0}'>
                                            (<fmt:formatNumber value='${(totalsmy+totalsmycogs+(totalsmyotherrevenue+totalsmyexpense+totalsmyotherexpense)) * -1}' pattern=',##0.00'/>)
                                        </c:if>
                                        </strong>
                                    </td>
                                </tr>
								<tbody>
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

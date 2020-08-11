<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Register</title>
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
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>

		<div id="se-navigator">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Reports > Financial Accounting > Accounting > Vehicle Profit Loss</td>
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
						<h1 class="page-title">RF81 - Vehicle Profit Loss</h1>
						
						<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/vehicleregisterpre.htm'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							<a class="item-button-export-xls" href="<c:url value='/page/vehicleregisterexcellview.xls'/>"><span>Export</span></a>
						</div>
					</div>

					<div class="main-box" style="overflow:auto;">
	 					<div class="pageTitle"><strong>Vehicle Profit Loss</strong></div>
                        <div class="clears">&nbsp;</div>
                        <table width="100%" style="border:none;font-weight:bold;" cellpadding="5">
                        <tr>
                        	<td width="9%" align="left">Company</td>
                         	<td width="1%">:</td>
                          	<td width="90%" align="left">
                            	<c:forEach items='${organizations}' var='org'>
                                	<c:out value='${org.salutation} ${org.firstName} ${org.middleName} ${org.lastName}'/>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                        	<td align="left">Date</td>
                         	<td>:</td>
                            <td align="left"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;-&nbsp;&nbsp;<fmt:formatDate value='${criteria.dateTo}' pattern='dd-MM-yyyy'/></td>
                        </tr>
                        </table>
                        <div class="clears">&nbsp;</div>
                        <c:set var='_rev' value='${0}'/>
                        <c:set var='_cogs' value='${0}'/>
                        <c:set var='_exp' value='${0}'/>
                        <c:set var='_orev' value='${0}'/>
                        <c:set var='_oexp' value='${0}'/>
                        <table width="100%" cellspacing="0" cellpadding="3" style="border:none" class="report-table">
                        <thead>
                        <tr>
                            <th colspan="2" rowspan="2" align="center" style="border:solid 1px black;">Account</th>
   	  	  	  	  	  	  	<th width="46%" colspan="${vehicleLen}" align="center" style="border-top:solid 1px black;border-right:solid 1px black;">Vehicle</th>
                       	  	<th width="11%" align="center" rowspan="2" style="border-top:solid 1px black;border-right:solid 1px black;border-bottom:solid 1px black;">Total</th>
                        </tr>
                        <tr>
                        	<c:forEach items='${vehicles}' var='vehicle'>
	                            <th align="center" style="border-top:solid 1px black;border-right:solid 1px black;border-bottom:solid 1px black;"><c:out value='${vehicle}'/></th>	
                            </c:forEach>
                        </tr>
                        <thead>
                        <tbody>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" width="12%" colspan="${3+vehicleLen}"><strong>Revenue</strong></td>
                        </tr>
                        <c:forEach items='${revenues}' var='report'>
                        <tr>
                       	  	<td style="border-left:solid 1px black;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${report.account.code} - ${report.account.name}'/></td>
                   	  	  	<c:forEach items='${report.items}' var='amt'>
	                        <td align="right">
                            	<c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                            </td>
                            <c:set var='_rev' value='${_rev+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<c:if test='${_rev >= 0}'><fmt:formatNumber value='${_rev}' pattern=',##0.00'/></c:if>
                                <c:if test='${_rev < 0}'>(<fmt:formatNumber value='${_rev*-1}' pattern=',##0.00'/>)</c:if>
                            </td>	
                        </tr>
                        </c:forEach>
                        <tr>
                        	<td style="border-left:solid 1px black;" colspan="${2}" align="right"><strong>Total Revenue :</strong></td>
                            <c:set var='t_rev_amt' value='${0}'/>
                            <c:forEach items='${t_revenues}' var='amt'>
	                        <td align="right">
                            	<strong>
                                    <c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>
                            <c:set var='t_rev_amt' value='${t_rev_amt+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${t_rev_amt >= 0}'><fmt:formatNumber value='${t_rev_amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${t_rev_amt < 0}'>(<fmt:formatNumber value='${t_rev_amt*-1}' pattern=',##0.00'/>)</c:if>
                                    <c:remove var='t_rev_amt' />
                               	</strong>
                            </td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" colspan="${3+vehicleLen}">&nbsp;</td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" width="12%" colspan="${3+vehicleLen}"><strong>COGS</strong></td>
                        </tr>
                        <c:forEach items='${cogses}' var='report'>
                        <tr>
                       	  	<td style="border-left:solid 1px black;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${report.account.code} - ${report.account.name}'/></td>
                   	  	  	<c:forEach items='${report.items}' var='amt'>
	                        <td align="right">
                            	<c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                            </td>
                            <c:set var='_cogs' value='${_cogs+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<c:if test='${_cogs >= 0}'><fmt:formatNumber value='${_cogs}' pattern=',##0.00'/></c:if>
                                <c:if test='${_cogs < 0}'>(<fmt:formatNumber value='${_cogs*-1}' pattern=',##0.00'/>)</c:if>
                            </td>	
                        </tr>
                        </c:forEach>
                        <tr>
                        	<td style="border-left:solid 1px black;" colspan="${2}" align="right"><strong>Total COGS :</strong></td>
                            <c:set var='t_rev_amt' value='${0}'/>
                            <c:forEach items='${t_cogses}' var='amt'>
	                        <td align="right">
                            	<strong>
                                    <c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>
                            <c:set var='t_rev_amt' value='${t_rev_amt+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${t_rev_amt >= 0}'><fmt:formatNumber value='${t_rev_amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${t_rev_amt < 0}'>(<fmt:formatNumber value='${t_rev_amt*-1}' pattern=',##0.00'/>)</c:if>
                                    <c:remove var='t_rev_amt' />
                               	</strong>
                            </td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" colspan="${3+vehicleLen}">&nbsp;</td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" width="12%" colspan="${3+vehicleLen}"><strong>Expense</strong></td>
                        </tr>
                        <c:forEach items='${expenses}' var='report'>
                        <tr>
                       	  	<td style="border-left:solid 1px black;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${report.account.code} - ${report.account.name}'/></td>
                   	  	  	<c:forEach items='${report.items}' var='amt'>
	                        <td align="right">
                            	<c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                            </td>
                            <c:set var='_exp' value='${_exp+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<c:if test='${_exp >= 0}'><fmt:formatNumber value='${_exp}' pattern=',##0.00'/></c:if>
                                <c:if test='${_exp < 0}'>(<fmt:formatNumber value='${_exp*-1}' pattern=',##0.00'/>)</c:if>
                            </td>	
                        </tr>
                        </c:forEach>
                        <tr>
                        	<td style="border-left:solid 1px black;" colspan="${2}" align="right"><strong>Total Expense :</strong></td>
                            <c:set var='t_rev_amt' value='${0}'/>
                            <c:forEach items='${t_expenses}' var='amt'>
	                        <td align="right">
                            	<strong>
                                    <c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>
                            <c:set var='t_rev_amt' value='${t_rev_amt+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${t_rev_amt >= 0}'><fmt:formatNumber value='${t_rev_amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${t_rev_amt < 0}'>(<fmt:formatNumber value='${t_rev_amt*-1}' pattern=',##0.00'/>)</c:if>
                                    <c:remove var='t_rev_amt' />
                               	</strong>
                            </td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" colspan="${3+vehicleLen}">&nbsp;</td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" width="12%" colspan="${3+vehicleLen}"><strong>Other Revenue</strong></td>
                        </tr>
                        <c:forEach items='${otherRevenues}' var='report'>
                        <tr>
                       	  	<td style="border-left:solid 1px black;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${report.account.code} - ${report.account.name}'/></td>
                   	  	  	<c:forEach items='${report.items}' var='amt'>
	                        <td align="right">
                            	<c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                            </td>
                            <c:set var='_orev' value='${_orev+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<c:if test='${_orev >= 0}'><fmt:formatNumber value='${_orev}' pattern=',##0.00'/></c:if>
                                <c:if test='${_orev < 0}'>(<fmt:formatNumber value='${_orev*-1}' pattern=',##0.00'/>)</c:if>
                            </td>	
                        </tr>
                        </c:forEach>
                        <tr>
                        	<td style="border-left:solid 1px black;" colspan="${2}" align="right"><strong>Total Other Revenue :</strong></td>
                            <c:set var='t_rev_amt' value='${0}'/>
                            <c:forEach items='${t_otherRevenues}' var='amt'>
	                        <td align="right">
                            	<strong>
                                    <c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>
                            <c:set var='t_rev_amt' value='${t_rev_amt+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${t_rev_amt >= 0}'><fmt:formatNumber value='${t_rev_amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${t_rev_amt < 0}'>(<fmt:formatNumber value='${t_rev_amt*-1}' pattern=',##0.00'/>)</c:if>
                                    <c:remove var='t_rev_amt' />
                               	</strong>
                            </td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" colspan="${3+vehicleLen}">&nbsp;</td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" width="12%" colspan="${3+vehicleLen}"><strong>Other Expense</strong></td>
                        </tr>
                        <c:forEach items='${otherExpenses}' var='report'>
                        <tr>
                       	  	<td style="border-left:solid 1px black;" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${report.account.code} - ${report.account.name}'/></td>
                   	  	  	<c:forEach items='${report.items}' var='amt'>
	                        <td align="right">
                            	<c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                            </td>
                            <c:set var='_oexp' value='${_oexp+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<c:if test='${_oexp >= 0}'><fmt:formatNumber value='${_oexp}' pattern=',##0.00'/></c:if>
                                <c:if test='${_oexp < 0}'>(<fmt:formatNumber value='${_oexp*-1}' pattern=',##0.00'/>)</c:if>
                            </td>	
                        </tr>
                        </c:forEach>
                        <tr>
                        	<td style="border-left:solid 1px black;" colspan="${2}" align="right"><strong>Total Other Expense :</strong></td>
                            <c:set var='t_rev_amt' value='${0}'/>
                            <c:forEach items='${t_otherExpenses}' var='amt'>
	                        <td align="right">
                            	<strong>
                                    <c:if test='${amt >= 0}'><fmt:formatNumber value='${amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${amt < 0}'>(<fmt:formatNumber value='${amt*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>
                            <c:set var='t_rev_amt' value='${t_rev_amt+amt}'/>
                            </c:forEach>
                            <td align="right" style="border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${t_rev_amt >= 0}'><fmt:formatNumber value='${t_rev_amt}' pattern=',##0.00'/></c:if>
                                    <c:if test='${t_rev_amt < 0}'>(<fmt:formatNumber value='${t_rev_amt*-1}' pattern=',##0.00'/>)</c:if>
                                    <c:remove var='t_rev_amt' />
                               	</strong>
                            </td>
                        </tr>
                        <tr>
                        	<td style="border-left:solid 1px black;border-right:solid 1px black;" colspan="${3+vehicleLen}">&nbsp;</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                        	<td style="border-top:solid 1px black;" colspan="2">&nbsp;</td>
                            <c:set var='t_all' value='${0}'/>
                            <c:forEach items='${grants}' var='amt'>
	                        <td align="right" style="border-top:solid 1px black;">
                            	<strong>
                                    <fmt:formatNumber value='${amt}' pattern=',##0.00'/>
                                    <c:set var='t_all' value='${t_all+amt}'/>
                                </strong>
                            </td>	
                            </c:forEach>
                            <td align="right" style="border-top:solid 1px black;border-right:solid 1px black;">
                            	<strong>
                                    <c:if test='${_rev+_orev+_cogs+_exp+_oexp >= 0}'><fmt:formatNumber value='${_rev+_orev+_cogs+_exp+_oexp}' pattern=',##0.00'/></c:if>
                                    <c:if test='${_rev+_orev+_cogs+_exp+_oexp < 0}'>(<fmt:formatNumber value='${(_rev+_orev+_cogs+_exp+_oexp)*-1}' pattern=',##0.00'/>)</c:if>
                                </strong>
                            </td>	
                            <c:remove var='t_all'/>
                            <c:remove var='_rev'/>
                            <c:remove var='_cogs'/>
                            <c:remove var='_exp'/>
                            <c:remove var='_orev'/>
                            <c:remove var='_oexp'/>
                        </tr>
                        </tfoot>
                        </table>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>

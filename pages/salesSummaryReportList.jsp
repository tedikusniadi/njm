<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Sales Summary Report</title>
	<style type="text/css" media="screen">
		 @import url("<c:url value='/assets/sirius.css'/>");
		 @import url("<c:url value='/css/deliveryRecapitulationReport.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/css/deliveryRecapitulationReport.css'/>");
	</style>
</head>

<body>

<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>

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
				<td width="60%">Sales > Report > Sales Summary</td>
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
							<h1 class="page-title">SR01 - Sales Summary</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/salessummaryreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/salessummaryreportexcel.xls?organization=${com.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<table width="100%" cellpadding="5">
                                <tbody>
                                <tr>
                                	<td>Company</td>
                                    <td>:</td>
                                    <td><c:out value='${com.firstName} ${com.middleName} ${com.lastName}'/></td>
                                </tr>
                                <tr>
                                	<td>Period</td>
                                    <td>:</td>
                                    <td><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;to&nbsp;&nbsp;<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table style="border:none" width="100%" cellspacing="0" cellpadding="5">
                                <thead>
                                <tr>
                                	<th width="10%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                  <th width="30%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Customer</th>
                                    <th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Amount</th>
                                    <th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">COGS</th>
                                    <th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Cost</th>
                                    <th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Net</th>
                                    <th width="10%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Net (%)</th>                                    
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var='t_amount' value='${0}'/>
                                <c:set var='t_cogs' value='${0}'/>
                                <c:set var='t_cost' value='${0}'/>
                                <c:forEach items='${reports}' var='repo'>
                                <tr>
                                	<td align="left"><fmt:formatDate value='${repo.date}' pattern='dd-MM-yyyy'/></td>
                                  <td align="left"><c:out value='${repo.customer}'/></td>
                                    <td align="right"><fmt:formatNumber value='${repo.amount}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${repo.cogs}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${repo.cost}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${repo.net}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${(repo.net / repo.amount) * 100}' pattern=',##0.00'/>%</td>
                                </tr>
                                <c:set var='t_amount' value='${t_amount+repo.amount}'/>
                                <c:set var='t_cogs' value='${t_cogs+repo.cogs}'/>
                                <c:set var='t_cost' value='${t_cost+repo.cost}'/>
                                </c:forEach>
                                <tr>
                                	<td colspan="2">&nbsp;</td>
                                    <td style="border-top:solid 1px black;" align="right"><fmt:formatNumber value='${t_amount}' pattern=',##0.00'/></td>
                                    <td style="border-top:solid 1px black;" align="right"><fmt:formatNumber value='${t_cogs}' pattern=',##0.00'/></td>
                                    <td style="border-top:solid 1px black;" align="right"><fmt:formatNumber value='${t_cost}' pattern=',##0.00'/></td>
                                    <td style="border-top:solid 1px black;" align="right"><fmt:formatNumber value='${t_amount-t_cogs-t_cost}' pattern=',##0.00'/></td>
                                    <td style="border-top:solid 1px black;" align="right"><fmt:formatNumber value='${(t_amount-t_cogs-t_cost)/t_amount*100}' pattern=',##0.00'/>%</td>
                                </tr>
                                <c:remove var='t_amount'/>
                                <c:remove var='t_cogs'/>
                                <c:remove var='t_cost'/>
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

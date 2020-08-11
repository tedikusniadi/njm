<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%@ include file="/common/tld-spring.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>Dashboard > Net Income</title>
<style type="text/css" media="screen">
<!--
@import url("assets/sirius.css");

-->

<!--
@import url("css/report_format.css");
-->
</style>
<%@ include file="/filter/dashboardProfitLossFilter.jsp"%>
<script type="text/javascript" src="assets/dialog.js"></script>
<style type="text/css" media="print">
<!--
@import url("css/print_format.css");
-->
</style>
<script type="text/javascript">
		function printPage(){print();}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
<div class="area" dojoType="Container" id="quick_link_container">
<%@ include file="/common/sirius-header.jsp"%></div>

<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
<div id="se-r01">&nbsp;</div>
<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

<div class="area" dojoType="Container" id="quick_link_container">
<%@ include file="/common/sirius-menu.jsp"%></div>

<div id="se-navigator">
<div class="area" dojoType="Container" id="quick_link_container">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td width="60%">Dashboard > Net Income</td>
		<td width="40%" align="right"><%@ include
			file="/common/welcome.jsp"%></td>
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

<h1 class="page-title"> DASHBOARD - NET INCOME<br>
</h1>

<div class="toolbar"><a class="item-button-back" href="<c:url value='/page/start.htm'/>"><span>Back</span></a>
<div dojoType="Toggler" targetId="filter"><a class="item-button-search" href="javascript:return;"><span>Filter</span></a>
</div>
</div>
</div>

<div class="main-box" style="overflow: scroll;">
<div class="main_container"><br />
<div class="report">&nbsp;
<table width="498">
	<tr>
		<td width="100">Company</td>
		<td width="11">:&nbsp;&nbsp;</td>
		<td width="344"><c:out
			value='${organization.firstName} ${organization.middleName} ${organization.lastName}' /></td>
	</tr>
	<tr>
		<td width="100">Period</td>
		<td width="11">:&nbsp;&nbsp;</td>
		<td width="344"><c:out value='${period}' /></td>
	</tr>
</table>
</div>
<img src="<c:url value='/charts/profitlossconsecutive.png'/>" />
<table cellpadding="5" cellspacing="0" class="report-table">
	<thead>
		<tr>
			<th width="200" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;"> &nbsp;</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">January</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">February</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">March</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">April</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">May</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">June</th>
		</tr>
	</thead>
	<tr>
	<td width="100" align="left">
	 NET INCOME
	</td>
	<c:forEach items='${reports}' var='report'>
		
		<c:if test="${report.month == 'JANUARY'}">
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	
	
		<c:if test="${report.month == 'FEBRUARY'}">
		<td align="left"> 
		<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'MARCH'}">
		<td align="left">		
		<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	
		<c:if test="${report.month == 'APRIL'}">	
		<td align="left"> 
		<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'MAY'}">
		<td align="left"> 
		<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'JUNE'}">
		<td align="left"> 
		<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	</c:forEach>
	</tr>
	<tr>
		<td colspan="6" height="30"></td>
	</tr>           
 		<tr>
 			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;"> </th>
 			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">July</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">August</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">September</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">October</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">November</th>
			<th width="50" align="left"
				style="border-bottom: 1px solid black; border-top: 1px solid black;">December</th>
 
 	</tr>      
       <tr>
       <td>Net Income</td>
		<c:forEach items='${reports}' var='report'>
		
		<c:if test="${report.month == 'JULY'}">
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	
	
		<c:if test="${report.month == 'AUGUST'}">
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'SEPTEMBER'}">
		<td align="left">		
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	
		<c:if test="${report.month == 'OCTOBER'}">	
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'NOVEMBER'}">
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
		
		<c:if test="${report.month == 'DECEMBER'}">
		<td align="left"> 
			<fmt:formatNumber value='${report.amount}' pattern=',##0.00' />
		</td>
		</c:if>
	</c:forEach>
	</tr>

</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div style="clear: both; height: 0px">&nbsp;</div>
<div id="footer">
<div><span>&copy; 2007 siriusERP
v1.0GA&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
</div>
<div style="clear: both; height: 20px">&nbsp;</div>

</div>

</body>
<%@ include file="/common/dialog.jsp"%>
</html>
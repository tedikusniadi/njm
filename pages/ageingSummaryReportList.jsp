<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Ageing Summary</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="assets/main.js"></script>
	
	<!-- Calendar Script -->
	<script type="text/javascript" src="assets/calendar.js"></script>
	<script type="text/javascript" src="assets/listform.js"></script>
	
	<script type="text/javascript">
			function printPage()
			{
	   			print();
			}
	</script>


<style type="text/css">
<!--
@media print
{
	div#main_container
	{
		
			padding: 4px;
			margin: 2px;
			width: 90%;
			height:100%;
			position: relative;
			
			visibility: inherit;
			 position:relative ;
			 left: 10px;
			 background-color: white;
			page-break-before: auto;
			page-break-after: auto;	
	
	}
	div#menu_container
	{
		display:none;
	}
	div#headerZZ
	{
		display:none;
	}
	div#footer
	{
		display:none;
	}
	div#letterNo
	{
		position: absolute;
		left: 350px;
		top: 20px;
		width: 216px;
		height: 29px;
		
	}
	div#letterNo2
	{		
		font-family: Verdana, Arial, Helvetica, sans-serif;
		font-size: 14px;
	}
	div#logo_part
	{
		display:none;
	}
	div#corp_part
	{
		display:none;
	}
	div#corp_part2
	{
		display:block;
	}
	div#footer_part
	{
		display:none;
	}
	div#part
	{
		display:block;
		position: absolute; bottom: 650px;
	}
	div#quick_link_container
	{
		display:none;
	}
	.content-font {font-size:10pt; color:#000000;}

	.borderTable 
	{ 
		border:1px solid #000000; 
	}

.border_RightCSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:82px;
}

.border_RightCSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:92px; 
}

.border_RightCSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:82px;
}

.border_Right_BottomCSS1header_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:100px;
}

.border_RightCSS1_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:82px;
}

.border_RightCSS2_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:92px;
}

.border_RightCSS3_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:82px;
}


}
@media screen
{

	div#letterNo
	{
		position: absolute;
		left: 450px;
		top: 30px;
		width: 216px;
		height: 29px;
		
	}
	div#letterNo2
	{
		font-family: Verdana, Arial, Helvetica, sans-serif;
		font-size: 14px;
	}
	div#corp_part2
	{
		display:none;
	}
	div#part
	{
	display:block;
	font-family: Verdana;
	font-size: 10px;
	position: absolute;
	bottom: 28px;
	left: 15px;
	top: 700px;
	width: 893px;
	}
	div#main_container
	{
		border: 0px solid white;
			padding: 4px;
			margin: 4px;
			width: 90%;
			height:100%;
			position: relative;
			overflow: auto;
			visibility: inherit;
			 position:relative ;
			 left: 0px;
			 background-color: white;
			page-break-before: auto;
			page-break-after: auto;	
	
	}
	div#footer_part
	{
		
	}	

	.borderTable 
	{ 
		border:1px solid #000000; 
	}
	
.CSS1 {
	font-family: Verdana;
	font-size: 10px;
	text-decoration:none; color:#000000;
}


.border_RightCSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:102px;
}

.border_RightCSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:115px;
}

.border_RightCSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:102px;
}

.border_Right_BottomCSS1header_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid;
}

.border_RightCSS1_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:102px;
}

.border_RightCSS2_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:115px;
}

.border_RightCSS3_bottom_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:102px;
}


}
.CSS {
	font-family: Verdana;
	font-size: 10px;
	font-weight: bold;
}
.CSS1 {
	font-family: Verdana;
	font-size: 10px;
	text-decoration:none; color:#000000;
}
.CSS2 {
	border: thin solid #000000;
}
.CSS3 {
	font-family: Verdana;
	font-size: 20px;
	color: #FFFFFF;
	font-weight: 600;
}
.CSS4 {
	font-family: Times New Roman;
	font-size: 14px;
}
.CSS5 {
	font-family: Arial;
	font-size: 12px;
	font-weight: bold;
}
.posisi1 {
	position: absolute; bottom: 25px; 
	font-family: Verdana;
	font-size: 10px;
}
.posisi2 {
	position: absolute; bottom: 5px; 
}
.word1 {
	font-family: Verdana;
	font-size: 10px;
	position: absolute; bottom: 25px; left: 0px;
}

.pageTitle{
    color: #000080;
    font-size: 20px;
    font-weight: bold;
}		

.spanTitleBg{
	font-size:12px;
  text-align: center; 
  background-color:#E0F2FE;
}

.border_Left
{
border-left-color:#000000; 
border-left-width:1px; 
border-left-style:solid;
}
.border_Left_Bottom
{
border-left-color:#000000; 
border-left-width:1px; 
border-left-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid;
}

.border_Right
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;
}


.border_Right_Bottom
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid;
}

.border_Bottom
{
border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid;

}
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
				<td width="60%">Financial Accounting > Account Receivables > Ageing Summary Report</td>
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
							<h1 class="page-title">F26 - Ageing Summary<br></h1>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/ageingsummaryreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/ageingsummaryreportexport.xls?organization=${organization.id}&customer=${criteria.customer}&customerLeasing=${criteria.customerLeasing}&customerMainDealer=${criteria.customerMainDealer}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
					  </div>
						<div class="main-box">
						<div class="main_container">
						<br>
							<div class="report"><strong>REPORT AGEING SUMMARY</strong></div>
                    		<br>
							<div class="report">
	    					<table width="498">	
		   						<tr>	
		    						<td width="100" class="CSS1">Company</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
		   						</tr>
		   						<tr>	
		    						<td width="100" class="CSS1">Period</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><%-- <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp;  --%><fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
		   						</tr>								
	    					</table>
							</div>
							<br>
								<div class="CSS1"><strong></div>
								<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
								<tr class="CSS">
									<td width="15%" class="border_Right_BottomCSS1header_fix" align="center" valign="middle" style="height:28px;">Customer</td>
									<td width="10%" class="border_Right_Bottom" align="center" valign="middle">Balance</td>
									<td width="10%" class="border_Right_Bottom" align="center" valign="middle">Not Yet Due</td>
									<td width="75%" colspan="5">
										<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:28px;">
										<tr class="rowTitle">
											<td align="center" colspan="5" class="border_Bottom" valign="middle"><span class="style5">Over Due (Days)</span></td>
										</tr>
										<tr class="rowTitle">
											<td width="20%" height="12" class="border_Right_Bottom" align="center" valign="middle"><span class="style5">1 - 3</span></td>
											<td width="20%" class="border_Right_Bottom" align="center" valign="middle" ><span class="style5">4 - 10</span></td>
											<td width="20%" class="border_Right_Bottom" align="center" valign="middle"><span class="style5">11 - 20</span></td>
											<td width="20%" class="border_Right_Bottom" align="center" valign="middle"><span class="style5">21 - 30</span></td>
											<td width="20%" class="border_Bottom" align="center" valign="middle"> <span class="style5">> 30</span></td>
										</tr>
										</table>
									</td>
								</tr>
								<c:forEach items='${reports}' var='report'>
									<tr>
										<td colspan="5" nowrap="nowrap" style="border-top:1px solid black;border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><h3><strong><c:out value='${report.org.name}'/></strong></h3></td>
									</tr>
									<c:forEach items='${report.datas}' var='data'>
										<c:if test="${data.customersData}">
										<tr>
											<td colspan="8" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER</td>
										</tr>
										<c:forEach  items='${data.customers.items}' var='item'> 
										<tr>
											<td align="left" class="border_Right_Bottom">&nbsp;<c:out value='${item.customer.firstName}'/>&nbsp;<c:out value='${item.customer.middleName}'/>&nbsp;<c:out value='${item.customer.lastName}'/></td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.balance}' groupingUsed='true'/>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td width="75%" colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.fstMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.sndMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.thdMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.fthMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><fmt:formatNumber value='${item.fifthMonth}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   	</tr>
									  	</c:forEach>
									  	<tr>
											<td class="border_Right_Bottom">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalBalance}' groupingUsed='true'/></strong>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalNotYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalFstMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalSndMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalThdMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.totalFthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><strong><fmt:formatNumber value='${data.customers.totalFifthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="border_Right_Bottom">&nbsp;<strong>Percentage</strong></td>
											<td align="right" class="border_Right_Bottom">&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.notYetDuePercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.fstMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.sndMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.thdMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customers.fthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><strong><fmt:formatNumber value='${data.customers.fifthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td colspan="8">&nbsp;</td>
										</tr>
										</c:if>
										
										<c:if test="${data.customersLeasingData}">
										<tr>
											<td colspan="8" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER LEASING</td>
										</tr>
										<c:forEach  items='${data.customersLeasing.items}' var='itemLeasing'> 
										<tr>
											<td align="left" class="border_Right_Bottom">&nbsp;<c:out value='${itemLeasing.customer.firstName}'/>&nbsp;<c:out value='${item.customer.middleName}'/>&nbsp;<c:out value='${item.customer.lastName}'/></td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.balance}' groupingUsed='true'/>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td width="75%" colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.fstMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.sndMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.thdMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.fthMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><fmt:formatNumber value='${itemLeasing.fifthMonth}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   	</tr>
									  	</c:forEach>
									  	<tr>
											<td class="border_Right_Bottom">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalBalance}' groupingUsed='true'/></strong>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalNotYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalFstMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalSndMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalThdMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalFthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.totalFifthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="border_Right_Bottom">&nbsp;<strong>Percentage</strong></td>
											<td align="right" class="border_Right_Bottom">&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.notYetDuePercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.fstMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.sndMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.thdMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.fthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><strong><fmt:formatNumber value='${data.customersLeasing.fifthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td colspan="8">&nbsp;</td>
										</tr>
										</c:if>
										
										<c:if test="${data.customersMainDealerData}">
										<tr>
											<td colspan="8" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER MAIN DEALER</td>
										</tr>
										<c:forEach  items='${data.customersMainDealer.items}' var='itemMainDealer'> 
										<tr>
											<td align="left" class="border_Right_Bottom">&nbsp;<c:out value='${itemMainDealer.customer.firstName}'/>&nbsp;<c:out value='${item.customer.middleName}'/>&nbsp;<c:out value='${item.customer.lastName}'/></td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.balance}' groupingUsed='true'/>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td width="75%" colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.fstMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.sndMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.thdMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.fthMonth}' groupingUsed='true'/>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><fmt:formatNumber value='${itemMainDealer.fifthMonth}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   	</tr>
									  	</c:forEach>
									  	<tr>
											<td class="border_Right_Bottom">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalBalance}' groupingUsed='true'/></strong>&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalNotYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalFstMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalSndMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalThdMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalFthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Bottom"><strong><fmt:formatNumber value='${data.customersMainDealer.totalFifthMonth}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										<tr>
											<td class="border_Right">&nbsp;<strong>Percentage</strong></td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${data.customersMainDealer.notYetDuePercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
											<td colspan="5">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="20%" align="right" class="border_Right"><strong><fmt:formatNumber value='${data.customersMainDealer.fstMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right"><strong><fmt:formatNumber value='${data.customersMainDealer.sndMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right"><strong><fmt:formatNumber value='${data.customersMainDealer.thdMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right" class="border_Right"><strong><fmt:formatNumber value='${data.customersMainDealer.fthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
													<td width="20%" align="right"><strong><fmt:formatNumber value='${data.customersMainDealer.fifthMonthPercent}' groupingUsed='true'/>&nbsp;%</strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
										</c:if>
									</c:forEach>
								</c:forEach>
							</table>
							<br>
							<br>
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

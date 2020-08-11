<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Ageing Detail</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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


.border_Right_BottomCSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px; 
}

.border_Right_BottomCSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px;
}

.border_Right_BottomCSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px
}


.border_Right_BottomCSS4_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; 
}

/*kolom total */
.border_Right_Bottom2CSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:80px; 
}

.border_Right_Bottom2CSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:80px; 
}

.border_Right_Bottom2CSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:80px; 
}

/*kolom total */


/*date */

.border_Right_Bottom1_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px; 
}

.border_Right_Bottom2_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px; 
}

.border_Right_Bottom3_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:80px; 
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

.border_Right_BottomCSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px; 
}

.border_Right_BottomCSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px;
}

.border_Right_BottomCSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px
}

.border_Right_BottomCSS4_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; 
}

.border_Right_Bottom2CSS1_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:104px; 
}

.border_Right_Bottom2CSS2_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:104px; 
}

.border_Right_Bottom2CSS3_fix
{ 
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:104px; 
}

.border_header_fix
{
width:104px;
}

.border_Right_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid; width:104px;
}

.border_Bottom_header_fix
{
border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px;
}

.border_Right_Bottom1_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px; 
}

.border_Right_Bottom2_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px; 
}

.border_Right_Bottom3_header_fix
{
border-right-color:#000000; 
border-right-width:1px; 
border-right-style:solid;

border-bottom-color:#000000; 
border-bottom-width:1px; 
border-bottom-style:solid; width:104px; 
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

-->
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
				<td width="60%">
					Reports > Financial Accounting > Account Receiveables > Ageing Detail
				</td>
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
							<h1 class="page-title">F27 - Ageing Detail<br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/ageingdetailreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/ageingdetailreportexport.xls?organization=${organization.id}&customer=${criteria.customer}&customerLeasing=${criteria.customerLeasing}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
						<div class="main_container">
						<br>
							<div class="report"><strong>REPORT AGEING DETAIL</strong></div>
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
		   						<tr>	
		    						<td width="100" class="CSS1">Customer</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><c:out value='${strcust}'/></td>			  
		   						</tr>								
	    					</table>
							</div>
							<br>
							<c:forEach items='${reports}' var='report'>
								<tr>
									<td colspan="7" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><h3><strong><c:out value='${report.org.name}'/></strong></h3></td>
								</tr>
								<c:forEach items='${report.datas}' var='data'>
					    			<c:if test="${data.customersData}">
					    			<table width="100%">
					    				<tr>
					    					<td bgcolor="gray" align="center" style="border:1px solid black"><font color="white" size="3">CUSTOMER</td>
					    				</tr>
					    			</table>
					 				<div>&nbsp;</div>
									<c:forEach  items='${data.adapters}' var='ageing'>
										<div class="CSS">&nbsp;<c:out value='${ageing.customer.firstName}'/>&nbsp;<c:out value='${ageing.customer.middleName}'/>&nbsp;<c:out value='${ageing.customer.lastName}'/></div>
										<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
										<tr class="CSS">
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom" style="height:28px;">Date</td>
											<td width="15%" align="center" valign="middle" class="border_Right_Bottom">Ref No</td>
											<td width="15%" align="center" valign="middle" class="border_Right_Bottom">Sales</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Due Date</td>
											<td width="8%" align="center" valign="middle" class="border_Right_Bottom">Balance</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Not Yet Due</td>
											<td width="50%" colspan="6" align="left" valign="top">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:28px;">
												<tr class="CSS1">
													<td align="center" colspan="5" class="border_Bottom"><center>Over Due (Days)</center></td>
												</tr>
												<tr class="CSS1">
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">1 - 3</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">4 - 10</td>
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">11 - 20</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">21 - 30</td>
													<td align="center" valign="middle" class="border_Bottom_header_fix">> 30</td>
												</tr>
												</table>
											</td>
										</tr>
										<c:forEach  items='${ageing.items}' var='item'> 
										<tr>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${item.billing.date}' pattern='dd-MMM-yyyy'/>&nbsp;</td>	
											<td align="left" class="border_Right_Bottom"><c:out value='${item.billing.code}'/>&nbsp;&nbsp;&nbsp;</td>	
											<td align="left" class="border_Right_Bottom"><c:out value='${item.billing.unitSalesOrder.salesPerson.name}'/>&nbsp;&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${item.billing.collectingStatus.dueDate}' pattern='dd-MM-yyyy'/>&nbsp;</td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.balance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${item.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td colspan="7">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_Bottom1_header_fix" style="height:25px;"><fmt:formatNumber value='${item.fstOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${item.sndOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${item.thdOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${item.fthOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Bottom_header_fix"><fmt:formatNumber value='${item.fifthOverDue}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   </tr>
									  </c:forEach>
									  <tr>
											<td class="border_Right">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageing.balance}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageing.notYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="6">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageing.fstOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageing.sndOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageing.thdOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageing.fthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_header_fix"><strong><fmt:formatNumber value='${ageing.fifthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
									</table>
					 				<div>&nbsp;</div>
							  		</c:forEach>
							  		</c:if>
							  		
							  		<c:if test="${data.customersLeasingData}">
					 				<br/>
					    			<table width="100%">
					    				<tr>
					    					<td bgcolor="gray" align="center" style="border:1px solid black"><font color="white" size="3">CUSTOMER LEASING</td>
					    				</tr>
					    			</table>
					 				<div>&nbsp;</div>
							  		<c:forEach  items='${data.adaptersLeasing}' var='ageingLeasing'>
										<div class="CSS">&nbsp;<c:out value='${ageingLeasing.customer.firstName}'/>&nbsp;<c:out value='${ageingLeasing.customer.middleName}'/>&nbsp;<c:out value='${ageingLeasing.customer.lastName}'/></div>
										<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
										<tr class="CSS">
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom" style="height:28px;">Date</td>
											<td width="15%" align="center" valign="middle" class="border_Right_Bottom">Ref No</td>
											<td align="center" valign="middle" class="border_Right_Bottom">Sales</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Due Date</td>
											<td width="8%" align="center" valign="middle" class="border_Right_Bottom">Balance</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Not Yet Due</td>
											<td width="50%" colspan="6" align="left" valign="top">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:28px;">
												<tr class="CSS1">
													<td align="center" colspan="5" class="border_Bottom"><center>Over Due (Days)</center></td>
												</tr>
												<tr class="CSS1">
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">1 - 3</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">4 - 10</td>
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">11 - 20</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">21 - 30</td>
													<td align="center" valign="middle" class="border_Bottom_header_fix">> 30</td>
												</tr>
												</table>
											</td>
										</tr>
										<c:forEach  items='${ageingLeasing.items}' var='itemLeasing'> 
										<tr>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${itemLeasing.billing.date}' pattern='dd-MMM-yyyy'/>&nbsp;</td>	
											<td align="left" class="border_Right_Bottom"><c:out value='${itemLeasing.description}'/>&nbsp;&nbsp;&nbsp;</td>
											<td align="left" nowrap="nowrap" class="border_Right_Bottom"><c:out value='${itemLeasing.billing.unitSalesOrder.salesPerson.name}'/>&nbsp;&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${itemLeasing.billing.collectingStatus.dueDate}' pattern='dd-MM-yyyy'/>&nbsp;</td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.balance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemLeasing.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td colspan="7">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_Bottom1_header_fix" style="height:25px;"><fmt:formatNumber value='${itemLeasing.fstOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemLeasing.sndOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemLeasing.thdOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemLeasing.fthOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Bottom_header_fix"><fmt:formatNumber value='${itemLeasing.fifthOverDue}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   </tr>
									  </c:forEach>
									  <tr>
											<td class="border_Right">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageingLeasing.balance}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageingLeasing.notYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="6">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingLeasing.fstOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingLeasing.sndOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingLeasing.thdOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingLeasing.fthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_header_fix"><strong><fmt:formatNumber value='${ageingLeasing.fifthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
									</table>
					 				<div>&nbsp;</div>
							  		</c:forEach>
							  		</c:if>
							  		
							  		<c:if test="${data.customersMainDealerData}">
					 				<br/>
					    			<table width="100%">
					    				<tr>
					    					<td bgcolor="gray" align="center" style="border:1px solid black"><font color="white" size="3">CUSTOMER MAIN DEALER</td>
					    				</tr>
					    			</table>
					 				<div>&nbsp;</div>
							  		<c:forEach  items='${data.adaptersMainDealer}' var='ageingMainDealer'>
										<div class="CSS">&nbsp;<c:out value='${ageingMainDealer.customer.firstName}'/>&nbsp;<c:out value='${ageingMainDealer.customer.middleName}'/>&nbsp;<c:out value='${ageingMainDealer.customer.lastName}'/></div>
										<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
										<tr class="CSS">
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom" style="height:28px;">Date</td>
											<td width="20%" align="center" valign="middle" class="border_Right_Bottom">Ref No</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Due Date</td>
											<td width="8%" align="center" valign="middle" class="border_Right_Bottom">Balance</td>
											<td width="7%" align="center" valign="middle" class="border_Right_Bottom">Not Yet Due</td>
											<td width="50%" colspan="6" align="left" valign="top">
												<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:28px;">
												<tr class="CSS1">
													<td align="center" colspan="5" class="border_Bottom"><center>Over Due (Days)</center></td>
												</tr>
												<tr class="CSS1">
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">1 - 3</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">4 - 10</td>
													<td align="center" valign="middle" class="border_Right_Bottom2_header_fix">11 - 20</td>
													<td align="center" valign="middle" class="border_Right_Bottom3_header_fix">21 - 30</td>
													<td align="center" valign="middle" class="border_Bottom_header_fix">> 30</td>
												</tr>
												</table>
											</td>
										</tr>
										<c:forEach  items='${ageingMainDealer.items}' var='itemMainDealer'> 
										<tr>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${itemMainDealer.billing.date}' pattern='dd-MMM-yyyy'/>&nbsp;</td>	
											<td align="left" class="border_Right_Bottom"><c:out value='${itemMainDealer.description}'/>&nbsp;&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatDate value='${itemMainDealer.billing.collectingStatus.dueDate}' pattern='dd-MM-yyyy'/>&nbsp;</td>	
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.balance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right_Bottom"><fmt:formatNumber value='${itemMainDealer.notYetDue}' groupingUsed='true'/>&nbsp;</td>
											<td colspan="7">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_Bottom1_header_fix" style="height:25px;"><fmt:formatNumber value='${itemMainDealer.fstOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemMainDealer.sndOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemMainDealer.thdOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Right_Bottom1_header_fix"><fmt:formatNumber value='${itemMainDealer.fthOverDue}' groupingUsed='true'/>&nbsp;</td>
													<td align="right" class="border_Bottom_header_fix"><fmt:formatNumber value='${itemMainDealer.fifthOverDue}' groupingUsed='true'/>&nbsp;</td>
												</tr>
												</table>
											</td>
									   </tr>
									  </c:forEach>
									  <tr>
											<td class="border_Right">&nbsp;<strong>Total</strong></td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right">&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageingMainDealer.balance}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
											<td align="right" class="border_Right"><strong><fmt:formatNumber value='${ageingMainDealer.notYetDue}' groupingUsed='true'/></strong>&nbsp;</td>
											<td colspan="6">
												<table width="100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingMainDealer.fstOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingMainDealer.sndOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingMainDealer.thdOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_Right_header_fix"><strong><fmt:formatNumber value='${ageingMainDealer.fthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
													<td align="right" class="border_header_fix"><strong><fmt:formatNumber value='${ageingMainDealer.fifthOverDue}' groupingUsed='true'/></strong>&nbsp;</td>
												</tr>
												</table>
											</td>
										</tr>
									</table>
					 				<div>&nbsp;</div>
							  		</c:forEach>
							  		</c:if>
					 				<div>&nbsp;</div>
							  	</c:forEach>
						  	</c:forEach>
						  	</br>
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

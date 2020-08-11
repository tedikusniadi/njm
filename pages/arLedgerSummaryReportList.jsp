<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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

	<div id="se-navigator">
		<div class="area" dojoType="Container" id="quick_link_container">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">${breadcrumb}</td>
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
							<h1 class="page-title">${pageTitle}<br></h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/ledgersummaryreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/ledgersummaryreportexport.xls?organization=${organization.id}&customer=${criteria.customer}&customerLeasing=${criteria.customerLeasing}&date='/><fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
					  </div>
						
						<div class="main-box">
						<div class="main_container">
						<br>
							<div class="report"><strong>REPORT AR LEDGER SUMMARY</strong></div>
                    		<br>			
							<div class="report">				
	    					<table width="498">	
		   						<tr>	
		    						<td width="100" class="CSS1">Company</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><c:out value='${organization.name}'/></td>			  
		   						</tr>
		   						<tr>	
		    						<td width="100" class="CSS1">Date</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><%-- <fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> -  --%><fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
		   						</tr>
	    					</table>
							</div>							
							<br>
							<div class="CSS1"><strong></strong></div>
			    			<table border="0" width="100%" style="border:1px solid black; border-bottom:none;" cellpadding="0" cellspacing="0">
							<tr class="CSS">
								<td width="28%" align="center" valign="middle" style="height:28px;" class="border_Right_Bottom">Customer</td>
								<td width="18%" align="center" valign="middle" class="border_Right_Bottom">Opening Balance </td>
				    			<td width="17%" align="center" valign="middle" class="border_Right_Bottom">Debit</td>
								<td width="18%" align="center" valign="middle" class="border_Right_Bottom">Credit</td>
								<td width="19%" align="center" valign="middle" class="border_Bottom">Closing Balance </td>
							</tr>
							<c:forEach items='${reports}' var='report'>
								<tr>
									<td colspan="5" nowrap="nowrap" style="border-bottom:1px solid black;border-right:1px solid black;border-left:1px solid black;"><strong><c:out value='${report.org.name}'/></strong></td>
								</tr>
								<c:forEach items='${report.datas}' var='data'>
									<c:if test="${data.customerData}">
									<tr>
										<td colspan="5" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER</td>
									</tr>
						    		<c:forEach  items='${data.customers}' var='map'> 
									<tr class="CSS1">
										<td align="left" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;&nbsp;<c:out value='${map.customer}'/></td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${map.openingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${map.debit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${map.credit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><fmt:formatNumber value='${map.closingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
					       			</tr>
						  			</c:forEach>
						  			<tr class="CSS1">
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong>Total</strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalOpeningBalance}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalDebit}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalCredit}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${data.totalClosingBalance}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
					      		 	</tr>
					      		 	</c:if>
					      		 	<c:if test="${data.customerLeasingData}">
									<tr>
										<td colspan="5" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER LEASING</td>
									</tr>
						    		<c:forEach  items='${data.customersLeasing}' var='mapLeasing'> 
									<tr class="CSS1">
										<td align="left" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;&nbsp;<c:out value='${mapLeasing.customer}'/></td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapLeasing.openingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapLeasing.debit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapLeasing.credit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><fmt:formatNumber value='${mapLeasing.closingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
					       			</tr>
						  			</c:forEach>
						  			<tr class="CSS1">
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong>Total</strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalOpeningBalanceLeasing}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalDebitLeasing}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalCreditLeasing}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${data.totalClosingBalanceLeasing}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
					      		 	</tr>
					      		 	</c:if>
					      		 	<c:if test="${data.customerMainDealerData}">
									<tr>
										<td colspan="5" bgcolor="gray" align="center" style="border:1px solid black"><font color="white">CUSTOMER MAIN DEALER</td>
									</tr>
						    		<c:forEach  items='${data.customersMainDealer}' var='mapMainDealer'> 
									<tr class="CSS1">
										<td align="left" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;">&nbsp;&nbsp;<c:out value='${mapMainDealer.customer}'/></td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapMainDealer.openingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapMainDealer.debit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><fmt:formatNumber value='${mapMainDealer.credit}' groupingUsed='true'/>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><fmt:formatNumber value='${mapMainDealer.closingBalance}' groupingUsed='true'/>&nbsp;&nbsp;</td>
					       			</tr>
						  			</c:forEach>
						  			<tr class="CSS1">
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong>Total</strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalOpeningBalanceMainDealer}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalDebitMainDealer}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black; border-right:1px solid black;"><strong><fmt:formatNumber value='${data.totalCreditMainDealer}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
										<td align="right" valign="top" style="border-bottom:1px solid black;"><strong><fmt:formatNumber value='${data.totalClosingBalanceMainDealer}' groupingUsed='true'/></strong>&nbsp;&nbsp;</td>
					      		 	</tr>
					      		 	</c:if>
					      		 </c:forEach>
				      		</c:forEach>
				 			</table>
				 			<br/>
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

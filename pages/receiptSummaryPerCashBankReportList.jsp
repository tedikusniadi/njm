<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Receipt Summary Per Cash/Bank Account </title>
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
				<td width="60%">
					Financial Accounting > Account Receivables > Report &gt; Receipt Summary Per Cash/Bank Account </td>
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
							<h1 class="page-title">F34 - Receipt Summary Per Cash/Bank Account <br>
							</h1>
						
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/receiptsummarycashbankreportprepare.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/receiptsummarycashbankreport.xls?organization=${organization.id}&dateFrom='/><fmt:formatDate value='${dateFrom}' pattern='dd-MM-yyyy'/>&dateTo=<fmt:formatDate value='${dateTo}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
							</div>
					  </div>
						
						<div class="main-box">
						<div class="main_container">
						<br>
							<div class="report"><strong>REPORT RECEIPT SUMMARY PER CASH/BANK ACCOUNT</strong></div>
	    					<br>
							<table width="498">	
		   						<tr>	
		    						<td width="100" class="CSS1">Company</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>			  
		   						</tr>
		   						<tr>	
		    						<td width="100" class="CSS1">Period</td>
									<td width="11" class="CSS1">:&nbsp;&nbsp;</td>
									<td width="344" class="CSS1"><fmt:formatDate value='${dateFrom}' pattern='dd MMM yyyy' /> &nbsp;-&nbsp; <fmt:formatDate value='${dateTo}' pattern='dd MMM yyyy' /></td>			  
		   						</tr>
	    					</table><br>

					<c:forEach items='${report}' var='receipt'>
						<div class="CSS1"><strong><c:out value='${receipt.bankAccount.bankName}'/>&nbsp;-&nbsp;<c:out value='${receipt.bankAccount.accountName}'/></strong></div>
						<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
						<tr class="CSS">
							<td width="10%" align="center" valign="middle" class="border_Right_Bottom" style="height:28px;">Date</td>
							<td width="14%" align="center" valign="middle" class="border_Right_Bottom">Receipt Reference</td>
							<td width="10%" align="center" valign="middle" class="border_Right_Bottom">Receipt Type</td>
							<td width="18%" align="center" valign="middle" class="border_Right_Bottom">Reference No</td>
							<td width="16%" align="center" valign="middle" class="border_Right_Bottom">Clearing No </td>
							<td width="16%" align="center" valign="middle" class="border_Right_Bottom">Status</td>
							<td width="16%" align="center" valign="middle" class="border_Bottom">Amount</td>
						</tr>
						<c:forEach  items='${receipt.payments}' var='map'> 
						<tr>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;<fmt:formatDate value='${map.payment.date}' pattern='dd MMM yyyy'/></td>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;<c:out value='${map.payment.receiptInformation.reference}'/></td>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;<c:out value='${map.payment.receiptInformation.paymentMethodType}'/></td>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;<c:out value='${map.payment.code}'/></td>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;<c:out value='${map.payment.clearReceipt.code}'/></td>
							<td align="left" valign="top" class="border_Right_Bottom">&nbsp;
							                                <c:if test="${map.payment.receiptInformation.paymentMethodType == 'CLEARING' && map.payment.cleared}">
                                                              CLEARED
                                                            </c:if>
                                                            <c:if test="${map.payment.receiptInformation.paymentMethodType == 'CLEARING' && !map.payment.cleared}">
                                                              CLEARING
                                                            </c:if>
							</td>
							<td align="right" valign="top" class="border_Bottom"><fmt:formatNumber value='${map.total}' groupingUsed='true'/>&nbsp;</td>
					   </tr>
					  </c:forEach>
					  <tr>
						<td colspan="6" align="right"><strong>Total for &nbsp;<c:out value='${receipt.bankAccount.bankName}'/>&nbsp;-&nbsp;<c:out value='${receipt.bankAccount.accountName}'/> : </strong></td>
						<td colspan="1" align="right" width="16%"><strong><fmt:formatNumber value='${receipt.total}' groupingUsed='true'/></strong>&nbsp;</td>
					 </tr>
					 </table>
					<br>
					</c:forEach>
					<table border="0" width="100%" class="CSS1" cellpadding="0" cellspacing="0" style="border:1px solid black;">
						<tr>
							<td colspan="6" align="right"><strong>Total for <c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/> &nbsp; :</strong></td>
							<td width="16%" colspan="1" align="right"><strong><fmt:formatNumber value='${totalAll}' groupingUsed='true'/></strong>&nbsp;</td>
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

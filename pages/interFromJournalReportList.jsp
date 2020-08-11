<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Inter From Journal Report</title>
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
<div class="area" dojoType="Container" id="quick_link_container">
	<%@ include file="/common/sirius-header.jsp"%>
</div>


<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<div class="area" dojoType="Container" id="quick_link_container">
		<%@ include file="/common/sirius-menu.jsp"%>
	
		<div id="se-navigator">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="60%">Reports > Financial Accounting > Accounting > Inter From Journal</td>
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
							<h1 class="page-title">RF70 - Inter From Journal</h1>
						
							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/interfromjournalreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
								<a class="item-button-export-xls" href="<c:url value='/page/interfromjournalreportexcelview.xls'/>"><span>Export</span></a>
							</div>
						</div>

						<div class="main-box">
							<table width="100%">
                            <tr class="CSS">
                                <td>Company</td>
                                <td>:</td>
                                <td colspan="4">${criteria.organization.firstName} ${criteria.organization.middleName} ${criteria.organization.lastName}</td>
                            </tr>
                            <tr class="CSS">
                            	<td width="130">Date From</td>
                                <td width="9">:</td>
                       	  	  <td width="182"><fmt:formatDate value="${criteria.dateFrom}" pattern="dd-MM-yyyy"/></td>
                                <td width="59">Date To</td>
                                <td width="4">:</td>
                           	  <td width="832"><fmt:formatDate value="${criteria.dateTo}" pattern="dd-MM-yyyy"/></td>
                            </tr>                            
                            </table>
                            <br/>
                            <table width="100%">
                            <tr>
                            	<th width="27%" align="left">Destination</th>
                              	<th width="8%" align="left">Date</th>
                              	<th width="23%" align="left">Journal No</th>
                              	<th width="22%">Description</th>
                              	<th width="11%" align="right">Debet</th>
                              	<th width="9%" align="right">Credit</th>
                            </tr>
                            <c:forEach items='${reports}' var='report'>
                            <c:forEach items='${report.journals}' var='journal' varStatus='status'>
                            <tr>
                            	<td align="left">
                                	<c:if test='${status.index == 0}'>
                                    	${report.destination.firstName} ${report.destination.middleName} ${report.destination.lastName}
                                    </c:if>
                                </td>
                                <td align="left"><fmt:formatDate value='${journal.entryTo.entryDate}' pattern='dd-MM-yyyy'/></td>
                                <td align="left">${journal.entryTo.code}</td>
                                <td align="left">${journal.entryTo.note}</td>
                                <td align="right">
                                	<c:if test="${journal.postingType == 'DEBET'}">
                                    	<fmt:formatNumber value='${journal.amount * journal.entryTo.exchange.rate}' groupingUsed='true' pattern=',##0.00'/>
                                    </c:if>
                                </td>
                                <td align="right">
                                	<c:if test="${journal.postingType == 'CREDIT'}">
                                    	<fmt:formatNumber value='${journal.amount * journal.entryTo.exchange.rate}' groupingUsed='true' pattern=',##0.00'/>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                            <tr>
                            	<td colspan="4">&nbsp;</td>
                                <td><hr/></td>
                                <td><hr/></td>
                            </tr>
                            <tr>
                            	<td colspan="4" align="right"><strong>Total ${report.destination.firstName} ${report.destination.middleName} ${report.destination.lastName}</strong>&nbsp;</td>
                                <td align="right"><strong><fmt:formatNumber value='${report.debet}' groupingUsed='true' pattern=',##0.00'/></strong></td>
                                <td align="right"><strong><fmt:formatNumber value='${report.credit}' groupingUsed='true' pattern=',##0.00'/></strong></td>
                            </tr>
                            </c:forEach>
                            </table>
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
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

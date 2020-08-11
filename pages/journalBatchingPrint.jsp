<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Journal Batching Print</title>
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
	.main_container
	{

			padding: 4px;
			margin: 2px;
			width: 90%;
			height:100%;
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

	.widthPrint {color:#000000; font-weight:normal; width:60%;}
	.tenPersen1 {color:#000000; font-weight:normal; width:10%;}
	.tenPersen2 {color:#000000; font-weight:normal; width:10%;}
	.tenPersen3 {color:#000000; font-weight:normal; width:10%;}
	.tenPersen4 {color:#000000; font-weight:normal; width:10%;}

.adjust {width:150px;}
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
	.main_container
	{
		border: 0px solid white;
			padding: 4px;
			margin: 4px;
			width: 100%;
			height:100%;
			position: relative;
			overflow: scroll;
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
}
.CSS {
	font-family: Verdana;
	font-size: 10px;
	font-weight: bold;
}
.CSS1 {
	font-family: Verdana;
	font-size: 10px;
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
.margin-left {margin-left:7px;}
-->
.border-top{
	border-top:1px solid black;
}
.border-left{
	border-left: 1px solid black;
}
.border-right{
	border-right: 1px solid black;
}
.border-bottom{
	border-bottom: 1px solid black;
}
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
	<!-- /main menu -->

	<!-- tips & page navigator -->
	<div id="se-navigator">
	<div class="area" dojoType="Container" id="quick_link_container">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Journal Entry Batching > Print</td>
			<td width="40%" align="right">
				<%@ include file="/common/welcome.jsp"%>
			</td>
		</tr>
		</table>
	</div>
	</div>
	<!-- /tips & page navigator -->

	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					<!-- main contents goes here -->

						<div class="area" dojoType="Container" id="quick_link_container">

							<h1 class="page-title">F60 - Journal Entry Batching Print<br></h1>

							<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/journalBatchingList.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>					  		</div>
						</div>
						<div class="main-box">
							<div class="main_container" >
								<div class="pageTitle"><strong class="margin-left">Journal Batching</strong></div>
								<br/>
								<br/>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="margin-left" >
                                <tr class="CSS">
                                    <td height="28px" align="center" class="border-top border-left border-bottom">Date</td>
                                    <td align="left" class="border-top border-left border-bottom">&nbsp;Journal Name/Account</td>
                                    <td align="center" class="border-top border-left border-bottom">Debit</td>
                                    <td align="center" class="border-top border-left border-bottom">Credit</td>
                                    <td align="center" class="border-top border-left border-bottom border-right">Currency</td>
                                </tr>
                                <c:set var="credit" value="0"/>
                                <c:set var="debit" value="0"/>
                                <c:forEach items='${journalEntrys}' var='journalBatching'>
                                <tr class="CSS1">
                                    <td height="29" nowrap  class="widthPrint" style="border-left: 1px solid black;">
                                        <fmt:formatDate value='${journalBatching.entryDate}' pattern='dd-MM-yyyy'/>
                                    </td>
                                    <td height="29" nowrap  class="widthPrint" style="border-left: 1px solid black;">
                                        <c:out value='${journalBatching.code} - ${journalBatching.name}'/>
                                    </td>
                                    <td align="right" style="border-left: 1px solid black;"></td>
                                    <td align="right" style="border-left: 1px solid black;"></td>
                                    <td align="right" style="border-left: 1px solid black;border-right: 1px solid black;"></td>
                                </tr>
                                <c:forEach items='${journalBatching.details}' var='item'>
                                <tr>
                                    <td style="border-left: 1px solid black;"></td>
                                    <td style="border-left: 1px solid black;">
                                        <c:out value='${item.account.code}'/>-<c:out value='${item.account.name}'/>
                                    </td>
                                    <td align="right" style="border-left: 1px solid black;" >
                                        <c:if test="${item.postingType == 'DEBET'}">
                                            <fmt:formatNumber value='${item.amount}' pattern=',#00.00'/>
                                            <c:set var="debit" value="${item.amount+debit}"/>
                                        </c:if>&nbsp;
                                    </td>
                                    <td align="right" style="border-left: 1px solid black;">
                                        <c:if test="${item.postingType == 'CREDIT'}">
                                            <fmt:formatNumber value='${item.amount}' pattern=',#00.00'/>
                                            <c:set var="credit" value="${item.amount+credit}"/>
                                        </c:if>&nbsp;
                                    </td>
                                    <td width="5%" align="center" style="border-left: 1px solid black;border-right: 1px solid black;"><c:out value='${journalBatching.currency.symbol}'/></td>
                                </tr>
                                </c:forEach>
                                </c:forEach>
                                <tr class="CSS1" style="border-top: 1px solid black;">
                                    <td  colspan="2" height="29" align="right" style="border-top: 1px solid black;"><strong>Total :</strong>&nbsp;&nbsp;</td>
                                    <td  align="right" style="border-top: 1px solid black;">
                                        <fmt:formatNumber value="${debit}" groupingUsed='true' pattern=',##0.00'/>&nbsp;&nbsp;
                                    </td>
                                    <td  align="right" style="border-top: 1px solid black;">
                                        <fmt:formatNumber value="${credit}" groupingUsed='true' pattern=',##0.00'/>&nbsp;&nbsp;
                                    </td>
                                    <td style="border-top: 1px solid black;"></td>
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

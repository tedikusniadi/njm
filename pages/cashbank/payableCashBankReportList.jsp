<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cash/Bank Report</title>
	<style type="text/css" media="screen,print">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report-normal.css"); -->
    </style>

	<script type="text/javascript">
		function printPage(){
	   		print();
		}
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
				<td width="60%">Reports > Financial Accounting > Accounting > Bank/Cash Account</td>
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
						<h1 class="page-title">RF76 - Bank/Cash Report</h1>

						<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/reportpayablecashbankpre.htm'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
						</div>
					</div>

					<div class="main-box">
	 					<div class="pageTitle"><strong>Bank/Cash Account Report<br></strong></div><br>
                        <table width="75%" class="margin-left">
	                        <tr >
	                            <td width="205">Company</td>
	                          	<td width="1%">:</td>
	                            <td width="691"><c:out value='${criteria.organization.name}'/></td>
	                        </tr>
	                     	<tr >
	                            <td width="205">Date</td>
	                        	<td width="10">:</td>
	                            <td width="691"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd-MM-yyyy'/></td>
	                        </tr>
                        </table>

                        <div class="clears">&nbsp;</div>
                        <c:forEach items="${reports}" var="report" >
                        <strong><c:out value='${report.account.code} - ${report.account.name}'/></strong>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="report-table">
	                        <thead>
		                        <tr>
		                            <th colspan="2" width="15%" align="left" class="border-bottom">Deskripsi</th>
		                          	<th width="17%" align="right" class="border-bottom">Debit</th>
		                          	<th width="24%" align="right" class="border-bottom">Credit</th>
		                        </tr>
	                        </thead>
                        	<tbody>
		                        <tr>
		                            <td colspan="2"><strong>Opening Balance</strong></td>
		                            <td align="right">
		                            	<c:if test='${report.openingdebet > report.openingcredit}'>
		                            		<strong><fmt:formatNumber value="${report.openingdebet-report.openingcredit}" pattern=',##0.00'/></strong>
		                                </c:if>
		                            </td>
		                            <td align="right">
		                            	<c:if test='${report.openingdebet < report.openingcredit}'>
		                            		<strong><fmt:formatNumber value="${report.openingcredit-report.openingdebet}" pattern=',##0.00'/></strong>
		                                </c:if>
		                            </td>
		                        </tr>
                        <c:set var='t_debet' value='${0}'/>
                        <c:set var='t_credit' value='${0}'/>

						<tr><td colspan="2"><strong>Debit Transaction</strong></td></tr>
						<c:forEach items='${report.entrys}' var='entry'>
							<c:if test="${entry.postingType == 'DEBET'}">
	                        <tr>
	                            <td valign="top">
	                                &nbsp;<c:out value="${entry.journalEntry.code}" />
	                            </td>
	                            <td valign="top">
	                                <c:out value="${entry.journalEntry.name}" />
	                            </td>
	                            <td  align="right" valign="top">
	                                &nbsp;
	                                    <fmt:formatNumber value="${entry.amount}" pattern="#,###.00"/>
	                                    <c:set var='t_debet' value='${t_debet+entry.amount}'/>
	                            </td>
	                            <td align="right" valign="top">
	                            </td>
	                        </tr>
	                        </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><strong>Total Debit</strong></td><td align="right"><fmt:formatNumber value="${t_debet}" pattern="#,###.00"/></td></tr>

                        <tr><td colspan="2"><strong>Credit Transaction</strong></td></tr>
						<c:forEach items='${report.entrys}' var='entry'>
							<c:if test="${entry.postingType == 'CREDIT'}">
	                        <tr>
	                            <td valign="top">
	                                &nbsp;<c:out value="${entry.journalEntry.code}" />
	                            </td>
	                            <td valign="top">
	                                <c:out value="${entry.journalEntry.name}" />
	                            </td>
	                            <td align="right" valign="top">
	                            </td>
	                            <td  align="right" valign="top">
	                                &nbsp;
	                                    <fmt:formatNumber value="${entry.amount}"  pattern='#,###.00'/>
	                                    <c:set var='t_credit' value='${t_credit+entry.amount}'/>
	                            </td>
	                        </tr>
	                        </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><strong>Total Credit</strong></td><td></td><td align="right"><fmt:formatNumber value="${t_credit}" pattern="#,###.00"/></td></tr>
                        <tr >
                            <td colspan="2" valign="top"><strong>Closing Balance</strong>
                            	<c:set var="closing" value="${(report.openingcredit-report.openingdebet)+t_debit-t_credit}"/>
                            </td>
                            <td align="right" valign="top"><strong>
                                <fmt:formatNumber value="${(closing>0)?closing:0}"  pattern=',##0.00'/></strong>
                            </td>
                            <td  align="right" valign="top">
                                <strong><fmt:formatNumber value="${(closing<0)?closing:0}"  pattern=',##0.00'/></strong>
                            </td>
                        </tr>
                        </tbody>
                        </table>
                        <br/><br/><br/><br/>
                        <c:remove var='name'/>
                        </c:forEach >
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>

</body>

</html>

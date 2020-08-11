<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Bank/Cash Account Report</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
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
						<h1 class="page-title">RF76 - Bank/Cash Account Report</h1>
						
						<div class="toolbar">
							<a class="item-button-back" href="<c:url value='/page/reportbankaccountpre.htm'/>"><span>Back</span></a>
							<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
							<a class="item-button-export-xls" href="<c:url value='/page/reportbankaccountexcel.xls'/>"><span>Export</span></a>
						</div>
					</div>

					<div class="main-box">
	 					<div class="pageTitle"><strong>Bank/Cash Account Report<br></strong></div><br>
                        <table width="75%" class="margin-left">
                        <tr >
                            <td width="205">Bank/Cash Account</td>
                          	<td width="1%">:</td>
                            <td width="691"><c:out value='${criteria.bankAccount.bankName} - ${criteria.bankAccount.accountNo}'/></td>
                        </tr>
                     	<tr >
                            <td width="205">Period</td>
                        	<td width="10">:</td>
                            <td width="691"><fmt:formatDate value='${criteria.dateFrom}' pattern='dd-MM-yyyy'/> to <fmt:formatDate value='${criteria.dateTo}' pattern='dd-MM-yyyy'/></td>
                        </tr>
                        </table>
                        <div class="clears">&nbsp;</div>
                        <c:forEach items="${reports}" var="report" >
                        <c:set var='name' value='${report.openingdebet-report.openingcredit}'/>
                        <table width="100%" border="0" class="report-table">
                        <thead>
                        <tr>
                            <th width="9%" align="left">Account</th>
                          	<th width="17%" align="center">Date</th>	
                          	<th width="24%" align="center">Reference No.</th>
                       	  	<th width="17%" align="right">Debit</th>	
                       	  	<th width="17%" align="right">Credit</th>
                       	  	<th width="16%" align="right">Balance</th>
                        </tr>
                        </thead>
                        <tbody>                        
                        <tr>
                            <td colspan="6" valign="top"><strong><c:out value='${report.account.code} - ${report.account.name}'/></strong></td>
                        </tr>
                        <tr>
                            <td >&nbsp;</td>
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
                            <td align="right">
                            	<strong><fmt:formatNumber value="${report.openingdebet - report.openingcredit}" pattern=',##0.00'/></strong>
                            </td>
                        </tr>
                        <c:set var='t_debet' value='${0}'/>
                        <c:set var='t_credit' value='${0}'/>
                        
                        <c:if test='${report.openingdebet > report.openingcredit}'>
                        	<c:set var='t_debet' value='${t_debet+report.openingdebet-report.openingcredit}'/>
                        </c:if>
                        <c:if test='${report.openingdebet < report.openingcredit}'>
                        	<c:set var='t_credit' value='${t_credit+report.openingcredit-report.openingdebet}'/>
                        </c:if>
                        
                        <c:forEach items='${report.entrys}' var='entry'>
                        <tr>
                           <td valign="top">	
                                &nbsp;<fmt:formatDate value="${entry.journalEntry.entryDate}" pattern="dd-MM-yyyy"/>
                            </td>
                            <td valign="top">	
                                &nbsp;<c:out value="${entry.journalEntry.code}" />
                            </td>   
                            <td valign="top">	
                                <c:out value="${entry.journalEntry.name}" />
                            </td>                          
                            <td  align="right" valign="top">
                                &nbsp;
                                <c:if test="${entry.postingType == 'DEBET'}">
                                    <fmt:formatNumber value="${entry.amount}"  pattern=',##0.00'/>
                                    <c:set var='name' value='${name+entry.amount}'/>
                                    <c:set var='t_debet' value='${t_debet+entry.amount}'/>
                                </c:if>    
                            </td>
                            <td   align="right" valign="top">
                                &nbsp;
                                <c:if test="${entry.postingType == 'CREDIT'}">
                                  <fmt:formatNumber value="${entry.amount}"  pattern=',##0.00'/>
                                  <c:set var='name' value='${name-entry.amount}'/>
                                  <c:set var='t_credit' value='${t_credit+entry.amount}'/>
                                </c:if> 
                            </td>
                            <td align="right" valign="top">
                                <c:if test="${name < 0}">
                                    <c:if test="${report.account.postingType == 'DEBET'}">(</c:if>
                                        <fmt:formatNumber value="${name*-1}"  pattern=',##0.00'/>
                                    <c:if test="${report.account.postingType == 'DEBET'}">)</c:if>
                                </c:if>
                                <c:if test='${name >= 0}'>
                                    <fmt:formatNumber value="${name}"  pattern=',##0.00'/>
                                </c:if>
                            </td>
                        </tr>
                        </c:forEach>       
                        <tr >
                            <td colspan="3">&nbsp;	</td>
                            <td  align="right" colspan="3"><hr/></td>	
                        </tr>
                        <tr >
                            <td >&nbsp;	</td>
                            <td colspan="2" valign="top"><strong>Closing Balance</strong></td>
                            <td align="right" valign="top"><strong>
                                <fmt:formatNumber value="${t_debet}"  pattern=',##0.00'/></strong>
                            </td>	
                            <td  align="right" valign="top">
                                <strong><fmt:formatNumber value="${t_credit}"  pattern=',##0.00'/></strong>
                            </td>
                            <td align="right" valign="top">
                                <strong>
                                <c:if test='${name < 0}'>
                                    <c:if test="${report.account.postingType == 'DEBET'}">(</c:if>
                                        <fmt:formatNumber value="${name*-1}"  pattern=',##0.00'/>
                                    <c:if test="${report.account.postingType == 'DEBET'}">)</c:if>
                                </c:if>
                                <c:if test='${name >= 0}'>
                                    <fmt:formatNumber value="${name}"  pattern=',##0.00'/>
                                </c:if>
                                </strong>
                            </td>	
                        </tr>
                        <tr><td colspan="6">&nbsp;</td></tr>
                        </tbody>
                        </table>
                        <div class="clears">&nbsp;</div>
                        <c:remove var='name'/>
                        </c:forEach >
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

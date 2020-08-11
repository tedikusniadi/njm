<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>General Journal Report</title>
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

			<div id="se-navigator">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="60%">Reports > Financial Accounting > Accounting > General Journal</td>
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
                            <h1 class="page-title">RF68 - General Journal</h1>
                            
                            <div class="toolbar">
                                <a class="item-button-back" href="<c:url value='/page/generaljournalreportpre.htm'/>"><span>Back</span></a>
                                <a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                                <a class="item-button-export-xls" href="<c:url value='/page/generaljournalreportexcelview.xls'/>"><span>Export</span></a>
                            </div>
                        </div>
						<div class="main-box">
			   				<div class="pageTitle"><strong>General Journal</strong></div><br>

			    			<div >
                            	<table width="100%">
                                <tr>
                                	<td width="7%">Date</td>
                                  	<td width="1%">:</td>
                                  	<td width="92%"><fmt:formatDate value="${criteria.dateFrom}"/>-<fmt:formatDate value="${criteria.dateTo}"/></td>
                                </tr>
                                <tr>
                                	<td>Company</td>
                                    <td>:</td>
                                    <td>
                                    	<c:forEach items='${criteria.organizations}' var='org'>
                                        	<a href="<c:url value='/page/partypreedit.htm?id=${org.id}'/>"><c:out value='${org.firstName} ${org.middleName} ${org.lastName}'/></a>,
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
							</div>
                            <div class="clears">&nbsp;</div>
							<table width="100%" cellpadding="5" cellspacing="0" class="report-table">
							<thead>
                            <tr >
			    			  	<th width="99"  align="left">Trans. Date</th>
                       		  	<th align="left" colspan="2">Entry No./<br/>
                   		      	&nbsp;&nbsp;&nbsp;&nbsp;GL Account No.</th>
	    			  	  	  	<th width="49"  align="center" >Curr</th>
	    			  	  	 	<th width="133" align="right">Debit</th>
	    			  	  	  	<th width="131" align="right">Credit</th>
                                <th width="131" align="right">Status</th>
							</tr>
                            </thead>
                            <tr><td colspan="6">&nbsp;</td></tr>
							<c:forEach items="${reports}" var="journal">
							<tr class="CSS1">
				    			<td  align="left"><fmt:formatDate value="${journal.entryDate}" pattern='dd-MM-yyyy'/>&nbsp;&nbsp;</td>
				    			<td  align="left" valign="middle" colspan="5"><c:out value='${journal.code} - ${journal.name}'/></td>
                                <td  align="right" valign="middle">
                                	<strong>
                                    	<c:out value='${journal.entryStatus}'/>
                                        <br/>
                                        <c:out value='${journal.createdBy.firstName}'/>
                                    </strong>
                                </td>
							</tr>
                            <c:set var='_t_credit' value='0'/>
                            <c:set var='_t_debet' value='0'/>
                            <c:forEach items='${journal.details}' var='detail'>
                            <tr class="CSS1">
				    			<td>&nbsp;</td>
				    			<td width="89" valign="top">&nbsp;&nbsp;&nbsp;<c:out value='${detail.account.code}'/></td>
                              	<td width="728"><c:out value='${detail.account.name} - ${detail.note}'/></td>
								<td align="center" valign="middle" ><c:out value='${journal.currency.symbol}'/></td>
				    			<td align="right" >
                                	<c:if test="${detail.postingType == 'DEBET'}">
                                    	<fmt:formatNumber value='${detail.amount}' groupingUsed='true' pattern=',##0.00'/>
                                        <c:set var='_t_debet' value='${_t_debet+detail.amount}'/>
                                    </c:if>
                                </td>
                                <td align="right" >
                                	<c:if test="${detail.postingType == 'CREDIT'}">
                                    	<fmt:formatNumber value='${detail.amount}' groupingUsed='true' pattern=',##0.00'/>
                                        <c:set var='_t_credit' value='${_t_credit+detail.amount}'/>
                                    </c:if>
                                </td>
							</tr>
                            </c:forEach>
                            <tr class="CSS1">
				    			<td align="right" colspan="4">&nbsp;</td>
				    			<td align="right"><strong><fmt:formatNumber value='${_t_debet}' groupingUsed='true' pattern=',##0.00'/></strong></td>
                                <td align="right"><strong><fmt:formatNumber value='${_t_credit}' groupingUsed='true' pattern=',##0.00'/></strong></td>
							</tr>
                            <c:remove var='_t_credit'/>
                            <c:remove var='_t_debet'/>
                            <tr><td colspan="6">&nbsp;</td></tr>
							</c:forEach>
							</table>
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

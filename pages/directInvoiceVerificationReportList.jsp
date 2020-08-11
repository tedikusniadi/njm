<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Advance Pertamina Verification Report</title>
	<style type="text/css" media="screen">
		 @import url("<c:url value='/assets/sirius.css'/>");
		 @import url("<c:url value='/css/deliveryRecapitulationReport.css'/>");
	</style>
	<style type="text/css" media="print">
		@import url("<c:url value='/css/deliveryRecapitulationReport.css'/>");
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
				<td width="60%">Financial Accounting > Account Payable > Reports > Advance Pertamina Verification Report</td>
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
							<h1 class="page-title">F58 - Advance Pertamina Verification Report</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/directinvoiceverificationreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/directinvoiceverificationreportexcell.xls?org=${organization.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<table width="100%" cellpadding="5" style="font-weight:bolder;">
                                <tbody>
                                <tr>
                                	<td width="8%">Organization</td>
                                  	<td width="1%">:</td>
                                  	<td width="91%"><c:out value='${organization.firstName} ${organization.middleName} ${organization.lastName}'/></td>
                                </tr>
                                <tr>
                                	<td width="8%">Date</td>
                                  	<td width="1%">:</td>
                                  	<td width="91%"><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;To&nbsp;&nbsp;<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div style="overflow:auto; width:100%; height: 100%;"> 
                                <table style="border:none" width="185%" cellspacing="0" cellpadding="2" border="0">
                                <thead>
                                <tr>
                                    <th width="7%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                    <th width="22%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Reference</th>
                                    <th width="6%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Bill&nbsp;From</th>
                                    <th width="10%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Pertamina SO</th>
                                    <th width="10%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tax&nbsp;Invoice No.</th>
                                    <th width="7%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tax&nbsp;Date</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Transaction</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tax&nbsp;1</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tax&nbsp;2</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tax&nbsp;3</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Debit&nbsp;Memo</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Return&nbsp;Tax</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Rounding</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Total&nbsp;Amount</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Unpaid&nbsp;Amount&nbsp;</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='rep'>
                               <tr>
                                    <td align="left"><fmt:formatDate value='${rep.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${rep.ref}'/></td>
                                    <td align="left"><c:out value='${rep.supplier}'/></td>
                                    <td align="left"><c:out value='${rep.code}'/></td>
                                	  <td align="left"><c:out value="${rep.taxNo}"/></td>
                                    <td align="left"><fmt:formatDate value='${rep.taxDate}' pattern='dd-MM-yyyy'/></td>
                                    <td align="right"><fmt:formatNumber value='${rep.trxAmount}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.tax}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.tax1}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.tax2}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.debit}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.returTax}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.rounding}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.total}' pattern=',##0.00'/>&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${rep.unpaid}' pattern=',##0.00'/>&nbsp;</td>
                                </tr>
                                <c:if test="${not empty rep.totalUnpaid}">
                                <tr>
                                <strong>
                                        <td align="left" colspan="6">&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalTrx}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalTax}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalTax1}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalTax2}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalDebet}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalRetur}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalRounding}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalAmount}' pattern=',##0.00'/>&nbsp;</td>
                                        <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${rep.totalUnpaid}' pattern=',##0.00'/>&nbsp;</td>
                                </strong>
                                </tr>
                                </c:if>
                                </c:forEach>
                                </tbody>
                                </table>
                                </div>
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

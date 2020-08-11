<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SalesOrder Cost Component Report</title>
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
				<td width="60%">Procurement > Report > Sales Order Cost Component</td>
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
							<h1 class="page-title">S06 - Sales Cost Component</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/dorealizationcostcomponentgroupreportview.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/dorealizationcostcomponentgroupreportexcel.xls?org=${organization.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
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
                                <table style="border:none" width="100%" cellspacing="0" cellpadding="5">
                                <thead>
                                <tr>
                                    <th width="8%" valign="middle" align="left" rowspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                    <th width="20%" valign="middle" align="left" rowspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;">Reference</th>
                                    <th width="13%" valign="middle" align="left" rowspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;">Vehicle</th>
                                    <th width="2%" valign="middle" align="left" rowspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;">Rit</th>
                                    <th width="40%" valign="top" align="center" colspan="<c:out value='${count}'/>" style="border-top:solid 1px black;">Cost</th>
                                    <th width="9%" valign="middle" align="left" rowspan="2" style="border-top:solid 1px black;black;border-bottom:solid 1px black;">Total Cost</th>
                                </tr>
                                <tr>
                                 <c:forEach items='${costs}' var='cost'>
                                        <th width="10" valign="top" align="center" style="black;border-bottom:solid 1px black;">Cost <c:out value='${cost.name}'/></th>
                                </c:forEach>
                                <tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='rep'>
                               <tr>
                                    <td align="left"><fmt:formatDate value='${rep.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${rep.code}'/></td>
                                    <td align="left"><c:out value='${rep.vehicle}'/></td>
                                    <td align="left"><c:out value='${rep.rit}'/></td>
                                    <c:forEach items='${rep.amounts}' var='amount'>
                                        <td align="right"><fmt:formatNumber value='${amount.amount}' pattern=',##0.00'/></td>
                                    </c:forEach>
                                    <td align="right"><fmt:formatNumber value='${rep.costAmount}' pattern=',##0.00'/></td>
                                </tr>
                                 <c:if test='${not empty rep.total}'>
                                <tr>
                                        <td align="left" colspan="4"></td>
                                        <c:forEach items='${rep.totalList}' var='totals'>
                                                <td align="right" style="border-top:solid 1px black;font-weight:bold; "><fmt:formatNumber value='${totals.totalCost}' pattern=',##0.00'/></td>
                                        </c:forEach>
                                        <td align="right" style="border-top:solid 1px black;font-weight:bold; "><fmt:formatNumber value='${rep.total}' pattern=',##0.00'/></td>
                                </tr>
                                </c:if>
                                </c:forEach>
                                <tr>
                                </tbody>
                                </table>
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

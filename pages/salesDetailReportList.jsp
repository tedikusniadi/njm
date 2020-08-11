        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Sales Detail</title>
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
				<td width="60%">Sales > Report > Sales Detail</td>
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
							<h1 class="page-title">SR02 - Sales Detail</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/salesdetailreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/salesdetailreportexcel.xls?organization=${com.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
					  		</div>
						</div>
						
						<div class="main-box">
                            <div class="main_container">
                            	<table width="100%" cellpadding="5">
                                <tbody>
                                <tr>
                                	<td width="17%">Company</td>
                                  	<td width="1%">:</td>
                                  	<td width="82%"><c:out value='${com.firstName} ${com.middleName} ${com.lastName}'/></td>
                                </tr>
                                <tr>
                                	<td>Period</td>
                                    <td>:</td>
                                    <td><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;to&nbsp;&nbsp;<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table style="border:none" width="100%" cellspacing="0" cellpadding="5" border="0">
                                <thead>
                                <tr>
                                    <th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                    <th width="10%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Customer</th>
                                    <th width="8%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Sales</th>
                                    <th width="20%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Order<br/>
                                  &nbsp;&nbsp;&nbsp;Item</th>
                                    <th width="5%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Qty</th>
                                    <th width="7%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Price</th>
                                    <th width="5%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Disc</th>
                                  <th width="7%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Amount</th>
                                  <th width="6%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">COGS</th>
                                    <th width="7%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tot. COGS</th>
                                  <th width="8%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Cost</th>
                                  <th width="8%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Net</th>
                                  <th width="5%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Net(%)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='repo'>
                                <tr>
                                    <td align="center"><fmt:formatDate value='${repo.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${repo.customer}'/></td>
                                    <td align="left" colspan="11"><c:out value='${repo.sales}'/></td>
                                </tr>
                                <c:forEach items='${repo.details}' var='det'>
                                <tr>
                                        <td align="left" colspan="3">&nbsp;</td>
                                        <td align="left" colspan="10"><c:out value='${det.order}'/></td>
                                <tr>
                                <c:forEach items='${det.items}' var='item'>
                                <tr>
                                	<td align="left" style="border-bottom:solid 1px white;" colspan="3">&nbsp;</td>
                                    <td align="left" style="border-bottom:solid 1px white;" colspan="1"><c:out value='${item.name}'/></td>
                                    <td align="right" style="border-bottom:solid 1px white;"><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-bottom:solid 1px white;"><fmt:formatNumber value='${item.amount}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-bottom:solid 1px black;"><fmt:formatNumber value='${item.disc}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-bottom:solid 1px black;"><fmt:formatNumber value='${item.quantity*item.amount}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-bottom:solid 1px white;"><fmt:formatNumber value='${item.cogs / item.quantity}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-bottom:solid 1px black;"><fmt:formatNumber value='${item.cogs}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                	<td align="left" colspan="6">&nbsp;</td>
                                    <td align="right">&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${det.t_amount}' pattern=',##0.00'/></td>
                                    <td align="left">&nbsp;</td>
                                    <td align="right"><fmt:formatNumber value='${det.t_cogs}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.t_cost}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.t_amount-det.t_cogs-det.t_cost}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${(det.t_amount-det.t_cogs-det.t_cost)/det.t_amount*100}' pattern=',##0.00'/>%</td>
                                </tr>
                                </c:forEach>
                                <c:if test="${not empty repo.g_amount}">
                                <tr>
                                  <td align="right" colspan="7">&nbsp;</td>
                                	<td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${repo.g_amount}' pattern=',##0.00'/></td>
                                  <td align="left" style="border-top:solid 1px black;">&nbsp;</td>
                                  <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${repo.g_cogs}' pattern=',##0.00'/></td>
                                  <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${repo.g_cost}' pattern=',##0.00'/></td>
                                  <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${repo.g_amount-repo.g_cogs-repo.g_cost}' pattern=',##0.00'/></td>
                                  <td align="right" style="border-top:solid 1px black; font-weight:bold;"><fmt:formatNumber value='${(repo.g_amount-repo.g_cogs-repo.g_cost)/repo.g_amount*100}' pattern=',##0.00'/>%</td>
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

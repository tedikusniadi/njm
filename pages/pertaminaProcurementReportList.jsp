<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Pertamina Procurement Report</title>
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
				<td width="60%">Procurement > Report > Pertamina Procurement</td>
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
							<h1 class="page-title">PR01 - Pertamina Procurement</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/pertaminaprocurementreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/pertaminaprocurementreportexcel.xls?org=${organization.id}&supp=${supplier.id}&from='/><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&to=<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
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
                                	<th width="20%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Supplier</th>
                                    <th width="9%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                    <th width="31%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Collectiong Order<br/>
                                  &nbsp;&nbsp;&nbsp;Item</th>
                                    <th width="6%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Qty</th>
                                    <th width="12%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Price</th>
                                    <th width="11%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Discount</th>
                                    <th width="11%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Tot. Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${reports}' var='rep'>
                                <tr>
                                	<td align="left" colspan="7"><strong><c:out value='${rep.supplier}'/></strong></td>
                                </tr>
                                <c:forEach items='${rep.details}' var='det'>
                                <tr>
                                	<td align="left">&nbsp;</td>
                                    <td align="left"><fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left" colspan="5"><c:out value='${det.order}'/></td>
                                </tr>
                                <c:set var='t_discount' value='${0}'/>
                                <c:set var='t_amt' value='${0}'/>
                                <c:forEach items='${det.items}' var='item'>
                                <tr>
                                	<td align="left" colspan="2">&nbsp;</td>
                                    <td align="left">&nbsp;&nbsp;&nbsp;<c:out value='${item.item.product.name}'/></td>
                                    <td align="right"><fmt:formatNumber value='${item.item.quantity}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${item.item.unitPrice}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${item.item.discountAmount}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${(item.item.quantity*item.item.unitPrice)-item.item.discountAmount}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='t_discount' value='${t_discount+item.item.discountAmount}'/>
                                <c:set var='t_amt' value='${t_amt+((item.item.quantity*item.item.unitPrice)-item.item.discountAmount)}'/>
                                </c:forEach>
                                <tr>
                                	<td align="left" colspan="5">&nbsp;</td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${t_discount}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${t_amt}' pattern=',##0.00'/></td>
                                </tr>
                                <c:remove var='t_discount'/>
                                <c:remove var='t_amt'/>
                                </c:forEach>
                                <tr>
                                	<td align="left" colspan="7">&nbsp;</td>
                                </tr>
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

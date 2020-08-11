<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>HPP Summary</title>
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
				<td width="60%">Sales > Report > HPP Summary</td>
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
							<h1 class="page-title">SR04 - HPP Summary</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/hppsummaryreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/hppsummaryreportexcel.xls?organization=${organization.id}&product=${product.id}&date='/><fmt:formatDate value='${date}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
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
                                	<td width="8%">Month</td>
                                  	<td width="1%">:</td>
                                  	<td width="91%"><fmt:formatDate value='${date}' pattern='MMMM-yyyy'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table border="0" width="100%" cellspacing="0" cellpadding="5">
                                <thead>
                    <c:set var='a_opening' value='${0}'/>
                    <c:set var='a_in' value='${0}'/>
                    <c:set var='a_out' value='${0}'/>
                    <c:set var='a_closing' value='${0}'/>
					<c:forEach items='${reports}' var='repo'>
					<tr>
						<th align="left" width="9%">Facility</th>
						<th align="left"  width="1%">:</th>
						<th align="left" colspan="4" width="100%"><c:out value='${repo.facility}'/></th>
					</tr>
					<tr>
						<th colspan="2" width="20%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Product</th>
						<th width="10%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Opening Qty</th>
						<th width="5%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">In</th>
						<th width="5%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Out</th>
						<th width="10%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Closing Qty</th>
						<th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Opening Amount</th>
						<th width="10%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">In Amount</th>
						<th width="10%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Out Amount</th>
						<th width="15%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Closing Amount</th>
					</tr>
                                </thead>
                                <tbody>
					<c:forEach items='${repo.details}' var='det'>
					<tr>
						<td colspan="2" align="left"><c:out value='${det.product}'/></td>
						<td align="right"><fmt:formatNumber value='${det.openingQty}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.in}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.out}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.openingQty+(det.in-det.out)}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.openingAmount}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.pIN}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.pOUT}' pattern=',##0.00'/></td>
						<td align="right"><fmt:formatNumber value='${det.openingAmount+(det.pIN-det.pOUT)}' pattern=',##0.00'/></td>
						<td></td>
                                <c:set var='a_opening' value='${a_opening+det.openingAmount}'/>
                                <c:set var='a_in' value='${a_in+det.pIN}'/>
                                <c:set var='a_out' value='${a_out+det.pOUT}'/>
                                <c:set var='a_closing' value='${a_closing+det.openingAmount+(det.pIN-det.pOUT)}'/>
					</tr>
					</c:forEach>
                                </c:forEach>
                                </tbody></tbody>
                                <tr>
                                	<td align="left" colspan="6">&nbsp;</td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${a_opening}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${a_in}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${a_out}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${a_closing}' pattern=',##0.00'/></td>
                                </tr>
                                <c:remove var='a_opening' />
                                <c:remove var='a_out'/>
                                <c:remove var='a_in' />
                                <c:remove var='a_closing'/>
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

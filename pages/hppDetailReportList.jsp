<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>HPP Detail</title>
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
				<td width="60%">Sales > Report > HPP Detail</td>
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
							<h1 class="page-title">SR05 - HPP Detail</h1>
							<div class="clears">&nbsp;</div>
					  		<div class="toolbar">
								<a class="item-button-back" href="<c:url value='/page/hppdetailreportpre.htm'/>"><span>Back</span></a>
								<a class="item-button-print" href="javascript:window.print();"><span>Print</span></a>
                            	<a class="item-button-export-xls" href="<c:url value='/page/hppdetailreportexcel.xls?organization=${organization.id}&product=${product.id}&date='/><fmt:formatDate value='${date}' pattern='dd-MM-yyyy'/>"><span>Export</span></a>
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
                                	<td>Period</td>
                                    <td>:</td>
                                    <td><fmt:formatDate value='${from}' pattern='dd-MM-yyyy'/>&nbsp;&nbsp;to&nbsp;&nbsp;<fmt:formatDate value='${to}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <c:forEach items='${reports}' var='repo'>
                                <table width="100%" cellpadding="5" style="font-weight:bolder;">
                                <tbody>
                                <tr>
                                	<td width="8%"><c:out value='${repo.product}'/></td>
                                </tr>
                                </tbody>
                                </table>
                                <table style="border:none" width="100%" cellspacing="0" cellpadding="5">
                                <thead>
                                <tr>
                                	<th width="9%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Date</th>
                                    <th width="14%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Referensi</th>
                                    <th width="23%" align="left" style="border-top:solid 1px black;border-bottom:solid 1px black;">Note</th>
                                  	<th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">In</th>
                                  	<th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Out</th>
                                  	<th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">HPP In</th>
                                  	<th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">HPP Out</th>
                                    <th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Amt. In</th>
                                    <th width="9%" align="right" style="border-top:solid 1px black;border-bottom:solid 1px black;">Amt. Out</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var='t_in' value='${0}'/>
                                <c:set var='t_out' value='${0}'/>
                                <c:forEach items='${repo.details}' var='det'>
                                <tr>
                                	<td align="left"><fmt:formatDate value='${det.date}' pattern='dd-MM-yyyy'/></td>
                                    <td align="left"><c:out value='${det.parent}'/></td>
                                    <td align="left"><c:out value='${det.note}'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.in}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.out}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.hIN}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.hOUT}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.pIN}' pattern=',##0.00'/></td>
                                    <td align="right"><fmt:formatNumber value='${det.pOUT}' pattern=',##0.00'/></td>
                                </tr>
                                <c:set var='t_in' value='${t_in+det.pIN}'/>
                                <c:set var='t_out' value='${t_out+det.pOUT}'/>
                                </c:forEach>
                                </tbody>
                                <tr>
                                	<td align="left" colspan="6">&nbsp;</td>
                                    <td></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${t_in}' pattern=',##0.00'/></td>
                                    <td align="right" style="border-top:solid 1px black;"><fmt:formatNumber value='${t_out}' pattern=',##0.00'/></td>
                                </tr>
                                <c:remove var='t_in' />
                                <c:remove var='t_out'/>
                                </table>
                                <div class="clears">&nbsp;</div>
                                </c:forEach>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Plafon >> Popup</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/filterandpaging.jsp"%>
</head>

<body>
<div id="se-containers_pick">
	<div id="se-r00">
		<div id="se-r01a">&nbsp;</div>
		<div id="se-r03">&nbsp;</div>
	</div>
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                        	<th width="65%">Sales Order</th>
                          <th width="19%">Date</th>
                          <th width="16%">Used</th>
                        </tr>
                        <c:forEach items='${plafon.bridges}' var='bridge'>
                        <c:if test='${bridge.plafonUsed > 0}'>
                        <tr>
                        	<td><c:out value='${bridge.salesOrder.code}'/></td>
                            <td><fmt:formatDate value='${bridge.salesOrder.date}' pattern='dd-MM-yyyy'/></td>
                            <td><fmt:formatNumber value='${bridge.plafonUsed}' pattern=',##0.00'/></td> 
                        </tr>
                        </c:if>
                        </c:forEach>
                        <tr class="end-table"><td colspan="3">&nbsp;</td></tr>
                        </table>
				    </div>
				</div>
			</div>
		</div>
	</div>
	
    <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer-pick">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>

</html>
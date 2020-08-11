<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Stock Sparepart</title>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
						<table width="100%" cellpadding="0" cellspacing="0" class="table-list">
						<thead>
						<tr>
							<th width="8%">Facility</th>
							<th width="20%">Company</th>
							<th width="18%">Grid</th>
							<th width="30%">On Hand</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach items='${products}' var='prod'>
	                            <c:forEach items='${prod.inventorys}' var='inv'>
	                            	<c:if test="${inv.onHand > 0}">
		                            <tr>
		                            	<td colspan="4">${prod.facility.name}</td>
		                            </tr>
		                            <tr>
		                            	<td></td>
		                                <td nowrap="nowrap">
		                                    <c:out value='${inv.organization.name}'/>
		                                </td>
		                                <td nowrap="nowrap"><c:out value='${inv.grid.name}'/></td>
		                                <td><fmt:formatNumber value='${inv.onHand}' pattern=',##0.00'/></td>
		                            </tr>
		                           	<tr>
		                           		<td colspan="4">&nbsp;</td>
		                           	</tr>
		                           	</c:if>
	                           </c:forEach>
                           </c:forEach>
                           </tbody>
                           <tfoot>
                               <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                           </tfoot>
                           </table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>

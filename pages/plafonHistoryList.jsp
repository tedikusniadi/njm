<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
	<title>Plafon History >> Popup</title>
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
                    	<table style="border:none" width="50%" align="center">
                        <tr>
                        	<td width="24%" align="right">Plafon</td>
                            <td width="0%">:</td>
                            <td width="76%"><input class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${plafon.plafon.plafon}' pattern=',#00.00'/>"/></td>
                        </tr>
                        <tr>
                        	<td align="right">Used</td>
                            <td>:</td>
                            <td>
                            	<c:set var='used' value='${0}'/>
                                <c:forEach items="${plafon.plafon.bridges}" var="plaf">
                                	<c:set var='used' value='${used+plaf.plafonUsed}'/>
                                </c:forEach>                                
                            	<input class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${used}' pattern=',#00.00'/>"/>
                                <c:remove var='used'/>
                            </td>
                        </tr>
                        </table>
						<table class="table-list" cellspacing="0" cellpadding="0" width="80%">
					  	<tr>
					  		<th width="60%">Sales Order</th>
                          <th width="17%">Date</th>
			  		  	  <th width="23%">Amount</th>
				  		</tr>
						<c:forEach items="${plafon.plafon.bridges}" var="plaf">
						<c:if test='${plaf.plafonUsed > 0}'>
                        <tr>
							<td><c:out value='${plaf.salesOrder.code}'/></td>                            
							<td><fmt:formatDate value='${plaf.salesOrder.date}' pattern='dd-MM-yyyy'/></td>
                            <td><fmt:formatNumber value='${plaf.plafonUsed}' pattern=',##0.00'/></td>
					  	</tr>
                        </c:if>
						</c:forEach>
					  	<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
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
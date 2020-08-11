<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Route Cost Component >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Transport Outsource > Transport Outsource Route Price > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D10 - Transport Outsource Route Price</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/transportoutsourceroutepreedit.htm?id=${component.route.id}'/>"><span>List</span></a>
					  	</div>
					  
						<div class="main-box">
                            <table width="100%" style="border:none">
                            <tr>
                                <td width="32%" nowrap="nowrap" align="right">Component :</td>
                                <td width="68%"><input value='${component.cost.name}' disabled/></td>
                            </tr>
                            </table>
                            <br/>
                            <table border="0" cellpadding="0" cellspacing="0" width="70%" align="center">
							<tr>
								<td width="30%" height="30" align="left" valign="middle">															
									<div class="toolbar-clean">
										<a class="item-button-new" href="<c:url value='/page/transportoutsourceroutecostcomponenthistorypreadd.htm?id=${component.id}'/>"><span>New Cost</span></a>
									</div>
								</td>
								<td width="70%" align="right" height="20">&nbsp;</td>
							</tr>
							</table>
                            <table cellpadding="0" cellspacing="0" class="table-list" style="width:70%" align="center">
                            <tr>
                              	<th width="30%">Price</th>
                       	  	  	<th width="20%">Currency</th>
                       	  	  	<th width="26%">Valid From</th>
                           	  	<th width="24%">Valid To</th>
                            </tr>
                            <c:forEach items="${component.historys}" var="history">
                            <tr>
                                <td><fmt:formatNumber value='${history.money.amount}' pattern=',##0.00'/></td>
                                <td align="center"><c:out value='${history.money.currency.symbol}'/></td> 
                                <td><fmt:formatDate value='${history.validFrom}' pattern='dd-MM-yyyy'/></td>
                                <td><fmt:formatDate value='${history.validTo}' pattern='dd-MM-yyyy'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                            </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
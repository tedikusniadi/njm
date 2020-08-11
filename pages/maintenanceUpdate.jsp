<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Maintenance >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/maintenanceadd.htm'/>";
			document.editForm.submit();
		}
		
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
			<td width="60%">Transport Outsource > Transport Management > Vehicle Management > Vehicle Maintenance > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D11 - Vehicle Maintenance</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/vehiclepreedit.htm?id=${maintenance.vehicle.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="maintenance">
								<table width="100%" style="border:none">
                                <tr>
									<td width="32%" nowrap="nowrap" align="right">Type :</td>
									<td width="68%">
                                        <form:select path='type' cssClass='combobox' disabled='true'>
                                        	<form:option value='${maintenance.type.id}' label='${maintenance.type.name}'/>
                                        </form:select>
                                    </td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>			
							</form:form>
                            <br/>
                            <table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
                            <tr>
                                <td align="left" valign="middle">															
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/maintenancehistorypreadd.htm?id=${maintenance.id}'/>"><span>New Maintenance</span></a>
                                    </div>
                                </td>
                            </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" class="table-list" style="width:50%" align="center">
                            <tr>
                                <th width="37%">Date</th>
                             	<th width="31%">Fee</th>
                              	<th width="32%">Currency</th>
                            </tr>
                            <c:forEach items="${maintenance.historys}" var="history">
                            <tr>
                                <td><fmt:formatDate value='${history.date}' pattern='dd-MM-yyyy'/></td>
                                <td><fmt:formatNumber value='${history.money.amount}' pattern=',##0.00'/></td> 
                                <td><c:out value='${history.money.currency.symbol}'/></td>
                            </tr>
                            </c:forEach>
                            <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Transport Outsource Route >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.editForm.action = "<c:url value='/page/transportoutsourcerouteedit.htm'/>";
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
			<td width="60%">Transport Outsource > Transport Outsource Route > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D10 - Transport Outsource Route</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/transportoutsourcecontractpreedit.htm?id=${route_edit.contract.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="route_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td valign="top" align="left">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="21%" nowrap="nowrap" align="right">Name :</td>
                                            <td width="79%"><form:input cssClass='inputbox' path="name"/></td>
                                        </tr>
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right">Total Kilometer :</td>
                                            <td width="72%"><form:input cssClass='inputbox' path="kilometer"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Rekapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                            	<th width="32%">&nbsp;</th>
                                              <th width="35%"><div id="trx">Amount (<c:out value='${route_edit.price.money.currency.symbol}'/>)</div></th>
                                              <th width="33%">Amount (<c:out value='${route_edit.price.money.rate.to.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Cost :</td>
                                                <td><input id="trxamount" size="14" class="input-disabled" style="text-align:right" disabled value="<fmt:formatNumber value='${route_edit.cost}' pattern=',##0.00'/>"/></td>
                                                <td><input id="trxdefamount" size="14" class="input-disabled" style="text-align:right" disabled value="<fmt:formatNumber value='${route_edit.cost*route_edit.price.money.rate.rate}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </table>
                                    	</fieldset>
                                    </td>
                                </tr>
                                </table>
                                <br/>
                                <table border="0" cellpadding="0" cellspacing="0" width="70%" align="center">
                                <tr>
                                    <td width="30%" height="30" align="left" valign="middle">															
                                        <div class="toolbar-clean">
                                            <a class="item-button-new" href="<c:url value='/page/transportoutsourceroutepricepreadd.htm?id=${route_edit.id}'/>"><span>New Fee Before Tax</span></a>
                                        </div>
                                    </td>
                                    <td width="70%" align="right" height="20">&nbsp;</td>
                                </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0" class="table-list" style="width:70%" align="center">
                                <tr>
                                    <th width="30%">Fee Before Tax</th>
                                    <th width="20%">Currency</th>
                                    <th width="26%">Valid From</th>
                                    <th width="24%">Valid To</th>
                                </tr>
                                <c:forEach items="${route_edit.prices}" var="price">
                                <tr>
                                    <td><fmt:formatNumber value='${price.money.amount}' pattern=',##0.00'/></td>
                                    <td align="center"><c:out value='${price.money.currency.symbol}'/></td> 
                                    <td><fmt:formatDate value='${price.validFrom}' pattern='dd-MM-yyyy'/></td>
                                    <td><fmt:formatDate value='${price.validTo}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                </table>
                                <br/>
                                <table cellpadding="0" cellspacing="0" class="table-list" align="center" style="width:70%">
                                <tr>
                                    <th width="5%"><div style="width:20px"></div></th>
                                    <th width="36%">Cost Component</th>
                                    <th width="16%">Amount</th>
                                    <th width="14%">Currency</th>
                                    <th width="14%">Exchange</th>
                                    <th width="15%">Valid From</th>
                                </tr>
                                <c:forEach items="${route_edit.costs}" var="cost">
                                <tr>
                                    <td class="tools">
                                        <a class="item-button-edit" href="<c:url value='/page/transportoutsourceroutecostcomponentpreedit.htm?id=${cost.id}'/>"  title="Edit"><span>Edit</span></a>
                                    </td>
                                    <td>${cost.cost.name}</td>
                                    <td align="center"><fmt:formatNumber value='${cost.active.money.amount}' groupingUsed='true' maxFractionDigits='0'/></td> 
                                    <td>${cost.active.money.currency.symbol}</td>
                                    <td>${cost.active.money.exchangeType}</td>
                                    <td><fmt:formatDate value='${cost.active.validFrom}' pattern='dd-MM-yyyy'/></td> 
                                </tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
                                </table>
							</form:form>
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
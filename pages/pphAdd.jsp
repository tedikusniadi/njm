<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PPH >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Financial Accounting > Account Receivable > Pph > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F20 - PPH</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingpreedit.htm?id=${pph_add.billing.id}'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="pph_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Billing :</td>
								  	<td width="80%"><input value="${pph_add.billing.code}" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Document No :</td>
									<td><form:input path='code' size='50'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"> Entry Date :</td>
									<td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right"> Doc Date :</td>
									<td><input id="docDate" name="docDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<select class="combobox-ext" disabled>
                                        	<option><c:out value='${pph_add.billing.customer.firstName} ${pph_add.billing.customer.lastName} ${pph_add.billing.customer.middleName}' /></option>
										</select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Customer :</td>
									<td>
										<select class="combobox-ext" disabled>
                                        	<option><c:out value='${pph_add.billing.customer.firstName} ${pph_add.billing.customer.lastName} ${pph_add.billing.customer.middleName}' /></option>
										</select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">DPP :</td>
									<td><input size='25' value="<fmt:formatNumber value='${adapter.totalLineAmount}' pattern=',##0.00'/>" class-'input-disabled' disabled/></td>
								</tr>
								<tr>
                                	<td align="right">Amount :</td>
                                    <td><form:input path="amount" size="20"/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	function save()
	{		
		document.addForm.action = "<c:url value='/page/pphadd.htm'/>";
		document.addForm.submit();
	}
	
	function showamount()
	{
		var _rate = 0.0;
	
		var rate = document.getElementById('rate');
		if(rate.value != '')
			_rate = parseFloat(rate.value);
			
		var amount = document.getElementById('amount');
		amount.value = ((_rate/100)*parseFloat('${adapter.totalLineAmount}')).numberFormat('#,#.00');
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
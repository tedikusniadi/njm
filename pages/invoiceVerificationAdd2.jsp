<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Invoice Verification >> Add</title>
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
			<td width="60%">Financial Accounting > Account Payable > Invoice Verification > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F26 - Invoice Verification</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/invoiceverificationview.htm'/>"><span>List</span></a>
							<a class="item-button-next" href="javascript:save();"><span>Next</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adapter">
								<table width="100%" style="border:none">
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">ID :</td>
                                  	<td width="76%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="invoiceVerification.organization" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty adapter.invoiceVerification.organization}'>
                                                <form:option value='${adapter.invoiceVerification.organization.id}' label='${adapter.invoiceVerification.organization.firstName} ${adapter.invoiceVerification.organization.lastName} ${verification.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                  	<td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="invoiceVerification.date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">Bill From :</td>
                                  	<td width="76%"><input value="${adapter.invoiceVerification.supplier.firstName} ${adapter.invoiceVerification.supplier.middleName} ${adapter.invoiceVerification.supplier.lastName}" class='input-disabled' size='45'/></td>
                                </tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">Invoice :</td>
                                  	<td width="76%"><form:input id='invoice' path='invoiceVerification.invoice' size='30'/></td>
                                </tr>
                                 <tr>
                                  	<td nowrap="nowrap" align="right">Due Date :</td>
                                    <td><input id="dueDate" name="invoiceVerification.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">Invoice Tax No :</td>
                                  	<td width="76%"><form:input path='invoiceVerification.taxNo' size='30'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Tax Date :</td>
                                    <td><input id="taxDate" name="invoiceVerification.taxDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                  <td width="24%" nowrap="nowrap" align="right">Reference Type :</td>
                                  <td width="76%">
                                    <c:if test="${adapter.invoiceVerification.purchaseOrder.transactionSource == 'PURCHASE_ORDER'}">
                                            <input value="Purchase Order" class='input-disabled' size='30'/>
                                    </c:if>
                                    <c:if test="${adapter.invoiceVerification.purchaseOrder.transactionSource == 'TRANSFER_ORDER'}">
                                            <input value="Transfer Order" class='input-disabled' size='30'/>
                                    </c:if>
                                  </td>
                                </tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">Reference Doc :</td>
                                  	<td width="76%"><input value="${adapter.invoiceVerification.purchaseOrder.code}" class='input-disabled' size='30'/></td>
                                </tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right">Note :</td>
                                  	<td width="76%"><form:textarea path='invoiceVerification.note' cols='45' rows='5'/></td>
                                </tr>
                                <tr><td colspan="2">&nbsp;</td></tr>
                                <tr>
                                  	<td width="24%" nowrap="nowrap" align="right" valign="top">Goods Receipt Reference :</td>
                                  	<td width="76%">
                                    	<table style="border:none" id="receipts">
                                        <tbody>
                                        <c:forEach items='${adapter.receipts}' var='receipt' varStatus='status'>
                                        <c:if test='${!receipt.verificated}'>
                                        <tr>
                                        	<td><input type='checkbox' id='chkbx[${receipt.id}]' name='receipts[${status.index}].verificated' value='true' checked/></td>
                                            <td><a href="<c:url value='/page/goodsreceiptpreedit.htm?id=${receipt.id}'/>"><c:out value='${receipt.code}'/></a></td>
                                        </tr>
                                        </c:if>
                                        </c:forEach>
                                        </tbody>
                                        </table>
                                    </td>
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
		var __date__ = dojo.widget.byId('date');
		if(__date__.getValue() == '')
		{
			alert('Date can not be empty!');
			return;
		}
		
		var __dueDate__ = dojo.widget.byId('dueDate');
		if(__dueDate__.getValue() == '')
		{
			alert('Due Date can not be empty!');
			return;
		}
		
		var __inv__ = document.getElementById('invoice');
		if(__inv__.value == '')
		{
			alert('Invoice can not be empty!');
			return;
		}

		var __checked__ = false;
		
		<c:forEach items='${adapter.receipts}' var='receipt' varStatus='status'>
			var v = document.getElementById('chkbx[${receipt.id}]');
			if(v && v.checked)
				__checked__ = true;
		</c:forEach> 
		
		if(!__checked__)
		{
			alert('You need to chooice min one of the available Goods Receipt');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/invoiceverificationpreadd3.htm'/>";
		document.addForm.submit();
	}
			
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
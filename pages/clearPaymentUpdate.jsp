<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Payment >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.addForm.action = "<c:url value='/page/clearpaymentedit.htm'/>";
			document.addForm.submit();
		}
	</script>
</head>

<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Accounting Payable > Clear Payment > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F28 - Clear Payment</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/clearpaymentview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="clearPayment_edit">
 								<table width="100%" style="border:none">
 								<tr>
 									<td nowrap="nowrap" align="right">ID :</td>
									<td><input class="input-disabled" value="${clearPayment_edit.code}" disabled size="30"/></td>
 								</tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${clearPayment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right"> Company : </td>
                      				<td>
                                        <select class="combobox-ext" disabled>
                                        	<option><c:out value='${clearPayment_edit.organization.firstName} ${clearPayment_edit.organization.lastName} ${clearPayment_edit.organization.middleName}'/></option>
                                        </select>
                                  	</td>					
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Supplier :</td>
                                    <td>
                                        <select id="supplier" class="combobox-ext" disabled>
                                            <option><c:out value='${clearPayment_edit.payment.supplier.firstName} ${clearPayment_edit.payment.supplier.lastName} ${clearPayment_edit.payment.supplier.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right">Payment No : </td>
                      				<td><input size="20" value="${clearPayment_edit.payment.code}" class="input-disabled" disabled/></td>					
                                </tr>  
                                <tr>
 									<td nowrap="nowrap" align="right">Transfer/Clearing No :</td>
									<td><input size="20" value="${clearPayment_edit.payment.paymentInformation.reference}" class="input-disabled" disabled/></td>
 								</tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Amount :</td>
									<td>
                                    	<input id="amount" value="<fmt:formatNumber value='${clearPayment_edit.payment.paymentInformation.amount}' pattern=',##0.00'/>" size="20" class="input-disabled" disabled/>
                                        &nbsp;
                                        <input id="currency" value="${clearPayment_edit.payment.currency.symbol}" size="7" class="input-disabled" disabled/>
                                    </td>
 								</tr>
 								<tr>
 									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
 								</tr> 
 								</table>
 							</form:form>
						</div>
						<div class="info">Created by : ${clearPayment_edit.createdBy.firstName} ${clearPayment_edit.createdBy.middleName} ${clearPayment_edit.createdBy.lastName} (<fmt:formatDate value='${clearPayment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${clearPayment_edit.updatedBy.firstName} ${clearPayment_edit.updatedBy.middleName} ${clearPayment_edit.updatedBy.lastName} (<fmt:formatDate value='${clearPayment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>

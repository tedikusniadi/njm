<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Clear Payment >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.addForm.action = "<c:url value='/page/creditmemoadd.htm'/>";
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
			<td width="60%">Financial Accounting > Accounting Receivable > Credit Memo > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F30 - Credit Memo</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/billingpreedit.htm?id=${creditMemo_add.billing.id}.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="creditMemo_add">
 								<table width="100%" style="border:none">
 								<tr>
 									<td nowrap="nowrap" align="right">ID :</td>
									<td><input class="input-disabled" value="Auto Number" disabled size="30"/></td>
 								</tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right"> Company : </td>
                      				<td>
                                        <select class="combobox-ext" disabled>
                                        	<option><c:out value='${creditMemo_add.organization.firstName} ${creditMemo_add.organization.lastName} ${creditMemo_add.organization.middleName}'/></option>
                                        </select>
                                  	</td>					
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer :</td>
                                    <td>
                                        <select id="supplier" class="combobox-ext" disabled>
                                            <option><c:out value='${creditMemo_add.billing.customer.firstName} ${creditMemo_add.billing.customer.lastName} ${creditMemo_add.billing.customer.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="24%" align="right">Invoice No : </td>
                      				<td><input size="20" value="${creditMemo_add.billing.code}" class="input-disabled" disabled/></td>					
                                </tr>  
                                <tr>
 									<td nowrap="nowrap" align="right">Currency :</td>
									<td><input id="currency" value="${creditMemo_add.billing.currency.symbol}" size="7" class="input-disabled" disabled/></td>
 								</tr>
                                <tr>
                                    <td width="24%" align="right">Reference No : </td>
                      				<td><input size="20" value="${creditMemo_add.memoable.code}" class="input-disabled" disabled/></td>					
                                </tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Amount :</td>
									<td>
                                    	<input id="amount" value="<fmt:formatNumber value='${creditMemo_add.amount}' pattern=',##0.00'/>" size="20" class="input-disabled" disabled/>
                                    </td>
 								</tr>
 								<tr>
 									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
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
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>

</body>

</html>

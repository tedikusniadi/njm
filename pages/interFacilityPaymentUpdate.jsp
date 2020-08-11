<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Payment >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/interfacilitypaymentedit.htm'/>";
			document.addForm.submit();
		}

		function showerror()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="showerror();">
	
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Payment > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F38 - Loan Payment</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/interfacilitypaymentview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="payment_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="61%" valign="top">
                                   	  	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="22%" align="right">ID :</td>
                                            <td width="78%"><input disabled size="30" class="input-disabled" value="${payment_edit.code}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input class="input-disabled" disabled size="15" value="<fmt:formatDate value='${payment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_edit.organization}'>
                                                        <option value="${payment_edit.organization.id}"><c:out value='${payment_edit.organization.firstName} ${payment_edit.organization.middleName} ${payment_edit.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payer :</td>
                                            <td>
                                                <form:select path="payable.payer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_edit.payable.payer}'>
                                                        <option value="${payment_edit.payable.payer.id}"><c:out value='${payment_edit.payable.payer.firstName} ${payment_edit.payable.payer.middleName} ${payment_edit.payable.payer.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee :</td>
                                            <td>
                                                <form:select path="payable.payee" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_edit.payable.payee}'>
                                                        <option value="${payment_edit.payable.payee.id}"><c:out value='${payment_edit.payable.payee.firstName} ${payment_edit.payable.payee.middleName} ${payment_edit.payable.payee.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Amount :</td>
                                            <td width="78%"><input size='20' class="input-disabled" disabled value="<fmt:formatNumber value='${payment_edit.amount}' pattern=',#00.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Write Off :</td>
                                            <td width="78%"><input size='20' class="input-disabled" disabled value="<fmt:formatNumber value='${payment_edit.writeoff}' pattern=',#00.00'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <select disabled>
                                                    <option><c:out value='${payment_edit.payable.currency.symbol}'/></option>
                                                </select>
                                                &nbsp;
                                                <select disabled>
                                                    <option><c:out value='${payment_edit.payable.exchangeType}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Note :</td>
                                            <td width="78%"><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="right">Type : </td>
                                            <td width="73%">
                                                <form:select id='methodType' path='payable.information.paymentMethodType' disabled='true'>
                                                    <form:option value='CASH' label='CASH'/>
                                                    <form:option value='TRANSFER' label='TRANSFER'/>
                                                    <form:option value='CLEARING' label='CLEARING'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="27%" align="right">Transfer/Clearing No : </td>
                                          <td width="73%"><form:input path='payable.information.reference' size='35'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Bank Account : </td>
                                            <td>
                                                <form:select id='account' path='payable.information.bankAccount' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty payment_edit.payable.information.bankAccount}'>
                                                        <form:option value='${payment_edit.payable.information.bankAccount.id}' label='${payment_edit.payable.information.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Name : </td>
                                            <td><input id='accountName' disabled='true' class='input-disabled' value="${payment_edit.payable.information.bankAccount.accountName}" size="30"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input id='bankName' disabled='true' class='input-disabled' size="30" value="${payment_edit.payable.information.bankAccount.bankName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input id='bankBranch' disabled='true' class='input-disabled' size="30" value="${payment_edit.payable.information.bankAccount.bankBranch}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input id='accountNo' disabled='true' class='input-disabled' size="30" value="${payment_edit.payable.information.bankAccount.accountNo}"/></td>
                                        </tr>    	
                                        </table>
                                    </td>
                                    <td width="39%" valign="top">
                                    	<fieldset>
                                        	<legend>Recapitulation</legend>
                                  			<table style="border:none" width="100%">
                                            <tr>
                                            	<th width="52%">&nbsp;</th>
                                                <th width="30%">Amount(<c:out value='${adapter.payable.currency.symbol}'/>)</th>
                                                <th width="18%">Amount(<c:out value='${adapter.payable.exchange.to.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Unapplied</td>
                                                <td><input id="unapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.payable.information.amount-adapter.applied-adapter.writeoff}'/>"/></td>
                                                <td><input id="defunapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${(adapter.payable.information.amount-adapter.applied-adapter.writeoff)*adapter.payable.exchange.rate}'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Applied</td>
                                                <td><input id="applied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.applied}'/>"/></td>
                                                <td><input id="defapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.applied*adapter.payable.exchange.rate}'/>"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total Write Off</td>
                                                <td><input id="displaywriteoff" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.writeoff}'/>"/></td>
                                                <td><input id="defdisplaywriteoff" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.writeoff*adapter.payable.exchange.rate}'/>"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : ${payment_edit.createdBy.firstName} ${payment_edit.createdBy.middleName} ${payment_edit.createdBy.lastName} (<fmt:formatDate value='${payment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${payment_edit.updatedBy.firstName} ${payment_edit.updatedBy.middleName} ${payment_edit.updatedBy.lastName} (<fmt:formatDate value='${payment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->
</body>
</html>

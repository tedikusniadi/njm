<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Payment Clearing >> Edit</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/interfacilitypaymentclearingedit.htm'/>";
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Payment Clearing > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F39 - Loan Payment Clearing</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/interfacilitypaymentclearingview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form name="addForm" method="post" modelAttribute="clearing_edit">
                                <table style="border:none" width="100%">
                                <tr>
                                    <td width="22%" align="right">ID :</td>
                                    <td width="78%"><input disabled size="30" class="input-disabled" value="${clearing_edit.code}"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${clearing_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Organization :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                            <c:if test='${not empty clearing_edit.organization}'>
                                                <option value="${clearing_edit.organization.id}"><c:out value='${clearing_edit.organization.firstName} ${clearing_edit.organization.middleName} ${clearing_edit.organization.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payer :</td>
                                    <td>
                                        <form:select path="payment.payable.payer" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty clearing_edit.payment.payable.payer}'>
                                                <option value="${clearing_edit.payment.payable.payer.id}"><c:out value='${clearing_edit.payment.payable.payer.firstName} ${clearing_edit.payment.payable.payer.middleName} ${clearing_edit.payment.payable.payer.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payee :</td>
                                    <td>
                                        <form:select path="payment.payable.payee" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty clearing_edit.payment.payable.payee}'>
                                                <option value="${clearing_edit.payment.payable.payee.id}"><c:out value='${clearing_edit.payment.payable.payee.firstName} ${clearing_edit.payment.payable.payee.middleName} ${clearing_edit.payment.payable.payee.lastName}'/></option>
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="22%" align="right">Payment ID :</td>
                                    <td width="78%"><input disabled class="input-disabled" size="25" value="${clearing_edit.payment.code}"/></td>
                                </tr>
                                <tr>
                                    <td width="22%" align="right">Transfer/Clearing ID :</td>
                                    <td width="78%"><input disabled class="input-disabled" size="25" value="${clearing_edit.payment.payable.information.reference}"/></td>
                                </tr>
                                <tr>
                                    <td width="22%" align="right">Amount :</td>
                                    <td width="78%"><input disabled class="input-disabled" size="20" value="<fmt:formatNumber value='${clearing_edit.payment.amount}' pattern=',##0.00'/>"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                    <td>
                                        <select disabled>
                                            <option><c:out value='${clearing_edit.payment.payable.currency.symbol}'/></option>
                                        </select>
                                        &nbsp;
                                        <select disabled>
                                            <option><c:out value='${clearing_edit.payment.payable.exchangeType}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="22%" align="right">Note :</td>
                                    <td width="78%"><form:textarea path='note' cols='45' rows='6'/></td>
                                </tr>
                                </table>
							</form:form>
						</div>
							<div class="info">Created by : ${clearing_edit.createdBy.firstName} ${clearing_edit.createdBy.middleName} ${clearing_edit.createdBy.lastName} (<fmt:formatDate value='${clearing_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${clearing_edit.updatedBy.firstName} ${clearing_edit.updatedBy.middleName} ${clearing_edit.updatedBy.lastName} (<fmt:formatDate value='${clearing_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Loan Payment >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Loan Payment > Add</td>
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
							<form:form name="addForm" method="post" modelAttribute="payment_add">
                                <table style="border:none" width="100%">
                                <tr>
                                	<td width="61%" valign="top">
                                   	  	<table style="border:none" width="100%">
                                        <tr>
                                            <td width="22%" align="right">ID :</td>
                                            <td width="78%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty payment_add.organization}'>
                                                        <option value="${payment_add.organization.id}"><c:out value='${payment_add.organization.firstName} ${payment_add.organization.middleName} ${payment_add.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payer :</td>
                                            <td>
                                                <form:select id="payer" path="payable.payer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_add.payable.payer}'>
                                                        <option value="${payment_add.payable.payer.id}"><c:out value='${payment_add.payable.payer.firstName} ${payment_add.payable.payer.middleName} ${payment_add.payable.payer.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee :</td>
                                            <td>
                                                <form:select path="payable.payee" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty payment_add.payable.payee}'>
                                                        <option value="${payment_add.payable.payee.id}"><c:out value='${payment_add.payable.payee.firstName} ${payment_add.payable.payee.middleName} ${payment_add.payable.payee.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Amount :</td>
                                            <td width="78%"><form:input id='amount' path='amount' size='20' onchange='display();'/></td>
                                        </tr>
                                        <tr>
                                            <td width="22%" align="right">Write Off :</td>
                                            <td width="78%"><form:input id='writeoff' path='writeoff' size='20' onchange='display();'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <select disabled>
                                                    <option><c:out value='${payment_add.payable.currency.symbol}'/></option>
                                                </select>
                                                &nbsp;
                                                <select disabled>
                                                    <option><c:out value='${payment_add.payable.exchangeType}'/></option>
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
                                          	<td width="73%">
                                            	<c:if test="${payment_add.payable.information.paymentMethodType != 'CASH'}">
                                                	<form:input path='payable.information.reference' size='35'/>
                                                </c:if>
                                                <c:if test="${payment_add.payable.information.paymentMethodType == 'CASH'}">
                                                	<form:input path='payable.information.reference' size='35' cssClass='input-disabled' disabled='true'/>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Bank Account : </td>
                                            <td>
                                                <form:select id='account' path='payable.information.bankAccount' cssClass='combobox' disabled='true'>
                                                    <c:if test='${not empty payment_add.payable.information.bankAccount}'>
                                                        <form:option value='${payment_add.payable.information.bankAccount.id}' label='${payment_add.payable.information.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account Name : </td>
                                            <td><input id='accountName' disabled='true' class='input-disabled' value="${payment_add.payable.information.bankAccount.accountName}" size="30"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Name : </td>
                                            <td><input id='bankName' disabled='true' class='input-disabled' size="30" value="${payment_add.payable.information.bankAccount.bankName}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Bank Branch : </td>
                                            <td><input id='bankBranch' disabled='true' class='input-disabled' size="30" value="${payment_add.payable.information.bankAccount.bankBranch}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Account No : </td>
                                            <td><input id='accountNo' disabled='true' class='input-disabled' size="30" value="${payment_add.payable.information.bankAccount.accountNo}"/></td>
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
                                                <td>
                                                	<input type="hidden" id="_hid_unapplied" value="${adapter.payable.information.amount-adapter.applied-adapter.writeoff}"/>
                                                	<input id="unapplied" size="15" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${adapter.payable.information.amount-adapter.applied-adapter.writeoff}'/>"/>
                                                </td>
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
<script type="text/javascript">
	function save()
	{
		if(document.getElementById('org').value == null || document.getElementById('org').value == '')
		{
			alert("Please select Organization first!");
			return;
		}
		
		var _hid_unapplied = document.getElementById('_hid_unapplied').value;			
		if(parseFloat(_hid_unapplied) < 0)
		{
			alert('Unapplied amount cant < 0');
			return;
		}
	
		document.addForm.action = "<c:url value='/page/interfacilitypaymentadd.htm'/>";
		document.addForm.submit();
	}
	
	function display()
	{
		var amount = document.getElementById('amount').value;
		var writeoff = document.getElementById('writeoff').value;

		var _applied = parseFloat('${adapter.applied}')+parseFloat(amount);
		var _writeoff = parseFloat('${adapter.writeoff}')+parseFloat(writeoff);
		var _unapplied = parseFloat('${adapter.payable.information.amount}')-_applied-_writeoff;
		
		document.getElementById('_hid_unapplied').value = _unapplied;
		
		if(_unapplied < 0)
		{
			alert('Unapplied amount cant < 0');
			return;
		}
			
		document.getElementById('unapplied').value = _unapplied.numberFormat('#,#.00');
		document.getElementById('defunapplied').value = (_unapplied*parseFloat('${adapter.payable.exchange.rate}')).numberFormat('#,#.00');
		
		document.getElementById('applied').value = _applied.numberFormat('#,#.00');
		document.getElementById('defapplied').value = (_applied*parseFloat('${adapter.payable.exchange.rate}')).numberFormat('#,#.00');
		
		document.getElementById('displaywriteoff').value = _writeoff.numberFormat('#,#.00');
		document.getElementById('defdisplaywriteoff').value = (_writeoff*parseFloat('${adapter.payable.exchange.rate}')).numberFormat('#,#.00');
	}
	
	function openpayee()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppayeeview.htm?target=payee&organization='/>"+org.value);
	}
	
	function showerror()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
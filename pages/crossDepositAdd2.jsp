<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Cross Deposit >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.addForm.action = "<c:url value='/page/crossdepositadd.htm'/>";
			document.addForm.submit();
		}
		
		function openinfo()
		{
			dojo.byId('clearing').setAttribute('class','inputbox');
			dojo.byId('clearing').disabled = false;
			dojo.widget.byId('dueDate').enable();
		}
		
		function closeinfo()
		{
			dojo.byId('clearing').setAttribute('class','input-disabled');
			dojo.byId('clearing').setAttribute('disabled','true');
			dojo.widget.byId('dueDate').disable();
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
			<td width="60%">Financial Accounting > Cash Bank Management > Inter Facility Transaction > Cross Deposit > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F40 - Cross Deposit</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/crossdepositview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<table style="border:none" width="100%">
                            <tr>
                            	<td width="61%" valign="top">
                               	  <form:form name="addForm" method="post" modelAttribute="deposit_add">
                              <table style="border:none" width="100%">
                                        <tr>
                                            <td width="32%" align="right">ID :</td>
                                          <td width="68%"><input disabled size="30" class="input-disabled" value="Auto Generated"/></td>
                                </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Organization :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty deposit_add.organization}'>
                                                        <option value="${deposit_add.organization.id}"><c:out value='${deposit_add.organization.firstName} ${deposit_add.organization.middleName} ${deposit_add.organization.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payer :</td>
                                            <td>
                                                <form:select id="payer" path="payer" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty deposit_add.payer}'>
                                                        <option value="${deposit_add.payer.id}"><c:out value='${deposit_add.payer.firstName} ${deposit_add.payer.middleName} ${deposit_add.payer.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee :</td>
                                            <td>
                                                <form:select id="payee" path="payee" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty deposit_add.payee}'>
                                                        <option value="${deposit_add.payee.id}"><c:out value='${deposit_add.payee.firstName} ${deposit_add.payee.middleName} ${deposit_add.payee.lastName}'/></option>
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td width="32%" align="right">Loan Amount :</td>
                                          <td width="68%"><input class="input-disabled" disabled="disabled" size="20" value="<fmt:formatNumber value='${deposit_add.information.amount}' pattern=',##0.00'/>"/></td>
                                </tr>
                                        <tr>
                                            <td width="32%" align="right">Interest/Month(%) :</td>
                                          <td width="68%"><input class="input-disabled" disabled value="<fmt:formatNumber value='${adjustment.interest}'/>" size="6"/></td>
                                </tr>
                                        <tr>
                                            <td width="32%" align="right">Duration (Month) :</td>
                                          <td width="68%"><input class="input-disabled" disabled value="<fmt:formatNumber value='${adjustment.approvedDuration}'/>" size="6"/></td>
                                </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <select disabled>
                                                    <option><c:out value='${deposit_add.payment.payable.currency.symbol}'/></option>
                                                </select>
                                                &nbsp;
                                                <form:select id='type' path='payment.payable.exchangeType' disabled='true'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                                &nbsp;
                                                <input class="input-disabled" disabled size='15' value="<fmt:formatNumber value='${deposit_add.payment.payable.exchange.rate}' pattern=',##0.00'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="32%" align="right">Payment Type : </td>
                                      <td width="68%">
          <form:select id='methodType' path='information.paymentMethodType'>
                                                    <form:option value='CASH' label='CASH' onclick='closeinfo()'/>
                                                    <form:option value='TRANSFER' label='TRANSFER' onclick='openinfo()'/>
                                                    <form:option value='CLEARING' label='CLEARING' onclick='openinfo()'/>
                                                </form:select>
                                            </td>
                                </tr>
                                        <tr>
                                            <td width="32%" align="right">Transfer/Clearing No : </td>
                                          <td width="68%"><form:input id='clearing' path='information.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                </tr>
                                        <tr>
                                            <td align="right">Payer Account : </td>
                                            <td>
                                                <form:select id='account' path='information.bankAccount' cssClass='combobox'>
                                                    <c:if test='${not empty deposit_add.information.bankAccount}'>
                                                        <form:option value='${deposit_add.information.bankAccount.id}' label='${deposit_add.information.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountview.htm?target=account&organization=${deposit_add.payer.id}'/>');" style="CURSOR:pointer;" title="Bank Account" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Payee Account : </td>
                                            <td>
                                                <form:select id='pay' path='payTo' cssClass='combobox'>
                                                    <c:if test='${not empty deposit_add.payTo}'>
                                                        <form:option value='${deposit_add.payTo.id}' label='${deposit_add.payTo.code}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupbankaccountview.htm?target=pay&organization=${deposit_add.payee.id}'/>');" style="CURSOR:pointer;" title="Bank Account" />
                                            </td>
                                        </tr>
                                        <tr>
                                              <td width="32%" align="right" nowrap="nowrap">Due Date :</td>
                                          <td width="68%"><input id="dueDate" disabled name="information.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                        <tr>
                                            <td width="32%" align="right">Note :</td>
                                          <td width="68%"><form:textarea path='note' cols='45' rows='6'/></td>
                                </tr>
                                        </table>
                                    </form:form>
                              </td>
                                <td width="39%" valign="top">
                                	<fieldset>
                                    	<legend><strong>Reference</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                        	<td width="40%">Loan Acknowledgement</td>
                                       	  	<td width="1%">:</td>
                                          	<td width="58%"><a href="<c:url value='/page/loanacknowledgementpreedit.htm?id=${adjustment.id}'/>"><c:out value='${adjustment.code}'/></a></td>
                                        </tr>
                                        <tr>
                                        	<td>Loan Payment</td>
                                           	<td>:</td>
                                            <td><a href="<c:url value='/page/interfacilitypaymentpreedit.htm?id=${deposit_add.payment.id}'/>"><c:out value='${deposit_add.payment.code}'/></a></td>
                                        </tr>
                                        </table>
                                    </fieldset>
                              </td>
                            </tr>
                            </table>
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

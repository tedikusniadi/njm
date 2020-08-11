<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Manual Billing (Opening Balance) &gt;&gt; Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
			<td width="60%">Financial Accounting > Account Receivable > Manual Billing (Opening Balance) > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F82 - Manual Billing (Opening Balance) </h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/manualbillingopeningbalanceview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save();"><span>Next</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="manual_billing_openingbalance_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty manual_billing_openingbalance_add.organization}'>
                                               	<form:option value='${manual_billing_openingbalance_add.organization.id}' label='${manual_billing_openingbalance_add.organization.firstName} ${manual_billing_openingbalance_add.organization.lastName} ${manual_billing_openingbalance_add.organization.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
                                  	<td align="right">Company Tax Address :</td>
                                  	<td>
                                        <form:select id="taxAddress" path="taxAddress" cssClass="combobox-ext">
                                            <c:if test='${not empty manual_billing_openingbalance_add.taxAddress}'>
                                                <form:option value='${manual_billing_openingbalance_add.taxAddress.id}' label='${manual_billing_openingbalance_add.taxAddress.party.firstName} ${manual_billing_openingbalance_add.taxAddress.party.middleName} ${manual_billing_openingbalance_add.taxAddress.party.lastName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openpostal('taxAddress');" style="CURSOR:pointer;" title="Address" />
                                    </td>
                                </tr>									                      
                                <tr>
                                    <td align="right">Bank Account : </td>
                                    <td>
                                        <form:select id='akun' path='bankAccount' cssClass='combobox-ext'>
                                            <c:if test='${not empty bankAccount}'>
                                                <form:option value='${bankAccount.id}' label='${bankAccount.code}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
                                    </td>
                                </tr>							   
							    <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
                                    <td align="right">Billing Type : </td>
                                    <td>
                                        <select id='billingType' name='billingType' cssClass='combobox-ext'>
                                        	<option value="" selected>--Tipe--</option>
                                            <c:forEach items="${billingTypes}" var="billType">
                                                <option value='${billType.id}'>${billType.name}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
								<tr>
									<td nowrap="nowrap" align="right">Customer :</td>
									<td>
										<form:select id="customer" path="customer" cssClass="combobox-ext">
                                           	<c:if test='${not empty manual_billing_openingbalance_add.customer}'>
                                               	<form:option value='${manual_billing_openingbalance_add.customer.id}' label='${manual_billing_openingbalance_add.customer.firstName} ${manual_billing_openingbalance_add.customer.lastName} ${manual_billing_openingbalance_add.customer.middleName}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="billedTo('customer');" style="CURSOR:pointer;" title="Customer" />
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Contact :</td>
                                    <td>
                                        <form:select id="customerContactPerson" path="customerContactPerson" cssClass="combobox-ext">
                                            <c:if test='${not empty manual_billing_openingbalance_add.customerContactPerson}'>
                                                <form:option value='${manual_billing_openingbalance_add.customerContactPerson.id}' label='${manual_billing_openingbalance_add.customerContactPerson.firstName} ${manual_billing_openingbalance_add.customerContactPerson.lastName} ${manual_billing_openingbalance_add.customerContactPerson.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opencontact();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
                                	<td align="right">Tax :</td>
                                    <td>
                                    	<form:select path='tax'>
                                        <c:forEach items='${taxs}' var='tax'>
                                        	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate}"/>
                                        </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <input size="15" id="taxRate" class="input-disabled" disabled style="text-align:right;"/>
                                    </td>
                                </tr>
                                <%-- <tr>
                                	<td align="right">Tax 2 :</td>
                                    <td>
                                    	<form:select path='extTax1'>
                                        	<option value='' selected></option>
                                            <c:forEach items='${taxs}' var='tax'>
                                                <form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('tax2Rate').value = ${tax.taxRate}"/>
                                            </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <input size="15" id="tax2Rate" class="input-disabled" disabled style="text-align:right;"/>
                                    </td>
                                </tr>
                                <tr>
                                	<td align="right">Tax 3 :</td>
                                    <td>
                                    	<form:select path='extTax2'>
                                        	<option value='' selected></option>
                                            <c:forEach items='${taxs}' var='tax'>
                                                <form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('tax3Rate').value = ${tax.taxRate}"/>
                                            </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <input size="15" id="tax3Rate" class="input-disabled" disabled style="text-align:right;"/>
                                    </td>
                                </tr> --%>
                                <tr>
                                	<td align="right">Currency :</td>
                                    <td>
                                    	<form:select path='currency'>
                                        <c:forEach items='${currencys}' var='currency'>
                                        	<form:option value='${currency.id}' label='${currency.symbol}'/>
                                        </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <form:select path='exchangeType'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <%-- <tr>
									<td nowrap="nowrap" align="right">Invoice Tax Number :</td>
									<td>
                                    	<form:input size="7" path='taxNumber.code'/>
                                        &nbsp;
										<form:select id="taxcode" path="taxNumber.invoiceTax" cssClass="combobox">
                                           	<c:if test='${not empty manual_billing_openingbalance_add.taxNumber.invoiceTax}'>
                                               	<form:option value='${manual_billing_openingbalance_add.taxNumber.invoiceTax.id}' label='${manual_billing_openingbalance_add.taxNumber.invoiceTax.code}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="opentax();" style="CURSOR:pointer;" title="Invoice Tax Code" />
									</td>
								</tr>
								<tr>
                                	<td align="right">Reference Type :</td>
                                    <td>
                                    	<form:select path='billingType'>
                                        	<form:option value='5' label='MANUAL(OPENING BALANCE)'/>
                                        </form:select>
                                    </td>
                                </tr> --%>
                                <tr>
                                    <td nowrap="nowrap" align="right">Authorizer :</td>
                                    <td>
                                        <form:select id="signer" path="signer" cssClass="combobox-ext">
                                            <c:if test='${not empty manual_billing_openingbalance_add.signer}'>
                                                <form:option value='${manual_billing_openingbalance_add.signer.id}' label='${manual_billing_openingbalance_add.signer.firstName} ${manual_billing_openingbalance_add.signer.lastName} ${manual_billing_openingbalance_add.signer.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opensigner();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Authorizer Role :</td>
                                    <td>
                                        <form:select id="activeRole" path="activeRole" cssClass="combobox-ext">
                                            <c:if test='${not empty manual_billing_openingbalance_add.activeRole}'>
                                                <form:option value='${manual_billing_openingbalance_add.activeRole.id}' label='${manual_billing_openingbalance_add.activeRole.fromRole.roleType.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openrole();" style="CURSOR:pointer;" title="Role" />
                                    </td>
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
	<%@ include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	function save()
	{		
		document.addForm.action = "<c:url value='/page/manualbillingopeningbalancepreadd2.htm'/>";
		document.addForm.submit();
	}
	
	function opentax()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupinvoicetaxview.htm?target=taxcode&organization='/>"+org.value);
	}
			
	function opencustomer()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
	}

	function opencontact()
	{
		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcontactpersonview.htm?target=customerContactPerson&organization='/>"+customer.value);
	}

	function openpostal(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		openpopup("<c:url value='/page/popuppostaladdressview.htm?type=TAX&target='/>"+target+"&party="+org.value);
	}

	function openaccount()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=akun&organization='/>"+org.value);
	}
		
	function opensigner()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupsignerview.htm?target=signer&organization='/>"+org.value);
	}
	
	function openrole()
	{
		var signer = document.getElementById('signer');
		if(signer.value == '')
		{
			alert('Please select Authorizer first!');
			return;
		}
		
		openpopup("<c:url value='/page/popuppartyroleview.htm?target=activeRole&party='/>"+signer.value);
	}

	function billedTo(target){
		var org = document.getElementById('org').value;
		
		switch($("#billingType").val()){
			case "10":
				openCustomerFacilityByOrg(target);
				break;
			case "9":
				opensupplierpersonal(target);
				break;
			case "8":
				openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
				break;
			case "7":
				openCustomerByOrg(target);
				break;
			case "6":
				openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization='/>"+org);
				break;
			default:
				alert("Please select Billing Type first !!!");
				break;
		}
	}
		
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
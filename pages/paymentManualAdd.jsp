<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
</head>

<body onload="javascript:setState('true');">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%">${breadcrumb}</td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">${pageTitle}</h1>

						<div class="toolbar">
                            <a class="item-button-list" href="<c:url value='/page/paymentmanualview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
                            	<a class="item-button-save b_entry" style="cursor:pointer;"><span>Save</span></a>
								<a class="item-button-save-new b_entry" style="cursor:pointer;"><span>Save &amp; New</span></a>
                            </c:if>
                        </div>

                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute='payment_add'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="Auto Number" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${payment_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty payment_add.organization}'>
                                                        <form:option value='${payment_add.organization.id}' label='${payment_add.organization.firstName} ${payment_add.organization.lastName} ${payment_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencompany();" style="CURSOR:pointer;" title="Company Structure" />
                                          	</td>
                                        </tr>
                                        <tr>
		                                    <td align="right">Tipe Payment : </td>
		                                    <td>
		                                        <select id='referenceType' name='paymentInformation.referenceType' class='combobox'>
		                                        	<option value="" selected>--Tipe--</option>
		                                        	<option value="SERVICEAGENT">BIRO JASA</option>
		                                        	<option value="MEDIATOR">MEDIATOR</option>
		                                        	<option value="MAINDEALER">MAIN DEALER</option>
		                                        	<option value="SALESMAN">SALESMAN</option>
		                                        	<option value="LEASING">LEASING</option>
		                                        	<option value="REGION">SAMSAT</option>
		                                        	<option value="DEPOSIT">DEPOSIT</option>
		                                        	<option value="RETUR">RETUR</option>
		                                        </select>
		                                    </td>
                                        </tr>
                                        <tr>
		                                    <td align="right">Tipe Payment Detail : </td>
		                                    <td>
		                                        <select id='referenceDetail' name='referenceDetail' class='combobox-medium input-disabled' disabled>
		                                        	<option value="" selected>--Tipe--</option>
		                                        </select>
		                                    </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Payment To :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty payment_add.supplier}'>
                                                        <form:option value='${payment_add.supplier.id}' label='${payment_add.supplier.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency'>
                                                    <form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT'/>
                                                    <form:option value='MIDDLE' label='MIDDLE'/>
                                                    <form:option value='TAX' label='TAX'/>
                                                </form:select>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Type : </td>
                       	  	  		  		<td>
	  											<form:select id='methodType' path='paymentInformation.paymentMethodType'>
                                                    <option value='CASH' selected onclick="setState(true);">CASH</option>
                                                    <form:option value='TRANSFER' label='TRANSFER' onclick="setState(false);"/>
                                                    <form:option value='CLEARING' label='CLEARING' onclick="setState(false);"/>
                                            	</form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td align="right">Bank/Cash Account : </td>
                                            <td>
                                                <form:select id='account' path='paymentInformation.bankAccount' cssClass='combobox-ext'>
                                                    <c:if test='${not empty paymentInformation.bankAccount}'>
                                                        <form:option value='${paymentInformation.bankAccount.id}' label='${paymentInformation.bankAccount.code}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img id="browseAccount" src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Transfer/Clearing No : </td>
                                          	<td><form:input id='ref' path='paymentInformation.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                          <td align="right" nowrap="nowrap">Due Date :</td>
                                          <td><input id="dueDate" name="paymentInformation.dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                    	</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Atas Nama :</td>
                                            <td>
                                                <select id="referenceFor" name="customerReference" class="combobox-ext input-disabled" disabled>
                                                </select>
                                                &nbsp;
                                                <img id="browseReferenceFor" hidden="true" src="assets/icons/list_extensions.gif" onclick="openCustomerByOrg('referenceFor');" style="CURSOR:pointer;" title="Referensi" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Reference From :</td>
                                            <td>
                                                <select id="referenceFrom" name="referenceFrom" class="combobox-ext input-disabled" disabled>
                                                </select>
                                                &nbsp;
                                                <img id="browseReference" hidden="true" src="assets/icons/list_extensions.gif" onclick="openAmount('referenceFrom');" style="CURSOR:pointer;" title="Referensi" />
                                            </td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Payment Amount : </td>
                                            <td>
                                            	<form:input id='referenceFrom-unpaidAmount' path="paymentInformation.amount" readonly="true" onkeyup="separator('referenceFrom-unpaidAmount');" cssStyle='text-align:right;'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                                <br/>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" language="javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Payment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_entry').click(function(e)
		{
			if(validation())
			{
				$('.b_entry').hide();
				$.ajax({
					url:"<c:url value='/page/paymentmanualadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Payment data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
	
								if($(e.target).html() == 'Save')
									window.location="<c:url value='/page/paymentmanualview.htm'/>";
								else
									window.location="<c:url value='/page/paymentmanualpreadd.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason:<br/>'+json.message);
							}
						}
					}
				});
			}
		});
		
		$("#referenceType").change(function()
		{
			$("#supplier option").remove();
			$("#referenceFrom option").remove();
			$("#referenceFrom-unpaidAmount").val(0);
			
			if($("#referenceType").val() == 'SERVICEAGENT')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceDetail");
				//$("<option></option>").text("BBN").val("BBN").appendTo("#referenceDetail");
				$("<option></option>").text("NOMOR CANTIK").val("SPECIAL_NUMBER").appendTo("#referenceDetail");
				$("<option></option>").text("PAJAK PROGRESIF").val("PROGRESSIVE_TAX").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");

				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			}
			else if($("#referenceType").val() == 'MEDIATOR')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceDetail");
				
				$("#referenceDetail").attr("disabled", "true");
				$("#referenceDetail").attr("class","combobox-medium input-disabled");
				
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#referenceFrom-unpaidAmount").attr("readonly","true");
				$("#browseReference").removeAttr("hidden");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			}
			else if($("#referenceType").val() == 'RETUR')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("PREPAYMENT").val("PREPAYMENT").appendTo("#referenceDetail");
				$("<option></option>").text("PENCAIRAN PELANGGAN").val("CUSTOMER_RECEIPT").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#referenceFrom-unpaidAmount").attr("readonly","true");
				$("#browseReference").removeAttr("hidden");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			}
			else if($("#referenceType").val() == 'MAINDEALER')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("PELANGGARAN WILAYAH").val("CROSS_DISTRICT").appendTo("#referenceDetail");
				$("<option></option>").text("LOKSUS").val("FINES_INVOICE").appendTo("#referenceDetail");
				$("<option></option>").text("DENDA ADM. FAKTUR").val("ADMINISTRATION_INVOICE").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
				
				if($("#referenceDetail").val() == 'CROSS_DISTRICT')
				{
					$("#referenceFrom").removeAttr("disabled");
					$("#referenceFrom").attr("class","combobox-ext");
					$("#browseReference").removeAttr("hidden");
				}
			}
			else if($("#referenceType").val() == 'SALESMAN')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("OMPANG").val("TEMPORARY").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#referenceFrom-unpaidAmount").attr("readonly","true");
				$("#browseReference").removeAttr("hidden");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			}
			else if($("#referenceType").val() == 'LEASING')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("SHARING BUDGET").val("SHARING_BUDGET").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");
				
				$("#referenceFor").attr("disabled", "true");
				$("#referenceFor").attr("class","combobox-ext input-disabled");
				$("#browseReferenceFor").attr("hidden", "true");
			}
			else if($("#referenceType").val() == 'REGION')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("PAJAK PROGRESIF").val("PROGRESSIVE_TAX").appendTo("#referenceDetail");
				$("<option></option>").text("LOKSUS").val("FINES_INVOICE").appendTo("#referenceDetail");
				$("<option></option>").text("DENDA ADM. FAKTUR").val("ADMINISTRATION_INVOICE").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");

				if($("#referenceDetail").val() == 'PROGRESSIVE_TAX')
				{
					$("#referenceFrom").removeAttr("disabled");
					$("#referenceFrom").attr("class","combobox-ext");
					$("#browseReference").removeAttr("hidden");
				}
			}
			else if($("#referenceType").val() == 'DEPOSIT')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceDetail");
				
				$("#referenceDetail").attr("disabled", "true");
				$("#referenceDetail").attr("class","combobox-medium input-disabled");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").attr("disabled", "true");
				$("#referenceFor").attr("class","combobox-ext input-disabled");
				$("#browseReferenceFor").attr("hidden", "true");
			}
			else
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceDetail");
				
				$("#referenceDetail").attr("disabled", "true");
				$("#referenceDetail").attr("class","combobox-medium input-disabled");
				
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
				$("#browseReference").attr("hidden", "true");
				
				$("#referenceFor option").remove();
				$("<option></option>").text("").val("").appendTo("#referenceFor");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			} 
		});
		
		$("#referenceDetail").change(function()
		{
			$("#referenceFor option").remove();
			$("<option></option>").text("").val("").appendTo("#referenceFor");
			
			if($("#referenceDetail").val() == 'BBN' || $("#referenceDetail").val() == 'SPECIAL_NUMBER')
			{
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
				$("#referenceFrom-unpaidAmount").attr("readonly","true");
			}
			else if($("#referenceDetail").val() == 'CROSS_DISTRICT')
			{
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
			}
			else if($("#referenceDetail").val() == 'PROGRESSIVE_TAX' || $("#referenceDetail").val() == 'SPECIAL_NUMBER' ||
					$("#referenceDetail").val() == 'PREPAYMENT')
			{
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
				$("#referenceFrom-unpaidAmount").attr("readonly","true");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
			}
			else if($("#referenceDetail").val() == 'CUSTOMER_RECEIPT')
			{
				$("#referenceFrom").removeAttr("disabled");
				$("#referenceFrom").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
				
				$("#referenceFor").removeAttr("disabled");
				$("#referenceFor").attr("class","combobox-ext");
				$("#browseReferenceFor").removeAttr("hidden");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
			}
			else
			{
				$("#referenceFrom").attr("disabled", "true");
				$("#referenceFrom").attr("class","combobox-ext input-disabled");
				$("#browseReference").attr("hidden", "true");
				$("#referenceFrom-unpaidAmount").removeAttr("readonly");
			}
		});
	});
	
	function validation()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		var reference = document.getElementById('referenceFrom').value;
		var type = document.getElementById('referenceType').value;
		var typeDetail = document.getElementById('referenceDetail').value;
		if(type == 'MEDIATOR')
		{
			if(reference == '')
			{
				alert('Please select Reference From first !!!');
				return;
			}
		}
		
		if(type == 'SERVICEAGENT')
		{
			if(typeDetail == '')
			{
				alert('Please select Payment Detail Type first !!!');
				return;
			}
			
			if(typeDetail == 'BBN' || typeDetail == 'PROGRESSIVE_TAX' || typeDetail == 'SPECIAL_NUMBER')
			{
				if(reference == '')
				{
					alert('Please select Reference From first !!!');
					return;
				}
			}
		}
		
		if(type == 'SALESMAN')
		{
			if(typeDetail == '')
			{
				alert('Please select Payment Detail Type first !!!');
				return;
			}
			
			if(typeDetail == 'TEMPORARY')
			{
				if(reference == '')
				{
					alert('Please select Reference From first !!!');
					return;
				}
			}
		}
		
		if(type != 'DEPOSIT')
		{
			var supplier = document.getElementById('supplier');
			if(supplier.value == '')
			{
				alert('Please select Payment To first!');
				return;
			}
		}

		var account = document.getElementById('account').value;
		if(account == '')
		{
			alert('Bank/Cash Account can not be empty!');
			return;
		}
		
		var amount = document.getElementById('referenceFrom-unpaidAmount').value;
		if(new Number(amount.replace(/,/g,'')) <= 0)
		{
			alert('Payment Amount must be greater than zero !!!');
			return;
		}
		
		return true;
	}

	function setState(disabled)
	{
		if(disabled)
		{
			document.getElementById('ref').setAttribute('class','input-disabled');
			document.getElementById('ref').disabled = true;
		}
		else
		{
			document.getElementById('ref').setAttribute('class','');
			document.getElementById('ref').disabled = false;
		}
		
		var bank = document.getElementById('account');
		bank.remove(bank.selectedIndex);
	}

	function opencompany()
	{
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>");

		var supplier = document.getElementById('supplier');
		for(var idx=supplier.options.length;idx>=0;idx--)
			supplier.remove(supplier.selectedIndex);
	}

	function opensupplier()
	{
		var org = document.getElementById('org');
		var type = document.getElementById('referenceType');
		
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		if(type.value == '')
		{
			alert('Please select Payment Type first !!!');
			return;
		}
		
		if(type.value == 'MEDIATOR' || type.value == 'RETUR')
			openCustomerByOrg('supplier');
		else if(type.value == 'SERVICEAGENT')
			openpopup("<c:url value='/page/bbnagentpopupview.htm?target=supplier&organization='/>"+org.value);
		else if(type.value == 'MAINDEALER')
			openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
		else if(type.value == 'SALESMAN')
			openpopup("<c:url value='/page/salesmanpopupview.htm?target=supplier&organization='/>"+org.value);
		else if(type.value == 'LEASING')
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=supplier&organization='/>"+org.value);
		else if(type.value == 'REGION')
			openpopup("<c:url value='/page/popupregionview.htm?target=supplier&organization='/>"+org.value);
	}

	function openaccount()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		var methodType = document.getElementById('methodType');
		var method = 'CASH';
		
		if(methodType.value != 'CASH')
			method = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+"&type="+method);
	}
	
	function openAmount(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}

		var supplier = document.getElementById('supplier');
		if(supplier.value == '')
		{
			alert('Please select Payment To first!');
			return;
		}

		var ref = document.getElementById('referenceFor');
		if(ref.value == '')
		{
			alert('Mohon pilih atas nama terlebih dahulu!');
			return;
		}
		
		var reference = document.getElementById('referenceType');
		var referenceDetail = document.getElementById('referenceDetail');
		if(reference.value == 'SERVICEAGENT' || reference.value == 'SALESMAN')
		{
			if(referenceDetail.value == 'PROGRESSIVE_TAX' || referenceDetail.value == 'SPECIAL_NUMBER' || referenceDetail.value == 'TEMPORARY')
				openpopup("<c:url value='/page/popupunitbillingmanualview.htm?organization='/>"+org.value+"&target="+target+"&referenceDetail="+referenceDetail.value+"&custId="+ref.value);
			else
				openpopup("<c:url value='/page/bbnpopup.htm?organization='/>"+org.value+"&target="+target);
		}
		else if(reference.value == 'MEDIATOR')
			openpopup("<c:url value='/page/unitsalesordermediatorpopup.htm?organization='/>"+org.value+"&target="+target+"&mediator="+supplier.value);
		else if(reference.value == 'RETUR')
		{
			if(referenceDetail.value == 'PREPAYMENT')
				openpopup("<c:url value='/page/unitsalesorderprepaymentpopup.htm?organization='/>"+org.value+"&target="+target+"&customer="+supplier.value);
			else
				openpopup("<c:url value='/page/unitsalesordercustomerreturpopup.htm?organization='/>"+org.value+"&target="+target+"&customer="+ref.value);
		}
		else if(reference.value == 'MAINDEALER'||reference.value == 'REGION')
		{
			if(referenceDetail.value == 'PROGRESSIVE_TAX')
				openpopup("<c:url value='/page/popupunitbillingmanualview.htm?organization='/>"+org.value+"&target="+target+"&referenceDetail="+referenceDetail.value+"&custId="+ref.value);
			else
				openpopup("<c:url value='/page/unitsalesorderpopup.htm?organization='/>"+org.value+"&target="+target+"&customer="+ref.value);
		}
	}
	
	function separator(id)
	{
		var amount = document.getElementById(id);
		
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
		}
	}
</script>
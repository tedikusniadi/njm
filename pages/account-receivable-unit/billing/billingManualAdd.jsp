<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/unitbillingmanualview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="billing">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	<c:if test='${not empty billing.organization}'>
                                               	<form:option value='${billing.organization.id}' label='${billing.organization.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
                                	<td nowrap="nowrap" align="right">Type : </td>
              	  	  		  		<td>
										<form:select id='methodType' path='paymentMethodType'>
                                           <form:option value='CASH' label='CASH'/>
                                           <form:option value='TRANSFER' label='TRANSFER'/>
                                    	</form:select>
                              	  	</td>
                               	</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Cash/Bank :</td>
									<td>
										<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext"></form:select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="checkTypeAccount();" style="CURSOR:pointer;" title="Cash/Bank Account" />
									</td>
								</tr>
							    <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td>
										<input id="date" inputId="dateId" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
										&nbsp;&nbsp;Due Date :
										<input id="dueDate" inputId="dueDateId" name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
									</td>
								</tr>
								<tr>
                                	<td align="right">Reference Type :</td>
                                    <td>
                                    	<form:select id="referenceFrom" path='referenceFrom'>
                                        	<form:option value='0' label='---Tipe---'/>
                                        	<form:option value='CUSTOMER' label='CUSTOMER'/>
                                        	<form:option value='LEASING' label='LEASING'/>
                                        	<form:option value='RETUR' label='RETUR'/>
                                        </form:select>
                                    </td>
                                </tr>
								<tr>
                                	<td align="right">Reference Type Detail :</td>
                                    <td>
                                    	<select id="referenceDetail" name='referenceFromDetail' class="combobox-medium input-disabled" disabled>
                                    		<option value="">---Tipe---</option>
                                        </select>
                                    </td>
                                </tr>
								<tr>
									<td nowrap="nowrap" align="right">Customer/Leasing/Mediator :</td>
									<td>
										<form:select id="customer" path="customer" cssClass="combobox-ext">
                                           	<c:if test='${not empty billing.customer}'>
                                               	<form:option value='${billing.customer.id}' label='${billing.customer.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="billedTo('customer');" style="CURSOR:pointer;" title="Customer" />
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Reference From :</td>
                                    <td>
                                        <select id="reference" name="unitSalesOrder" class="combobox-ext input-disabled" disabled>
                                        </select>
                                        <img id="browseReference" hidden="true" src="assets/icons/list_extensions.gif" onclick="openReference('reference');" style="CURSOR:pointer;" title="Referensi" />
                                    </td>
                                </tr>
	 							<tr>
                                     <td align="right">Mata Uang :</td>
                                     <td>
                                         <form:select id='currency' path='currency'>
                                         <c:forEach items='${currencys}' var='curr'>
                                             <form:option value='${curr.id}' label='${curr.symbol}'/>
                                         </c:forEach>
                                         </form:select>
                                         <form:select id='type' path='exchangeType'>
                                             <form:option value='SPOT' label='SPOT'/>
                                             <form:option value='MIDDLE' label='MIDDLE'/>
                                             <form:option value='TAX' label='TAX'/>
                                         </form:select>
                                         <input id="trxrate" class="input-disabled" disabled value="1"/>
                                     </td>
                                </tr>
                          		<tr>
									<td align="right">Amount :</td>
									<td><form:input id="amount" readonly="readonly" path="amount" value="0" size="20" onkeyup="separator('amount');"/></td>
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

	<%@include file='/common/sirius-footer.jsp' %>

</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		$("#type").change(function(){
			var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
			$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
		});
		
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Unit Billing Manual',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.b_save').click(function(e)
		{
			if(validation())
			{
				$('.b_save').hide();
				$.ajax({
					url:"<c:url value='/page/unitbillingmanualadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Billing data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitbillingmanualview.htm?id='/>"+json.id;
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
		
		$("#methodType").change(function()
		{
			$("#bankAccount option").remove();
		});
		
		$("#referenceFrom").change(function()
		{
			if($("#referenceFrom").val() == 'CUSTOMER')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("ASURANSI").val("INSURANCE").appendTo("#referenceDetail");
				$("<option></option>").text("NOMOR CANTIK").val("SPECIAL_NUMBER").appendTo("#referenceDetail");
				$("<option></option>").text("OMPANG").val("TEMPORARY").appendTo("#referenceDetail");
				$("<option></option>").text("PAJAK PROGRESIF").val("PROGRESSIVE_TAX").appendTo("#referenceDetail");
				$("<option></option>").text("PENAMBAHAN OTR").val("ADDITIONAL_OTR").appendTo("#referenceDetail");
				$("<option></option>").text("PELANGGARAN WILAYAH").val("CROSS_DISTRICT").appendTo("#referenceDetail");
				$("<option></option>").text("ACC TAHUN").val("ACC_TAHUN").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");

				$("#amount").val(0);
				$("#amount").removeAttr("readonly");
			}
			else if($("#referenceFrom").val() == 'LEASING')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("SHARING BUDGET").val("SHARING_BUDGET").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");

				$("#amount").val(0);
				$("#amount").removeAttr("readonly");
			}
			else if($("#referenceFrom").val() == 'RETUR')
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("MEDIATOR").val("MEDIATOR").appendTo("#referenceDetail");
				
				$("#referenceDetail").removeAttr("disabled");
				$("#referenceDetail").attr("class","combobox-medium");
				
				$("#reference").removeAttr("disabled");
				$("#reference").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
				
				$("#amount").val(0);
				$("#amount").attr("readonly", "readonly");
			}
			else
			{
				$("#referenceDetail option").remove();
				$("<option></option>").text("---Pilih---").val("0").appendTo("#referenceDetail");
				
				$("#referenceDetail").attr("disabled","true");
				$("#referenceDetail").attr("class","combobox-medium input-disabled");

				$("#amount").val(0);
				$("#amount").removeAttr("readonly");
			}
		});
		
		$("#referenceDetail").change(function()
		{
			if($("#referenceDetail").val() == 'PROGRESSIVE_TAX' || $("#referenceDetail").val() == 'ADDITIONAL_OTR' || $("#referenceDetail").val() == 'CROSS_DISTRICT' ||
					$("#referenceDetail").val() == 'MEDIATOR')
			{
				$("#reference").removeAttr("disabled");
				$("#reference").attr("class","combobox-ext");
				$("#browseReference").removeAttr("hidden");
			}
			else
			{
				$("#reference").attr("disabled", "true");
				$("#reference").attr("class","combobox-ext input-disabled");
				$("#browseReference").attr("hidden", "true");
			}
		});
	});

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

	function checkTypeAccount()
	{
		var payment = 'CASH';
		if($("#methodType").val() == 'CASH')
			payment = 'CASH';
		else
			payment = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&organization='/>"+$("#org").val()+'&type='+payment);
	}
	
	function validation()
	{
		if($("#org").val() == '' || $("#org").val() == null)
		{
			alert('Please select Company first !!!');
			return;
		}
		
		if($("#bankAccount").val() == '' || $("#bankAccount").val() == null)
		{
			alert('Please select Cash/Bank Account first !!!');
			return;
		}
		
		if($("#dateId").val() == '' || $("#dueDateId").val() == '')
		{
			alert('Date and Due Date cannot be empty !!!');
			return;
		}
		
		if($("#referenceFrom").val() == '0')
		{
			alert('Please select Reference Type first !!!');
			return;
		}
		
		if($("#referenceDetail").val() == '0')
		{
			alert('Please select Reference Type Detail first !!!');
			return;
		}
		
		if($("#customer").val() == '' || $("#customer").val() == null)
		{
			alert('Please select Customer first !!!');
			return;
		}
		
		if(new Number($("#amount").val().replace(/,/g,'')) <= 0)
		{
			alert('Please input Billing Amount first !!!');
			return;
		}
		
		return true;		
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}

	function separator(id)
	{
		var amount = document.getElementById(id);

		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}
	
	function billedTo(target)
	{
		var org = document.getElementById('org');
		if($("#referenceFrom").val() == '')
		{
			alert("Silahkan pilih Reference Type terlebih dahulu !!!");
			return;
		}
		else if($("#referenceFrom").val() == 'CUSTOMER' || $("#referenceFrom").val() == 'RETUR')
		{
			openCustomerByOrg(target);
		}
		else if($("#referenceFrom").val() == 'LEASING')
		{
			openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization="+org.value+"'/>");
		}
	}

	
	function openReference(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}

		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select Customer first!');
			return;
		}
		
		if($("#referenceFrom").val() == 'CUSTOMER')
			openpopup("<c:url value='/page/unitsalesorderpopup.htm?organization='/>"+org.value+"&target="+target+"&customer="+customer.value+"&popupFor=progressiveTax");
		else if($("#referenceFrom").val() == 'RETUR')
			openpopup("<c:url value='/page/unitsalesordermediatorreturpopup.htm?organization='/>"+org.value+"&target="+target+"&mediator="+customer.value);
	}
</script>
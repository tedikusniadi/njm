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
	<%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
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
                            <a class="item-button-list" href="<c:url value='/page/prepaymentcashview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
								<!-- <a class="item-button-save-new b_entry" style="cursor:pointer;"><span>Save &amp; New</span></a> -->
                            </c:if>
                        </div>

                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute='prepayment_add'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right">ID :</td>
                                          	<td width="76%"><input size="25" value="Auto Number" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right">Facility :</td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty prepayment_add.organization}'>
                                                        <form:option value='${prepayment_add.organization.id}' label='${prepayment_add.organization.firstName} ${prepayment_add.organization.middleName} ${prepayment_add.organization.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="opencompany();" style="CURSOR:pointer;" title="Company Structure" />
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Receive From :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext">
                                                    <c:if test='${not empty prepayment_add.customer}'>
                                                        <form:option value='${prepayment_add.customer.id}' label='${prepayment_add.customer.firstName} ${prepayment_add.customer.middleName} ${prepayment_add.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrgInstant('customer', 'false');" style="CURSOR:pointer;" title="Customer" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Reference :</td>
                                            <td>
                                                <form:select id="unitSalesOrder" path="unitSalesOrder" cssClass="combobox-ext">
                                                    <c:if test='${not empty prepayment_add.unitSalesOrder}'>
                                                        <form:option value='${prepayment_add.unitSalesOrder.id}' label='${prepayment_add.unitSalesOrder.code}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="openSalesOrderLeasingStatus('unitSalesOrder',null,'REJECTED');" style="CURSOR:pointer;" title="Sales Order" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td nowrap="nowrap" align="right">Type : </td>
                      	  	  		  		<td>
	  											<form:select id='methodType' path='prepaymentType' onchange="clearAccount();">
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
                                            <td align="right">Reference Amount :</td>
                                          	<td><input id="salesAmount" size="25" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right">Amount :</td>
                                          	<td width="76%"><form:input id="amount" path="amount" size="25" onkeyup="separator('amount');"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right">Note :</td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
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
  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">

$(function(){
	$("#type").change(function(){
		var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
	});
	
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Prepayment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(validation())
		{
			$('.b_save').hide();
			$.ajax({
				url:"<c:url value='/page/prepaymentadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Prepayment data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/prepaymentcashview.htm?'/>";
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
});

function validation()
{
	var org = document.getElementById('org').value;
	var date = document.getElementById('inputDate').value;
	var customer = document.getElementById('customer').value;
	var sales = document.getElementById('unitSalesOrder').value;
	var account = document.getElementById('bankAccount').value;
	var salesAmount = document.getElementById('salesAmount').value;
	var amount = document.getElementById('amount').value;

	if(org == '')
	{
		alert('Please select Facility first !!!');
		return;
	}

	if(date == '')
	{
		alert('Date cannot be empty !!!');
		return;
	}

	if(customer == '')
	{
		alert('Please select Receive From first !!!');
		return;
	}

	if(sales == '')
	{
		alert('Please select Unit Sales Order first !!!');
		return;
	}

	if(account == '')
	{
		alert('Please select Cash/Bank Account first !!!');
		return;
	}

	if(amount == '' || parseFloat(amount.replace(/,/g,'')) <= 0)
	{
		alert('Amount cannot be empty and must be greater than zero !!!');
		return;
	}
	
	if(parseFloat(amount.replace(/,/g,'')) > parseFloat(salesAmount.replace(/,/g,'')))
	{
		alert('Amount tidak boleh melebihi Sales Amount !!!');
		return;
	}
	return true;
}

function opencompany()
{
	openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>");

	var customer = document.getElementById('customer');
	for(var idx=customer.options.length;idx>=0;idx--)
		customer.remove(customer.selectedIndex);

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

function checkTypeAccount()
{
	var payment = 'CASH';
	if($("#methodType").val() == 'CASH')
		payment = 'CASH';
	else
		payment = 'BANK';

	openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&organization='/>"+$("#org").val()+'&type='+payment);
}

function separator(id)
{
	var amount = document.getElementById(id);

	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
	}
}

function clearAccount()
{
	var account = document.getElementById('bankAccount');
	for(var idx=account.options.length;idx>=0;idx--)
		account.remove(account.selectedIndex);
}
</script>
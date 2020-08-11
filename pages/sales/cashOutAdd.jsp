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
                            <a class="item-button-list" href="<c:url value='/page/cashoutview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save-new b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                        </div>
                        <div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute='cash_out'>
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
                                                    <c:if test='${not empty cash_out.organization}'>
                                                        <form:option value='${cash_out.organization.id}' label='${cash_out.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opencompany();" style="CURSOR:pointer;" title="Company Structure" />
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <%-- <tr>
                                        	<td nowrap="nowrap" align="right">Type : </td>
                      	  	  		  		<td>
	  											<form:select id='methodType' path='paymentMethodType'>
                                                   <form:option value='CASH' label='CASH'/>
                                                   <form:option value='TRANSFER' label='TRANSFER'/>
	                                           	</form:select>
                                      	  	</td>
                                       	</tr> --%>
                                        <tr>
			 								<td nowrap="nowrap" align="right">Shift Management :</td>
											<td>
												<form:select id="shiftManagement" path="shiftManagement" cssClass="combobox-ext">
                                                    <c:if test='${not empty cash_out.shiftManagement}'>
                                                        <form:option value='${cash_out.shiftManagement.id}' label='${cash_out.shiftManagement.code}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openShiftManagement();" style="CURSOR:pointer;" title="Shift Management" />
											</td>
			 							</tr>
                                        <tr>
                                            <td align="right">Cashier :</td>
                                          	<td><input id="cashier" size="25" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
			 								<td nowrap="nowrap" align="right">Cash Account :</td>
											<td>
												<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext">
                                                    <c:if test='${not empty cash_out.bankAccount}'>
                                                        <form:option value='${cash_out.bankAccount.id}' label='${cash_out.bankAccount.bankName}' />
                                                    </c:if>
                                                </form:select>
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
		                                         &nbsp;
		                                         <form:select id='type' path='exchangeType'>
		                                             <form:option value='SPOT' label='SPOT'/>
		                                             <form:option value='MIDDLE' label='MIDDLE'/>
		                                             <form:option value='TAX' label='TAX'/>
		                                         </form:select>
		                                         &nbsp;
		                                         <input id="trxrate" class="input-disabled" disabled value="10"/>
		                                     </td>
		                                </tr>
                                        <tr>
                                            <td align="right">Amount :</td>
                                          	<td><form:input id="amount" path="amount" size="25" onkeyup="separator('amount');"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
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
<script type="text/javascript">

	$(function(){
		$("#type").change(function(){
			var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
			$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
		});
		
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'CASH OUT',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.b_save').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/cashoutadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Cash Out data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/cashoutview.htm?'/>";
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
		var account = document.getElementById('bankAccount').value;
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
		
		return true;
	}

	function opencompany()
	{
		openpopup("<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>");
	}

	function openShiftManagement()
	{
		var org = document.getElementById('org').value;
		if(org == '')
		{
			alert('Please select Organization first !!!');
			return;
		}
		openpopup("<c:url value='/page/popupshiftmanagementview.htm?target=shiftManagement&organization='/>"+org);
	}

	function checkTypeAccount()
	{
		var payment = 'CASH';
		if($("#methodType").val() == 'CASH')
			payment = 'CASH';
		else
			payment = 'BANK';
		
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&plafon=N&organization='/>"+$("#org").val()+'&type='+payment);
	}

	function separator(id)
	{
		var amount = document.getElementById(id);

		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}

</script>
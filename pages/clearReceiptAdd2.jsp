<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
    <head>
        <title>Clear Receipt >> Add</title>
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
			<td width="60%">Financial Accounting > Accounting Receivables > Clear Receipt > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F25 - Clear Receipt</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/clearreceiptview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="clear_add">
 								<table width="100%" style="border:none">
 								<tr>
 									<td nowrap="nowrap" align="right">ID :</td>
									<td width="75%"><input class="input-disabled" value="Auto Number" disabled size="30"/></td>
 								</tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Date :</td>
                                    <td><input id="date" name="date" value="<fmt:formatDate value='${clear_add.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="25%" align="right"> Company : </td>
               				  <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                  	</td>					
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer :</td>
                                    <td>
                                        <select id="customer" class="combobox-ext" disabled>
                                            <c:if test='${not empty clear_add.receipt.customer}'>
                                                <option value='${clear_add.receipt.customer.id}'>
                                                	<c:out value='${clear_add.receipt.customer.firstName} ${clear_add.receipt.customer.lastName} ${clear_add.receipt.customer.middleName}'/>
                                                </option>
                                            </c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="25%" align="right">Receipt No : </td>
               				  <td>
                                        <form:select id="receipt" path="receipt" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty clear_add.receipt}'>
                                                <form:option value='${clear_add.receipt.id}' label='${clear_add.receipt.code}' />
                                            </c:if>
                                        </form:select>
                                  	</td>					
                                </tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Bank Name :</td>
									<td><input id="reference" size="35" value="${clear_add.receipt.receiptInformation.bankAccount.bankName}" class="input-disabled" disabled/></td>
 								</tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Transfer/Clearing No :</td>
									<td><input id="reference" size="35" value="${clear_add.receipt.receiptInformation.reference}" class="input-disabled" disabled/></td>
 								</tr>
                                <tr>
 									<td nowrap="nowrap" align="right">Amount :</td>
									<td>
                                    	<input id="amount" size="25" value="<fmt:formatNumber value='${clear_add.receipt.receiptInformation.amount}' pattern=',##0.00'/>" class="input-disabled" disabled/>
                                        &nbsp;
                                        <input id="currency" size="10" value="${clear_add.receipt.currency.symbol}" class="input-disabled" disabled/>
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
  	<div style="clear_add:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear_add:both;height:20px">&nbsp;</div>

</div>

</body>

</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Clear Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/clearreceiptadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Clear Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/clearreceiptview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});		
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
	
	function openreceipt()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		var customer = document.getElementById('customer');
		if(customer.value == '')
		{
			alert('Please select customer first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupreceipt4clearingview.htm?target=receipt&type=CLEARING&cleared=false&organization='/>"+org.value+'&customer='+customer.value);
	}
</script>
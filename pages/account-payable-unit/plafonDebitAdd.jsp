<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code='plafondebit.htmltitle'/></title>
	<%@ include file="/common/sirius-header.jsp"%>
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="60%"><spring:message code="plafondebit.breadcrumb"/></td>
            <td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
        </tr>
        </table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="plafondebit.title"/></h1>

						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/plafondebitview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plafondebit">
								<table width="100%" style="border:none">
								<tr>
									<td width="18%" align="right"><spring:message code="id"/></td>
									<td width="40%"><input class="inputbox input-disabled" disabled value='<spring:message code="autonumber"/>'/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
								<tr>
 									<td align="right"><spring:message code="facility"/> :</td>
									<td>
                                    	<form:select id="org" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty plafondebit.organization}'>
                                            <form:option value='${plafondebit.organization.id}' label='${plafondebit.organization.name}' />
                                        </c:if>
	                                    </form:select>
	                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                	</td>
	 							</tr>
	 							<tr>
 									<td align="right"><spring:message code="plafon"/> :</td>
									<td>
                                    	<form:select id="plafon" cssClass="combobox-ext" path="plafon">
                                    		<c:if test="${empty plafondebit.plafon }">
                                    			<option value="${plafondebit.plafon.id }">${plafondebit.plafon.name}</option>
                                    		</c:if>
                                        </form:select>
	                                     <c:if test="${empty plafondebit.plafon }">
                                 			<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openPlafon();" style="CURSOR:pointer;" title="Popup" />
                                 		</c:if>&nbsp;
                                 		<input type="hidden" id="bankid" name="bankid"/>
                                    </td>
	 							</tr>
 								<tr>
									<td align="right"><spring:message code="date"/> :</td>
									<td colspan="2"><input name="date" inputId="inputDate" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
									&nbsp;
									<%-- <spring:message code="duedate"/> :
									<input name="dueDate" inputId="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/> --%>
									
									</td>
									
								</tr>
								<%-- <tr>
									<td align="right"><spring:message code="duedate"/></td>
									<td colspan="2"><input name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr> --%>
								
								<tr>
                                     <td align="right">Mata Uang :</td>
                                     <td>
                                         <form:select id='currency' path='money.currency'>
                                         <c:forEach items="${currencies}" var="curr">
											<form:option value='${curr.id}' label='${curr.symbol}' onclick='display();'/>
										</c:forEach>
                                         
                                         <%-- <c:forEach items='${currencys}' var='curr'>
                                             <form:option value='${curr.id}' label='${curr.symbol}' onclick='display();'/>
                                         </c:forEach> --%>
                                         </form:select>
                                         
                                         <form:select id='type' path='money.exchangeType'>
                                             <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                             <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                             <form:option value='TAX' label='TAX' onclick='display();'/>
                                         </form:select>
                                         
                                         <input id="trxrate" class="input-disabled" disabled value="1"/>
                                         <input type="hidden" id='exchange' path='money.rate'/>
                                     </td>
                                 </tr>
                                 
								<%-- <tr>
									<td align="right"><spring:message code="currency"/></td>
									<td colspan="2">
									<select name="money.currency" id="currency">
										<option value="0">--<spring:message code="currency"/>--</option>
										<c:forEach items="${currencies}" var="cur">
											<option value="${cur.id}">${cur.name}</option>
										</c:forEach>
									</select>
									&nbsp;Rate:&nbsp;<input id="rate" value="" size="5" disabled class="input-disabled"/></td>
								</tr> --%>
								<tr>
									<td align="right"><spring:message code="payment"/>&nbsp;<spring:message code="type"/> :</td>
									<td colspan="2"><input value="TRANSFER" disabled size="20"/></td>
								</tr>
								<tr>
									<td align="right"><spring:message code="num"/>&nbsp;<spring:message code="transfer"/> :</td>
									<td colspan="2"><input id="refNo" value="" name="refNo"/></td>
								</tr>
								<tr>
									<td align="right"><spring:message code="amount"/> :</td>
									<td colspan="2"><input id="amount" value="" name="money.amount" onkeyup="separator();"/></td>
								</tr>
								<tr>
	 								<td align="right"><spring:message code="bank"/> :</td>
									<td colspan="2">
										<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext"></form:select>
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="openBankAccount();" style="CURSOR:pointer;" title="Bank Account" />
									</td>
	 							</tr>
								<tr>
                                     <td nowrap="nowrap" align="right"><spring:message code="note"/> :</td>
                                     <td colspan="2"><form:textarea path='note' cols='30' rows='4'/></td>
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
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#type").change(function(){
		var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
	});
	
	$("#currency").change(function(){
		var data={
				from:$("#currency").val(),
				to:1,
				date:$("#inputDate").val(),
				type:'SPOT'
		};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#rate").val(json.rate);});
	});
});

function removeItem(target)
{
	$("#"+target+" option").remove();
	$("<option></option>").	text("").val("").appendTo("#"+target);
}

function openPlafon()
{
	if($("#org").val() == '')
	{
		alert('Please select facility first !!!');
		return;
	}
	
	openpopup("<c:url value='/page/popupplafonlist.htm?target=plafon&organization='/>"+$("#org").val());
}

function save()
{
	var name = document.getElementById('plafon').value;
	if(name == null || name == '') {
		alert('Please select Plafon first !!!');
		return;
	}
	
	var date = document.getElementById('inputDate').value;
	if(date == null || date == '') {
		alert('Plafon Date cannot be empty !!!');
		return;
	}
	
	/* var duedate = document.getElementById('dueDate').value;
	if(duedate == null || duedate == '') {
		alert('Due Date cannot be empty !!!');
		return;
	} */
	
	var ref = document.getElementById('refNo').value;
	if(ref == null || ref == '') {
		alert('Transfer Number cannot be empty !!!');
		return;
	}
	
	var amount = document.getElementById('amount').value;
	if(amount == null || amount == '') {
		alert('Amount cannot be empty !!!');
		return;
	} else if(parseFloat(amount) <= 0){
		alert('Amount must be greater than zero !!!');
		return;
	}
	
	document.addForm.action = "<c:url value='/page/plafondebitadd.htm'/>";
	document.addForm.submit();
}

function display()
{
	var _date = dojo.widget.byId("validFrom");
	var curr = document.getElementById('currency');
	var type = document.getElementById('type');

	var transaction=document.getElementById("transaction");
	var transactionDef=document.getElementById("transactionDef");
	var tax=document.getElementById("tax");
	var taxDef=document.getElementById("taxDef");

	var receiveds=document.getElementsByName("receiveds");
	var prices=document.getElementsByName("prices");
	var subtotals=document.getElementsByName("subtotals");
	for(var i=0;i<receiveds.length;i++){
		subtotals[i].value=prices[i].value*receiveds[i].value;
		transaction.value=parseFloat(transaction.value)+parseFloat(subtotals[i].value);
		transactionDef.value=transaction.value*exchange;
	}

}

function openBankAccount()
{
	var org = document.getElementById('org').value;
	var plafon = document.getElementById('plafon').value;
	if(plafon == '')
	{
		alert('Please select Plafon first !!!');
		return;
	}
	
	var bank = document.getElementById('bankid').value;
	
	openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&bankId='/>"+bank+"&holderId="+org);
}

function separator()
{
	var amount = document.getElementById('amount');
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
	}
}
</script>
</body>
<!-- END OF BODY -->
</html>

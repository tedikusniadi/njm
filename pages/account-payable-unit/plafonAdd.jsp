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
    <style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/popup.jsp"%>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<!-- main menu -->
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
							<a class="item-button-list" href="<c:url value='/page/plafonview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" href="javascript:save();"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<c:if test="${not empty message}">
								<%@ include file="/common/error.jsp"%>
							</c:if>
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plafon_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="18%" align="right"><spring:message code="id"/> :</td>
									<td width="40%"><input class="inputbox input-disabled" disabled value='<spring:message code="autonumber"/>'/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
								<tr>
 									<td align="right"><spring:message code="facility"/> :</td>
									<td>
                                    	<form:select id="relation" path="partyRelationship" cssClass="combobox-ext">
                                            <c:if test='${not empty plafon_add.partyRelationship}'>
                                                <form:option value='${plafon_add.partyRelationship.id}' label='${plafon_add.partyRelationship.fromRole.party.name}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popuppartyrelationshipview.htm?target=relation&type=5'/>');" style="CURSOR:pointer;" title="Party Relationship" />
                                    </td>
	 							</tr>
	 							<tr>
									<td width="18%" align="right"><spring:message code="plafon.name"/> :</td>
									<td width="40%"><form:input path="name" size="30"/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
	 							<tr>
	 								<td align="right"><spring:message code="bank"/> :</td>
									<td colspan="2">
										<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext"></form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openBankAccount();" style="CURSOR:pointer;" title="Party Relationship" />
									</td>
	 							</tr>
	 							<tr>
                                <td align="right">Accounting Schema :</td>
                                <td colspan="2">
                                    <form:select id="coa" path='chartOfAccount' cssClass="combobox-ext" disabled='true'>
                                    	<form:option value='${plafon_add.chartOfAccount.id}' label='${plafon_add.chartOfAccount.code} ${plafon_add.chartOfAccount.name}'/>
                                    </form:select>
                                </td>
	                            </tr>
	                            <tr>
	                            	<td align="right">Bank/Cash GL Account :</td>
	                                <td colspan="2">
										<form:select id="account" path="account" cssClass="combobox-ext">
										</form:select>
	                                    &nbsp;
	                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:popup();" style="CURSOR:pointer;" title="GL Account" />
							  		</td>
	                            </tr>
	 							<tr>
									<td align="right"><spring:message code="date"/> :</td>
									<td colspan="2"><input inputId="date" id="validFrom" name="validFrom" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
	 							<tr>
                                     <td align="right">Mata Uang :</td>
                                     <td>
                                         <form:select id='currency' path='currency'>
                                         <c:forEach items='${currencys}' var='curr'>
                                             <form:option value='${curr.id}' label='${curr.symbol}' onclick='display();'/>
                                         </c:forEach>
                                         </form:select>
                                         &nbsp;
                                         <form:select id='type' path='exchangeType'>
                                             <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                             <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                             <form:option value='TAX' label='TAX' onclick='display();'/>
                                         </form:select>
                                         &nbsp;
                                         <input id="trxrate" class="input-disabled" disabled value="1"/>
                                     </td>
                                </tr>
                          		<tr>
									<td width="18%" align="right">Limit Plafon :</td>
									<td width="40%"><form:input id="limit" path="plafon" value="0" size="20" onkeyup="separator();"/></td>
   									<td width="42%">&nbsp;</td>
								</tr>
								<tr>
                                     <td nowrap="nowrap" align="right">Catatan :</td>
                                     <td><form:textarea path='note' cols='30' rows='4'/></td>
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

	function popup()
	{
		var coa = document.getElementById('coa');
		if(coa.value == '')
		{
			alert('Please select valid Journal Schema first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupglaccountview.htm?target=account&coa='/>"+coa.value);
	}
	
	function openBankAccount()
	{
		openpopup("<c:url value='/page/popupbankaccountview.htm?target=bankAccount&holderId='/>");
	}

	function save()
	{
		var facility = document.getElementById('relation').value;
		if(facility == null || facility == '') {
			alert('Please select Facility first !!!');
			return;
		}
		
		var name = document.getElementById('name').value;
		if(name == null || name == '') {
			alert('Plafon Name cannot be empty !!!');
			return;
		}
		
		var bank = document.getElementById('bankAccount').value;
		if(bank == null || bank == '') {
			alert('Please select Bank Account first !!!');
			return;
		}
		
		var date = document.getElementById('date').value;
		if(date == null || date == '') {
			alert('Plafon Date cannot be empty !!!');
			return;
		}
		
		var limit = document.getElementById('limit').value;
		if(limit == null || limit == '') {
			alert('Please input Plafon Limit first !!!');
			return;
		}
		if(limit.replace(/,/g,'') >= 0) {
			alert('Plafon Limit must be less than 0 !!!');
			return;
		}
		
		document.addForm.action = "<c:url value='/page/plafonadd.htm'/>";
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
	
	function separator()
	{
		var amount = document.getElementById('limit');
		
		if(amount.value != '')
		{
			var minus = "";
			if(amount.value.substring(0,1) == '-')
			{
				minus = "-";
				amount.value = amount.value.replace('-','0');
			}
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
			amount.value = minus+amount.value;
		}
	}

	$(function(){
		$("#type").change(function(){
			var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
			$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
		});
	});
</script>
</body>
<!-- END OF BODY -->
</html>

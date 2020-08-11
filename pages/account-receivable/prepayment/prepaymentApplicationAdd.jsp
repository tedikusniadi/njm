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
</head>

<body>

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->

	<!-- tips & page navigator -->
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

						<!-- Top toolbar -->
					  	<div class="toolbar">
							<a class="item-button-back" href="javascript:history.back();"><span><spring:message code='back'/></span></a>
							<c:if test='${access.add}'>
	                            <a id="b_save" class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="application">
			 				<table width="100%" style="border:none" class="space">
							<tr>
								<td width="29%" align="right">Kode </td>
				  		  	  	<td width="1%">:</td>
					 		  	<td width="70%"><input class="inputbox input-disabled" value="<spring:message code='autonumber'/>" disabled/>
							</tr>
							<tr>
								<td align="right">Prepayment</td>
								<td>:</td>
								<td><input class="inputbox input-disabled" value="${application.prepayment.code}" disabled/></td>
							</tr>
							<tr>
								<td align="right">Facility </td>
								<td>:</td>
								<td>
								<form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                     <c:if test='${not empty application.organization}'>
                                         <form:option value='${application.organization.id}' label='${application.organization.firstName} ${application.organization.middleName} ${application.organization.lastName}' />
                                     </c:if>
                                 </form:select>
								</td>
							</tr>
                            <tr>
								<td align="right">Tanggal </td>
								<td>:</td>
								<td><input value="<fmt:formatDate value='${now}'/>" name="date" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300" /></td>
							</tr>
							<tr>
								<td nowrap="nowrap" align="right">Type</td>
								<td>:</td>
                      	  	  	<td>
	  								<form:select id='methodType' path='prepaymentType'>
                                    	<form:option value='CASH' label='CASH'/>
                                        <form:option value='TRANSFER' label='TRANSFER'/>
	                                </form:select>
                                </td>
                            </tr>
                            <tr>
 								<td nowrap="nowrap" align="right">Cash/Bank</td>
								<td>:</td>
								<td>
									<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext"></form:select>
                                      	&nbsp;
									<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="checkTypeAccount();" style="CURSOR:pointer;" title="Cash/Bank Account" />
								</td>
 							</tr>
							<tr>
								<td align="right">Amount Prepayment</td>
								<td>:</td>
								<td><input class="inputbox input-disabled" value="<fmt:formatNumber value='${application.prepayment.amount}' pattern='#,###.00'/>" disabled/></td>
							</tr>
							<tr>
								<td align="right">Sisa Prepayment</td>
								<td>:</td>
								<td><input id="availableAmount" class="inputbox input-disabled" value="<fmt:formatNumber value='${application.prepayment.available}' pattern='#,###.00'/>" disabled/></td>
							</tr>
                            <tr>
								<td width="29%" align="right">Jumlah Penarikan</td>
				  				<td width="1%">:</td>
				  				<td width="70%"><input id="amount" value="<fmt:formatNumber value='${application.prepayment.available}' pattern='#,###'/>" onkeyup="separator('amount');" name="amount" maxlength="50" class="inputbox"/></td>
							</tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file='/common/sirius-footer.jsp' %>
</div><!-- /main containers -->

</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	function save()
	{
		var amount=new Number($("#amount").val().replace(/,/g,''));
		var available = new Number($("#availableAmount").val().replace(/,/g,''));
		var account = document.getElementById('bankAccount').value;

		if(account == '')
		{
			alert('Please select Cash/Bank Account first !!!');
			return;
		}
		
		if(amount > available)
		{
			alert('Jumlah Penarikan tidak boleh melebihi Sisa Prepayment !!!');
			return;
		}
		
		$('#b_save').hide();
		document.addForm.action="<c:url value='/page/prepaymentapplicationadd.htm'/>";
		document.addForm.submit();
	}

	function checkTypeAccount()
	{
		var payment = 'CASH';
		if($("#methodType").val() == 'CASH')
			payment = 'CASH';
		else
			payment = 'BANK';
		
		openAccount('bankAccount', payment, '${prepayment.organization.id}');
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
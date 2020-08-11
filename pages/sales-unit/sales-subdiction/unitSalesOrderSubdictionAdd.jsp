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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordersubdictionview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
	                            <a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="subdiction">
			 				<table width="100%" style="border:none" class="space">
			 				<tr>
			 					<td align="right">Date From</td>
			 					<td>:</td>
			 					<td><input inputId="dateFromId" id="dateFrom" name="dateFrom" class="datepicker" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>"/></td>
			 				</tr>
			 				<tr>
                                <td align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty subdiction.organization}'>
                                            <form:option value='${subdiction.organization.id}' label='${subdiction.organization.firstName} ${subdiction.organization.middleName} ${subdiction.organization.lastName}' />
                                        </c:if>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                </td>
                            </tr>
		 					<tr>
								<td align="right">Tipe Unit</td>
								<td>:</td>
								<td>
									<select id="productType" name="productType" class="combobox">
									</select>
									<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=productType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
								</td>
							</tr>
					  		<tr>
						  		<td align="right">Tipe Pembayaran</td>
						  		<td>:</td>
						  		<td>
						  			<form:select id="unitPayment" path="unitPayment">
						  				<option value="pilih">---PILIH---</option>
										<form:option value="CASH" label="CASH"/>
										<form:option value="CREDIT" label="CREDIT"/>
										<form:option value="CASHCREDIT" label="CASH & CREDIT"/>
									</form:select>
                          		</td>
					  		</tr>
							<tr>
						  		<td align="right">Tipe Subsidi</td>
						  		<td>:</td>
						  		<td>
						  			<form:select id="type" path="type" class="input-disabled" disabled="true">
						  				<option value="pilih">---PILIH---</option>
										<form:option value="DISC_DEALER" label="DISCOUNT DEALER"/>
										<form:option value="DISC_PROGRAM" label="DISCOUNT PROGRAM"/>
										<form:option value="LEASING" label="LEASING"/>
										<form:option value="MAIN_DEALER" label="MAIN DEALER"/>
									</form:select>
                          		</td>
					  		</tr>
							<%-- <tr>
								<td align="right">Name</td>
								<td>:</td>
								<td><form:input id="name" path="name" cssClass='inputbox-medium'/></td>
							</tr> --%>
							<tr>
								<td align="right">Leasing</td>
								<td>:</td>
								<td>
									<select id='leasing' name=leasing class='combobox-medium input-disabled' disabled><option value="">--Leasing--</option></select>
									<img id='leasing-browse' hidden="true" src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Payment Leasing" />
								</td>
							</tr>
							<tr>
						  		<td align="right">Currency </td>
						  		<td>:</td>
						  		<td>
						  			<form:select path="money.currency">
										<form:options items="${currencies}" itemLabel="symbol" itemValue="id"/>
									</form:select>
									<form:select path="money.exchangeType">
										<form:options items="${exchangeTypes}"/>
									</form:select>
                          		</td>
					  		</tr>
					  		<tr>
								<td align="right">Budget</td>
								<td>:</td>
								<td><form:input id="amount" path="money.amount" size="21"/></td>
							</tr>
					  		<tr>
					  			<td align="right">Note </td>
						  		<td>:</td>
						  		<td><form:textarea path="note" rows="6" cols="45"/></td>
					  		</tr>
							</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->
	<%@include file="/common/sirius-footer.jsp" %>
</div><!-- /main containers -->

</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	$(function()
	{
		$("#unitPayment").change(function()
		{
			if($("#unitPayment").val() == 'pilih')
			{
				$("#type").attr("disabled", "true");
				$("#type").attr("class","input-disabled");
				
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('');
				
				var exist = 0;
				$("#type option[value='LEASING']").each(function() {
				    exist++;
				});
				
				if(exist == 0)
					$("<option></option>").text("LEASING").val("LEASING").appendTo("#type");
			}
			else if($("#unitPayment").val() == 'CREDIT')
			{
				$("#type").removeAttr("disabled");
				$("#type").removeAttr("class");
				
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('');
				
				var exist = 0;
				$("#type option[value='LEASING']").each(function() {
				    exist++;
				});
				
				if(exist == 0)
					$("<option></option>").text("LEASING").val("LEASING").appendTo("#type");
			}
			else
			{
				$("#type").removeAttr("disabled");
				$("#type").removeAttr("class");
				
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('');
				
				$("#type option[value='LEASING']").each(function() {
					$(this).remove();
				});
			}
		});
		
		$("#type").change(function()
		{
			if($("#type").val() == 'DISC_DEALER')
			{
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('Subsidi Beban Dealer');
			}
			else if($("#type").val() == 'DISC_PROGRAM')
			{
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('Subsidi Beban Dealer');
			}
			else if($("#type").val() == 'LEASING')
			{
				$("#leasing").removeAttr("disabled");
				$("#leasing").attr("class","combobox-medium");
				$("#leasing-browse").removeAttr("hidden");
				$("#note").val('Subsidi Bukan Beban Dealer');
			}
			else if($("#type").val() == 'MAIN_DEALER')
			{
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('Subsidi Bukan Beban Dealer');
			}
			else
			{
				$("#leasing option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
				$("#leasing").attr("disabled", "true");
				$("#leasing").attr("class","combobox-medium input-disabled");
				$("#leasing-browse").attr("hidden", "true");
				$("#note").val('');
			}
		});
	});
	
	function openLeasing(target)
	{
		var org = document.getElementById('org').value;
		if(org == '')
		{
			alert('Please select Company first !!!');
			return;
		}
		openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=leasing&organization='/>"+org);
	}
		
	function save()
	{
		if($("#dateFromId").val() == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if($("#productType").val() == '' || $("#productType").val() == null)
		{
			alert('Product Type cannot be empty !!!');
			return;
		}
		
		if($("#type").val() == 'pilih')
		{
			alert('Please select Subdiction Type first !!!');
			return;
		}
		
		if($("#type").val() == 'LEASING')
		{
			if($("#leasing").val() == '')
			{
				alert('Please select Leasing first !!!');
				return;
			}
		}
		
		if($("#amount").val() == '' || $("#amount").val() < 0)
		{
			alert("Budget cannot be empty and must be greater than zero !!!");
			return;
		} 
		
		$('.item-button-save').hide();
		document.addForm.action="<c:url value='/page/unitsalesordersubdictionadd.htm'/>";
		document.addForm.submit();
	}
</script>
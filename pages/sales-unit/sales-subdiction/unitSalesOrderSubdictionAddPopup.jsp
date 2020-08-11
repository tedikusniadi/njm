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
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					  	<div class="toolbar">
							<a class="item-button-cancel b_cancel_popup" style="cursor:pointer;"><span><spring:message code="cancel"/></span></a>
							<a class="item-button-save b_save_popup" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addFormPopup" name="addFormPopup" method="post" modelAttribute="subdiction">
			 				<table width="100%" style="border:none">
			 				<tr>
			 					<td align="right">Date From</td>
			 					<td>:</td>
			 					<td><input inputId="dateFromId" id="dateFrom" name="dateFrom" class="datepicker" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>"/></td>
			 				</tr>
			 				<tr>
                                <td align="right">Company</td>
                                <td>:</td>
                                <td>
                                    <form:select id="org-popup" path="organization" cssClass="combobox-ext">
                                        <c:if test='${not empty subdiction.organization}'>
                                            <form:option value='${subdiction.organization.id}' label='${subdiction.organization.firstName} ${subdiction.organization.middleName} ${subdiction.organization.lastName}' />
                                        </c:if>
                                    </form:select>
                                    &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org-popup')" style="CURSOR:pointer;" title="Organisasi" />
                                </td>
                            </tr>
		 					<tr>
								<td align="right">Tipe Unit</td>
								<td>:</td>
								<td>
									<select id="productType-popup" name="productType" class="combobox">
									</select>
									<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=productType-popup&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
								</td>
							</tr>
					  		<tr>
						  		<td align="right">Tipe Pembayaran</td>
						  		<td>:</td>
						  		<td>
						  			<form:select id="unitPayment-popup" path="unitPayment">
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
						  			<form:select id="type-popup" path="type" class="input-disabled" disabled="true">
						  				<option value="pilih">---PILIH---</option>
										<form:option value="DISC_DEALER" label="DISCOUNT DEALER"/>
										<form:option value="DISC_PROGRAM" label="DISCOUNT PROGRAM"/>
										<form:option value="LEASING" label="LEASING"/>
										<form:option value="MAIN_DEALER" label="MAIN DEALER"/>
									</form:select>
                          		</td>
					  		</tr>
							<tr>
								<td align="right">Leasing</td>
								<td>:</td>
								<td>
									<select id='leasing-popup' name=leasing class='combobox-medium input-disabled' disabled><option value="">--Leasing--</option></select>
									<img id='leasing-browse-popup' hidden="true" src="assets/icons/list_extensions.gif" onclick="javascript:openLeasingForPopup('leasing-popup');" style="CURSOR:pointer;" title="Payment Leasing" />
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
								<td><form:input id="amount-popup" path="money.amount" size="21"/></td>
							</tr>
					  		<tr>
					  			<td align="right">Note </td>
						  		<td>:</td>
						  		<td><form:textarea id="note-popup" path="note" rows="6" cols="45"/><input name="addingType" value="popup" hidden="true"/></td>
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
</div>
<script type="text/javascript">
	$(function()
	{
		$("#unitPayment-popup").change(function()
		{
			if($("#unitPayment-popup").val() == 'pilih')
			{
				$("#type-popup").attr("disabled", "true");
				$("#type-popup").attr("class","input-disabled");
				
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note").val('');
				
				var exist = 0;
				$("#type-popup option[value='LEASING']").each(function() {
				    exist++;
				});
				
				if(exist == 0)
					$("<option></option>").text("LEASING").val("LEASING").appendTo("#type-popup");
			}
			else if($("#unitPayment-popup").val() == 'CREDIT')
			{
				$("#type-popup").removeAttr("disabled");
				$("#type-popup").removeAttr("class");
				
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note-popup").val('');
				
				var exist = 0;
				$("#type-popup option[value='LEASING']").each(function() {
				    exist++;
				});
				
				if(exist == 0)
					$("<option></option>").text("LEASING").val("LEASING").appendTo("#type-popup");
			}
			else
			{
				$("#type-popup").removeAttr("disabled");
				$("#type-popup").removeAttr("class");
				
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note-popup").val('');
				
				$("#type-popup option[value='LEASING']").each(function() {
					$(this).remove();
				});
			}
		});
		
		$("#type-popup").change(function()
		{
			if($("#type-popup").val() == 'DISC_DEALER')
			{
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note").val('Subsidi Beban Dealer');
			}
			else if($("#type-popup").val() == 'DISC_PROGRAM')
			{
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note-popup").val('Subsidi Beban Dealer');
			}
			else if($("#type-popup").val() == 'LEASING')
			{
				$("#leasing-popup").removeAttr("disabled");
				$("#leasing-popup").attr("class","combobox-medium");
				$("#leasing-browse-popup").removeAttr("hidden");
				$("#note-popup").val('Subsidi Bukan Beban Dealer');
			}
			else if($("#type-popup").val() == 'MAIN_DEALER')
			{
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note-popup").val('Subsidi Bukan Beban Dealer');
			}
			else
			{
				$("#leasing-popup option").remove();
				$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing-popup");
				$("#leasing-popup").attr("disabled", "true");
				$("#leasing-popup").attr("class","combobox-medium input-disabled");
				$("#leasing-browse-popup").attr("hidden", "true");
				$("#note-popup").val('');
			}
		});
	});
	
	function openLeasingForPopup(target)
	{
		var org = document.getElementById('org-popup').value;
		if(org == '')
		{
			alert('Please select Company first !!!');
			return;
		}
		openpopup("<c:url value='/page/paymentleasingpopupview.htm?target=leasing-popup&organization='/>"+org);
	}
		
	function validationPopup()
	{
		if($("#dateFromId").val() == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if($("#productType-popup").val() == '' || $("#productType-popup").val() == null)
		{
			alert('Product Type cannot be empty !!!');
			return;
		}
		
		if($("#type-popup").val() == 'pilih')
		{
			alert('Please select Subdiction Type first !!!');
			return;
		}
		
		if($("#type-popup").val() == 'LEASING')
		{
			if($("#leasing-popup").val() == '')
			{
				alert('Please select Leasing first !!!');
				return;
			}
		}
		
		if($("#amount-popup").val() == '' || $("#amount-popup").val() < 0)
		{
			alert("Budget cannot be empty and must be greater than zero !!!");
			return;
		} 
		
		return true;
	}

	$(function()
	{
		//Bugs on init.jsp if included
		$(".datepicker").datepicker({
			showOn: "button",
			buttonImage: "assets/icons/calendar.png",
			buttonImageOnly:true,
			dateFormat: 'dd-mm-yy'
		});

		$('.b_cancel_popup').click(function(){
			closepopup("${param.popupid}");
		});

		$('.b_save_popup').click(function()
		{
			if(validationPopup())
			{
				$.ajax({
					url:"<c:url value='/page/unitsalesordersubdictionadd.htm'/>",
					data:$('#addFormPopup').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								if(self.opener.flagPayment)
								{
									self.opener.flagPayment("${param.type}");
								}
								closepopup("${param.popupid}");
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
</script>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
							<a class="item-button-cancel b_cancel_customer_instant_popup" style="cursor:pointer;"><span><spring:message code="cancel"/></span></a>
							<a class="item-button-save b_save_customer_instant_popup" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="formCustomer" name="formCustomer" method="post" modelAttribute="customer_add">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Name Pelanggan</td>
                                    <td width="1%" align="center">:</td>
									<td width="64%">
										<form:input cssClass='check_field' id='firstName' path="firstName" size='15'/>
										<form:input cssClass='check_field' id='middleName' path="middleName" size='15'/>
										<form:input cssClass='check_field' id='lastName' path="lastName" size='15'/>
										<input id="partyType" name="type" type="hidden" value="personal"/>
										<input id="instant" name="instant" type="hidden" value="true"/>
									</td>
									<td width="1%"><form:errors path="firstName"/></td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Gender</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="genderMan" name="gender" type='radio' value='MALE' checked/>Laki-laki&nbsp;<input id="genderWoman" name="gender" type='radio' value='FEMALE'/>Perempuan</td>
	 							  	<td></td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Alamat</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="address" name="postalAddresses[0].address" size="58"/></td>
	 							  	<td></td>
	 							</tr>
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
<script type="text/javascript">

	function validationInstantPopup()
	{
		if($("#firstName").val() == '')
		{
			alert('First Name cannot be empty !!!');
			return;
		}
	
		return true;
	}
	
	$(function()
	{
		$('.b_cancel_customer_instant_popup').click(function(){
			closepopup("${param.popupid}");
		});
		
		$('.b_save_customer_instant_popup').click(function()
		{
			if(validationInstantPopup())
			{
				$.ajax({
					url:"<c:url value='/page/customerinstantadd.htm'/>",
					data:$('#formCustomer').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Customer data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
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
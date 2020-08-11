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
							<a class="item-button-list" href="<c:url value='/page/unitsalespaymentprogramview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
						</div>					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="paymentProgram_edit">
								<table width="100%" border="0">
								<tr>&nbsp;</tr>
								<tr>
									<td width="27%" align="right">Organization :</td>
									<td width="73%">
										<select id="org" name="organization" class="combobox-ext">
											<c:if test="${not empty paymentProgram_edit.organization}">
												<option value="${paymentProgram_edit.organization.id}">${paymentProgram_edit.organization.code} ${paymentProgram_edit.organization.name}</option>
											</c:if>
										</select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Program Name :</td>
									<td><input id="programName" name="name" value="${paymentProgram_edit.name}" size='30'/></td>
								</tr>
 								<tr>
 									<td align="right">Customer Type Unit</td>
							  		<td>
			  					  		<form:select id="programType" path="programType" class="combobox-medium">
		  					  				<form:option value="SPAREPART" label='SPAREPART'/>
		  					  				<form:option value="SERVICE" label='SERVICE'/>
										</form:select>
									</td>
 								</tr>
 								<tr>
 									<td align="right">Payment Type</td>
							  		<td>
			  					  		<form:select id="methodType" path="methodType" class="combobox-medium">
		  					  				<form:option value="CASH" label='CASH'/>
		  					  				<form:option value="CREDIT" label='CREDIT'/>
		  					  				<form:option value="NON_PAYABLE" label='NON PAYABLE'/>
										</form:select>
									</td>
 								</tr>
                                <tr>
                                    <td align="right">Bank/Cash Account : </td>
                                    <td>
                                        <form:select id='account' path='bankAccount' cssClass='combobox-ext'>
                                        	<c:if test="${not empty paymentProgram_edit.bankAccount}">
                                        		<form:option value="${paymentProgram_edit.bankAccount.id}" label="${paymentProgram_edit.bankAccount.accountName}"/>
                                        	</c:if>
                                        </form:select>
                                        <img id="browseAccount" src="assets/icons/list_extensions.gif" onclick="openaccount();" style="CURSOR:pointer;" title="Bank Account" />
                                    </td>
                                </tr>
 								<tr>
 									<td nowrap="nowrap" align="right">Status Aktif :</td>
									<td>
										<form:radiobutton path='active' id="activeYes" value='true' label='Yes'/>
		                                <form:radiobutton path='active' id="activeNo" value='false' label='No'/>
									</td>
								</tr>
								<tr>
									<td align="right">Note :</td>
									<td><form:textarea path='note' cols='55' rows='6'/></td>
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
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Unit Sales Payment Program',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if($("#org").val() == null || $("#org").val() == '')
		{
			alert('Please select Organization first !!!');
			return;
		}
		
		if($("#programName").val() == '')
		{
			alert('Program Name cannot be empty !!!');
			return;
		}
		
		$.ajax({
			url:"<c:url value='/page/unitsalespaymentprogramedit.htm'/>",
			data:$('#editForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Payment Program data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/unitsalespaymentprogramview.htm?'/>";
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason:<br/>'+json.message);
					}
				}
			}
		});
	});
});

function openaccount()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Organization first!');
		return;
	}

	var methodType = document.getElementById('methodType');
	var method = 'CASH';
	
	if(methodType.value != 'CASH')
		method = 'BANK';
	
	openpopup("<c:url value='/page/popupbankaccountview.htm?target=account&organization='/>"+org.value+"&type="+method);
}
</script>

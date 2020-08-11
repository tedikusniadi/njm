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
	<%@ include file="/common/sirius-header.jsp" %>
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
							<a class="item-button-list" href="<c:url value='/page/shiftmanagementview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="shiftManagement_add">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="606">
											<table width="100%" style="border:none">
												<tr>
													<td width="23%" align="right">Shift No :</td>
													<td width="73%"><input type="text" name="code" id="code" value="Auto Generated" disabled class='input-disabled' size='25'/></td>
												</tr>
												<tr>
													<td align="right">Facility :</td>
													<td>
														<select id="companyFacility" name="companyFacility" class="combobox-ext">
															<c:if test="${not empty shiftManagement_add.organization}">
																<option value="${shiftManagement_add.organization.id}">${shiftManagement_add.organization.name}</option>
															</c:if>
														</select>
													</td>
												</tr>
												<tr>
													<td align="right">Date :</td>
													<td><input type="text" name="shiftDate" id="shiftDate" inputId="shiftDateId" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveformat="dd-MM-yyyy" value="" lang="en-us"/></td>
												</tr>
												<tr>
													<td align="right">Counter ID :</td>
													<td>
														<select id="counterRegister" name="counterRegister" class="combobox-ext">
															<option value="">-- Counter Register --</option>
															<c:forEach items="${counterRegisters}" var="counter">
																<option value="${counter.id}">${counter.code}</option>
															</c:forEach>
														</select>
													</td>
												</tr>
												<c:if test="${empty shiftManagement_add.cashierPerson}">
													<tr>
														<td align="right">Petugas Kasir :</td>
														<td>
															<select id="cashier" name="cashierPerson" class="combobox" style="WIDTH:230px;">
															</select>
															<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupusercashier.htm?target=cashier'/>');" style="CURSOR:pointer;" title="Cari Kasir" />
														</td>
													</tr>
												</c:if>
												<tr>
													<td align="right">Jam Mulai :</td>
													<td><input type="text" name="shiftStart" id="shiftStart" inputId="shiftStartId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
												</tr>
												<tr>
													<td align="right">Saldo Awal Kasir :</td>
													<td><input type="text" name="fundStart" id="fundStart" value="0" class="inputbox" style="WIDTH:100px;" onkeyup="separator('fundStart');"/></td>
												</tr>
												<tr>
												  	<td align="right">Keterangan :</td>
												  	<td><textarea rows="7" cols="41" id="note" name="note"></textarea></td>
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
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Shift Management',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.b_save').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/shiftmanagementadd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Shift Management data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/shiftmanagementview.htm?'/>";
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
		var org = document.getElementById('companyFacility');
		if(org.value == '')
		{
			alert('Please select Company Facility first!');
			return;
		}

		var date = document.getElementById('shiftDateId').value;
		if(date == '' || date == null)
		{
			alert("Date cannot be empty !!!");
			return;
		}

		var shift = document.getElementById('shiftStartId').value;
		if(shift == '' || shift == null)
		{
			alert("Shift Start cannot be empty !!!");
			return;
		}
		
		var counter = document.getElementById('counterRegister');
		if(counter.value == '')
		{
			alert('Please select Counter Register first!');
			return;
		}
		
		var amount = document.getElementById('fundStart').value;
		if(amount == '' || new Number(amount.replace(/,/g,'')) < 0)
		{
			alert('Starting Amount cannot be empty !!!');
			return;
		}
		
		return true;
	}
		
	function separator(id)
	{
		var amount = document.getElementById(id);
	
		if (amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g, ''))).numberFormat('#,###');
		}
	}
</script>

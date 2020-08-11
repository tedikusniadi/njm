<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
	<%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
		@import url("<c:url value='/assets/sirius.css'/>");
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
						<div class="toolbar"><a class="item-button-list" href="<c:url value='/page/shiftmanagementview.htm'/>"><span>List</span></a>
							<!-- <a class="item-button-save" href="javascript:update();"><span>Save</span></a> -->
							<c:if test="${shiftManagement_edit.status == 'OPEN'}">
								<a class="item-button-close b_close" style="cursor:pointer;"><span>Closing</span></a>
							</c:if>
							<c:if test="${shiftManagement_edit.status == 'CLOSED'}">
								<a class="item-button-print" href="<c:url value='/page/shiftmanagementprint.htm?id=${shiftManagement_edit.id}'/>"><span>Print</span></a>
							</c:if>
						</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="shiftManagement_edit">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="600">
										<table width="100%" style="border: none">
											<tr>
												<td width="23%" align="right">Shift ID :</td>
												<td width="73%">
													<input type="hidden" name="id" id="id" value="<c:out value='${shiftManagement_edit.id}' />" />
													<input type="hidden" name="status" id="status" value="<c:out value='${shiftManagement_edit.status}' />" />
													<input type="text" name="code" id="code" value="<c:out value='${shiftManagement_edit.code}' />" class="inputbox-disabled" readonly="true"/>
												</td>
											</tr>
											<c:if test="${activerole.id=='20'}">
											<tr>
												<td align="right">Petugas Kasir :&nbsp;&nbsp;</td>
												<td><input type="text" disabled class="input-disabeld" value="${shiftManagement_edit.cashierPerson.name}"/></td>
											</tr>
											</c:if>
											<tr>
												<td align="right">Tanggal :</td>
												<td>
													<input type="hidden" name="shiftDate" id="shiftDate" value="<fmt:formatDate value='${shiftManagement_edit.shiftDate}' pattern='dd-MM-yyyy' />" />
													<input type="text" name="shiftDateCom" id="shiftDateCom" dojotype="dropdowndatepicker" class="inputbox-disabled" displayformat="dd-MM-yyyy" saveformat="dd-MM-yyyy" value="<fmt:formatDate value='${shiftManagement_edit.shiftDate}' pattern='yyyy-MM-dd' />" lang="en" containerToggle="explode" containerToggleDuration="300" disabled />
												</td>
											</tr>
											<tr>
												<td align="right">Kantor :</td>
												<td>
													<select id="companyFacilityComb"name="companyFacility" class="combobox inputbox-disabled" style="WIDTH: 230px;" disabled>
														<option value="${shiftManagement_edit.organization.id}">${shiftManagement_edit.organization.name}</option>
													</select>
												</td>
											</tr>
											<tr>
												<td align="right">Kode Counter :</td>
												<td>
													<select id="counterRegistryComb" name="counterRegister" class="combobox inputbox-disabled" style="WIDTH: 230px;" disabled>
														<option value="${shiftManagement_edit.counterRegister.id}">${shiftManagement_edit.counterRegister.code}</option>
													</select>
												</td>
											</tr>
											<tr>
												<td align="right">Mulai Shift :</td>
												<td><input type="text" name="shiftStart" inputId="shiftStartComInput" id="shiftStart" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="${shiftManagement_edit.shiftStart}" lang="en" containerToggle="explode" containerToggleDuration="300" disabled classNames="inputbox-disabled"/></td>
											</tr>
											<tr>
												<td align="right">Saldo Kas Awal :</td>
												<td>
													<input type="hidden" id="fundStart" name="fundStart" value="<fmt:formatNumber value='${shiftManagement_edit.fundStart}' pattern='####' />" />
													<input type="text" name="fundStartCom" id="fundStartCom" class="inputbox-disabled" value="<fmt:formatNumber value='${shiftManagement_edit.fundStart}' pattern='#,###' />" style="WIDTH: 100px;" disabled />
												</td>
											</tr>
											<tr>
												<td align="right">Catatan :</td>
												<td><textarea rows="3" cols="35" id="note" name="note" class="inputbox"><c:out value='${shiftManagement_edit.note}' /></textarea></td>
											</tr>
											<tr>
												<td align="right">&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</table>
										</td>
										<td width="377" align="left" valign="top">
											<fieldset><legend><strong>Informasi Tutup Shift</strong></legend>
											<table width="100%">
												<tr>
													<td align="right" width="50%">Shift End :</td>
													<td width="50%">
														<c:if test="${shiftManagement_edit.status=='CLOSED'}">
															<input type="text" name="shiftEnd" id="shiftEnd" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<c:out value='${shiftManagement_edit.shiftEnd}' />" lang="en" containerToggle="explode" containerToggleDuration="300" 	<c:if test="${shiftManagement_edit.status=='CLOSED'}">disabled</c:if>/>
														</c:if>
														<c:if test="${shiftManagement_edit.status!='CLOSED'}">
															<input type="text" name="shiftEnd" id="shiftEnd" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en" containerToggle="explode" containerToggleDuration="300"/>
														</c:if>
													</td>
												</tr>
												<tr>
													<td align="right">Saldo Kas Akhir :</td>
													<td>
														<input type="text" name="fundEnd" id="fundEnd" style="WIDTH: 100px;" value="<fmt:formatNumber value='${shiftManagement_edit.fundEnd}' pattern='####' />" onkeyup="separator('fundEnd');" onchange="calculate();" class="${shiftManagement_edit.status=='CLOSED'?'inputbox-disabled':'inputbox'}" <c:if test="${shiftManagement_edit.status=='CLOSED'}">disabled </c:if> />
													</td>
												</tr>
												<tr>
													<td align="right">Perhitungan Kas oleh System :</td>
													<td><input value="<fmt:formatNumber value='${shiftManagement_edit.realCalculateFund}' pattern='#,###' />"  readonly="true" type="text" id="realCalculateFund" class="${shiftManagement_edit.status=='CLOSED'?'inputbox-disabled':'inputbox'}" style="WIDTH: 100px;"/></td>
												</tr>
												<tr>
													<td align="right">Perhitungan KPB oleh System :</td>
													<td><input value="<fmt:formatNumber value='${shiftManagement_edit.realCalculateKPB}' pattern='#,###' />"  readonly="true" type="text" id="realCalculateKPB" class="${shiftManagement_edit.status=='CLOSED'?'inputbox-disabled':'inputbox'}" style="WIDTH: 100px;"/></td>
												</tr>
												<tr>
													<td align="right">Perhitungan Klaim oleh System :</td>
													<td><input value="<fmt:formatNumber value='${shiftManagement_edit.realCalculateClaim}' pattern='#,###' />"  readonly="true" type="text" id="realCalculateClaim" class="${shiftManagement_edit.status=='CLOSED'?'inputbox-disabled':'inputbox'}" style="WIDTH: 100px;"/></td>
												</tr>
												<tr>
													<td align="right">Perhitungan AR oleh System :</td>
													<td><input value="<fmt:formatNumber value='${shiftManagement_edit.realCalculateAR}' pattern='#,###' />"  readonly="true" type="text" id="realCalculateAR" class="${shiftManagement_edit.status=='CLOSED'?'inputbox-disabled':'inputbox'}" style="WIDTH: 100px;"/></td>
												</tr>
												<tr>
													<td align="right">Selisih :</td>
													<td>
														<c:if test="${shiftManagement_edit.status=='CLOSED'}">
															<input type="text" id="discrepancy" class="inputbox-disabled" style="WIDTH: 100px;" value="<fmt:formatNumber value='${shiftManagement_edit.discrepancy}' pattern=",##0.00"/>" readonly="true" />
														</c:if>
														<c:if test="${shiftManagement_edit.status=='OPEN'}">
															<input type="text" id="discrepancy" class="inputbox-disabled" style="WIDTH: 100px;" value="0" readonly="true" />
														</c:if>
													</td>
												</tr>
											</table>
											</fieldset>
											<fieldset>
                                               	<legend><strong>Journal Reference</strong></legend>
                                                   <table style="border:none" width="100%">
													<tr>
                                                       <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
													<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${shiftManagement_edit.journalEntry.id}'/>">${shiftManagement_edit.journalEntry.code}</td>
                                                     </tr>
                                                   </table>
                                               </fieldset>
										</td>
									</tr>
								</table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${shiftManagement_edit.createdBy.firstName} ${shiftManagement_edit.createdBy.middleName} ${shiftManagement_edit.createdBy.lastName}'/> (<fmt:formatDate value='${shiftManagement_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${shiftManagement_edit.updatedBy.firstName} ${shiftManagement_edit.updatedBy.middleName} ${shiftManagement_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${shiftManagement_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	function calculate()
	{
		var realCalculateFund = document.getElementById("realCalculateFund");
		var fundEnd = document.getElementById("fundEnd");
		var discrepancy = document.getElementById("discrepancy");

		discrepancy.value = parseFloat(fundEnd.value.replace(/,/g, '')) - parseFloat(realCalculateFund.value.replace(/,/g, ''));
		discrepancy.value = new Number(discrepancy.value).numberFormat("#,###");
	}
	
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Shift Management',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.b_close').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/shiftmanagementclose.htm'/>",
					data:$('#editForm').serialize(),
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
		var fundEnd = document.getElementById("fundEnd");
		if (fundEnd.value == "0")
		{
			alert("Silahkan masukan Saldo Kas Akhir");
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
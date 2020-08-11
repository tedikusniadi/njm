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
                            <a class="item-button-list" href="<c:url value='/page/extcashoutview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                        </div>
                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='cash_out'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${cash_out.code}" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Facility : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext input-disabled" disabled='true'>
                                                    <c:if test='${not empty cash_out.organization}'>
                                                        <form:option value='${cash_out.organization.id}' label='${cash_out.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${cash_out.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tgl Pendapatan :</td>
                                            <td><input id="cashOutDate" name="realDate" inputId="inputCashOutDate" value="<fmt:formatDate value='${cash_out.realDate}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
			 								<td nowrap="nowrap" align="right">Cash/Bank :</td>
											<td>
												<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext input-disabled" disabled="true">
                                                    <c:if test='${not empty cash_out.bankAccount}'>
                                                        <form:option value='${cash_out.bankAccount.id}' label='${cash_out.bankAccount.bankName}' />
                                                    </c:if>
                                                </form:select>
											</td>
			 							</tr>
                                        <tr>
                                            <td align="right">Amount :</td>
                                            <td><input class='input-disabled' value="<fmt:formatNumber value='${cash_out.amount}' pattern=',##0.00'/>" disabled size='15'/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency' disabled='true' class="input-disabled">
                                                    <form:option value='${cash_out.currency.id}' label='${cash_out.currency.symbol}'/>
                                                </form:select>
                                                Rate : <input class='input-disabled' value="<fmt:formatNumber value='${cash_out.exchange.rate}' pattern=',##0.00'/>" disabled size='10'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          	<td><form:textarea path='note' cols='45' rows='6' value='${cash_out.note}'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                    		<legend>Referensi</legend>
                                    			<a href="<c:url value='/page/journalentrypreview.htm?id=${cash_out.journalEntry.id}'/>">${cash_out.journalEntry.code}</a>&nbsp;&nbsp;&nbsp;
                                    	</fieldset>
                                    </td>
                                </tr>
                                </table>
                                <br/>
							</form:form>
						</div>
						<div class="info">Created by : ${cash_out.createdBy.firstName} ${cash_out.createdBy.middleName} ${cash_out.createdBy.lastName} (<fmt:formatDate value='${cash_out.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${cash_out.updatedBy.firstName} ${cash_out.updatedBy.middleName} ${cash_out.updatedBy.lastName} (<fmt:formatDate value='${cash_out.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'EXT CASH OUT',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(document.getElementById('inputCashOutDate').value == '')
		{
			alert('Cash Out Date cannot be empty !!!');
			return;
		}
		
		$.ajax({
			url:"<c:url value='/page/extcashoutedit.htm'/>",
			data:$('#editForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Ext Cash Out data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/extcashoutview.htm'/>";
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
</script>

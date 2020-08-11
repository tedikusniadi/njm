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
                            <a class="item-button-list" href="<c:url value='/page/additionalcashview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                        </div>

                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='additional_cash'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${additional_cash.code}" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Facility : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty additional_cash.organization}'>
                                                        <form:option value='${additional_cash.organization.id}' label='${additional_cash.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                          </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${additional_cash.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Amount :</td>
                                            <td><input class='input-disabled' value="<fmt:formatNumber value='${additional_cash.amount}' pattern=',##0.00'/>" disabled size='15'/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Currency : </td>
                              				<td>
                                                <form:select id='currency' path='currency' disabled='true'>
                                                    <form:option value='${additional_cash.currency.id}' label='${additional_cash.currency.symbol}'/>
                                                </form:select>
                                                &nbsp;&nbsp;
                                                Rate : <input class='input-disabled' value="<fmt:formatNumber value='${additional_cash.exchange.rate}' pattern=',##0.00'/>" disabled size='10'/>
                                          	</td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          	<td><form:textarea path='note' cols='45' rows='6' value='${additional_cash.note}'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td valign="top">
                                    	<fieldset>
                                    		<legend>Referensi</legend>
                                    			<a href="<c:url value='/page/journalentrypreview.htm?id=${additional_cash.journalEntry.id}'/>">${additional_cash.journalEntry.code}</a>&nbsp;&nbsp;&nbsp;
                                    	</fieldset>
                                    </td>
                                </tr>
                                </table>
                                <br/>
							</form:form>
						</div>
						<div class="info">Created by : ${additional_cash.createdBy.firstName} ${additional_cash.createdBy.middleName} ${additional_cash.createdBy.lastName} (<fmt:formatDate value='${additional_cash.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${additional_cash.updatedBy.firstName} ${additional_cash.updatedBy.middleName} ${additional_cash.updatedBy.lastName} (<fmt:formatDate value='${additional_cash.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'PENAMBAHAN KAS',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/additionalcashedit.htm'/>",
			data:$('#editForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Additional Cash data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/additionalcashview.htm?'/>";
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

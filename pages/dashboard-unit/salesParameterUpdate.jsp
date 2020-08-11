<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
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
							<a class="item-button-list" href="<c:url value='/page/salesparameterview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
	                            <a class="item-button-save b_save"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="salesParameter_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID : </td>
                                          	<td width="73%"><input id="soCode" value="${salesParameter_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                            	<select id="org" class="combobox-ext input-disabled">
                                            		<option value='${salesParameter_edit.organization.id}'>${salesParameter_edit.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Periode Follow Up :</td>
		                                    <td>
		                                    	<input style="text-transform: uppercase;" value="<fmt:formatDate value='${salesParameter_edit.periode}' pattern='MMMM'/>" disabled class='input-disabled'/>
		                                    	<input value="<fmt:formatDate value='${salesParameter_edit.periode}' pattern='yyyy'/>" disabled class='input-disabled'/>
		                                    </td>
		                                </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Target Unit :</td>
		                                    <td>
		                                    	<input value="<fmt:formatNumber value='${salesParameter_edit.targetUnit}' pattern='#,###'/>" disabled class='input-disabled'/>
		                                    </td>
		                                </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Target MS (%) :</td>
		                                    <td>
		                                    	<input value="<fmt:formatNumber value='${salesParameter_edit.targetMS}' pattern='#,###'/>" disabled class='input-disabled'/>
		                                    </td>
		                                </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table><br/>
	                            <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
	                            <thead>
	                            <tr>
	                                <th width="1%" style="width: 10px">&nbsp;</th>
	                                <th width="10%">Date</th>
	                                <th width="90%">Pengajuan Faktur</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${salesParameter_edit.dayDetails}' var='item' varStatus='status'>
	                            <tr>
	                            	<td>&nbsp;</td>
	                                <td><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
	                                <td><form:input id='invoice[${status.index}]' path='dayDetails[${status.index}].invoice' size='10' onkeyup="separator('invoice[${status.index}]');"/></td>
	                            </tr>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot><tr class="end-table"><td colspan="8">&nbsp;</td></tr></tfoot>
	                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${salesParameter_edit.createdBy.firstName} ${salesParameter_edit.createdBy.middleName} ${salesParameter_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesParameter_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesParameter_edit.updatedBy.firstName} ${salesParameter_edit.updatedBy.middleName} ${salesParameter_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesParameter_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sales Parameter',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/salesparameteredit.htm'/>",
			data:$('#editForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Sales Parameter data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/salesparameterview.htm'/>";
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

function separator(id)
{
	var amount = document.getElementById(id);

	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
	}
}
</script>
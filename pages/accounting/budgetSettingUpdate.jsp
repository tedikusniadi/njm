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
							<a class="item-button-list" href="<c:url value='/page/budgetsettingview.htm'/>"><span>List</span></a>
							<!-- <a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a> -->
							<a class="item-button-copy" href="<c:url value='/page/budgetsettingpreaddcopy.htm?id=${budget_edit.id}'/>"><span>Copy</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="budget_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="20%" nowrap="nowrap" align="right">ID :</td>
								  			<td width="80%"><input value="${budget_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Organization :</td>
		                                    <td>
                                            	<select id="org" class="combobox-ext">
                                            		<option value='${budget_edit.organization.id}'>${budget_edit.organization.name}</option>
                                                </select>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Period :</td>
		                                    <td>
                                            	<select id="org" class="combobox-ext">
                                            		<option value='${budget_edit.accountingPeriod.id}'>${budget_edit.accountingPeriod.name}</option>
                                                </select>
		                                    </td>
		                                </tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Budget Type :</td>
			 							  	<td><input value="${budget_edit.budgetType}" disabled class='input-disabled' size='25'/></td>
			 							  	<td></td>
			 							</tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Department :</td>
		                                    <td>
                                            	<select id="org" class="combobox-ext">
                                            		<option value='${bugdet_edit.department.id}'>${budget_edit.department.name}</option>
                                                </select>
		                                    </td>
		                                </tr>
		                                <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><textarea name="note" cols="55" rows="7" disabled class="input-disabled">${budget_edit.note}</textarea></td>
                                        </tr>
                                      	</table>
                                  	</td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                            <thead>
	                            <tr>
	                              	<th width="1%">&nbsp;</th>
	                                <th width="25%">Account</th>
	                                <th width="14%">Account Group</th>
	                                <th width="60%">Amount</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${budget_edit.details}' var='detail'>
	                            <tr>
	                            	<td>&nbsp;</td>
	                                <td><c:out value='${detail.glAccount.name}'/></td>
	                                <td><c:out value='${detail.glAccount.parent.name}'/></td>
	                                <td><fmt:formatNumber value='${detail.amount}' pattern=',##0.00'/></td>
	                            </tr>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
	                            </tfoot>
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
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Budget Setting',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		$.ajax({
			url:"<c:url value='/page/budgetsettingedit.htm'/>",
			data:$('#addForm').serialize(),
			type : 'POST',
			dataType : 'json',
			beforeSend:function()
			{
				$dialog.empty();
				$dialog.html('Saving Budget Setting data......');
				$dialog.dialog('open');
			},
			success : function(json)
			{
				if(json)
				{
					if(json.status == 'OK')
					{
						$dialog.dialog('close');
						window.location="<c:url value='/page/budgetsettingview.htm'/>";
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
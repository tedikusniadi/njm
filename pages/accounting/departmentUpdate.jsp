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
							<a class="item-button-list" href="<c:url value='/page/departmentview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="department_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                       	  	<td width="73%"><input id="code" name="code" value="${department_edit.code}" size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Department Name :</td>
                                       	  	<td><input id="name" name="name" value="${department_edit.name}" size='76'/></td>
                                        </tr>
		                                <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea cols="55" rows="5" path='note' size='50'/></td>
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

function validation()
{
	if($("#code").val() == '')
	{
		alert('ID/Kode Department tidak boleh kosong !!!');
		return;
	}
	
	if($("#name").val() == '')
	{
		alert('Nama Department tidak boleh kosong !!!');
		return;
	}
	
	return true;
}

$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Department',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/departmentedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Department data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/departmentview.htm'/>";
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
</script>
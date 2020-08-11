<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>
<%@ include file="/common/tld-spring.jsp"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
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
							<a class="item-button-list" href="<c:url value='/page/sendmailaddressview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="mailAddress_add">
 								<table style="border:none" width="100%">
                                <tr>
 									<td align="right">Mail Address Name :</td>
									<td><form:input id="addressName" path="addressName" cssClass="inputbox"/></td>
									<td><form:errors path="mailTo"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Mail To :</td>
									<td><form:input id="mailTo" path="mailTo" size="100"/></td>
									<td><form:errors path="mailTo"/></td>
	 							</tr>
                                <tr>
 									<td align="right">&nbsp;</td>
									<td>Use commas (,) to separate multiple Mail Address</td>
									<td></td>
	 							</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext">
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
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
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
</html>
<script type="text/javascript">
$(function(){
	$('.item-button-save').click(function()
	{
		if(validation())
		{
			var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Mail Address',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
			var xhr = new XMLHttpRequest();
			xhr.open('POST', "<c:url value='/page/sendmailaddressadd.htm'/>");
			xhr.responseType = 'json';
			
			if(xhr.readyState == 1)
			{
				$dialog.empty();
				$dialog.html('Saving Mail Address Data....');
				$dialog.dialog('open');
			}
			
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4)
				{
					var json = xhr.response;
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/sendmailaddresspreedit.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			};
			
			xhr.send(new FormData($('#addForm')[0]));
		}
	});
});

function validation()
{
	if(!$('#addressName').val())
	{
		alert('Mail Address Name cannot be empty !!!');
		return;
	}
	
	if(!$('#mailTo').val())
	{
		alert('Mail To cannot be empty !!!');
		return;
	}
	
	if(!$('#org').val())
	{
		alert('Please select Organization first !!!');
		return;
	}
	
	return true;
}
</script>
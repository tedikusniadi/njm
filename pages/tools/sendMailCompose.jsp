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
							<a class="item-button-list" href="<c:url value='/page/sendmailview.htm'/>"><span>List</span></a>
							<a class="item-button-doc" style="cursor:pointer;"><span>Send</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="mail_add" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
                                <tr>
 									<td align="right">Mail To :</td>
									<td><form:input id="mailTo" path="mailTo" cssClass="inputbox"/></td>
									<td><form:errors path="mailTo"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Subject :</td>
									<td><form:input id="subject" path="subject" cssClass="inputbox"/></td>
									<td><form:errors path="subject"/></td>
	 							</tr>
                                <tr>
 									<td align="right">Attachment File :</td>
									<td><input type="file" name="file"/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
 									<td align="right">Content :</td>
									<td><form:textarea id="content" path="content" rows="10" cols="80"/></td>
									<td>&nbsp;</td>
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
	$('.item-button-doc').click(function()
	{
		if(validation())
		{
			var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Send Mail',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
			var xhr = new XMLHttpRequest();
			xhr.open('POST', "<c:url value='/page/sendmailsend.htm'/>");
			xhr.responseType = 'json';
			
			if(xhr.readyState == 1)
			{
				$dialog.empty();
				$dialog.html('Sending mail....');
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
							window.location="<c:url value='/page/sendmailview.htm'/>";
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
	if(!$('#mailTo').val())
	{
		alert('Mail To cannot be empty !!!');
		return;
	}
	
	if(!$('#subject').val())
	{
		alert('Subject cannot be empty !!!');
		return;
	}
	
	if(!$('#content').val())
	{
		alert('Content cannot be empty !!!');
		return;
	}
	
	return true;
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Configuration Assistance</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<%@ include file="/common/sirius-header.jsp"%>
	<%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function displayContent(url)
		{
			var listPane = dojo.widget.getWidgetById("listPane");
			listPane.setUrl(url);
		}

		function redirectTo(url)
		{
			window.location = url;
		}
		
		function opensupplier()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
		}
	</script>
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
			<td width="60%">Tool > Configuration </td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<div dojoType="SplitContainer" widgetId="split" style="width: 100%; height: 430px;" orientation="horizontal" sizerWidth="5" activeSizing="0"	layoutAlign="client">
							<div widgetId="treePane" dojoType="Tree" toggle="wipe" toggleDuration="500" sizeMin="20" sizeShare="3" >
								<div dojoType="TreeNode" title="Configuration Assistance" expandLevel="2" onTitleClick='redirectTo("page/configurationassistancepreedit.htm");' childIconSrc="assets/icons/configuration-assistance.gif">
    								<div id="entryconfig" dojoType="TreeNode" onTitleClick='displayContent("page/configurationassistancejournalentryconfig.htm");' title="Journal Entry Configuration" childIconSrc="assets/icons/configuration-assistance-child.gif"></div>
									<div id="displayconfig" dojoType="TreeNode" onTitleClick='displayContent("page/configurationassistancedisplayconfig.htm");' title="Display Configuration" childIconSrc="assets/icons/configuration-assistance-child.gif"></div>
                                    <div id="displayconfig" dojoType="TreeNode" onTitleClick='displayContent("page/configurationassistanceprocurementconfig.htm");' title="Procurement Configuration" childIconSrc="assets/icons/configuration-assistance-child.gif"></div>
								</div>
							</div>
							<div id="listPane" dojoType="ContentPane" style="padding: 5px; width:100% ; height:430px;" refreshOnShow="true" doLayout="true" overFlow="true">
								<div class="main-box" style="height: 370px;">
									<strong><font color="#00FF00">Application Configuration Assistance.</font></strong>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
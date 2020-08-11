<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Change Password</title>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript" src="js/webtoolkit.base64.js"></script>
	<script type="text/javascript">
		function change()
		{
			var old = document.getElementById('old');
			var typed = document.getElementById('typed');
			var retyped = document.getElementById('retyped');
			
			if(old.value == "" || typed.value == "" || retyped.value == '')
			{
				alert("Old/New/Re-New Password cannot be empty!");
				return;
			}
			
			if(typed.value != retyped.value)
			{
				alert("New password and Re-New Password not equals!");
				return;
			}
			
			/* old.value = Base64.encode(old.value);
			typed.value = Base64.encode(typed.value);
			retyped.value = Base64.encode(retyped.value); */
			
			document.editForm.action = "<c:url value='/page/usereditpassword.htm'/>";
			document.editForm.submit();
		}
	</script>
</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	<%@ include file="/common/sirius-header.jsp"%>
<!-- /top menu -->

<!-- rounded -->
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<!-- /rounded -->

<!-- main containers -->
<div id="se-containers">
	<!-- main menu -->
		<%@ include file="/common/sirius-menu.jsp"%>
	<!-- /main menu -->
	
	<!-- tips & page navigator -->
	<div id="se-navigator">
	
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td width="60%">
		Tools > Change Password
		</td>
		<td width="40%" align="right">
			<%@ include file="/common/welcome.jsp"%>
		</td>
	</tr>
</table>

	
	</div>
	<!-- /tips & page navigator -->
	
	<!-- rounded -->
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">T20 - Change Password</h1>
						
					  	<div class="toolbar">
							<a class="item-button-save" href="javascript:change();"><span>Save</span></a>
					  	</div>
						<div class="main-box">
							<form name="editForm" method="post">
							<table style="border:none" width="100%">
							<tr>
								<td width="174" style="WIDTH:170px;"><div align="right">Old Password</div></td>
								<td>:</td>
								<td width="240"><input id="old" size="40" name="old" type="password" class="inputbox" /></td>
			    			</tr>	
							<tr>
								<td><div align="right">New Password</div></td>
								<td width="5">:</td>
								<td><input id="typed"  size="40" name="typed" type="password" class="inputbox" /></td>							
							</tr>
							<tr>
								<td><div align="right">Re-Type Password</div></td>
								<td width="5">:</td>
								<td><input id="retyped"  size="40" name="retyped" type="password" class="inputbox" />
							</tr>
							</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
	<%@include file="/common/sirius-footer.jsp" %>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

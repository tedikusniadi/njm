<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
	<head>
		<title>News Update Panel</title>
			<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
			<%@ include file="/common/sirius-header.jsp"%>
			<script type="text/javascript" src="assets/main.js"></script>

			<script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce_src.js"></script>
			<script type="text/javascript">
			tinyMCE.init({
				mode : "textareas",
				theme : "advanced",
				editor_selector : "mceEditor",		
				theme_advanced_buttons1 : "bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright, justifyfull,bullist,numlist,undo,redo,link,unlink",
				theme_advanced_buttons2 : "",
				theme_advanced_buttons3 : "",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "center",		
				extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]"
			});
			</script>	

			<script type="text/javascript">
			function save()
			{
				document.expeditionAddForm.action = "<c:url value='/page/newsUpdate.htm?id=${news.id}'/>";
				document.expeditionAddForm.submit();
			}
		</script>		
			
			
	</head>
<!-- BEGIN OF BODY -->
<body>

<!-- top  menu -->
	
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
			<td width="60%">Tools > News > Update</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">T40 - News </h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/newsView.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<div class="area" dojoType="Container" id="quick_link_container">
								<form class="edit-form" id="expeditionAddForm" name="expeditionAddForm" method="post">
 								<table width="100%" style="border:none">
								<tr>
									<td width="12%"><div class="form-label">Date :</div></td>
									<td width="50%"><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${news.date}' pattern='dd-MM-yyyy'/>"/></td>		
	    							<td width="38%" align="left"><div class="error" id="exId-error">&nbsp;</div></td>
								</tr>	
								<tr>
									<td><div class="form-label">Title :</div></td>
									<td><div class="form-value"><input name="title" id="title" class="inputbox" size="60" value="${news.title}" /></div></td>			
	    							<td><div class="error" id="name-error">&nbsp;</div></td>
								</tr>
								<tr>
									<td><div class="form-label">Content :</div></td>
									<td colspan="2">
										<div style="border: 1px solid black; width:450px" class="form-value">
											<textarea name="txtContent"  class="mceEditor" cols="70" rows="5" wrap="hard" class="inputbox">${news.content}</textarea>
										</div>
									</td>		
								</tr>
								</table>
 								</form>
 							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

	<!-- footer -->
  <div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

	<!-- /footer -->
</div><!-- /main containers -->



</body>
<!-- END OF BODY -->
</html>

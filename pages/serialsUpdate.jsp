<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Serials >> Edit</title>
	<%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	
	<script type="text/javascript">
		function save()
		{			
			document.updateForm.action = "<c:url value='/page/currencyUpdate.htm'/>";
			document.updateForm.submit();
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
		<td width="60%">Inventory > Warehouse Management > Product Serials</td>
		<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
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
					
					<h1 class="page-title">I35 - Product Serials</h1>
						
					<div class="toolbar">
						<a class="item-button-list" href="<c:url value='/page/serialsview.htm'/>"><span>List</span></a>
						<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					</div>					  
					  
					<div class="main-box">
						<c:if test="${not empty message}">
							<%@ include file="/common/error.jsp"%>
						</c:if>
						<form:form cssClass="edit-form" id="updateForm" name="updateForm" method="post" modelAttribute="serial_edit">
						<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
							<div>&nbsp;</div>
							<div>&nbsp;</div>
 							<tr>
								<td width="29%" align="right">No Mesin : </td>
					 		  	<td width="70%"><form:input id="serial" path="serial" cssClass="inputbox" size="30"/></td>
							</tr>
							<tr>
								<td align="right">No Rangka : </td>
								<td><form:input id="serialExt1" path="serialExt1" cssClass="inputbox" size="30"/></td>
							</tr>
                            <tr>
								<td align="right">Year : </td>
								<td><form:input id="year" path="year" cssClass="inputbox" size="10"/></td>
							</tr>
 						</table>
						</form:form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div><!-- /rounded -->

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>
</div>
</body>
<!-- END OF BODY -->
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Serial',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function()
		{
			if(validation()) 
			{
				$.ajax({
					url:"<c:url value='/page/serialsedit.htm?'/>",
					data:$('#updateForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Serials data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/serialsview.htm'/>";
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
	
	function validation()
	{
		var mesin = document.getElementById('serial').value;
		if(mesin == '')
		{
			alert('No Mesin tidak boleh kosong !!!');
			return;
		}
		
		var rangka = document.getElementById('serialExt1').value;
		if(rangka == '')
		{
			alert('No Rangka tidak boleh kosong !!!');
			return;
		}
		
		var year = document.getElementById('year').value;
		if(year == '')
		{
			alert('Tahun tidak boleh kosong !!!');
			return;
		}
		
		return true;
	}
</script>

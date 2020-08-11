<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Factor >> Edit</title>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
    </style>
</head>
<body>
<%@ include file="/common/sirius-header.jsp"%>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>
	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Company Administration > General Setting > Unit of Measure > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">C35 - Unit of Measure Factor</h1>
						
						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/uomPrepareUpdate.htm?id=${unit_of_measure_factor_edit.from.id}'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					 	</div>
					  
						<div class="main-box">
							<form:form id="uomForm" name="uomForm" method="post" modelAttribute="unit_of_measure_factor_edit">
 							<table width="100%" border="0" cellpadding="3" cellspacing="0">
 							<tr>
							  <td width="247" align="right">From</td>
                              	<td width="4" align="center">:</td>
						  	  <td width="962"><input class="input-disabled" disabled size="35" value="${unit_of_measure_factor_edit.from.name}"/></td>
 							</tr>
 							<tr>
 								<td align="right">To</td>
                                <td align="center">:</td>
								<td><input class="input-disabled" disabled size="35" value="${unit_of_measure_factor_edit.to.name}"/></td>
 							</tr>
                            <tr>
							  	<td align="right">Factor</td>
                              	<td width="4" align="center">:</td>
						  	  	<td width="962"><form:input id='factor' path='factor' size="20"/></td>
 							</tr>
 							</table>
 							</form:form>
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
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'UoM Factor',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			if(!$('#factor').val())
			{
				alert('Factor cannot be empty!');
				return;
			}
		
			$.ajax({
				url:"<c:url value='/page/unitofmeasurefactoredit.htm'/>",
				data:$('#uomForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating UoM Factor data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/uomPrepareUpdate.htm?id=${unit_of_measure_factor_edit.from.id}'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :'+json.message);
						}
					}
				},
				error : function(xhr) {
					console.log(xhr.responseText);
				},
			});		
		});
	});
</script>
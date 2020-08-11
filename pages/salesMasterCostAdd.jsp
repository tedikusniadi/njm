<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
<title>Sales Master Cost >> Add</title>
<style type="text/css" media="screen">
    @import url("<c:url value='/assets/sirius.css'/>");
    @import url("<c:url value='/css/jquery-ui.css'/>");
</style>
<%@ include file="/common/sirius-header.jsp"%>
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
			<td width="60%">Sales > Sales Master Cost</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						<h1 class="page-title">S50 - Sales Master Cost</h1>						
						<div class="clears">&nbsp;</div>
                        
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/salesmastercostview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					 	</div>
					  
						<div class="main-box">
							<form:form cssClass="edit-form" id="addForm" name="addForm" method="post" modelAttribute="cost_add">
                                <table  width="100%" style="border:none" cellpadding="2">
                                <tr>
                                  	<td width="19%" align="right">Name</td>
                                    <td width="1%">:</td>
                               	  	<td width="80%"><form:input id='name' path="name" size='35'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Type</td>
                                    <td>:</td>
                                    <td>
                                    	<form:select id='type' path="type">
                                        	<form:option value='CASH' label='CASH'/>
                                            <form:option value='NON_CASH' label='NON CASH'/>
                                    	</form:select>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sales Master Cost',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){		
			if(!$('#name').val())
			{
				alert('Name can not be empty!');
				return;
			}
			
			if(!$('#type').val())
			{
				alert('Type can not be empty!');
				return;
			}
			
			$.ajax({
				url:"<c:url value='/page/salesmastercostadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sales Master Cost data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/salesmastercostview.htm'/>";
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
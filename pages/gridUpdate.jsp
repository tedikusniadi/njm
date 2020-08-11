<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Grid >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
			<td width="60%">Company Administration > Facility > Grid > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A06 - Grid</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/facilitypreedit.htm?id=${grid.facility.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="grid">
								<table width="100%" style="border:none">
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Code :</td>
								  	<td width="80%"><form:input path='code' size="48" disabled='true' cssClass='input-disabled'/></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Name :</td>
								  	<td width="80%"><form:input path='name' size="48" cssClass='input-disabled' disabled='true'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
								</tr>
							</table>
							</form:form>
							<%/*
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="container" dojoType="ContentPane" label="Container" class="tab-pages">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/containerpreadd.htm?id=${grid.id}'/>"><span>New Container</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      <th width="10%"><div style="width:10px"></div></th>
                                        <th width="22%">Code</th>
                                        <th width="68%">Name</th>
                                    </tr>
                                    <c:forEach items="${grid.containers}" var="con">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/containerpreedit.htm?id=${con.id}'/>" title="Edit"><span>Edit</span></a>
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/containerdelete.htm?id=${con.id}'/>');" title="Del"><span>Del</span></a>
                                        </td>
                                        <td>${con.code}</td>
                                        <td>${con.name}</td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                                */ %>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Grid',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/gridedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Grid data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/facilitypreedit.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Facility Role >> Add</title>
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
			<td width="60%">Company Administration > Party > Facility Role > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A08 - Facility Role</h1>

					  	<div class="toolbar">
							<a class="item-button-back" href="<c:url value='${back}'/>"><span><spring:message code='back'/></span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="facility_role_add">
								<input type="hidden" name="party" value="${param.id}"/>
								<table width="100%" style="border:none">
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox">
                                        	<c:forEach items='${facilitys}' var='type'>
                                               	<form:option value='${type.id}' label='${type.name}' />
                                            </c:forEach>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Type :</td>
									<td>
										<form:select id="facilityRoleType" path="facilityRoleType" cssClass="combobox">
                                        	<c:forEach items='${types}' var='type'>
                                               	<form:option value='${type.id}' label='${type.name}' />
                                            </c:forEach>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Default :</td>
									<td>
										<form:radiobutton path='selected' value='true' label='Yes'/>
                                        <form:radiobutton path='selected' value='false' label='No'/>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
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
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Facility Role',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/facilityroleadd.htm'/>",
				data:$('form').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Facility Role data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/partypreedit.htm?id='/>"+json.id;
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
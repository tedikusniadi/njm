<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/productcategoryview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
						</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="category_edit">
								<table style="border:none" width="100%">
									<tr>
										<td width="29%" align="right">ID :&nbsp;</td>
									  <td width="27%"><form:input path="code" cssClass="inputbox" maxlength="50" disabled="true"/></td>
									  <td width="44%"><form:errors path="code"/></td>
								  </tr>
									<tr>
										<td align="right">Name :&nbsp;</td>
										<td><form:input path="name" cssClass="inputbox" maxlength="50" disabled="true"/></td>
										<td><form:errors path="name"/></td>
									</tr>
									<tr>
										<td align="right">Status :&nbsp;</td>
										<td>
											<form:radiobutton path='enabled' value='true' label='Active'/>
											<form:radiobutton path='enabled' value='false' label='Inactive'/>
										</td>
										<td><form:errors path="enabled"/></td>
									</tr>
									<tr>
										<td align="right">Parent :&nbsp;</td>
										<td>
											<form:select id='parent' path='parent' cssClass='combobox'>
												<form:option value="${category_edit.parent.id}" label='${category_edit.parent.name}'/>
											</form:select>
											&nbsp;
											<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Product Category" />
										</td>
										<td>&nbsp;</td>
									</tr>
                                    <tr>
										<td align="right">Company :&nbsp;</td>
										<td>
											<form:select path='organization' cssClass='combobox-ext' disabled='true'>
												<form:option value="${category_edit.organization.id}" label='${category_edit.organization.firstName} ${category_edit.organization.middleName} ${category_edit.organization.lastName}'/>
											</form:select>
										</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td align="right">Type :&nbsp;</td>
										<td>
											<form:select path="type" cssClass="combobox">
												<form:option value="STOCK">STOCK</form:option>
												<form:option value="NONSTOCK">NON STOCK</form:option>
											</form:select>
										</td>
									</tr>
									<tr>
										<td align="right">Note :&nbsp;</td>
										<td><form:textarea path="note" cols='55' rows='6'/></td>
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

  <%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product Category',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productcategoryedit.htm'/>",
				data:$('#editFprm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Product Category data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productcategoryview.htm'/>";
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
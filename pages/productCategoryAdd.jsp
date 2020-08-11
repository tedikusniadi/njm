<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
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

						<h1 class="page-title">${pageTitle }</h1>

						<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productcategoryview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
						</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="category_add">
								<table style="border:none" width="100%">
									<tr>
										<td width="23%" align="right">ID :&nbsp;</td>
									  <td width="30%"><form:input id='code' path="code" maxlength="50"/></td>
									  <td width="47%"><form:errors path="code"/></td>
								  </tr>
									<tr>
										<td align="right">Name :&nbsp;</td>
										<td><form:input id='name' path="name" maxlength="50"/></td>
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
											</form:select>
											&nbsp;
											<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproductcategoryview.htm?target=parent'/>');" style="CURSOR:pointer;" title="Product Category" />
										</td>
										<td><form:errors path="parent"/></td>
									</tr>
                                    <tr>
										<td align="right">Company :&nbsp;</td>
										<td>
											<form:select id='org' path='organization' cssClass='combobox-ext'>
											<form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
											</form:select>
											&nbsp;
											<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
										</td>
										<td><form:errors path="organization"/></td>
									</tr>
									<tr>
										<td align="right">Type :&nbsp;</td>
										<td>
											<form:select path="type" cssClass="combobox">
												<form:option value="STOCK">STOCK</form:option>
												<form:option value="NONSTOCK">NON STOCK</form:option>
											</form:select>
										</td>
                                        <td><form:errors path="type"/></td>
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
		$('#code').focus();

		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product Category',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			if(!$('#code').val())
			{
				alert('Code cannot be empty!');
				return;
			}

			if(!$('#name').val())
			{
				alert('Name cannot be empty!');
				return;
			}

			$.ajax({
				url:"<c:url value='/page/productcategoryadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Product Category data......');
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
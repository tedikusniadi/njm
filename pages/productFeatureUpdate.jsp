<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/productfeatureview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
					  	</div>

                        <div class="main-box">
							<form:form name="editForm" id="editForm" modelAttribute="feature" method="post">
                                <table width="100%" style="border:none">
                                <tr>
                                	<td width="63%" valign="top" align="left">
                                   		<table width="100%" style="border:none">
                                        <tr>
                                            <td width="332" align="right">Name</td>
                                            <td width="10">:</td>
                                            <td width="886"><form:input path="name" size='50' cssClass="input-disabled" disabled='true'/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Status</td>
                                            <td width="10">:</td>
                                            <td width="886">
                                                <form:radiobutton path='enabled' value='true' label='Active'/>
                                                <form:radiobutton path='enabled' value='false' label='Inactive'/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note</td>
                                            <td width="10">:</td>
                                          	<td width="886"><form:textarea path='note' cols='55' rows='6'/></td>
                                        </tr>
                                        </table>
                                  	</td>
                              		<td width="37%" valign="top" align="left">
										<fieldset>
                                        	<strong>
                                        	<legend>Feature Type</legend>
                                            <table width="100%" style="border:none">
                                            <c:forEach items='${feature.details}' var='detail' varStatus='status'>
                                            <tr>
                                           	  	<td width="8%"><input type='checkbox' disabled checked/></td>
                                                <td width="92%">${detail.type.name}</td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                            </strong>
                                        </fieldset>
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

  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Product Feature',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productfeatureedit.htm'/>",
				data:$('#editFprm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Product Feature data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productfeatureview.htm'/>";
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
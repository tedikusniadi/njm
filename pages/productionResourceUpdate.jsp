<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Resource >> Edit</title>
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
			<td width="60%">Production > Master > Resource > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U11 - Resource</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionresourceview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="resource_edit">
								<table width="100%" style="border:none" cellpadding="1">
                                <tr>
                                    <td width="16%" align="right">Code</td>
                                    <td>:</td>
                                  	<td width="84%"><form:input id='code' path='code' size="30" disabled='true' cssClass='input-disabled'/></td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Name</td>
                                    <td>:</td>
                                  	<td width="84%"><form:input id='name' path='name' size="50" disabled='true' cssClass='input-disabled'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Type</td>
                                    <td>:</td>
                                    <td>
                                        <form:select path="resourceType" cssClass="combobox" disabled='true'>
                                            <form:option value='PERSON' label='PERSON' />
                                            <form:option value='MACHINE' label='MACHINE' />
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="16%" align="right">Cost</td>
                                    <td>:</td>
                                  	<td width="84%"><form:input id='cost' path='cost' size="20" cssStyle='text-align:right;'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">UoM</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="uom" path="unitOfMeasure" disabled='true'>
                                            <form:option value='${resource_edit.unitOfMeasure.id}' label='${resource_edit.unitOfMeasure.name}'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid From</td>
                                    <td>:</td>
									<td><input size='10' disabled value="<fmt:formatDate value='${resource_edit.validFrom}' pattern='dd-MM-yyyy'/>" class='input-disabled'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To</td>
                                    <td>:</td>
									<td><input size='10' disabled value="<fmt:formatDate value='${resource_edit.validTo}' pattern='dd-MM-yyyy'/>" class='input-disabled'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note</td>
                                    <td>:</td>
									<td><form:textarea path='note' rows='6' cols='45'/></td>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Resource',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/productionresourceedit.htm'/>",
				data:$('#editForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Production Resource data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productionresourceview.htm'/>";
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
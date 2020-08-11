<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Production Planning >> Edit</title>
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
			<td width="60%">Production > Production Planning > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">U20 - Production Planning</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/productionplanningview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-edit" id='save'><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.add and access.edit}'>
                            	<a class="item-button-add-gl-child" href="<c:url value='/page/productionplanningsequencepreadd1.htm?plan=${production_planning_edit.id}'/>"><span>Add Sequence</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="production_planning_edit">
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
                                    <td align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                            <c:if test='${not empty production_planning_edit.organization}'>
                                                <form:option value='${production_planning_edit.organization.id}' label='${production_planning_edit.organization.firstName} ${production_planning_edit.organization.lastName} ${production_planning_edit.organization.middleName}' />
                                            </c:if>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note</td>
                                    <td>:</td>
									<td><form:textarea path='note' rows='6' cols='45'/></td>
								</tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table cellpadding="0" cellspacing="0" class="table-list" style="width:65%;" align="center">
                                <tr>
                                    <th width="9%"><div style="width:40px"></div></th>
                                    <th width="7%">Seq</th>
                                    <th width="45%">Work Unit</th>
                                    <th width="19%">Duration</th>
                                    <th width="20%">UoM</th>
                                </tr>
                                <c:forEach items="${production_planning_edit.sequences}" var="com" varStatus='status'>
                                <tr>
                                    <td class="tools">
                                    	<c:if test='${access.edit}'>
	                                        <a class="item-button-edit" href="<c:url value='/page/productionplanningsequencepreedit.htm?id=${com.id}'/>" title="Edit"><span>Edit</span></a>
                                        </c:if>
                                        <c:if test='${access.delete and empty com.productionOrder}'>
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/productionplanningsequencedelete.htm?id=${com.id}'/>');" title="Del"><span>Del</span></a>
                                        </c:if>
                                    </td>
                                    <td><c:out value='${status.index+1}'/></td>
                                    <td><c:out value='${com.workUnit.code} ${com.workUnit.name}'/></td>
                                    <td><fmt:formatNumber value='${com.duration}' pattern=',##0.00'/></td>
                                    <td><c:out value='${com.unitOfMeasure.name}'/></td>
                                </tr>
                                </c:forEach>
                                <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
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
<%@ include file="/common/dialog.jsp"%>
<script type="text/javascript" src="assets/dialog.js"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Production Resource',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
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
				url:"<c:url value='/page/productionplanningadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'html',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Production Planning data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(html)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/productionplanningview.htm'/>";
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
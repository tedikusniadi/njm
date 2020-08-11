<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
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
							<a class="item-button-list" href="<c:url value='/page/unitstockadjustmentpreedit.htm?id=${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.id}'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_detail_edit">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
							  	  	<td width="52%"><input value="${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.code}" class='input-disabled' size='30' disabled="true"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input class="input-disabled" size="10" disabled value="<fmt:formatDate value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.date}' pattern='dd-MM-yyyy'/>"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="" cssClass="combobox-ext">
                                           	<c:if test='${not empty adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.organization}'>
                                               	<form:option value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.organization.id}' label='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.organization.firstName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.organization.middleName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.organization.lastName}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="" cssClass="combobox-ext">
                                           	<c:if test='${not empty adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.facility}'>
                                               	<form:option value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.facility.id}' label='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.facility.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
								<tr>
									<td nowrap="nowrap" align="right">Grid :</td>
									<td>
										<form:select id="grid" path="" cssClass="combobox-ext">
                                           	<c:if test='${not empty adjustment_detail_edit.stockAdjustmentItem.grid}'>
                                               	<form:option value='${adjustment_detail_edit.stockAdjustmentItem.grid.id}' label='${adjustment_detail_edit.stockAdjustmentItem.grid.name}' />
                                            </c:if>
										</form:select>
									</td>
								</tr>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Product :</td>
							  	  	<td width="52%"><input value="${adjustment_detail_edit.stockAdjustmentItem.product.name}" class='input-disabled' size='30' disabled="true"/></td>
								</tr>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">No Mesin :</td>
							  	  	<td width="52%"><form:input id="mesin" path="serial" value="${adjustment_detail_edit.serial}" size='25'/></td>
								</tr>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">No Rangka :</td>
							  	  	<td width="52%"><form:input id="mesin" path="serialExt1" value="${adjustment_detail_edit.serialExt1}" size='25'/></td>
								</tr>
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Tahun :</td>
							  	  	<td width="52%"><form:input id="tahun" path="year" value="${adjustment_detail_edit.year}" size='25'/></td>
								</tr>
							</table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.createdBy.firstName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.createdBy.middleName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.createdBy.lastName}'/> (<fmt:formatDate value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.updatedBy.firstName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.updatedBy.middleName} ${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.updatedBy.lastName}'/> (<fmt:formatDate value='${adjustment_detail_edit.stockAdjustmentItem.stockAdjustment.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Stock Adjustment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			$target = $(e.target);

			$.ajax({
				url:"<c:url value='/page/unitstockadjustmentitemdetailedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Stock Adjustment Detail data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.mesinExist) {
							$dialog.html('No Mesin '+json.mesin+' already exist in database !!!');
							return;
						}

						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/unitstockadjustmentpreedit.htm?id='/>"+json.id;
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
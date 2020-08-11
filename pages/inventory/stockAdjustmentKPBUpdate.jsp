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
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptkpbview.htm'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_edit">
								<table style="border:none" width="100%">
                                <tr>
                                	<td width="60%" valign="top">
										<table width="100%" style="border:none">
										<tr>
											<td width="20%" nowrap="nowrap" align="right">ID :</td>
									  	  	<td width="52%"><input value="${adjustment_edit.code}" class='input-disabled' size='25'/></td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Date :</td>
											<td><input class="input-disabled" size="10" disabled value="<fmt:formatDate value='${adjustment_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Company :</td>
											<td>
												<form:select id="org" path="organization" cssClass="combobox-ext">
		                                           	<c:if test='${not empty adjustment_edit.organization}'>
		                                               	<form:option value='${adjustment_edit.organization.id}' label='${adjustment_edit.organization.firstName} ${adjustment_edit.organization.lastName} ${adjustment_edit.organization.middleName}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Facility :</td>
											<td>
												<form:select id="facility" path="facility" cssClass="combobox-ext">
		                                           	<c:if test='${not empty adjustment_edit.facility}'>
		                                               	<form:option value='${adjustment_edit.facility.id}' label='${adjustment_edit.facility.name}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Reason :</td>
											<td><form:textarea path="reason" cols="55" rows="7"/></td>
										</tr>
									</table>
                               	</td>
                               	<td width="40%" valign="top">
                               		<fieldset>
                               			<legend>Reference</legend>
                               			<table style="border:none" width="100%">
                               			<tr>
                               				<td align="right">Journal :</td>
                               				<td>
                               					<a href="<c:url value='/page/journalentrypreview.htm?id=${adjustment_edit.journalEntry.id}'/>">
                               						<c:out value='${adjustment_edit.journalEntry.code}'/>
                               					</a>
                               				</td>
                               			</tr>
                               			</table>
                               		</fieldset>
                               	</td>
                            	</tr>
                            	</table>
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                                <th width="1%">&nbsp;</th>
                                <th width="12%">Grid</th>
                           	  	<th width="15%">Product</th>
                           	  	<th width="8%">Adjustment</th>
                              	<th width="8%">UoM</th>
                                <th width="10%">Adj Price</th>
                            	<th width="8%">Curr</th>
                            	<th width="850%">Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${adjustment_edit.items}' var='item'>
                            <tr>
                            	<td>&nbsp;</td>
                            	<td><c:out value='${item.grid.name}'/></td>
                                <td><c:out value='${item.inventoryItem.product.name}'/></td>
                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                            	<td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
                                <td><fmt:formatNumber value='${item.money.amount}' pattern=',##0.00'/></td>
                                <td><c:out value='${item.money.currency.symbol}'/></td>
                                <td><c:out value='${item.money.exchangeType}'/></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="8">&nbsp;</td></tr>
                            </tfoot>
                            </table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${adjustment_edit.createdBy.firstName} ${adjustment_edit.createdBy.middleName} ${goodsIssue.createdBy.lastName}'/> (<fmt:formatDate value='${adjustment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${adjustment_edit.updatedBy.firstName} ${adjustment_edit.updatedBy.middleName} ${adjustment_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${adjustment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt KPB',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			$target = $(e.target);

			$.ajax({
				url:"<c:url value='/page/goodsreceiptkpbedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Goods Receipt KPB data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptkpbview.htm'/>";
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
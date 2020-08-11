<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Stock Adjustment >> Edit</title>
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
			<td width="60%">Inventory > Warehouse Management > Stock Adjustment > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">I26 - Stock Adjustment</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/stockadjustmentview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_edit">
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
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                                <th width="15%">Grid</th>
                                <th width="5%">&nbsp;</th>
                           	  	<th width="28%">Product</th>
                           	  	<th width="15%">Adjustment</th>
                              	<th width="8%">UoM</th>
                                <th width="12%">Adj Price</th>
                            	<th width="7%">Curr</th>
                            	<th width="8%">Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items='${adjustment_edit.items}' var='item'>
                            <tr>
                            	<td><c:out value='${item.grid.name}'/></td>
                            	<td>&nbsp;</td>
                                <td><c:out value='${item.inventoryItem.product.name}'/></td>
                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
                            	<td><c:out value='${item.inventoryItem.product.unitOfMeasure.measureId}'/></td>
                                <td><fmt:formatNumber value='${item.money.amount}' pattern=',##0.00'/></td>
                                <td><c:out value='${item.money.currency.symbol}'/></td>
                                <td><c:out value='${item.money.exchangeType}'/></td>
                            </tr>
                            <tr>
                            	<td>&nbsp;</td>
                            	<th>&nbsp;</th>
                            	<th>No Mesin-No Rangka</th>
                            	<th>Tahun Rakit</th>
                            	<th>Quantity</th>
                            	<th>&nbsp;</th>
                            	<th>&nbsp;</th>
                            	<th>&nbsp;</th>
                            </tr>
                            	<c:forEach items='${item.details}' var='detail'>
                            	<tr>
                            		<td>&nbsp;</td>
                            		<td class="tools">
										<c:if test='${access.edit}'>
		                                	<a class="item-button-edit" href="<c:url value='/page/stockadjustmentitemdetailpreedit.htm?id=${detail.id}'/>" title="Edit"><span>Edit</span></a>
		                                </c:if>
		                                <c:if test='${access.delete}'>
											<a class="item-button-delete" <%-- href="javascript:deleteDialog('<c:url value='/page/itemconversiondelete.htm?id=${con.id}'/>');" --%> title="Del"><span>Del</span></a>
		                                </c:if>
									</td>
                            		<td><c:out value='${detail.serialExt1} ${detail.serial}'/></td>
                            		<td><c:out value='${detail.year}'/></td>
                                	<td><fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/></td>
                                	<td>&nbsp;</td>
	                            	<td>&nbsp;</td>
	                            	<td>&nbsp;</td>
                            	</tr>
                            	</c:forEach>
                           	<tr>
                           		<td colspan="10">&nbsp;</td>
                           	</tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Stock Adjustment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			$target = $(e.target);

			$.ajax({
				url:"<c:url value='/page/stockadjustmentedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Stock Adjustment data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/stockadjustmentview.htm'/>";
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
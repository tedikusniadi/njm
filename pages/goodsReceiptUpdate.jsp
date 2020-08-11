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
	<%@ include file="/common/sirius-header.jsp" %>
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
							<a class="item-button-list" href="javascript:history.back();"><span>List</span></a>
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
                            	<a class="item-button-print" href="<c:url value='/page/goodsreceiptprint.htm?id=${goodsReceipt_edit.id}'/>"><span>Print</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="goodsReceipt_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.code}" class='input-disabled' size='35'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt_edit.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt_edit.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size='10' class="input-disabled" disabled value="<fmt:formatDate value='${goodsReceipt_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled='true' cssClass='input-disabled'/></td>
                                        </tr>
                                        <tr>
                                          <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          	<td width="74%">
                                          		<form:select path='warehouseTransaction.transactionSource' disabled='true' cssClass="input-disabled">
                                                	<form:option value='PURCHASE_ORDER' label='PURCHASE ORDER'/>
                                                    <form:option value='COLLECTING_ORDER' label='COLLECTING ORDER'/>
                                                    <form:option value='TRANSFER_ORDER' label='TRANSFER ORDER'/>
                                                    <form:option value='UNIT_PURCHASE_ORDER' label='UNIT PURCHASE ORDER'/>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt_edit.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
										<fieldset>
                                        	<legend><strong>Journal Reference </strong></legend>
                                            <a href="<c:url value='/page/journalentrypreedit.htm?id=${goodsReceipt_edit.journalEntry.id}'/>">
                                                <c:out value='${goodsReceipt_edit.journalEntry.code}'/>
                                            </a>
                                        </fieldset>
										<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${goodsReceipt_edit.items}' var='rec'>
                                            <tr>
                                            	<td><c:out value='${rec.warehouseTransactionItem.product.name}'/></td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.quantity - rec.warehouseTransactionItem.unissued}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.warehouseTransactionItem.receipted - rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                </td>
                                                <td><input value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>
								</form:form>
                                <div class="clears">&nbsp;</div>
	                            	<div id="item" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                       <tr>
		                                    <th width="17%">Nama</th>
			  	  	  	  	  	  			<th width="12%">Tipe</th>
			  	  	  	  	  	  			<th width="15%">Nama Tipe</th>
		                                    <th width="12%">Warna</th>
			  	  	  	  	  	  			<th width="12%">Grid</th>
		                                  	<th width="8%">Jumlah</th>
		                                    <th width="15%">Satuan/No.Mesin</th>
		                                    <th width="15%">No.Rangka</th>
		                                    <th width="15%">Tahun</th>
		                                </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${goodsReceipt_edit.items}' var='item' varStatus='status'>
		                                <tr>
		                                	<td>${item.warehouseTransactionItem.product.name}</td>
		                                	<td>${item.warehouseTransactionItem.product.types}</td>
		                                	<td>${item.warehouseTransactionItem.product.typeNames}</td>
		                                	<td>${item.warehouseTransactionItem.product.colors}</td>
		                                	<td>${item.grid.name}</td>
		                                    <td><fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/></td>
		                                    <td colspan="3">${item.warehouseTransactionItem.product.unitOfMeasure.measureId}</td>
		                                </tr>
			                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
			                                	<tr>
				                                	<td colspan="5"></td>
				                                    <td><fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/></td>
				                                    <td>${detail.serial}</td>
				                                    <td>${detail.serialExt1}</td>
				                                    <td>${detail.year}</td>
				                                </tr>
			                                </c:forEach>
		                                </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                </div>
							</div>
							<div class="info">Created by : <c:out value='${goodsReceipt_edit.createdBy.firstName} ${goodsReceipt_edit.createdBy.middleName} ${goodsReceipt_edit.createdBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${goodsReceipt_edit.updatedBy.firstName} ${goodsReceipt_edit.updatedBy.middleName} ${goodsReceipt_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${goodsReceipt_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Goods Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptview.htm'/>";
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
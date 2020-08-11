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
							<a class="item-button-back" href="javascript:history.back();"><span>Back</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Grid :</td>
                                          	<td width="74%">
                                          		<select id='allgrid' class="combobox-ext input-disabled" disabled>
                                                	<option value="${grid.id}"><c:out value='${grid.name}'/></option>
                                                </select>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${goodsReceipt.date}' pattern="dd-MM-yyyy"/>" class="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50' disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7" disabled="true" cssClass="input-disabled"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
                                                <c:if test="${goodsReceipt.warehouseTransaction.transactionSource == 'ACCESSORIES_PURCHASE_ORDER'}">
                                                	<input value="Accessories Purchase Order" class='input-disabled' size='45'/>
                                                </c:if>
                                                <c:if test="${goodsReceipt.warehouseTransaction.transactionSource == 'SALES_RETURN'}">
                                                	<input value="Sales Return" class='input-disabled' size='45'/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt.warehouseTransaction.code}" class='input-disabled' size='45'/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt.warehouseTransaction.receiveFrom}" class='input-disabled' size='45'/></td>
                                        </tr>
                                    	</table>
                                  	</td>
                                    <td width="47%" valign="top" align="left">
                                    	<fieldset>
                                        	<legend><strong>Recapitulation</strong></legend>
                                            <table style="border:none" width="100%">
                                        	<tr>
                                            	<th width="33%">&nbsp;</th>
                                                <th width="23%">Procured Qty</th>
                                                <th width="22%">Prev Received</th>
                                                <th width="22%">Receive</th>
                                            </tr>
                                            <c:forEach items='${warehouseTransaction.receiptables}' var='rec'>
                                            <c:if test="${rec.product.productCategory.id == 3}">
                                            <tr>
                                            	<td>${rec.product.name}</td>
                                                <td>
                                                	<input value="<fmt:formatNumber value='${rec.quantity}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="pro-${rec.product.id}" value="${rec.quantity}"/>
                                                </td>
                                                <td>
                                                	<input id="rec" value="<fmt:formatNumber value='${rec.receipted}' pattern=',##0.00'/>" class='input-disabled' size='10' disabled/>
                                                    <input type="hidden" id="rec-${rec.product.id}" value="${rec.receipted}"/>
                                                    </td>
                                                <td><input id="unrec-${rec.product.id}" value="0.00" class='input-disabled' size='10' disabled/></td>
                                            </tr>
                                            </c:if>
                                            </c:forEach>
                                        	</table>
                                        </fieldset>
                                	</td>
                                </tr>
                                </table>

                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <!-- <th width="20%">Product</th> -->
	  	  	  	  	  	  			<th width="18%">Product</th>
	  	  	  	  	  	  			<th width="18%">Merk</th>
                                    <th width="18%">Warna</th>
	  	  	  	  	  	  			<th width="15%">Grid</th>
                                  	<th width="8%">Jumlah</th>
                                    <th width="20%">Serial</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="value" value="0" />
                                <c:forEach items='${goodsReceipt.items}' var='item' varStatus='status'>
                                <c:if test="${item.warehouseTransactionItem.product.serial}">
	                                <c:set var="disabled" value="false"/>
	                                <c:set var="class" value=""/>
                                </c:if>
                                <c:if test="${!item.warehouseTransactionItem.product.serial}">
	                                <c:set var="disabled" value="true"/>
	                                <c:set var="class" value="input-disabled"/>
                                </c:if>
                                <tr>
                                	<td><input class="input-disabled" size="28" value="${item.warehouseTransactionItem.product.name}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.warehouseTransactionItem.product.brand}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.warehouseTransactionItem.product.primaryColors}" disabled/></td>
                                	<td><input class="input-disabled" size="30" value="${item.grid.name}" disabled/></td>
                                    <td><input class="input-disabled" disabled size='8' value="<fmt:formatNumber value='${item.receipted}' pattern=',##0.00'/>"/></td>
                                </tr>
	                                <c:forEach items="${item.details}" var="detail" varStatus="detailstatus">
	                                	<tr>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                	<td></td>
		                                    <td><input class="input-disabled" disabled size='8' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
		                                    <td><form:input size="20" id="serial[${value}]" path="items[${status.index}].details[${detailstatus.index}].serial" value="${detail.serial}" class="${class}" disabled="${disabled}"/>
		                                </tr>
		                                <c:set var="value" value="${value + 1}" />
	                                </c:forEach>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Goods Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/goodsreceiptmanualadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Goods Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/goodsreceiptmanualview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		});
	});
</script>
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

						<h1 class="page-title">${pageTitle}</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptmanualview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-next" style="cursor:pointer;"><span>Next</span></a>
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
                                          	<td width="74%">
                                          		<input value="Auto Generated" class='input-disabled' size='25'/>
                                          		<input id="id" type="hidden" value="${id}" class='input-disabled' size='25'/>
                                          	</td>
                                         </tr>
		                                 <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt.warehouseTransaction.receiptFacility.name}'/></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Grid :</td>
                                          	<td>
                                          		<select id='allgrid' class="combobox-ext">
                                                </select>
		                                        &nbsp;
												<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('allgrid');" style="CURSOR:pointer;" title="Grid" />
                                            </td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${now}'/>" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
		                                <tr>
		                                	<td nowrap="nowrap" align="right">DO No :</td>
		                                	<td><form:input path='doNo' size='30' maxlength='50'/></td>
		                                </tr>
                                        <tr>
	                                    	<td nowrap="nowrap" align="right">No Nota Debet :</td>
	                                        <td><input id="noSO" value="${goodsReceipt.warehouseTransaction.invoiceNo}" class='input-disabled' size='30' disabled/></td>
                                        </tr>
                                        <tr>
	                                    	<td nowrap="nowrap" align="right">No Sales Order :</td>
	                                        <td><input id="noSO" value="${goodsReceipt.warehouseTransaction.salesOrderNo}" class='input-disabled' size='30' disabled/></td>
                                        </tr>
		                                <tr>
		                                	<td nowrap="nowrap" align="right">Note :</td>
		                                	<td><form:textarea path="note" cols="55" rows="7"/></td>
		                                </tr>
		                                <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
                                                <c:if test="${goodsReceipt.warehouseTransaction.transactionSource == 'ACCESSORIES_PURCHASE_ORDER'}">
                                                	<input value="Accessories Purchase Order" class='input-disabled' size='45' disabled/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt.warehouseTransaction.code}" class='input-disabled' size='45' disabled/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt.warehouseTransaction.receiveFrom}" class='input-disabled' size='45' disabled/></td>
                                        </tr>
		                               	</table>
		                            </td>
                                </tr>
                                </table>
                                <br/>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
	  	  	  	  	  	  			<th width="20%">Product</th>
	  	  	  	  	  	  			<th width="20%">Merk</th>
                                    <th width="20%">Warna</th>
                                  	<th width="10%">Jumlah</th>
                                  	<th width="10%">Yg Diterima</th>
                                    <th width="20%">Grid</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsReceipt.items}' var='item' varStatus='status'>
                                <tr>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.name}" disabled/></td>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.brand}" disabled/></td>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.primaryColors}" disabled/></td>
                                    <td><input class="input-disabled" size='10' value="<fmt:formatNumber value='${item.warehouseTransactionItem.quantity-item.warehouseTransactionItem.receipted}' pattern='#,###'/>" disabled/></td>
                                    <td><input id="receipted[${status.index}]" name='items[${status.index}].receipted' size='10' value="<fmt:formatNumber value='${item.warehouseTransactionItem.quantity-item.warehouseTransactionItem.receipted}' pattern='#,###'/>"/></td>
                                    <td nowrap="nowrap">
                                    	<form:select id='grid[${status.index}]' path='items[${status.index}].grid' cssClass='combobox-ext'>
                                        </form:select>
                                    </td>
                                </tr>
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
		$('.item-button-next').click(function(){
			if(validation())
			{
				$("#addForm").attr("action","<c:url value='/page/goodsreceiptmanualpreadd3.htm'/>");
				$("#addForm").submit();
			}
		});
	});
	
	function validation()
	{
		if($("#facility").val() == null || $("#facility").val() == '')
		{
			alert('Please select Facility first !!!');
			return;
		}
		
		if($("#allgrid").val() == null || $("#allgrid").val() == '')
		{
			alert('Please select Grid first !!!');
			return;
		}

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			var totalQty = 0;
	
			for(var idx=len-1;idx>=0;idx--)
			{
				var product = t_section.rows[idx].cells[0].firstChild.value;
				var qty = t_section.rows[idx].cells[3].firstChild.value;
				var received = t_section.rows[idx].cells[4].firstChild.value;
				if(!received || received.toNumber() < 0)
				{
					alert('Receive quantity must be >= 0')
					return;
				}
				
				if(qty.toNumber() == 0 && received.toNumber() < qty.toNumber())
				{
					alert('Receive quantity must be >= 0');
					return;
				}
				
				if(received.toNumber() > qty.toNumber())
				{
					alert('Receive quantity <= quantity');
					return;
				}
	
				if(t_section.rows[idx].cells[5].childNodes[1].value == null || t_section.rows[idx].cells[5].childNodes[1].value == '')
				{
					alert('Grid for Product '+product+' cannot be empty!');
					return;
				}
				totalQty = totalQty + received;
			}
	
			if(parseFloat(totalQty) <= 0)
			{
				alert('Received Quantity must be greater than 0!');
				return;
			}
		}
		
		return true;
	}
	
	function opengrid(target)
	{
		var fac = document.getElementById('facility');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}
	
	function display(product,target)
	{
		var _target = document.getElementById(target);
		var _unrec = document.getElementById('unrec-'+product);

		var _quan = document.getElementById('pro-'+product);
		var _rec = document.getElementById('rec-'+product);

		var rec = 0.0;
		var av = _quan.value.toNumber() - _rec.value.toNumber();

		if(!_target.value)
		{
			alert('Receipted Quantity can not be empty!');
			return;
		}

		if(_target.value.toNumber() > av)
		{
			alert('Receipted Quantity exceeded allowed quantity!');
			return;
		}

		_unrec.value = _target.value.toNumber().numberFormat('#,#.00');
	}
</script>
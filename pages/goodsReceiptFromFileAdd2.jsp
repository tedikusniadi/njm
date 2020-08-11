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
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptfromfileview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-next" style="cursor:pointer;"><span>Next</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	<table width="100%" style="border:none">
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%">
                                          		<input value="Auto Generated" class='input-disabled' size='25' disabled/>
                                          		<input id="id" type="hidden" value="${id}" class='input-disabled' size='25'/>
                                          </td>
                                        </tr>
                                        <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">Warehouse :</td>
                                          	<td width="74%">
                                          		<select id='facility' class="combobox-ext input-disabled" disabled>
                                                	<option value="${goodsReceipt_add.warehouseTransaction.receiptFacility.id}"><c:out value='${goodsReceipt_add.warehouseTransaction.receiptFacility.name}'/></option>
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
                                            <td align="right">Import File :</td>
                                            <td>
                                           		<input type="file" id="fileImport" name="fileImport" size='31' ${enabled}/>
                                            </td>
                                        </tr>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">DO No :</td>
                                            <td><form:input path='doNo' size='30' maxlength='50'/></td>
                                        </tr>
                                        <c:if test="${type == 'UND'}">
                                        	<%-- <tr>
		                                    	<td width="26%" nowrap="nowrap" align="right">No Surat Jalan :</td>
		                                        <td width="74%"><input id="noDO" value="${verification.deliveryOrderNo}" class='input-disabled' size='30' disabled/></td>
	                                        </tr> --%>
	                                        <tr>
		                                    	<td nowrap="nowrap" align="right">No Nota Debet :</td>
		                                        <td><input id="noNota" value="${goodsReceipt_add.warehouseTransaction.invoiceNo}" class='input-disabled' size='30' disabled/></td>
	                                        </tr>
	                                        <tr>
		                                    	<td nowrap="nowrap" align="right">No Sales Order :</td>
		                                        <td><input id="noSO" value="${goodsReceipt_add.warehouseTransaction.salesOrderNo}" class='input-disabled' size='30' disabled/></td>
	                                        </tr>
                                        </c:if>
                                        <tr>
                                          	<td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                        <tr><td nowrap="nowrap" colspan="2">&nbsp;</td></tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Type :</td>
                                          <td width="74%">
                                          		<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'UNIT_PURCHASE_ORDER'}">
                                                	<input value="Unit Purchase Order" class='input-disabled' size='45' disabled/>
                                                </c:if>
												<c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'PURCHASE_ORDER'}">
                                                	<input value="Purchase Order" class='input-disabled' size='45' disabled/>
                                                </c:if>
                                                <c:if test="${goodsReceipt_add.warehouseTransaction.transactionSource == 'TRANSFER_ORDER'}">
                                                	<input value="Transfer Order" class='input-disabled' size='45' disabled/>
                                                </c:if>
                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Reference Doc :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.code}" class='input-disabled' size='45' disabled/></td>
                                        </tr>
                                        <tr>
                                          <td width="26%" nowrap="nowrap" align="right">Receive From :</td>
                                          <td width="74%"><input value="${goodsReceipt_add.warehouseTransaction.receiveFrom}" class='input-disabled' size='45' disabled/></td>
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
                                            <c:forEach items='${goodsReceipt_add.warehouseTransaction.receiptables}' var='rec'>
                                            <c:if test="${rec.product.productCategory.id == 1}">
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
                                <br/>
                                <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
                                    <!-- <th width="30%">Product</th> -->
	  	  	  	  	  	  			<th width="20%">Tipe</th>
	  	  	  	  	  	  			<th width="20%">Nama Tipe</th>
                                    <th width="20%">Warna</th>
                                  	<th width="10%">Jumlah</th>
                                    <!-- <th width="8%">Satuan</th> -->
                                    <th width="20%">Grid</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items='${goodsReceipt_add.items}' var='item' varStatus='status'>
                                <tr>
                                	<%-- <td><input class="input-disabled" size="40" value="${item.warehouseTransactionItem.product.name}" disabled/></td> --%>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.types}" disabled/></td>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.typeNames}" disabled/></td>
                                	<td><input class="input-disabled" size="35" value="${item.warehouseTransactionItem.product.colors}" disabled/></td>
                                    <td><input class="input-disabled" id="receipted[${status.index}]" value="${item.warehouseTransactionItem.quantity-item.warehouseTransactionItem.receipted}" name='items[${status.index}].receipted' size='10' value="<fmt:formatNumber value='${item.receipted}' pattern='##0.00'/>"/></td>
                                    <%-- <td><input class="input-disabled" size="7" value="${item.warehouseTransactionItem.measureName}" disabled/></td> --%>
                                    <td nowrap="nowrap">
                                    	<form:select id='grid[${status.index}]' path='items[${status.index}].grid' cssClass='combobox-ext'>
                                        </form:select>
                                        <input id="prodId[${status.index}]" name="prodIds" type="hidden" size="7" value="" />
                                        <input id="serial[${status.index}]" name="serials" type="hidden" size="7" value="" />
                                        <input id="year[${status.index}]" name="years" type="hidden" size="7" value="0" />
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="5">&nbsp;</td></tr></tfoot>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function()
	{
		$("#fileImport").change(function()
		{
			var data = new FormData();
			jQuery.each($('#fileImport')[0].files, function(i, file) {
				if(i==0)
			    	data.append('fileImport', file);
				else
					data.append('fileImport-'+i, file);
			});
			data.append('id',$("#id").val());
			//data.append('noDO',$("#noDO").val());
			data.append('noSO',$("#noSO").val());
			$.ajax({
				url:"<c:url value='/page/goodsreceiptremote.checkitems.json'/>",
				data:data,
				type : 'POST',
				dataType : 'json',
				cache: false,
			    contentType: false,
			    processData: false,
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Loading dari file....');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							$.each(json.items,function(idx,val)
							{
								var prodId = document.getElementById("prodId["+idx+"]");
								if(prodId)
									prodId.value = val.prodId;
								
								var serial = document.getElementById("serial["+idx+"]");
								if(serial)
									serial.value = val.serials;
								
								var year = document.getElementById("year["+idx+"]");
								if(year)
									year.value = val.year;
							});
						}
						else
						{
							var file = document.getElementById('fileImport');
							if(file)
								file.value = '';
							
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
		
		$('.item-button-next').click(function(e){
			if(!dojo.widget.byId('date').getValue())
			{
				alert('Date can not be empty!');
				return;
			}
			
			var grid = document.getElementById('allgrid');
			
			if(grid.value == '')
			{
				alert('Please select Grid first !!!');
				return;
			}
			
			/* var file = document.getElementById('fileImport');
			if(file.value == '')
			{
				alert('Please choose the correct file first !!!');
				return;
			} */

			var tbl = document.getElementById("lineItemTable");

			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			for(var idx=len-1;idx>=0;idx--)
			{
				var product = t_section.rows[idx].cells[0].firstChild.value;

				var received = t_section.rows[idx].cells[3].firstChild.value;
				if(!received || received.toNumber() <= 0)
				{
					alert('Receive quantity must be > 0')
					return;
				}

				if(t_section.rows[idx].cells[4].childNodes[1].value == null || t_section.rows[idx].cells[4].childNodes[1].value == '')
				{
					alert('Grid for product '+product+' cannot be empty!');
					return;
				}

			}

			$("#addForm").attr("action","<c:url value='/page/goodsreceiptfromfilepreadd3.htm'/>");
			$("#addForm").submit();
		});
	});

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
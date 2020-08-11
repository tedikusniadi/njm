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
							<a class="item-button-list" href="<c:url value='/page/unitservicetransactionview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="unitService">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="${unitService.code}" disabled class='input-disabled' size='30'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty unitService.organization}'>
                                                        <form:option value='${unitService.organization.id}' label='${unitService.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" inputId="dateId" disabled class="input-disabled" size="10" value="<fmt:formatDate value='${unitService.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
										<tr>
											<td align="right">Shift :</td>
											<td><input value="${unitService.shift.code}" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
										<tr>
											<td align="right">Cashier :</td>
											<td><input value="${unitService.shift.cashierPerson.name}" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                    <c:if test='${not empty unitService.salesPerson}'>
                                                        <form:option value='${unitService.salesPerson.id}' label='${unitService.salesPerson.firstName} ${unitService.salesPerson.lastName} ${unitService.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Customer :</td>
                               		  	  	<td>
  												<form:select id='customer' path='customer' cssClass='combobox-ext'>
                                                    <c:if test='${not empty unitService.customer}'>
                                                        <form:option value='${unitService.customer.id}' label='${unitService.customer.firstName} ${unitService.customer.middleName} ${unitService.customer.lastName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Note :</td>
                                            <td><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                      </table>
                                  </td>
                                  <td width="44%" valign="top">
                                  	<table width="100%" style="border:none">
                                  		<tr>
                                        	<td>
                                           	  	<fieldset>
                                                    <legend><strong>Transaction Recapitulation</strong></legend>
		                                            <table width="100%" style="border:none">
		                                            <tr>
		                                            	<th width="60%">&nbsp;</th>
		                                           	  <th width="20%"><div id="trx">Amount</div></th>
		                                           	  <th width="20%">Amount (<c:out value='${saleOrder.currency.symbol}'/>)</th>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Purchase : </td>
		                                                <td><input id="purchase" value="<fmt:formatNumber value='${salesAdapter.purchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="purchaseDef" value="<fmt:formatNumber value='${salesAdapter.defPurchase}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Satuan : </td>
		                                                <td><input id="discAmount1" value="<fmt:formatNumber value='${salesAdapter.discount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="discAmount1Def" value="<fmt:formatNumber value='${salesAdapter.defDiscount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Pelanggan : </td>
		                                                <td><input id="discAmount2" value="<fmt:formatNumber value='${salesAdapter.discountCustomer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="discAmount2Def" value="<fmt:formatNumber value='${salesAdapter.defDiscountCustomer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">DPP : </td>
		                                                <td><input id="dppAmount" value="<fmt:formatNumber value='${salesAdapter.dpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="dppAmountDef" value="<fmt:formatNumber value='${salesAdapter.defDpp}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">PPN : </td>
		                                                <td><input id="taxamount" value="<fmt:formatNumber value='${salesAdapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${salesAdapter.defTax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right"><strong>Total : </strong></td>
		                                                <td><input id="total" value="<fmt:formatNumber value='${salesAdapter.total}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="totalDef" value="<fmt:formatNumber value='${salesAdapter.defTotal}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                	</table>
                           	  	  </td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="unit" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                			<tr>
                                				<td width="15%" align="right">No Dokumen</td>
                                				<td width="35%">: <input value="${unitService.documentNo}" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama STNK</td>
                                				<td>: 
                                					<select class='combobox-ext'>
                                						<option value="${unitService.customerOwner.id}">${unitService.customerOwner.customer.name}</option>
                                					</select>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama Kontak</td>
                                				<td>: 
                                					<select class='combobox-ext'>
                                						<option value="${unitService.customerContact.id}">${unitService.customerContact.name}</option>
                                					</select>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">No Kendaraan</td>
                                				<td>: <input value="${unitService.customerOwner.plateNo}" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">No Rangka</td>
                                				<td>: <input value="${unitService.customerOwner.serialExt1}" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Jenis Sepeda Motor</td>
                                				<td>: <input value="${unitService.customerOwner.unitType}" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Tahun</td>
                                				<td>: <input value="${unitService.customerOwner.year}" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">KM</td>
                                				<td>: <input value="${unitService.distance}" disabled class='input-disabled'/></td>
                                			</tr>
                                		</table>
                                    </div>
                                    <div id="lineItemSparepart" dojoType="ContentPane" label="Transaksi Sparepart" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="itemTable_sparepart" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="20%" nowrap="nowrap">Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%" nowrap="nowrap">Harga</th>                                    
                                            <th width="10%" nowrap="nowrap">Sub Total</th>
                                            <th width="10%" nowrap="nowrap">Diskon Satuan</th>
                                            <th width="40%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
				                            <c:forEach items='${unitService.items}' var='item'>
				                            <c:if test="${item.price.product.productCategory.id != 4}">
				                            <tr>
				                            	<td nowrap="nowrap">${item.price.product.name}</td>
				                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
				                            	<td nowrap="nowrap">${item.price.product.unitOfMeasure.name}</td>
				                                <td><fmt:formatNumber value='${item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.quantity*item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.discount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${(item.quantity*item.price.money.amount)-item.discount}' pattern=',##0.00'/></td>
				                            </tr>
				                            </c:if>
				                            </c:forEach>
			                            </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="7">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="lineItemService" dojoType="ContentPane" label="Transaksi Service" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="itemTable_service" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="20%" nowrap="nowrap">Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%" nowrap="nowrap">Harga</th>                                    
                                            <th width="10%" nowrap="nowrap">Sub Total</th>
                                            <th width="10%" nowrap="nowrap">Diskon Satuan</th>
                                            <th width="40%">Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
				                            <c:forEach items='${unitService.items}' var='item'>
				                            <c:if test="${item.price.product.productCategory.id == 4}">
				                            <tr>
				                            	<td nowrap="nowrap">${item.price.product.name}</td>
				                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
				                            	<td nowrap="nowrap">${item.price.product.unitOfMeasure.name}</td>
				                                <td><fmt:formatNumber value='${item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.quantity*item.price.money.amount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${item.discount}' pattern=',##0.00'/></td>
				                                <td><fmt:formatNumber value='${(item.quantity*item.price.money.amount)-item.discount}' pattern=',##0.00'/></td>
				                            </tr>
				                            </c:if>
				                            </c:forEach>
			                            </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="7">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="detailService" dojoType="ContentPane" label="Detail Service" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="detailServiceTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="18%" nowrap="nowrap">Pekerjaan</th>
                                            <th width="20%" nowrap="nowrap">Dikerjakan Oleh</th>    
                                            <th width="10%" nowrap="nowrap">Jam Mulai</th>                                    
                                            <th width="50%" nowrap="nowrap">Jam Selesai</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${unitService.details}' var='serviceJob'>
                                        	<tr>
                                                <td nowrap="nowrap">
                                                	<select class='combobox-medium'>
                                						<option value="${serviceJob.unitServiceJob.id}">${serviceJob.unitServiceJob.jobName}</option>
                                					</select>
                                                </td>
                                                <td nowrap="nowrap">
                                                	<select class='combobox-medium'>
                                						<option value="${serviceJob.serviceBy.id}">${serviceJob.serviceBy.name}</option>
                                					</select>
                                                </td>
                                                <td><input type="text" value="${serviceJob.serviceStart}" disabled class="input-disabled"/></td>
                                                <td><input type="text" value="${serviceJob.serviceEnd}" disabled class="input-disabled"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="4">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="Payment" dojoType="ContentPane" label="Payment" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="paymentTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
											<th width="20%">Payment Type</th>
											<th width="15%">Reference</th>
											<th width="60%">Amount</th>
                                        </tr>
                                        </thead>
                                        <tbody>
				                            <c:forEach items='${unitService.applications}' var='app'>
				                            <tr>
				                            	<td nowrap="nowrap">${app.unitSalesPaymentProgram.name}</td>
				                            	<td nowrap="nowrap">${app.referenceCode}</td>
				                                <td><fmt:formatNumber value='${app.amount}' pattern=',##0.00'/></td>
				                            </tr>
				                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="3">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                </div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Unit Service Transaction',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e)
		{
			$.ajax({
				url:"<c:url value='/page/unitservicetransactionedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Service Transaction data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/unitservicetransactionview.htm'/>";
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
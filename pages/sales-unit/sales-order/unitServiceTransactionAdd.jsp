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
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='30'/></td>
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
                                            <td><input id="date" inputId="dateId" name="date" value="<fmt:formatDate value='${unitService.date}' pattern='dd/MM/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
										<tr>
											<td align="right">Shift :</td>
											<td><input value="${unitService.shift.code}" disabled class='input-disabled inputbox-ext'/></td>
										</tr>
										<tr>
											<td align="right">Cashier :</td>
											<td>
												<input value="${unitService.shift.cashierPerson.name}" disabled class='input-disabled inputbox-ext'/>
                                            	<input id="taxRate" type="hidden" value="${tax.taxRate}" size="5"/>
												<input type="hidden" id="currency" name="currency" value="1"/>
												<input type="hidden" id="type" name="exchangeType" value="SPOT"/>
											</td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Sales Person :</td>
                                            <td>
                                                <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext">
                                                    <c:if test='${not empty unitService.salesPerson}'>
                                                        <form:option value='${unitService.salesPerson.id}' label='${unitService.salesPerson.firstName} ${unitService.salesPerson.lastName} ${unitService.salesPerson.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                              	<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesPerson'/>');" style="CURSOR:pointer;" title="Salesman" />
                                            </td>
                                        </tr>
										<tr>
											<td align="right">Jam Masuk :</td>
											<td><input type="text" name="admissionTime" id="admissionTime" inputId="admissionTimeId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
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
		                                           	  <th width="20%">Amount (<c:out value='${currency.symbol}'/>)</th>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Purchase : </td>
		                                                <td><input id="purchase" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="purchaseDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Satuan : </td>
		                                                <td><input id="discAmount1" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="discAmount1Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Discount Pelanggan : </td>
		                                                <td><input id="discAmount2" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="discAmount2Def" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">DPP : </td>
		                                                <td><input id="dppAmount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="dppAmountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">PPN : </td>
		                                                <td><input id="taxamount" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td><input id="taxamountDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right"><strong>Total : </strong></td>
		                                                <td><input id="total" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/></td>
		                                                <td>
		                                                	<input id="totalDef" value="0.00" class="input-disabled" disabled style="text-align:right" size="10"/>
		                                                	<input id="totalPaymentAmount" name="amount" type="hidden" value="0.00" size="10"/>
		                                                </td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right"><strong>Bayar : </strong></td>
		                                                <td colspan="2">
		                                                	<input id="paidAmount" value="0.00" class="input-disabled" disabled style="text-align:right" size="31"/>
		                                                	<input id="totalPaidAmount" name="paidAmount" type="hidden" value="0.00" size="10"/>
		                                                </td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right"><strong>Kembalian : </strong></td>
		                                                <td colspan="2"><input id="change" value="0.00" class="input-disabled" disabled style="text-align:right" size="31"/></td>
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
                                				<td width="35%">: <input id="documentNo" name="documentNo"/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama STNK</td>
                                				<td>: 
                                					<select id='customerOwner' name='customerOwner' class='combobox-ext'>
                                						<option value="0">---Nama STNK---</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerOwner('customerOwner');" style="CURSOR:pointer;" title="Customer" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomerTransaction('customerOwner');" style="CURSOR:pointer;" title="Customer" />
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama Kontak</td>
                                				<td>: 
                                					<select id='customerContact' name='customerContact' class='combobox-ext'>
                                						<option value="0">---Nama Kontak---</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomer('customerContact');" style="CURSOR:pointer;" title="Customer" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomer('customerContact');" style="CURSOR:pointer;" title="Customer" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomerInstant('mediator');" style="CURSOR:pointer;" title="Customer Instant" />
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">No Kendaraan</td>
                                				<td>: <input id="plateNumber" name="plateNo" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">No Rangka</td>
                                				<td>: <input id="serialExt1" name="serialExt1" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Jenis Sepeda Motor</td>
                                				<td>: <input id="unitType" name="unitType" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Tahun</td>
                                				<td>: <input id="year" name="year" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">KM</td>
                                				<td>: <input id="distance" name="distance"/></td>
                                			</tr>
                                		</table>
                                    </div>
                                    <div id="lineItemSparepart" dojoType="ContentPane" label="Transaksi Sparepart" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem('itemTable_sparepart');"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('itemTable_sparepart')"><span>Delete Row</span></a>
                                        	<div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="itemTable_sparepart" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster_sparepart" id="checkMaster_itemTable_sparepart" onclick="clickAll('itemTable_sparepart');"/></th>
                                            <th colspan="2" nowrap="nowrap">Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">Stock</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%" nowrap="nowrap">Gudang</th>    
                                            <th width="10%" nowrap="nowrap">Harga</th>                                    
                                            <th width="10%" nowrap="nowrap">Sub Total</th>
                                            <th width="10%" nowrap="nowrap">Diskon Satuan</th>
                                            <th width="10%">Total</th>
                                        	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="12">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
                                    </div>
                                    <div id="lineItemService" dojoType="ContentPane" label="Transaksi Service" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem('itemTable_service');"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('itemTable_service')"><span>Delete Row</span></a>
                                        	<div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="itemTable_service" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="2%"><input type="checkbox" name="checkMaster_service" id="checkMaster_itemTable_service" onclick="clickAll('itemTable_service');"/></th>
                                            <th colspan="2" nowrap="nowrap">Product</th>
                                            <th width="8%">Qty</th>
                                            <th width="8%">Stock</th>
                                            <th width="8%">UoM</th>
                                            <th width="10%" nowrap="nowrap">Gudang</th>    
                                            <th width="10%" nowrap="nowrap">Harga</th>                                    
                                            <th width="10%" nowrap="nowrap">Sub Total</th>
                                            <th width="10%" nowrap="nowrap">Diskon Satuan</th>
                                            <th width="10%">Total</th>
                                        	<th width="1%">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="12">&nbsp;</td>
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
                                        <c:forEach items='${serviceJobs}' var='serviceJob' varStatus="status">
                                        	<tr>
                                                <td nowrap="nowrap">
                                                	<select id='job[${status.count}]' name='jobs' class='combobox-medium'>
                                						<option value="${serviceJob.id}">${serviceJob.jobName}</option>
                                					</select>
                                                </td>
                                                <td nowrap="nowrap">
                                                	<select id='serviceBy[${status.count}]' name='serviceBys' class='combobox-medium'>
                                						<option value="0"></option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openMechanicByOrg('serviceBy[${status.count}]');" style="CURSOR:pointer;" title="Mechanic" />
                                                </td>
                                                <td><input type="text" name="serviceStarts" id="serviceStart[${status.count}]" inputId="serviceStartId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
                                                <td><input type="text" name="serviceEnds" id="serviceEnd[${status.count}]" inputId="serviceEndId" dojotype="dropdowntimepicker" displayformat="HH:mm" saveformat="HH:mm" value="<fmt:formatDate value='<%= new java.util.Date() %>' pattern='HH:mm' />" lang="en-us"/></td>
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
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addPayment();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('paymentTable')"><span>Delete Row</span></a>
                                        	<div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="paymentTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster_paymentTable" onclick="clickAll('paymentTable');"/></th>
											<th width="15%" colspan="2" nowrap="nowrap">Metoda Pembayaran</th>
											<th width="15%" nowrap="nowrap">Referensi</th>
											<th width="70%" nowrap="nowrap">Jumlah</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="5">&nbsp;</td>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sparepart Sales Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/unitservicetransactionadd.htm'/>",
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
			}
		});
	});
	
	function validation()
	{
		if($('#documentNo').val() == '')
		{
			alert('No Dokumen tidak boleh kosong !!!');
			return;
		}
		
		if($('#customerOwner').val() == '0')
		{
			alert('Pilih Nama STNK terlebih dahulu !!!');
			return;
		}
		
		if($('#customerContact').val() == '0')
		{
			alert('Pilih Nama Kontak terlebih dahulu !!!');
			return;
		}
		
		if($('#distance').val() == '')
		{
			alert('KM tidak boleh kosong !!!');
			return;
		}

		var tbl = document.getElementById("itemTable_sparepart");
		var tblService = document.getElementById("itemTable_service");
		if(tbl && tblService)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
			
			var t_section_service = tblService.tBodies[0];
			var len_service = t_section_service.rows.length;
			
			if(len == 0 && len_service == 0)
			{
				alert('You need to provide Line Item or Service first before saving the transaction!');
				return;
			}
			
			for(var idx=len-1;idx>=0;idx--)
			{
				var product = t_section.rows[idx].cells[1].firstChild.value;
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var disc1 = parseFloat(t_section.rows[idx].cells[10].firstChild.value);
				
				if(product == '' || product == '0')
				{
					alert('Line Item Product cant be empty!');
					return;
				}

				if(quantity == '' || quantity <= '0')
				{
					alert('Line Item Quantity cannot be empty & must be greater than zero !!!');
					return;
				}
				
				if(disc1 == '' || disc1 < '0')
				{
					disc1 = 0;
				}
			}
			
			for(var idx=len_service-1;idx>=0;idx--)
			{
				var product = t_section_service.rows[idx].cells[1].firstChild.value;
				var quantity = parseFloat(t_section_service.rows[idx].cells[3].firstChild.value);
				var disc1 = parseFloat(t_section_service.rows[idx].cells[10].firstChild.value);
				
				if(product == '' || product == '0')
				{
					alert('Line Item Product cant be empty!');
					return;
				}

				if(quantity == '' || quantity <= '0')
				{
					alert('Line Item Quantity cannot be empty & must be greater than zero !!!');
					return;
				}
				
				if(disc1 == '' || disc1 < '0')
				{
					disc1 = 0;
				}
			}
		}
		
		var tblPayment = document.getElementById("paymentTable");
		if(tblPayment)
		{
			var t_section = tblPayment.tBodies[0];
			var len = t_section.rows.length;
			
			if(len == 0)
			{
				alert('You need to provide Payment first before saving the transaction!');
				return;
			}
			
			for(var idx=len-1;idx>=0;idx--)
			{
				var type = t_section.rows[idx].cells[1].firstChild.value;
				var amt = parseFloat(t_section.rows[idx].cells[4].firstChild.value);
				
				if(type == '' || product == null)
				{
					alert('Payment Type cannot be empty!');
					return;
				}

				if(amt == '' || amt <= '0')
				{
					alert('Payment Amount cannot be empty & must be greater than zero !!!');
					return;
				}
			}
		}
		
		/* var total = parseFloat($('#total').val().replace(/,/g,''));
		var tPaymentAmt = parseFloat($('#totalPaymentAmount').val().replace(/,/g,''));
		if(tPaymentAmt != total)
		{
			alert('Total pembayaran tidak sama dengan jumlah transaksi !!!');
			return;
		} */
		
		var change = parseFloat($('#change').val().replace(/,/g,''));
		if(change < 0)
		{
			alert('Total pembayaran kurang dari jumlah transaksi !!!');
			return;
		}

		return true;
	}

	function opensales(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}

		openpopup("<c:url value='/page/popupsalespersonview.htm?target="+target+"&organization='/>"+org.value);
	}

	function addCustomer(target)
	{
		openpopup("<c:url value='/page/customerpreaddpopup.htm?target='/>"+target);
	}

	function addCustomerInstant(target)
	{
		openpopup("<c:url value='/page/customerinstantpreaddpopup.htm?target='/>"+target);
	}

	function addCustomerTransaction(target)
	{
		openpopup("<c:url value='/page/customertransactionpreaddpopup.htm?target='/>"+target);
	}

	function display()
	{
		var taxrate=document.getElementById("taxRate").value;
		
		var purchase = document.getElementById('purchase');
		var purchaseDef = document.getElementById('purchaseDef');
		var totalDisc1 = document.getElementById('discAmount1');
		var totalDisc1Def = document.getElementById('discAmount1Def');
		var totalDisc2 = document.getElementById('discAmount2');
		var totalDisc2Def = document.getElementById('discAmount2Def');
		var dpp = document.getElementById('dppAmount');
		var dppDef = document.getElementById('dppAmountDef');
		var tax = document.getElementById('taxamount');
		var taxDef = document.getElementById('taxamountDef');
		var total = document.getElementById('total');
		var totalDef = document.getElementById('totalDef');
		var totalPaymentAmount = document.getElementById('totalPaymentAmount');
		var paidAmount = document.getElementById('paidAmount');
		var totalPaidAmount = document.getElementById('totalPaidAmount');
		var change = document.getElementById('change');
		
		var purchaseAmount = 0;
		var totalDisc1Amount = 0;
		var totalDisc2Amount = 0;
		var dppAmount = 0;
		var taxAmount = 0;
		var totalAmount = 0;
		
		var tbl = document.getElementById("itemTable_sparepart");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
			{
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[7].firstChild.value.replace(/,/g,''));
				var amount = t_section.rows[idx].cells[8].firstChild;
				var disc1 = parseFloat(t_section.rows[idx].cells[9].firstChild.value.replace(/,/g,''));
				var tAmount = t_section.rows[idx].cells[10].firstChild;
				
				purchaseAmount = purchaseAmount + (quantity*price);
				totalDisc1Amount = totalDisc1Amount + disc1;
				totalAmount = purchaseAmount - (totalDisc1Amount+totalDisc2Amount);
				
				amount.value = (quantity*price).numberFormat('#,###');
				tAmount.value = ((quantity*price)-(disc1)).numberFormat('#,###');
			}
		}
		
		var tbl = document.getElementById("itemTable_service");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
			{
				var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
				var price = parseFloat(t_section.rows[idx].cells[7].firstChild.value.replace(/,/g,''));
				var amount = t_section.rows[idx].cells[8].firstChild;
				var disc1 = parseFloat(t_section.rows[idx].cells[9].firstChild.value.replace(/,/g,''));
				var tAmount = t_section.rows[idx].cells[10].firstChild;
				
				purchaseAmount = purchaseAmount + (quantity*price);
				totalDisc1Amount = totalDisc1Amount + disc1;
				totalAmount = purchaseAmount - (totalDisc1Amount+totalDisc2Amount);
				
				amount.value = (quantity*price).numberFormat('#,###');
				tAmount.value = ((quantity*price)-(disc1)).numberFormat('#,###');
			}
		}
		
		purchase.value = purchaseAmount.numberFormat('#,###');
		purchaseDef.value = purchaseAmount.numberFormat('#,###');
		totalDisc1.value = totalDisc1Amount.numberFormat('#,###');
		totalDisc1Def.value = totalDisc1Amount.numberFormat('#,###');
		totalDisc2.value = totalDisc2Amount.numberFormat('#,###');
		totalDisc2Def.value = totalDisc2Amount.numberFormat('#,###');
		dpp.value = totalAmount.numberFormat('#,###');
		dppDef.value = totalAmount.numberFormat('#,###');
		tax.value = Math.round(parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		taxDef.value = Math.round(parseFloat(dpp.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,###');
		total.value = (parseFloat(dpp.value.replace(/,/g,''))+parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,###');
		totalDef.value = (parseFloat(dpp.value.replace(/,/g,''))+parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,###');

		var totalPaymentAmt = 0;
		var tblPayment = document.getElementById("paymentTable");
		if(tblPayment)
		{
			var t_section = tblPayment.tBodies[0];
			var len = t_section.rows.length;
				
			for(var idx=len-1;idx>=0;idx--)
			{
				var amt = parseFloat(t_section.rows[idx].cells[4].firstChild.value.replace(/,/g,''));
				
				totalPaymentAmt = totalPaymentAmt + amt;
			}
		}
		totalPaymentAmount.value = totalPaymentAmt.numberFormat('#,###');
		paidAmount.value = totalPaymentAmt.numberFormat('#,###');
		totalPaidAmount.value = totalPaymentAmt
		if(totalPaymentAmt > 0)
			change.value = (totalPaymentAmt-parseFloat(total.value.replace(/,/g,''))).numberFormat('#,###');
		else
			change.value = new Number(0);
	}
	
	function setCustomerType(type, discount)
	{
		$("#customerType").val(type);
		$("#discountRate").val(discount);
	}

	var index = 0;
	
	function addLineItem(table)
	{
		var popupVal = "";
		if(table == 'itemTable_sparepart')
			popupVal = "sparepart";
		else
			popupVal = "service";
		var tbl = document.getElementById(table);
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				/* if(t_section.rows.length > 0 )
					index = t_section.rows.length+1; */
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCheck(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index, popupVal));
				row.insertCell(3).appendChild(genQty(index));
				row.insertCell(4).appendChild(genStock(index));
				row.insertCell(5).appendChild(genUom(index));
				row.insertCell(6).appendChild(genWarehouse(index));
				row.insertCell(7).appendChild(genPrice(index));
				row.insertCell(8).appendChild(genSubTotal(index));
				row.insertCell(9).appendChild(genDisc1(index));
				row.insertCell(10).appendChild(genTotal(index));
				row.insertCell(11).appendChild(genHiddenPrice(index));
				
				index++;
			}
		}
	}
							
	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		
		return check;
	}

	function genProduct(index)
	{
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-medium');

		return itemx;
	}

	function genPopup(index, popupVal)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '') {
				alert('Please select Organization first !!!');
				return;
			}

			var _date=document.getElementById("dateId").value;
			var currency = document.getElementById('currency');
			var type = document.getElementById('type');
			var target="product["+index+"]";
			
			if(popupVal == "sparepart")
				openpopup("<c:url value='/page/popupproductonhandstockbycategoryview.htm?target='/>"+target+"&index="+index+"&organization="+org.value+"&categoryId=2&active=true");
			else
				openpopup("<c:url value='/page/popupproductview.htm?target='/>"+target+"&index="+index+"&organization="+org.value+"&categoryId=4&active=true");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Price';

		return _popup;

	}
	
	function genQty(index)
	{
		var quantity = document.createElement("input");
		quantity.type = "text";
		quantity.name = "quantitys";
		quantity.id = "quantity["+index+"]";
		quantity.setAttribute('size',"6");
		quantity.value = "0";
		quantity.setAttribute('onblur','display()');
		
		return quantity;
	}
	
	function genStock(index)
	{
		var stock = document.createElement("input");
		stock.type = "text";
		stock.id = "av["+index+"]";
		stock.setAttribute('size',"6");
		stock.value = "0";
		stock.setAttribute('class','input-disabled');
		stock.disabled = true;
		
		return stock;
	}
	
	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "product["+index+"]-uom";
		uom.setAttribute('size',"20");
		uom.setAttribute('class','input-disabled');
		uom.disabled = true;
		
		return uom;
	}

	function genWarehouse(index)
	{
		var warehouse = document.createElement("select");
		warehouse.name="grids";
		warehouse.id="grid["+index+"]";
		warehouse.setAttribute('class','combobox-medium');

		return warehouse;
	}
	
	function genPrice(index)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.id = "price["+index+"]";
		price.setAttribute('size',"20");
		price.value = "0";
		price.setAttribute('onkeyup',"separator('price["+index+"]');");
		price.setAttribute('onblur','display();');
		price.setAttribute('onchange','display();');
		
		return price;
	}

	function genHiddenPrice(index)
	{
		var price = document.createElement("input");
		price.type = "hidden";
		price.name = 'prices';
		price.id = "pricehidden["+index+"]";

		return price;
	}
	
	function genSubTotal(index)
	{
		var sub = document.createElement("input");
		sub.type = "text";
		sub.id = "subTotal["+index+"]";
		sub.setAttribute('size',"20");
		sub.value = "0";
		sub.setAttribute('class','input-disabled');
		sub.disabled = true;
		
		return sub;
	}
	
	function genDisc1(index)
	{
		var disc = document.createElement("input");
		disc.type = "text";
		disc.name = 'discounts';
		disc.id = "disc1["+index+"]";
		disc.setAttribute('size',"10");
		disc.value = "0";
		disc.setAttribute('onblur','display();');
		disc.setAttribute('onkeyup',"separator('disc1["+index+"]');");
		
		return disc;
	}
	
	function genTotal(index)
	{
		var total = document.createElement("input");
		total.type = "text";
		total.id = "total["+index+"]";
		total.setAttribute('size',"20");
		total.value = "0";
		total.setAttribute('class','input-disabled');
		total.disabled = true;
		
		return total;
	}
	
	function setPrice(index)
	{
		var orgId = $("#org").val();
		var productId = $("#product\\["+index+"\\]").val();
		
		$.get("<c:url value='/page/productstandardpriceremote.getbuyingprice.json'/>",{org:orgId,product:productId},
		function(json)
		{
			$("#price\\["+index+"\\]").val(new Number(json.price).numberFormat("#,###"));
			$("#pricehidden\\["+index+"\\]").val(new Number(json.price));
		});
	}
	
	function separator(id)
	{
		var amount = document.getElementById(id);
		
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
		}
	}

	var paymentIndex = 0;
	
	function addPayment()
	{
		var tbl = document.getElementById("paymentTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					paymentIndex = t_section.rows.length+1;
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCheckPayment(paymentIndex));
				row.insertCell(1).appendChild(genPaymentType(paymentIndex));
				row.insertCell(2).appendChild(genPopupPayment(paymentIndex));
				row.insertCell(3).appendChild(genReference(paymentIndex));
				row.insertCell(4).appendChild(genAmountPayment(paymentIndex));
				
				paymentIndex++;
			}
		}
	}

	function genCheckPayment(paymentIndex)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "checkPayment";
		check.id = "checkPayment["+paymentIndex+"]";
		
		return check;
	}

	function genPaymentType(paymentIndex)
	{
		var payment = document.createElement("select");
		payment.name="paymentTypes";
		payment.id="paymentType["+paymentIndex+"]";
		payment.setAttribute('class','combobox-ext');

		return payment;
	}

	function genPopupPayment(paymentIndex)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_payment['+paymentIndex+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '') {
				alert('Please select Organization first !!!');
				return;
			}
			var target="paymentType["+paymentIndex+"]";
			openpopup("<c:url value='/page/popuppaymentprogramview.htm?target='/>"+target+"&index="+paymentIndex+"&organization="+org.value+"&type=SERVICE");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Payment';

		return _popup;

	}
	
	function genReference(paymentIndex)
	{
		var reference = document.createElement("input");
		reference.type = "text";
		reference.name = "references";
		reference.id = "reference["+paymentIndex+"]";
		reference.setAttribute('class','inputbox-medium');
		
		return reference;
	}
	
	function genAmountPayment(paymentIndex)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.name = 'paymentAmounts';
		amount.id = "paymentAmount["+paymentIndex+"]";
		amount.setAttribute('size',"15");
		amount.value = "0";
		amount.setAttribute('onblur','display();');
		amount.setAttribute('onkeyup',"separator('paymentAmount["+paymentIndex+"]');");
		
		return amount;
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="unitinvoice.htmltitle"/></title>
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
			<td width="60%"><spring:message code="unitinvoice.breadcrumb"/></td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="unitinvoice.title"/></h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/unitinvoiceverificationview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" next='DONE' style="cursor:pointer;"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification" enctype="multipart/form-data">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right"><spring:message code="id"/></td>
                                          <td width="72%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification.organization}'>
                                                        <form:option value='${verification.organization.id}' label='${verification.organization.code} ${verification.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td nowrap="nowrap" align="right">Gudang Penerimaan :</td>
                                            <td>
                                                <form:select id="loc" path="location" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification.location}'>
                                                        <form:option value='${verification.location.id}' label='${verification.location.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openFacility('loc');" style="CURSOR:pointer;" title="Gudang" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${verification.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Pemasok :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty requisition.supplier}'>
                                                        <form:option value='${requisition.supplier.id}' label='${requisition.supplier.firstName} ${requisition.supplier.lastName} ${requisition.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Pemasok" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No.Nota Debit :</td>
                                            <td><form:input path='invoice' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal Jatuh Tempo :</td>
                                            <td><input id="receivedDate" inputId="dueDate" name="dueDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                         </tr>
                                        <tr>
                                            <td align="right">Mata Uang :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                <option value="0">-</option>
                                                <c:forEach items='${currencys}' var='currency'>
                                                    <form:option value='${currency.id}' label='${currency.symbol}' />
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="0"/>
                                                <input id="exchangeRate" name="exchange" type="hidden"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tipe Pajak :</td>
                                            <td>
                                            	<input type="hidden" id="unitdiscount" value="<fmt:formatNumber value='${verification.discount.amount}' pattern="#,###.00"/>"/>
                                            	<input type="hidden" id="unitdiscountId" name="discount" value="${verification.discount.id}"/>
                                                <form:select id='taxType' path='tax'>
                                                	<form:option label='-' value="0" onclick="javascript:document.getElementById('taxRate').value = 0;display();"
                                                    	onkeyup="javascript:document.getElementById('taxRate').value = 0;display();"/>
                                                	<c:forEach items='${taxes}' var='tax'>
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Import File :</td>
                                            <td>
                                           		<input type="file" id="fileImport" name="fileImport"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Catatan :</td>
                                            <td><form:textarea path='note' cols='55' rows='6'/></td>
                                        </tr>
                                        </table>
                                    </td>
                       		  		<td width="41%" valign="top">
										<fieldset>
                                       		<legend><strong>Rekap Transaksi</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                            	<th width="60%">&nbsp;</th>
                                           	  	<th width="20%"><div id="trx">Jumlah</div></th>
                                           	  	<th width="20%">Jumlah (<c:out value='${default.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Transaksi : </td>
                                                <td><input id="transaction" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="transactionDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Potongan Harga Satuan :</td>
                                                <td><input id="discount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Potongan Harga Lain-Lain :</td>
                                                <td><input id="otherdisc" name="rounding" value="0.0" style="text-align:right" size="13" onblur="display();"/></td>
                                                <td><input id="otherdiscDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">DPP :</td>
                                                <td><input id="nett" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="neffDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">PPN :</td>
                                                <td><input id="tax" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total :</td>
                                                <td>
                                                	<input id="total" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/>
                                                	<input type="hidden" id="totalsisa" name="totalsisa" class="input-disabled" size="13"/>
                                                </td>
                                                <td><input id="totalDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                <div id="info" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="javascript:addLineItem();"><span>Tambah</span></a>
                                         <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="2%"><input type="hidden" name="checkMaster" id="checkMaster_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                        <th colspan="1"><spring:message code='product'/></th>
                                        <th width="7%"><spring:message code="type"/></th>
                                        <th width="15%"><spring:message code="typename"/></th>
                                        <th width="15%"><spring:message code="color"/></th>
                                        <th width="7%"><spring:message code="year"/></th>
                                        <th width="5%"><spring:message code="quantity"/></th>
                                        <th width="10%"><spring:message code="price"/></th>
                                        <th width="7%"><spring:message code="discount"/></th>
                                        <th width="11%" colspan="2"><spring:message code="total"/></th>
                                        <th width="1%">&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="14">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
                                 <%-- <div id="otherdiscPane" dojoType="ContentPane" label="Potongan Harga" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="javascript:addDisc();"><span>Tambah</span></a>
                                        <a class="item-button-delete" href="javascript:deleteRow('otherdisctable')"><span>Hapus</span></a>
                                         <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" id="otherdisctable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_otherdisctable" onclick="clickAll('otherdisctable');"/></th>
                                        <th><spring:message code="type"/></th>
                                        <th width="50%"><spring:message code="amount"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div> --%>
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
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function()
	{
		$("#currency").change(function()
		{
			var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
			$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});
			var data={organization:$("#org").val(),supplier:$("#supplier").val(),date:$("#inputDate").val()}
			$.get("<c:url value='/page/unitinvoiceverificationremote.loaddiscount.json'/>",data,function(json){$("#unitdiscount").val(json.discount.amount);$("#unitdiscountId").val(json.discount.id);});
			
			display();
		});

		$('.item-button-save').click(function(e)
		{
			if(validation()) 
			{
				var amt = $('#totalsisa').val();
				
				if(parseFloat(amt) < 0)
				{
					var $dialog_confirm = $('<div title="Konfirmasi Limit Plafon"></div>')
						.html('Jumlah plafon telah melebihi limit, lanjutkan transaksi ?');
						
					$dialog_confirm.dialog({
						resizable: false,
						height:140,
						modal: true,
						buttons: {
							"Yes": function()
							{
								$( this ).dialog( "close" );
								$("#addForm").ajaxSubmit({
									url:"<c:url value='/page/unitinvoiceverificationadd.htm'/>",
									beforeSend:function()
									{
										$dialog.empty();
										$dialog.html('Saving Unit Nota Debet Verification data......');
										$dialog.dialog('open');
									},
									success : function(json)
									{
										json=$.parseJSON(json.replace(/<\/?[^>]+>/gi, ''));
										if(json)
										{
											if(json.status == 'OK')
											{
												$dialog.dialog('close');
												window.location="<c:url value='/page/unitinvoiceverificationview.htm'/>";
											}
											else
											{
												$dialog.empty();
												$dialog.html('Proccess fail,reason :<br/>'+json.message);
											}
										}
									}
								});
							},
							"No": function()
							{
								$( this ).dialog( "close" );
								window.location="<c:url value='/page/unitinvoiceverificationview.htm'/>";
							}
						}
					});
				}
				else
				{
					$("#addForm").ajaxSubmit({
						url:"<c:url value='/page/unitinvoiceverificationadd.htm'/>",
						beforeSend:function()
						{
							$dialog.empty();
							$dialog.html('Saving Unit Nota Debet Verification data......');
							$dialog.dialog('open');
						},
						success : function(json)
						{
							json=$.parseJSON(json.replace(/<\/?[^>]+>/gi, ''));
							if(json)
							{
								if(json.status == 'OK')
								{
									$dialog.dialog('close');
									window.location="<c:url value='/page/unitinvoiceverificationview.htm'/>";
								}
								else
								{
									$dialog.empty();
									$dialog.html('Proccess fail,reason :<br/>'+json.message);
								}
							}
						}
					});
				}
			}
		});
	});

	function validation()
	{
		var org = document.getElementById('org').value;
		if(org == null || org == '')
		{
			alert('Please select Organization first !!!');
			return;
		}
		
		var loc = document.getElementById('loc').value;
		if(loc == null || loc == '')
		{
			alert('Please select Warehouse first !!!');
			return;
		}

		var date = document.getElementById('inputDate').value;
		if(date == null || date == '')
		{
			alert('Verification Date cannot be empty !!!');
			return;
		}

		var supplier = document.getElementById('supplier').value;
		if(supplier == null || supplier == '')
		{
			alert('Please select Supplier first !!!');
			return;
		}

		var invoice = document.getElementById('invoice').value;
		if(invoice == null || invoice == '')
		{
			alert('No Nota Debit cannot be empty !!!');
			return;
		}

		var duedate = document.getElementById('dueDate').value;
		if(duedate == null || duedate == '')
		{
			alert('Due Date cannot be empty !!!');
			return;
		}

		var cur = document.getElementById('currency').value;
		if(cur == null || cur == '0')
		{
			alert('Please select Currency first !!!');
			return;
		}

		var tax = document.getElementById('taxType').value;
		if(tax == null || tax == '0')
		{
			alert('Please select Tax Type first !!!');
			return;
		}

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Transaction Item first before saving the transaction!');
				return;
			}

			for(var i=0;i<len;i++)
			{
				var product = document.getElementById("product["+i+"]").value;
				if(product == null || product == '') {
					alert('Please select Product first!');
					return;
				}

				var qty = parseFloat(document.getElementById("received["+i+"]").value);
				if(qty <= 0)
				{
					alert('Product Quantity must be greater than 0!');
					return;
				}

				var price = parseFloat(document.getElementById("price["+i+"]").value);
				if(price <= 0)
				{
					alert('Product Price must be greater than 0!');
					return;
				}
			}
		}

		return true;
	}

	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&personal=true&organization='/>"+org.value);
	}

	function separator(id)
	{
		var amount = document.getElementById(id);

		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}

	var index = 0;
	function addLineItem()
	{
		var data = new FormData();
		jQuery.each($('#fileImport')[0].files, function(i, file) {
			if(i==0)
		    	data.append('fileImport', file);
			else
				data.append('fileImport-'+i, file);
		});
		data.append('supplier',$("#supplier").val());
		data.append('org',$("#org").val());
		$.ajax({
			url:"<c:url value='/page/unitinvoiceverificationremote.loaditems.json'/>",
			data:data,
			type : 'POST',
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
						var tbl = document.getElementById("lineItemTable");
						if(tbl)
						{
							var t_section = tbl.tBodies[0];
							var len = t_section.rows.length;

							if(len > 0) {
								for(var idx=len-1;idx>=0;idx--)
								{
									t_section.deleteRow(idx);
								}
							}
						}
						$.each(json.items,function(idx,val){
							var tbl = document.getElementById("lineItemTable");
							if(tbl)
							{
								var t_section = tbl.tBodies[0];
								if(t_section)
								{
									if(t_section.rows.length > 0 )
										index = t_section.rows.length;

									var row = t_section.insertRow(t_section.rows.length);
									row.insertCell(0).appendChild(genCheck(index));
									row.insertCell(1).appendChild(genProduct(index,val.productId,val.productName));
									row.insertCell(2).appendChild(genType(index,val.type));
									row.insertCell(3).appendChild(genTypeName(index,val.typename));
									row.insertCell(4).appendChild(genColor(index,val.color));
									row.insertCell(5).appendChild(genYear(index,val.year));
									row.insertCell(6).appendChild(genQty(index,val.qty));
									row.insertCell(7).appendChild(genPrice(index,val.price));
									row.insertCell(8).appendChild(genDisc(index,val.disc));
									row.insertCell(9).appendChild(genSub(index,val.sub));
									row.insertCell(10).appendChild(genSerial(index,val.serials));
									index++;
								}
							}
						});

						calculateSubTotal();
					}
					else
					{
						$dialog.empty();
						$dialog.html('Proccess fail,reason :<br/>'+json.message);
					}
				}
			}
		});
	}

	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "hidden";
		check.name = "check";
		check.id = "check";
		
		return check;
	}

	function genProduct(index,id,text)
	{
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext input-disabled');

		var opt=document.createElement("option");
		opt.value=id;
		opt.text=text;
		itemx.appendChild(opt);
		
		return itemx;
	}

	function genType(index,val)
	{
		var producttype = document.createElement("input");
		producttype.type = "text";
		producttype.id = "type["+index+"]";
		producttype.setAttribute('size',"18");
		producttype.value = val;
		producttype.setAttribute('class','input-disabled');
		producttype.disabled = true;

		return producttype;
	}

	function genTypeName(index,val)
	{
		var producttypename = document.createElement("input");
		producttypename.type = "text";
		producttypename.id = "typename["+index+"]";
		producttypename.setAttribute('size',"18");
		producttypename.value = val;
		producttypename.setAttribute('class','input-disabled');
		producttypename.disabled = true;

		return producttypename;
	}

	function genColor(index,val)
	{
		var productcolor = document.createElement("input");
		productcolor.type = "text";
		productcolor.id = "color["+index+"]";
		productcolor.setAttribute('size',"17");
		productcolor.value = val;
		productcolor.setAttribute('class','input-disabled');
		productcolor.disabled = true;

		return productcolor;
	}

	function genYear(index,val)
	{
		var productyear = document.createElement("input");
		productyear.type = "text";
		productyear.id = "color["+index+"]";
		productyear.setAttribute('size',"10");
		productyear.value = val;
		productyear.setAttribute('class','input-disabled');
		productyear.disabled = true;

		return productyear;
	}

	function genQty(index,val)
	{
		var received = document.createElement("input");
		received.type = "text";
		received.name = "receiveds";
		received.id = "received["+index+"]";
		received.setAttribute('size',"4");
		received.value = val;
		received.setAttribute('onchange','display()');
		received.readOnly=true;
		received.setAttribute('class','input-disabled');
		
		return received;
	}

	function genPrice(index,val)
	{
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'prices';
		price.id = "price["+index+"]";
		price.setAttribute('size',"11");
		price.value = val.numberFormat('#,#');
		price.setAttribute('onblur','calculateSubTotal();separator("price['+index+']");');
		price.setAttribute('onkeyup','calculateSubTotal();separator("price['+index+']");');

		return price;
	}

	function genDisc(index,val)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.name="discs";
		amount.id = "disc["+index+"]";
		amount.setAttribute('size',"11");
		amount.value = val;
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}

	function genSub(index,val)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "subtotal["+index+"]";
		amount.name = "subtotals";
		amount.setAttribute('size',"11");
		amount.value = val;
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}

	function genSerial(index,val)
	{
		var amount = document.createElement("input");
		amount.type = "hidden";
		amount.name="serials";
		amount.value = val;

		return amount;
	}

	function calculateSubTotal()
	{
		var receiveds=document.getElementsByName("receiveds");
		var subtotals=document.getElementsByName("subtotals");
		var disc=document.getElementsByName("discs");
		var unitdisc=document.getElementById("unitdiscount").value;
		for(var x=0;x<receiveds.length;x++){
			var received=document.getElementById('received['+x+']').value;
			var price=document.getElementById('price['+x+']').value.replace(/,/g,'');
			subtotals[x].value=(price*received).numberFormat('#,#.00');
			disc[x].value=(Math.round(Math.round((((unitdisc*price*14)/(360*100)))*100)/100)*received).numberFormat('#,#.00');
		}
		display();
	}

	function display()
	{
		var transaction=document.getElementById("transaction");
		var transactionDef=document.getElementById("transactionDef");
		var exchange=document.getElementById("trxrate").value;
		var otherDiscount=document.getElementById("otherdisc");
		var otherDiscountDef=document.getElementById("otherdiscDef");
		var Nett=document.getElementById("nett");
		var NettDef=document.getElementById("neffDef");
		var tax=document.getElementById("tax");
		var taxDef=document.getElementById("taxDef");

		var total=document.getElementById("total");
		var totalDef=document.getElementById("totalDef");

		var subtotals=document.getElementsByName("subtotals");
		var amounts=document.getElementsByName("amounts");
		var discs=document.getElementsByName("discs");
		var discount=document.getElementById("discount");
		var discountDef=document.getElementById("discountDef");
		var discx = 0;
		var discDef = 0;
		for(var X=0;X<discs.length;X++){
			discx = parseFloat(discx)+parseFloat(discs[X].value.replace(/,/g,''));
			discDef = parseFloat(discx)*exchange;
		}
		discount.value=discx.numberFormat('#,#.00');
		discountDef.value=discDef.numberFormat('#,#.00');

		var trx = 0;
		var trxDef = 0;

		for(var i=0;i<subtotals.length;i++){
			trx=parseFloat(trx)+parseFloat(subtotals[i].value.replace(/,/g,''));
			trxDef=parseFloat(trx)*exchange;

		}

		transaction.value=trx.numberFormat('#,#.00');
		transactionDef.value=trxDef.numberFormat('#,#.00');

		var otherDisc=parseFloat(otherDiscount.value.replace(/,/g,''));
		var otherDiscDef = parseFloat(otherDisc)*exchange;
		otherDiscount.value = otherDisc.numberFormat('#,#.00');
		otherDiscountDef.value=otherDiscDef.numberFormat('#,#.00');

		Nett.value = (parseFloat(transaction.value.replace(/,/g,'')) - parseFloat(otherDiscount.value.replace(/,/g,'')) -parseFloat(discount.value.replace(/,/g,''))).numberFormat('#,#.00');
		NettDef.value = (parseFloat(Nett.value.replace(/,/g,''))*exchange).numberFormat('#,#.00');


		tax.value = Math.round(parseFloat(Nett.value.replace(/,/g,''))*(10/100)).numberFormat('#,#.00');
		taxDef.value = Math.round(parseFloat(tax.value.replace(/,/g,''))*exchange).numberFormat('#,#.00');

		if(total.value<0){
			alert('Total Tidak Minus');
		}
		total.value = (parseFloat(Nett.value.replace(/,/g,'')) + parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,#.00');
		totalDef.value = (total.value.replace(/,/g,'')*exchange).numberFormat('#,#.00');
		
		var cekplafon={org:$('#org').val(),amount:$('#total').val()}
		$.get("<c:url value='/page/unitinvoiceverificationremote.cekplafon.json'/>",cekplafon,function(json){$("#totalsisa").val(json.plafon.available);});
	}
</script>
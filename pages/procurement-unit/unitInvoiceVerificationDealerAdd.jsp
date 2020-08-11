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
							<a class="item-button-list" href="<c:url value='/page/unitinvoiceverificationdealerview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" next='DONE' style="cursor:pointer;"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification">
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
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openFacilityByOrg('loc');" style="CURSOR:pointer;" title="Gudang" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${now}'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Pemasok :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty verificaiton.supplier}'>
                                                        <form:option value='${verificaiton.supplier.id}' label='${verificaiton.supplier.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Pemasok" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No. Invoice :</td>
                                            <td><form:input path='invoice' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal Jatuh Tempo :</td>
                                            <td><input id="receivedDate" inputId="dueDate" name="dueDate" value="<fmt:formatDate value='${now}'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                         </tr>
                                        <tr>
                                            <td align="right">Mata Uang :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                <option value="0">-</option>
                                                <c:forEach items='${currencys}' var='currency'>
                                                <c:if test="${currency.symbol == 'RP' }">
                                                	<form:option value='${currency.id}' label='${currency.symbol}'/>
                                                </c:if>
                                                </c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                	<option value="">-</option>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="0"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tipe Pajak :</td>
                                            <td>
                                            	<input type="hidden" id="unitdiscount" value="<fmt:formatNumber value='${verification.discount.amount}'/>"/>
                                            	<input type="hidden" name="discount" id="unitdiscountId" value="${verification.discount.id}"/>

                                                <form:select id='taxType' path='tax'>
                                                	<form:option label='-' value="0" onclick="javascript:document.getElementById('taxRate').value = 0;display();"
                                                    	onkeyup="javascript:document.getElementById('taxRate').value = 0;display();"/>
                                                	<c:forEach items='${taxes}' var='tax'>
                                                	<c:if test="${tax.taxId == 'PPN' }">
                                                    	<form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"
                                                    	onkeyup="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                    </c:if>
                                                	</c:forEach>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" value="0" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Keterangan :</td>
                                            <td><form:textarea path='note' cols='37' rows='4'/></td>
                                        </tr>
                                        </table>
                                    </td>
                       		  		<td width="41%" valign="top">
										<fieldset>
                                       		<legend><strong>Rekap Transaksi</strong></legend>
                                            <table width="100%" style="border:none"  >
                                            <tr>
                                            	<th width="60%">&nbsp;</th>
                                           	  	<th width="20%"><div id="trx">Jumlah</div></th>
                                           	  	<th width="20%">Jumlah (<c:out value='${default.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Transaksi : </td>
                                                <td><input id="transaction" value="0.0" class="input-disabled" disabled style="text-align:right" size="13" /></td>
                                                <td><input id="transactionDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Biaya Pelanggaran Wilayah :</td>
                                                <td>
                                                	<input id="crossDistrictAmount" value="50,000.0" style="text-align:right" size="13" onkeyup="hitungCrossAmt();separator('crossDistrictAmount');" onblur="display();"/>
                                                	<input type="hidden" id="crossAmount" name="crossDistrictAmount" size="13"/>
                                                	<input type="hidden" id="crossAmountDef" value="50000"/>
                                                </td>
                                                <td><input id="crossDistrictAmountDef" value="50,000.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Potongan Harga Satuan :</td>
                                                <td><input id="discount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                                <td><input id="total" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
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
                                        <a class="item-button-delete" href="javascript:deleteRow('lineItemTable')"><span>Hapus</span></a>
                                         <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                        <th colspan="2"><spring:message code='product'/></th>
                                        <th width="7%"><spring:message code="type"/></th>
                                        <th width="10%"><spring:message code="typename"/></th>
                                        <th width="10%"><spring:message code="color"/></th>
                                        <th width="5%"><spring:message code="quantity"/></th>
                                        <th width="8%"><spring:message code="price"/></th>
                                        <th width="7%"><spring:message code="discount"/></th>
                                        <th width="15%"><spring:message code="total"/></th>
                                        <th width="1%">&nbsp;</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="13">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
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
	$(function(){
		$("#currency").change(function(){
			var data={from:$("#currency").val(),to:1,date:$("#inputDate").val(),type:'SPOT'};
			$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});

			var data={organization:$("#org").val(),supplier:$("#supplier").val(),date:$("#inputDate").val()}
			$.get("<c:url value='/page/unitinvoiceverificationremote.loaddiscount.json'/>",data,function(json){$("#unitdiscount").val(json.discount.amount);$("#unitdiscountId").val(json.discount.id);});
			
			display();
		});

		$('.item-button-save').click(function(e){
			if(validation()) {
				$.ajax({
					url:"<c:url value='/page/unitinvoiceverificationdealeradd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType:'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Unit Invoice Verification data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitinvoiceverificationdealerview.htm'/>";
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
		});
	});

	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&personal=false&organization='/>"+org.value);
	}

	function validation() {
		var org = document.getElementById('org').value;
		if(org == null || org == '') {
			alert('Please select Organization first !!!');
			return;
		}

		var date = document.getElementById('inputDate').value;
		if(date == null || date == '') {
			alert('Verification Date cannot be empty !!!');
			return;
		}

		var supplier = document.getElementById('supplier').value;
		if(supplier == null || supplier == '') {
			alert('Please select Supplier first !!!');
			return;
		}

		var invoice = document.getElementById('invoice').value;
		if(invoice == null || invoice == '') {
			alert('No Debit cannot be empty !!!');
			return;
		}

		var duedate = document.getElementById('dueDate').value;
		if(duedate == null || duedate == '') {
			alert('Due Date cannot be empty !!!');
			return;
		}

		var tax = document.getElementById('taxType').value;
		if(tax == null || tax == '0') {
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

			var products=document.getElementsByName("products");
			for(var i=0;i<products.length;i++){
				if(products[i].value == null || products[i].value == '') {
					alert('Please select Product first!');
					return;
				}
			}
			var qtys=document.getElementsByName("receiveds");
			for(var i=0;i<qtys.length;i++){
				if(parseFloat(qtys[i].value) <= 0) {
					alert('Product Quantity must be greater than 0!');
					return;
				}
			}

			var prices=document.getElementsByName("prices");
			for(var i=0;i<prices.length;i++){
				if(parseFloat(prices[i].value) <= 0) {
					alert('Product Price must be greater than 0!');
					return;
				}
			}
		}

		return true;
	}

	function separator(id)
	{
		var amount = document.getElementById(id);

		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}

	function display()
	{
		var transaction=document.getElementById("transaction");
		var transactionDef=document.getElementById("transactionDef");
		var exchange=document.getElementById("trxrate").value;
		var taxrate=document.getElementById("taxRate").value;
		//var otherDiscount=document.getElementById("otherdisc");
		//var otherDiscountDef=document.getElementById("otherdiscDef");
		var crossDistrict=document.getElementById("crossDistrictAmount");
		var crossDistrictDef=document.getElementById("crossDistrictAmountDef");
		var crossAmount=document.getElementById("crossAmount");
		var discount=document.getElementById("discount");
		var discountDef=document.getElementById("discountDef");
		var Nett=document.getElementById("nett");
		var NettDef=document.getElementById("neffDef");
		var tax=document.getElementById("tax");
		var taxDef=document.getElementById("taxDef");
		var total=document.getElementById("total");
		var totalDef=document.getElementById("totalDef");

		var discs=document.getElementsByName("discs");
		var subtotals=document.getElementsByName("subtotals");
		var amounts=document.getElementsByName("amounts");

		var discx = 0;
		var discDef = 0;
		$.each($("input[name=discs]"),function(idx,elem){
			var i=elem.id;
			var disc=document.getElementById(i);
			discx = parseFloat(discx)+parseFloat(disc.value.replace(/,/g,''));
			discDef = parseFloat(discx)*exchange;
		});
		discount.value=discx.numberFormat('#,#.00');
		discountDef.value=discDef.numberFormat('#,#.00');

		var trx = 0;
		var trxDef = 0;
		$.each($("input[name=subtotals]"),function(idx,elem){
			var i=elem.id;
			var subtotal=document.getElementById(i);
			trx=parseFloat(trx)+parseFloat(subtotal.value.replace(/,/g,''));
			trxDef=parseFloat(trx)*exchange;
		});
		transaction.value=trx.numberFormat('#,#.00');
		transactionDef.value=trxDef.numberFormat('#,#.00');

		Nett.value = (parseFloat(transaction.value.replace(/,/g,'')) + parseFloat(crossDistrict.value.replace(/,/g,'')) - parseFloat(discount.value.replace(/,/g,''))).numberFormat('#,#.00');
		NettDef.value = (parseFloat(Nett.value.replace(/,/g,''))*exchange).numberFormat('#,#.00');
		
		crossDistrict.value = parseFloat(crossDistrict.value.replace(/,/g,'')).numberFormat('#,#.00');
		crossDistrictDef.value = parseFloat(crossDistrict.value.replace(/,/g,'')).numberFormat('#,#.00');
		crossAmount.value = parseFloat(crossDistrict.value.replace(/,/g,''));

		tax.value = Math.round(parseFloat(Nett.value.replace(/,/g,''))*(taxrate/100)).numberFormat('#,#.00');
		taxDef.value = Math.round(parseFloat(Nett.value.replace(/,/g,''))*exchange*(taxrate/100)).numberFormat('#,#.00');

		if(total.value<0){
			alert('Total Tidak Minus');
		}
		
		total.value = (parseFloat(Nett.value.replace(/,/g,'')) + parseFloat(tax.value.replace(/,/g,''))).numberFormat('#,#.00');
		totalDef.value = (total.value.replace(/,/g,'')*exchange).numberFormat('#,#.00');
	}

	function calculateSubTotal(index)
	{
		var crossdisamt=document.getElementById('crossDistrictAmount');
		var crossdisamthid=document.getElementById('crossAmount');
		var crossdisamthiddef=document.getElementById('crossAmountDef');
		var received=document.getElementById('received['+index+']').value;
		var price=document.getElementById('price['+index+']').value.replace(/,/g,'');
		var disc=document.getElementById("disc["+index+"]");
		var unitdisc=document.getElementById("unitdiscount").value;
		var subtotals=document.getElementsByName("subtotals");
		var subtotal=document.getElementById("subtotal["+index+"]");

		subtotal.value=(price*received).numberFormat('#,#.00');
		disc.value=(Math.round(Math.round((((unitdisc*price*14)/(360*100)))*100)/100)*received).numberFormat('#,#.00');
		
		crossdisamt.value = (parseFloat(crossdisamthiddef.value.replace(/,/g,''))*received).numberFormat('#,#.00');
		crossdisamthid.value = (parseFloat(crossdisamthiddef.value.replace(/,/g,''))*received).numberFormat('#,#.00');

		display();
	}

	function hitungCrossAmt()
	{
		var crossdisamt=document.getElementById('crossDistrictAmount');
		var crossdisamthiddef=document.getElementById('crossAmountDef');
		var qty = 0;
		
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len > 0)
			{
				$.each($("input[name=receiveds]"),function(idx,elem){
					var i=elem.value;
			 		qty = qty+parseFloat($("#received\\["+idx+"\\]").val());
				});
			}
		}
		
		crossdisamthiddef.value = parseFloat(crossdisamt.value.replace(/,/g,''))/parseFloat(qty);
		display();
	}

	var index = 0;
	function addLineItem()
	{
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
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genType(index));
				row.insertCell(4).appendChild(genTypeName(index));
				row.insertCell(5).appendChild(genColor(index));
				row.insertCell(6).appendChild(genQty(index));
				row.insertCell(7).appendChild(genPrice(index));
				row.insertCell(8).appendChild(genDisc(index));
				row.insertCell(9).appendChild(genSub(index));

				index++;
			}
		}
	}

	function genCheck(index){
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		return check;
	}

	function genProduct(index){
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');

		return itemx;
	}

	function genPopup(index){
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
			var target="product["+index+"]";
			openpopup("<c:url value='/page/popupproductview.htm?target='/>"+target+"&index="+index+"&categoryId=1&active=true");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Price';

		return _popup;

	}

	function genType(index){
		var producttype = document.createElement("input");
		producttype.type = "text";
		producttype.id = "type["+index+"]";
		producttype.setAttribute('size',"15");
		producttype.value = "";
		producttype.setAttribute('class','input-disabled');
		producttype.disabled = true;

		return producttype;
	}

	function genTypeName(index){
		var producttypename = document.createElement("input");
		producttypename.type = "text";
		producttypename.id = "typename["+index+"]";
		producttypename.setAttribute('size',"20");
		producttypename.value = "";
		producttypename.setAttribute('class','input-disabled');
		producttypename.disabled = true;

		return producttypename;
	}

	function genQty(index){
		var received = document.createElement("input");
		received.type = "text";
		received.name = "receiveds";
		received.id = "received["+index+"]";
		received.setAttribute('size',"6");
		received.value = "0";
		received.setAttribute('onblur','calculateSubTotal('+index+');');

		return received;
	}

	function genPrice(index){
		var price = document.createElement("input");
		price.type = "text";
		price.name = 'prices';
		price.id = "price["+index+"]";
		price.setAttribute('size',"15");
		price.value = "0";
		price.setAttribute('onblur','calculateSubTotal('+index+');separator("price['+index+']");');
		price.setAttribute('onkeyup','separator("price['+index+']");');

		return price;
	}

	function genColor(index){
		var productcolor = document.createElement("input");
		productcolor.type = "text";
		productcolor.id = "color["+index+"]";
		productcolor.setAttribute('size',"20");
		productcolor.value = "";
		productcolor.setAttribute('class','input-disabled');
		productcolor.disabled = true;

		return productcolor;
	}

	function genDisc(index)
	{
		var amount = document.createElement("input");
		amount.type = "text";
		amount.id = "disc["+index+"]";
		amount.name="discs";
		amount.setAttribute('size',"11");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}

	function genSub(index){
		var amount = document.createElement("input");
		amount.type = "text";
		amount.name="subtotals";
		amount.id = "subtotal["+index+"]";
		amount.setAttribute('size',"20");
		amount.value = "0";
		amount.setAttribute('class','input-disabled');
		amount.disabled = true;

		return amount;
	}
	
	function setPrice(index)
	{
		var orgId = $("#org").val();
		var productId = $("#product\\["+index+"\\]").val();
		
		$.get("<c:url value='/page/productstandardpriceremote.getbuyingprice.json'/>",{org:orgId,product:productId},
		function(json)
		{
			$("#price\\["+index+"\\]").val(new Number(json.price).numberFormat("#,###"));
			$("#pricehidden\\["+index+"\\]").val(new Number(json.price).numberFormat("#,###"));
		});
	}
</script>
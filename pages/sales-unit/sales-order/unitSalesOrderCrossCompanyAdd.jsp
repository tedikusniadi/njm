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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordercrosscompanyview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="73%"><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <!-- <tr>
                                            <td width="27%" nowrap="nowrap" align="right">No. Referensi SPK :</td>
                                          	<td width="73%"><input value="" id="referenceCode" name="referenceCode" size='25'/></td>
                                        </tr> -->
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input inputId="dateId" id="date" name="date" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.organization}'>
                                                        <form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.firstName} ${salesOrder_add.organization.lastName} ${salesOrder_add.organization.middleName}' />
                                                    </c:if>
                                                    <form:option value='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.id}' label='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.firstName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.middleName} ${SIRIUS_SESSION_USER_PROFILE_KEY.organization.lastName}'/>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                            </td>
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
                                                	<option value="0">-</option>
                                                    <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                                    <%-- <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                                    <form:option value='TAX' label='TAX' onclick='display();'/> --%>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="0"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tipe Pajak :</td>
                                            <td>
                                            	<input type="hidden" id="unitdiscount" value="<fmt:formatNumber value='${0}'/>"/>
                                            	<input type="hidden" name="discount" id="unitdiscountId" value="${0}"/>

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
                                        <%-- <tr>
		                                    <td nowrap="nowrap" align="right">Salesman :</td>
		                                    <td>
		                                        <select id="salesPerson" name="salesPerson" class="combobox-ext">
		                                        	<option></option>
		                                        </select>
		                                        &nbsp;
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesPerson'/>');" style="CURSOR:pointer;" title="Salesman" />
		                                    </td>
		                                </tr> --%>
                                        <tr>
                                            <td width="10%" align="right" valign="top">Catatan: </td>
                               		  	  	<td width="40%"><form:textarea cols="35" rows="5" path='note' size='50'/></td>
                                        </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Rekapitulasi Transaksi</strong></legend>
                                                    <table width="100%" style="border:none">
		                                            <tr>
		                                            	<th width="60%">&nbsp;</th>
		                                           	  	<th width="20%"><div id="trx">Jumlah</div></th>
		                                           	  	<th width="20%">Jumlah (<c:out value='${currency.symbol}'/>)</th>
		                                            </tr>
                                                    <!-- <tr>
                                                        <td align="right">OTR : </td>
                                                        <td><input id="unit-price" name="priceAmount" value="0.00" style="text-align:right" onkeyup="separator('unit-price');" size="13"/></td>
                                                        <td><input id="unit-priceDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr> -->
		                                            <tr>
		                                            	<td align="right">Transaksi : </td>
		                                                <td>
		                                                	<input id="transaction" value="0.0" class="input-disabled" disabled style="text-align:right" size="13" />
		                                                	<input type="hidden" id="totalAmount" name="totalAmount" class="input-disabled" size="13"/>
		                                                </td>
		                                                <td><input id="transactionDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Biaya Pelanggaran Wilayah :</td>
		                                                <td>
		                                                	<input id="crossDistrictAmount" name="rounding" value="50,000.0" style="text-align:right" size="13" onkeyup="separator('crossDistrictAmount');" onblur="display();"/>
		                                                	<input type="hidden" id="crossAmount" name="crossAmount" class="input-disabled" size="13"/>
		                                                </td>
		                                                <td><input id="crossDistrictAmountDef" value="50,000.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Potongan Harga Satuan :</td>
		                                                <td>
		                                                	<input id="discount" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/>
		                                                	<input type="hidden" id="discountAmount" name="discountAmount" class="input-disabled" size="13"/>
		                                                </td>
		                                                <td><input id="discountDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">DPP :</td>
		                                                <td><input id="nett" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="neffDef" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">PPN :</td>
		                                                <td>
		                                                	<input id="tax" value="0.0" class="input-disabled" disabled style="text-align:right" size="13"/>
		                                                	<input type="hidden" id="taxAmount" name="taxAmount" class="input-disabled" size="13"/>
		                                                </td>
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
                           	  	  </td>
                                </tr>
                                </table>
                               	<div id="mainTab1" dojoType="TabContainer" style="width:100% ; height: 220px;">
                                	<div id="customerTab" dojoType="ContentPane" label="Informasi Pelanggan" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Nama Pemesan</td>
                                				<td width="35%">:
                                					<select id='cust' name='customer' class='combobox-ext'>
                                						<option value="0">--Pelanggan--</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerFacilityByOrg('cust');" style="CURSOR:pointer;" title="Pelanggan" />
                                				</td>
                                				<td width="10%" align="right">Kode Pos</td>
                                				<td width="35%">: <input id='cust-postalCode' disabled class='input-disabled' size="10"/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Alamat</td>
                                				<td>: <input id="cust-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Email</td>
                                				<td>: <input id='cust-email' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Provinsi</td>
                                				<td>: <input id="cust-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Telepon 1</td>
                                				<td>: <input id='cust-phone' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Kota/Kabupaten</td>
                                				<td>: <input id="cust-city" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Telepon 2</td>
                                				<td>: <input id='cust-phone2' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Kecamatan</td>
                                				<td>: <input id="cust-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Wilayah Samsat</td>
                                				<td>: <input id="cust-samsat-area" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Kelurahan/Desa</td>
                                				<td>: <input id="cust-village" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right"></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab2" dojoType="TabContainer" style="width:100% ; height: 200px;">
                                	<div id="licenseTab" dojoType="ContentPane" label="Informasi STNK" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Nama STNK</td>
                                				<td width="35%">:
                                					<select id='license' name='customerUnit' class='combobox-ext'>
                                						<option value="0">--Pelanggan--</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrgInstant('license', 'false')" style="CURSOR:pointer;" title="Pelanggan" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomer('license');" style="CURSOR:pointer;" title="Customer" />
                                				</td>
                                				<td width="10%" align="right">Kecamatan</td>
                                				<td width="35%">: <input id="license-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Alamat</td>
                                				<td>: <input id="license-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Kelurahan/Desa</td>
                                				<td>: <input id="license-village" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Provinsi</td>
                                				<td>: <input id="license-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Kode Pos</td>
                                				<td>: <input id='license-postalCode' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Kota/Kabupaten</td>
                                				<td>: <input id="license-city" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Wilayah Samsat</td>
                                				<td>: <input id="license-samsat-area" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab4" dojoType="TabContainer" style="width:100% ; height: 200px;">
                                	<div id="unitTab" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Product</td>
                                				<td width="35%">: <select id='unit' name='items[0].product' class='combobox-ext'><option value="0">--Motor--</option></select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openProductByCategoryAndOrg('unit','1')" style="CURSOR:pointer;" title="Motor" />
                                					<input type="hidden" id="unit-price-on" value="0"/><input type="hidden" id="unit-price-off" value="0"/>
                                					<input type='hidden' value='NONE' name='priceType'/>
                                				</td>
                                				<td width="10%" align="right"></td>
                                				<td width="35%"></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Tipe</td>
                                				<td>: <input id="unit-type" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right"></td>
                                				<td></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama Tipe</td>
                                				<td>: <input id="unit-type-name" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right"></td>
                                				<td></td>
                                			<tr>
                                				<td align="right">Warna</td>
                                				<td>: <input id="unit-color" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right"></td>
                                				<td></td>
                                			</tr>
                               				<!-- <tr>
                                				<td align="right">Tipe Harga</td>
                                				<td>: <input type='radio' value='ON_THE_ROAD' name='priceType' id="unit-pricetype" checked onclick="flagPrice('on');"/>On The Road&nbsp;<input onclick="flagPrice('off');" type='radio' value='OFF_THE_ROAD' name='priceType' id="unit-pricetype" />Off The Road</td>
                                				<td align="right"></td>
                                				<td></td>
                                			</tr> -->
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">

function openProductByCategoryAndOrg(target,category)
{
	var org = document.getElementById('org').value;
	if(org == null || org == '')
	{
		alert('Please select Organization first !!!');
		return;
	}
	openpopup("<c:url value='/page/productpopupview.htm?active=true&target='/>"+target+'&categoryId='+category+'&organization='+org);
}

function setPurchasePrice()
{
	var orgId = $("#org").val();
	var productId = $("#unit").val();
	
	$.get("<c:url value='/page/productstandardpriceremote.getbuyingprice.json'/>",{org:orgId,product:productId},
	function(json)
	{
			//$("#unit-price").val(new Number(json.price).numberFormat("#,###"));
			//$("#unit-price-on").val(new Number(val.price).numberFormat("#,###"));
		$("#transaction").val(new Number(json.price).numberFormat('#,#.00'));
		$("#transactionDef").val(new Number(json.price).numberFormat('#,#.00'));
		display();
	});
}

/* function flagPrice(status)
{
	var orgId = $("#org").val();
	var productId = $("#unit").val();
	
	if(status == "on")
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"ON_THE_ROAD"},
		function(json)
		{
			$.each(json.prices,function(idx,val)
			{
				$("#unit-price").val(new Number(val.price).numberFormat("#,###"));
				$("#unit-price-on").val(new Number(val.price).numberFormat("#,###"));
			});
		});
	}
	else
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"OFF_THE_ROAD"},
		function(json)
		{
			$.each(json.prices,function(idx,val)
			{
				$("#unit-price").val(new Number(val.price).numberFormat("#,###"));
				$("#unit-price-off").val(new Number(val.price).numberFormat("#,###"));
			});
		});
	}
} */

function display()
{
	var exchange=document.getElementById("trxrate").value;
	var taxrate=document.getElementById("taxRate").value;
	var unitdisc=document.getElementById("unitdiscount").value;
	
	var transaction=document.getElementById("transaction");
	var transactionDef=document.getElementById("transactionDef");
	var tAmount=document.getElementById("totalAmount");
	var crossDistrict=document.getElementById("crossDistrictAmount");
	var crossDistrictDef=document.getElementById("crossDistrictAmountDef");
	var crossAmount=document.getElementById("crossAmount");
	var discount=document.getElementById("discount");
	var discountDef=document.getElementById("discountDef");
	var discountAmount=document.getElementById("discountAmount");
	var Nett=document.getElementById("nett");
	var NettDef=document.getElementById("neffDef");
	var tax=document.getElementById("tax");
	var taxDef=document.getElementById("taxDef");
	var taxAmount=document.getElementById("taxAmount");
	var total=document.getElementById("total");
	var totalDef=document.getElementById("totalDef");

	var disc = (Math.round(Math.round((((unitdisc*transaction.value.replace(/,/g,'')*14)/(360*100)))*100)/100)*1);
	var dpp = parseFloat(transaction.value.replace(/,/g,'')) + parseFloat(crossDistrict.value.replace(/,/g,'')) - parseFloat(disc);
	var ppn = Math.round(parseFloat(dpp*(taxrate/100)));
	var totalAmount = parseFloat(dpp+ppn);
	
	tAmount.value = parseFloat(transaction.value.replace(/,/g,''));
	crossDistrict.value = parseFloat(crossDistrict.value.replace(/,/g,'')).numberFormat('#,#.00');
	crossDistrictDef.value = parseFloat(crossDistrict.value.replace(/,/g,'')).numberFormat('#,#.00');
	crossAmount.value = parseFloat(crossDistrict.value.replace(/,/g,''));
	discount.value = parseFloat(disc).numberFormat('#,#.00');
	discountDef.value = parseFloat(disc).numberFormat('#,#.00');
	discountAmount.value = parseFloat(disc);
	Nett.value = dpp.numberFormat('#,#.00');
	NettDef.value = dpp.numberFormat('#,#.00');
	tax.value = ppn.numberFormat('#,#.00');
	taxDef.value = ppn.numberFormat('#,#.00');
	taxAmount.value = ppn;
	total.value = totalAmount.numberFormat('#,#.00');
	totalDef.value = totalAmount.numberFormat('#,#.00');
}

function setCustomerInfo(id)
{
	$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:$("#"+id).val()},function(json){
		$("#"+id+"-address").val(json.address);
		$("#"+id+"-postalCode").val(json.postalCode);
		$("#"+id+"-province").val(json.province);
		$("#"+id+"-phone").val(json.phone);
		$("#"+id+"-phone2").val(json.phone2);
		$("#"+id+"-city").val(json.city);
		$("#"+id+"-subdistrict").val(json.subdistrict);
		$("#"+id+"-village").val(json.village);
		$("#"+id+"-email").val(json.email);
		$("#"+id+"-samsat-area").val(json.region);
	});
}

function getcity(target)
{
	$.get("<c:url value='/page/geographicsremote.getcity.json'/>",{id:$("#"+target+"-province").val()},function(json){
		$("#"+target+"-city option").remove();
		$("<option></option>").	text("--Kota/Kabupaten--").val(0).appendTo("#"+target+"-city");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-city");
		});
	});
}

/* function getregion(target)
{
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target+"-city").val()},function(json){
		$("#"+target+"-region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#"+target+"-region");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-region");
		});
	});
} */

function getsubdistrict(target)
{
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#"+target+"-city").val()},function(json){
		$("#"+target+"-subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#"+target+"-subdistrict");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-subdistrict");
		});
	});
}

function validation()
{
	if($("#org").val() == null || $("#org").val() == '')
	{
		alert('Please select Company first !!!');
		return;
	}

	if($("#currency").val() == '0' || $("#type").val() == '0')
	{
		alert('Pilih Mata Uang terlebih dahulu !!!');
		return;
	}

	if($("#taxType").val() == '0')
	{
		alert('Pilih Tipe Pajak terlebih dahulu !!!');
		return;
	}
	
	if($("#dateId").val() == '')
	{
		alert('Tanggal tidak boleh kosong !!!');
		return;
	}

	/* if($("#salesPerson").val() == null || $("#salesPerson").val() == '')
	{
		alert('Mohon pilih Salesman terlebih dahulu !!!');
		return;
	} */

	if($("#cust").val() == 0)
	{
		alert('Mohon pilih Pemesannya terlebih dahulu !!!');
		return;
	}

	if($("#unit").val() == 0)
	{
		alert('Mohon pilih Product-nya terlebih dahulu !!!');
		return;
	}
	return true;
}

$(function()
{
	$("#currency").change(function()
	{
		var data={from:$("#currency").val(),to:1,date:$("#dateId").val(),type:'SPOT'};
		$.get("<c:url value='/page/exchangeremote.loadrate.json'/>",data,function(json){$("#trxrate").val(json.rate);});

		var data={supplier:"1852",date:$("#dateId").val()}
		$.get("<c:url value='/page/unitinvoiceverificationremote.loaddiscount.json'/>",data,function(json){$("#unitdiscount").val(json.discount.amount);$("#unitdiscountId").val(json.discount.id);});

		display();
	});
	
	$('.b_save').click(function(e){
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/unitsalesordercrosscompanyadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Unit Sales Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/unitsalesordercrosscompanyview.htm'/>";
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

function setFromCustomer(id)
{
	if($("#cust-address").val() == '')
	{
		$("#"+id+"-address").val('');

		$("#"+id+"-province").val(0);

		$("#"+id+"-city option").remove();
		$("<option></option>").text("--Kota/Kabupaten--").val(0).appendTo("#"+id+"-city");

		$("#"+id+"-region option").remove();
		$("<option></option>").text("--Wilayah Samsat--").val(0).appendTo("#"+id+"-region");
		/* $("#"+id+"-region").val(''); */

		$("#"+id+"-subdistrict option").remove();
		$("<option></option>").text("--Kecamatan--").val(0).appendTo("#"+id+"-subdistrict");

		$("#"+id+"-village").val('');

		$("#"+id+"-postalCode").val('');
	}
	else
	{
		$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:$("#cust").val()},function(json)
		{
			if($("#buttonDetail").attr('checked'))
			{
				$("#"+id+"-address").val(json.address);
				$("#"+id+"-postalCode").val(json.postalCode);
				$("#"+id+"-province").val(json.province);
				$("#"+id+"-city").val(json.city);
				$("#"+id+"-subdistrict").val(json.subdistrict);
				$("#"+id+"-village").val(json.village);

				/* $("#"+id+"-phone").val(json.phone);
				$("#"+id+"-phone2").val(json.phone2);
				$("#"+id+"-email").val(json.email); */

				$("#"+id+"-samsat-area").val(json.subdistrictParent);

				$("#"+id).empty()
				$("#"+id).append($("<option value="+$("#cust").val()+">"+$("#cust option:selected").text()+"</option>"));
				//$("#buttonDetailPelanggan").val(json.addressId);
			}
			else
			{
				$("#"+id+" option").remove();
				$("<option></option>").text('--Pelanggan--').val(0).appendTo("#"+id);

				$("#"+id+"-address").val('');
				$("#"+id+"-postalCode").val('');
				$("#"+id+"-province").val('');
				$("#"+id+"-city").val('');
				$("#"+id+"-subdistrict").val('');
				$("#"+id+"-village").val('');

				/* $("#"+id+"-phone").val('');
				$("#"+id+"-phone2").val('');
				$("#"+id+"-email").val(''); */

				$("#"+id+"-samsat-area").val('');
			}
		});
	}

	$("#"+id+"-address").attr("disabled");
	$("#"+id+"-address").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-province").attr("class","inputbox-ext input-disabled");
	$("#"+id+"-province").attr("disabled");

	$("#"+id+"-city").attr("disabled");
	$("#"+id+"-city").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-region").attr("disabled");
	$("#"+id+"-region").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-subdistrict").attr("disabled");
	$("#"+id+"-subdistrict").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-village").attr("disabled");
	$("#"+id+"-village").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-postalCode").attr("disabled");
	$("#"+id+"-postalCode").attr("class","input-disabled");
}

function addCustomer(target)
{
	openpopup("<c:url value='/page/customerpreaddpopup.htm?target='/>"+target);
}

function numberOnly(event)
{
	if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 ))
	{
	    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || (event.keyCode >= 37 && event.keyCode <= 40))
	    {
	    }
	    else
	   	{
	    	event.preventDefault();
	   	}
	}
}

function separator(id)
{
	var amount = document.getElementById(id);
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
	}
}
</script>
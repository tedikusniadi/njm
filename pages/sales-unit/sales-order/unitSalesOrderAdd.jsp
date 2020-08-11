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
							<a class="item-button-list" href="<c:url value='/page/unitsalesorderview.htm'/>"><span>List</span></a>
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
                                         <tr>
                                            <td width="27%" nowrap="nowrap" align="right">No. Referensi SPK :</td>
                                          	<td width="73%"><input value="" id="referenceCode" name="referenceCode" size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input inputId="dateId" id="date" name="date" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty salesOrder_add.organization}'>
                                                        <form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.name}' />
                                                    </c:if>
                                                    <form:option value='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.id}' label='${SIRIUS_SESSION_USER_PROFILE_KEY.organization.name}'/>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Salesman :</td>
		                                    <td>
		                                        <select id="salesPerson" name="salesPerson" class="combobox-ext">
		                                        	<option></option>
		                                        </select>
		                                        &nbsp;
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesPerson'/>');" style="CURSOR:pointer;" title="Salesman" />
		                                    </td>
		                                </tr>
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
                                                        <td width="60%"align="right">OTR : </td>
                                                        <td width="40%"><input id="unit-price" name="priceAmount" value="0.00" class="input-disabled" readonly="true" style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="60%"align="right">Uang Muka PO : </td>
                                                        <td width="40%"><input id="unit-prepayment" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Leasing : </td>
                                                        <td><input id="sub-leasing" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Main Dealer</td>
                                                        <td><input id="sub-maindealer" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <!-- <tr>
                                                        <td align="right">Subsidi Dealer : </td>
                                                        <td><input id="sub-dealer" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr> -->
                                                    <tr>
                                                        <td align="right">Discount Konsumen : </td>
                                                        <td><input id="sub-discount" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Discount Program : </td>
                                                        <td><input id="sub-program" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Uang Muka Murni : </td>
                                                        <td><input id="unit-pureprepayment" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tambahan : </td>
                                                        <td><input id="sub-extras" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Komisi Mediator : </td>
                                                        <td><input id="mediator-com" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Dealer Murni : </td>
                                                        <td><input id="sub-puredealer" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <!-- <tr>
                                                        <td align="right">Biaya Tambahan : </td>
                                                        <td><input id="extras" value="0.00" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr> -->
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
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrgInstant('cust', 'false');" style="CURSOR:pointer;" title="Pelanggan" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomer('cust');" style="CURSOR:pointer;" title="Customer" />
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
                                				<td width="15%" align="right">Detail Pelanggan</td>
                                				<td width="35%">: <input type="checkbox" id="buttonDetail" onclick="setFromCustomer('license');"/>Sama dengan Pelanggan</td>
                                				<td width="10%" align="right">Kecamatan</td>
                                				<td width="35%">: <input id="license-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama STNK</td>
                                				<td>:
                                					<select id='license' name='customerUnit' class='combobox-ext'>
                                						<option value="0">--Pelanggan--</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrgInstant('license', 'false')" style="CURSOR:pointer;" title="Pelanggan" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomer('license');" style="CURSOR:pointer;" title="Customer" />
                                				</td>
                                				<td align="right">Kelurahan/Desa</td>
                                				<td>: <input id="license-village" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Alamat</td>
                                				<td>: <input id="license-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Kode Pos</td>
                                				<td>: <input id='license-postalCode' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Provinsi</td>
                                				<td>: <input id="license-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Wilayah Samsat</td>
                                				<td>: <input id="license-samsat-area" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td align="right">Kota/Kabupaten</td>
                                				<td>: <input id="license-city" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right"></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab3" dojoType="TabContainer" style="width:100% ; height: 200px;">
                                	<div id="deliveryTab" dojoType="ContentPane" label="Pengiriman" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Detail Pengiriman</td>
                                				<td width="35%">: <input type="radio" id="buttonDetailPelanggan" name="shippingAddress" onclick="setFromCustomer('delivery');"/>Sama dengan Pelanggan</td>
                                				<td width="10%" align="right">Kota/Kabupaten</td>
                                				<td width="35%">:
                                					<select name="delivery-city" id='delivery-city' onchange="javascript:checkavailableregion('delivery')" disabled class='combobox-ext input-disabled'>
                                						<option value="0">--Kota/Kabupaten--</option>
                                					</select>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right"></td>
                                				<td>&nbsp;&nbsp;<input type="radio" id="buttonDetailStnk" name="shippingAddress" onclick="setFromLicense('delivery');"/>Sama dengan STNK</td>
                                				<td align="right">Wilayah Samsat</td>
                                				<td>: <!-- <input id='delivery-region' name="delivery-region" disabled class='inputbox-ext input-disabled'/> -->
                                					<select id='delivery-region' onchange="javascript:getsubdistrict('delivery')" disabled class='combobox-ext input-disabled'>
                                						<option value="0">--Wilayah Samsat--</option>
                                					</select>
                                				</td>
                                			</tr>
                                				<td align="right"></td>
                                				<td>&nbsp;&nbsp;<input type="radio" id="buttonDetailOther" name="shippingAddress" onclick="validationAddress('delivery');"/>Other</td>
                                				<td align="right">Kecamatan</td>
                                				<td>:
                                					<select name="delivery-subdistrict" id='delivery-subdistrict' disabled class='combobox-ext input-disabled'>
                                						<option value="0">--Kecamatan--</option>
                                					</select>
                                				</td>
                                			<tr>
                                			</tr>
                                				<td align="right">Alamat</td>
                                				<td>: <input id="delivery-address" name="delivery-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Kelurahan/Desa</td>
                                				<td>: <input id='delivery-village' name="delivery-village" disabled class='inputbox-ext input-disabled'/></td>
                                			<tr>
                                				<td align="right">Provinsi</td>
                                				<td>:
                                					<select id="delivery-province" name="delivery-province" onchange="javascript:getcity('delivery')" disabled class='combobox-ext input-disabled'>
				 							  			<option value="0">--Provinsi--</option>
				 							  			<c:forEach items="${provinces}" var="province">
				 							  				<option value="${province.id}">${province.name}</option>
				 							  			</c:forEach>
				 							  		</select>
                                				</td>
                                				<td align="right">Kode Pos</td>
                                				<td>:
                                					<input id='delivery-postalCode' name="delivery-postalCode" maxlength="5" disabled class='input-disabled'/>
                                					<input id='delivery-address-validation' type="hidden" value='null'/>
                                				</td>
                                			</tr>
                                			<tr>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab4" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="unitTab" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Product</td>
                                				<td width="35%">: <select id='unit' name='items[0].product' class='combobox-ext'><option value="0">--Motor--</option></select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openProductByCategory('unit','1')" style="CURSOR:pointer;" title="Motor" />
                                					<input type="hidden" id="unit-price-on" value="0"/><input type="hidden" id="unit-price-off" value="0"/>
                                				</td>
                                				<td width="10%" align="right">Pembayaran</td>
                                				<td width="35%">: <input id='cash-payment' type='radio' value='CASH' name='unitPayment' onclick="flagPayment('cash');"/>Cash&nbsp;<input id="credit-payment" onclick="flagPayment('credit');" type='radio' value='CREDIT' name='unitPayment' checked/>Kredit</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Tipe</td>
                                				<td>: <input id="unit-type" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Leasing</td>
                                				<td>: <select id='leasing' name=leasing class='combobox-medium'><option value="0">--Leasing--</option></select>
                                					<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Payment Leasing" />
                                					Tenor&nbsp;:&nbsp;<input id='leasing-term' name='leasingterm' value="0" maxlength="2" size="5"/>
                                					<input id='leasing-temporary' value="0" type="hidden"/>
                                					<input id='leasing-temporary-id' value="0" type="hidden"/>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama Tipe</td>
                                				<td>: <input id="unit-type-name" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Top Angsuran</td>
                                				<td>: <input id="unit-installment" name='unitinstallment' value="0" onkeyup="separator('unit-installment');"/></td>
                                			<tr>
                                				<td align="right">Warna</td>
                                				<td>: <input id="unit-color" disabled class='inputbox-ext input-disabled'/></td>
                                				<td align="right">Uang Muka PO</td>
                                				<td>: <input id="unit-prepayment-po" name="poPrepayment" value="0" onkeyup="separator('unit-prepayment-po');"/></td>
                                			</tr>
                               				<tr>
                                				<td align="right">Tipe Harga</td>
                                				<td>: <input type='radio' value='ON_THE_ROAD' name='priceType' id="unit-pricetype" checked onclick="flagPrice('on');"/>On The Road&nbsp;<input onclick="flagPrice('off');" type='radio' value='OFF_THE_ROAD' name='priceType' id="unit-pricetype" />Off The Road</td>
                                				<td align="right">Uang Muka Murni</td>
                                				<td>:
                                					<input id="unit-pureprepayment-po" value="0" class="input-disabled" disabled/>
                                					<input type="hidden" id="unit-pureprepayment-po-hidden" name="prepayment" value="0"/>
                                				</td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="tabInfoBPKB" hidden dojoType="TabContainer" style="width:100% ; height: 120px;">
                                	<div id="bpkbTab" dojoType="ContentPane" label="Informasi Pengambilan BPKB" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td width="15%" align="right">Detail BPKB</td>
                                				<td width="35%">: <input type="radio" id="buttonDetailBPKBPelanggan" disabled="true" name="bInfoBPKB" onclick="setFromCustomer('infoBPKB');"/>Sama dengan Pelanggan</td>
                                				<td width="10%" align="right">&nbsp;</td>
                                				<td width="35%">&nbsp;</td>
                                			</tr>
                                			<tr>
                                				<td align="right">&nbsp;</td>
                                				<td>: <input type="radio" id="buttonDetailBPKBStnk" disabled="true" name="bInfoBPKB" onclick="setFromLicense('infoBPKB');"/>Sama dengan STNK</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Nama</td>
                                				<td>:
                                					<select id='namaInfoBPKB' name='namaInfoBPKB' class='combobox-ext'>
                                						<option value="0"></option>
                                					</select>
                                					<input id='infoBPKB-validation' name="infoBPKB" type="hidden" value='null'/>
                                				</td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab51" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="pendanaanTab" dojoType="ContentPane" label="Uang Muka" class="tab-pages" refreshOnShow="true">
                                		<div class="toolbar-clean">
			                                <div class="item-navigator">&nbsp;</div>
			                                <a class="item-button-new" href="javascript:newprepayment();"><span>New Row</span></a>
			                                <a class="item-button-delete" href="javascript:deleteRow('pendanaanTable')"><span>Delete Row</span></a>
			                            </div>
                                		<table class="table-list" id="pendanaanTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster_pendanaanTable" onclick="clickAll('pendanaanTable');"/></th>
		                                            <th width="20%">Kode</th>
		                                            <th width="20%">Tersedia</th>
		                                            <th width="25%">Jumlah</th>
		                                            <th>&nbsp;</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab5" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="subdictionNonDealerTab" dojoType="ContentPane" label="Subsidi Bukan Beban Dealer" class="tab-pages" refreshOnShow="true">
                                		<div class="toolbar-clean">
			                                <div class="item-navigator">&nbsp;</div>
			                                <a class="item-button-new" href="javascript:newSubdiction('subdictionNonDealerTab');"><span>Subsidi Baru</span></a>
			                            </div>
                                		<table class="table-list" id="subdictionNonDealerTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="1%"></th>
		                                            <th width="15%">Kategori</th>
		                                            <th width="12%">Nama Program</th>
		                                            <th width="8%">Budget</th>
		                                            <th width="12%">Konsumen</th>
		                                            <th width="15%">Mediator</th>
		                                            <th width="15%">Total</th>
		                                            <th width="15%">Sisa Budget</th>
		                                            <th></th>
		                                            <th></th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="10">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab6" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="subdictionDealerTab" dojoType="ContentPane" label="Subsidi Beban Dealer" class="tab-pages" refreshOnShow="true">
                                		<div class="toolbar-clean">
			                                <div class="item-navigator">&nbsp;</div>
			                                <a class="item-button-new" href="javascript:newSubdiction('subdictionDealerTab');"><span>Subsidi Baru</span></a>
			                            </div>
                                		<table class="table-list" id="subdictionDealerTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="1%"></th>
		                                            <th width="15%">Kategori</th>
		                                            <th width="12%">Nama Program</th>
		                                            <th width="8%">Budget</th>
		                                            <th width="12%">Konsumen</th>
		                                            <th width="15%">Mediator</th>
		                                            <th width="15%">Total</th>
		                                            <th></th>
		                                            <th></th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab7" dojoType="TabContainer" style="width:100% ; height: 110px;">
                                	<div id="mediatorTab" dojoType="ContentPane" label="Mediator" class="tab-pages" refreshOnShow="true">
                                		<table>
                                			<tr>
                                				<td align="right">Nama Mediator</td>
                                				<td>:
                                					<select id='mediator' name='secondarySales' class='combobox-ext'>
                                						<option value="0">--Mediator--</option>
                                					</select>
                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openCustomerByOrg('mediator')" style="CURSOR:pointer;" title="Mediator" />
                                					<img src="assets/icons/add_row.png" onclick="javascript:addCustomerInstant('mediator');" style="CURSOR:pointer;" title="Mediator" />
                                				</td>
                                			</tr>
                                			<tr>
                                				<td align="right">Jumlah Komisi Mediator</td>
                                				<td>:
                                					<input id="commission-mediator" disabled class='input-disabled' value="0" size="15"/>
                                					<input type="hidden" id="commission-mediator-manual" name="secondarySalesComManual" disabled class='input-disabled' onkeyup="separator('commission-mediator-manual');" value="0" size="15"/>
                                					<input type="hidden" id="commission-mediator-total" disabled class='input-disabled' value="0" size="15"/>
                                					<input type="hidden" id="mediator-commission" name="secondarySalesCom" value="0" size="15"/>
                                					<input type="hidden" id="mediator-commission-validation" value="0" size="15"/>
                                				</td>
                                			</tr>
                                		</table>
                                	</div>
                                </div>
                                <div>&nbsp;</div>
                                <div id="mainTab8" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="extrasTab" dojoType="ContentPane" label="Tambahan" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="extrasTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="3%"></th>
		                                            <th width="15%">Nama</th>
		                                            <th width="82%">Jumlah</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
                                        		<c:forEach items="${extras}" var="sub" varStatus="status">
	                                        	<tr>
	                                        		<td><input type="checkbox" name="extras" id="extras[${status.index}]" value="${sub.id}" onclick="checkExtras('${status.index}');calc();"/></td>
	                                        		<td>${sub.name}<input type="hidden" value="${status.index}" name="extraIdx"/></td>
	                                        		<td><input id="extras-amount[${status.index}]" name="extras-amount" value="0" disabled onchange="calc();" onkeyup="separator('extras-amount[${status.index}]');" class='input-disabled'/></td>
                                        		</tr>
	                                        	</c:forEach>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="3">&nbsp;</td></tr></tfoot>
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
function calc()
{
	var totalCustomer = 0;//new Number($("#customer-subdiction").val());
	var totalMediator = 0;//new Number($("#commission-mediator").val());
	var totalLeasing = 0;
	var totalRemaining = 0
	var discountDealer = 0;
	var discountProgram = 0;

	//CALCULATE SUBDICTION
	var $subdiction=$("input[name=subdictionIdx]");
	$("#sub-maindealer").val(0);
	$("#sub-leasing").val(0);
	$("#sub-program").val(0);
	$("#sub-discount").val(0);
	$("#sub-puredealer").val(0);
	$("#sub-extras").val(0);
	$.each($subdiction,function(idx,elem){
		var i=elem.value;
		if($("#subdiction\\["+i+"\\]").attr("checked")){
			var type=$("#subdiction-type\\["+i+"\\]").val();
			var total=new Number($("#subdiction-total\\["+i+"\\]").val().replace(/,/g,''));
			var customer=new Number($("#subdiction-customer\\["+i+"\\]").val().replace(/,/g,''));
			var mediator=new Number($("#subdiction-mediator\\["+i+"\\]").val().replace(/,/g,''));
			var remaining = 0;
			var $elem;

			if(type=="MAIN_DEALER")
			{
				$elem=$("#sub-maindealer");
				remaining = new Number($("#subdiction-remaining\\["+i+"\\]").val().replace(/,/g,''));
				totalRemaining = totalRemaining+remaining;
			}
			else if(type=="LEASING")
			{
				$elem=$("#sub-leasing");
				remaining = new Number($("#subdiction-remaining\\["+i+"\\]").val().replace(/,/g,''));
				totalRemaining = totalRemaining+remaining;
				totalLeasing = total;
			}
			else if(type=="DISC_DEALER")
			{
				discountDealer = new Number($("#subdiction-total\\["+i+"\\]").val().replace(/,/g,''));
			}
			else if(type=="DISC_PROGRAM")
			{
				$elem=$("#sub-program");
				discountProgram = new Number($("#subdiction-budget\\["+i+"\\]").val().replace(/,/g,''));
			}

			totalCustomer = totalCustomer+customer;
			totalMediator = totalMediator+mediator;

			if($elem)
				$elem.val($("#subdiction-budget\\["+i+"\\]").val());

			$("#sub-discount").val(new Number(totalCustomer).numberFormat("#,###"));
		}
	});

	var $extras=$("input[name=extraIdx]");
	var totalExtras = 0;
	$.each($extras,function(idx,elem){
		var i=elem.value;
		if($("#extras\\["+i+"\\]").attr("checked")){
			totalExtras = totalExtras+new Number($("#extras-amount\\["+i+"\\]").val().replace(/,/g,''));
		}
	});
	$("#sub-extras").val(new Number(totalExtras).numberFormat("#,###"));
	$("#sub-maindealer").val(new Number($("#sub-maindealer").val().replace(/,/g,'')).numberFormat("#,###"));

	var unit_prepayment_po = new Number($("#unit-prepayment-po").val().replace(/,/g,''));

	if($("#credit-payment").attr('checked'))
	{
		//@todo:check
		var totalUnitPrepaymentAmount = 0;
		$.each($("input[name=unitPrepaymentAmount]"),function(idx,elem){
			var i=elem.value;
			if($("#unitPrepayment\\["+idx+"\\]-amount").val())
			{
				totalUnitPrepaymentAmount = totalUnitPrepaymentAmount+new Number($("#unitPrepayment\\["+idx+"\\]-amount").val().replace(/,/g,''));
				if(totalUnitPrepaymentAmount > (unit_prepayment_po-totalCustomer))
				{
					$("#unitPrepayment\\["+idx+"\\]-amount").val(0);
					alert('Jumlah Uang Muka tidak boleh melebihi Uang Muka Murni !!!');
					return;
				}
			}
		});
		
		$("#unit-pureprepayment-po").val(new Number(unit_prepayment_po-totalCustomer).numberFormat("#,###"));
		$("#unit-pureprepayment-po-hidden").val(unit_prepayment_po-totalCustomer);
	}

	if($("#mediator").val() != '0')
	{
		var mediator_manual = new Number($("#commission-mediator-manual").val().replace(/,/g,''));
		$("#mediator-commission").val(new Number(totalMediator).numberFormat("#,###"));
		$("#commission-mediator").val(new Number(totalMediator).numberFormat("#,###"));
		$("#commission-mediator-total").val(new Number(totalMediator+mediator_manual).numberFormat("#,###"));
	}
	$("#mediator-commission-validation").val(new Number(totalMediator));

	$("#unit-prepayment").val(new Number($("#unit-prepayment-po").val().replace(/,/g,'')).numberFormat("#,###"));
	$("#unit-pureprepayment").val($("#unit-pureprepayment-po").val());
	$("#mediator-com").val($("#commission-mediator-total").val());

	//var subprogram = new Number($("#sub-program").val().replace(/,/g,''));
	var subextras = new Number($("#sub-extras").val().replace(/,/g,''));
	var mediatorManual = new Number($("#commission-mediator-manual").val().replace(/,/g,''));
	
	if((discountDealer+discountProgram+subextras-totalRemaining) >= 0)
		$("#sub-puredealer").val((new Number(totalExtras)+new Number(discountDealer+discountProgram+mediatorManual-totalRemaining)).numberFormat("#,###"));
	else
		$("#sub-puredealer").val(0);
}

function flagPrice(status)
{
	var orgId = $("#org").val();
	var productId = $("#unit").val();
	
	if(status == "on")
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"ON_THE_ROAD"},
		function(json)
		{
			/* $.each(json.prices,function(idx,val)
			{ */
				$("#unit-price").val(new Number(json.price).numberFormat("#,###"));
				$("#unit-price-on").val(new Number(json.price).numberFormat("#,###"));
			/* }); */
		});
	}
	else
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"OFF_THE_ROAD"},
		function(json)
		{
			/* $.each(json.prices,function(idx,val)
			{ */
				$("#unit-price").val(new Number(json.price).numberFormat("#,###"));
				$("#unit-price-off").val(new Number(json.price).numberFormat("#,###"));
			/* }); */
		});
	}
}

function openLeasing(target)
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Company first !!!');
		return;
	}
	
	openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization="+org.value+"'/>");
}

function calculateSubdiction(i)
{
	var budget=$("#subdiction-budget\\["+i+"\\]").val().replace(/,/g,'');
	var customer=new Number($("#subdiction-customer\\["+i+"\\]").val().replace(/,/g,''));
	var mediator=new Number($("#subdiction-mediator\\["+i+"\\]").val().replace(/,/g,''));
	var total=customer+mediator;

	if(budget<total)
	{
		alert("Total "+$("#subdiction-name\\["+i+"\\]").val()+" tidak boleh melebihi budget");

		$("#subdiction-customer\\["+i+"\\]").val(0);
		$("#subdiction-mediator\\["+i+"\\]").val(0);
		$("#subdiction-total\\["+i+"\\]").val(0);

		if($("#subdiction-remaining\\["+i+"\\]"))
			$("#subdiction-remaining\\["+i+"\\]").val(0);
	}
	else
	{
		$("#subdiction-total\\["+i+"\\]").val(new Number(total).numberFormat("#,###"));

		if($("#subdiction-remaining\\["+i+"\\]"))
			$("#subdiction-remaining\\["+i+"\\]").val(new Number(budget-total).numberFormat("#,###"));
	}

	calc();
}

function checkSubdiction(i)
{
	if($("#subdiction\\["+i+"\\]").attr("checked"))
	{
		$("#subdiction-name\\["+i+"\\]").removeAttr("disabled").attr("class","inputbox-medium");
		
		//if(!$("#subdiction-category\\["+i+"\\]").val().contains('MAIN DEALER'))
		$("#subdiction-mediator\\["+i+"\\]").removeAttr("disabled").attr("class","");
		
		$("#subdiction-customer\\["+i+"\\]").removeAttr("disabled").attr("class","");
		calculateSubdiction(i);
	}
	else
	{
		$("#subdiction-name\\["+i+"\\]").val("");
		$("#subdiction-customer\\["+i+"\\]").val(0);
		$("#subdiction-mediator\\["+i+"\\]").val(0);
		$("#subdiction-total\\["+i+"\\]").val(0);
		$("#subdiction-remaining\\["+i+"\\]").val(0);

		$("#subdiction-name\\["+i+"\\]").attr("disabled","true");
		$("#subdiction-name\\["+i+"\\]").attr("class","inputbox-medium input-disabled");
		$("#subdiction-mediator\\["+i+"\\]").attr("disabled","true");
		$("#subdiction-mediator\\["+i+"\\]").attr("class","input-disabled");
		$("#subdiction-customer\\["+i+"\\]").attr("disabled","true");
		$("#subdiction-customer\\["+i+"\\]").attr("class","input-disabled");
		calculateSubdiction(i);
	}
}

function checkExtras(i)
{
	if($("#extras\\["+i+"\\]").attr("checked"))
	{
		$("#extras-amount\\["+i+"\\]").removeAttr("disabled");
		$("#extras-amount\\["+i+"\\]").attr("class","");
	}
	else
	{
		$("#extras-amount\\["+i+"\\]").val('0');
		$("#extras-amount\\["+i+"\\]").attr("disabled");
		$("#extras-amount\\["+i+"\\]").attr("class","input-disabled");
	}
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
		$("#"+id+"-samsat-area").val(json.subdistrictParent);
	});
}

function setFromCustomer(id)
{
	if($("#cust-address").val() == '')
	{
		if(id.equals('infoBPKB'))
		{
			$("#namaInfoBPKB option").remove();
			$("<option></option>").text("").val(0).appendTo("#namaInfoBPKB");
			$("#infoBPKB-validation").val("null");
		} else
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
	}
	else
	{
		$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:$("#cust").val()},function(json)
		{
			if(id == "delivery")
			{
				$("#"+id+"-address").val(json.address);
				$("#"+id+"-postalCode").val(json.postalCode);

				$("#"+id+"-province").val(json.provinceId);

				$("#"+id+"-city option").remove();
				$("<option></option>").text(json.city).val(0).appendTo("#"+id+"-city");

				$("#"+id+"-region option").remove();
				$("<option></option>").text(json.subdistrictParent).val(0).appendTo("#"+id+"-region");
				/* $("#"+id+"-region").val(json.region); */

				$("#"+id+"-subdistrict option").remove();
				$("<option></option>").text(json.subdistrict).val(0).appendTo("#"+id+"-subdistrict");

				$("#"+id+"-village").val(json.village);
				$("#buttonDetailPelanggan").val(json.addressId);
			}
			else if(id == "infoBPKB")
			{
				$("#namaInfoBPKB option").remove();
				$("<option></option>").text(json.name).val(0).appendTo("#namaInfoBPKB");
				$("#infoBPKB-validation").val("customer");
			}
			else
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
			}
		});
	}

	$("#"+id+"-address").attr("disabled");
	$("#"+id+"-address").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-province").attr("class","combobox-ext input-disabled");
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
	
	$("#delivery-address-validation").val('customer');
}

function setFromLicense(id)
{
	if($("#license-address").val() == '')
	{
		if(id.equals('infoBPKB'))
		{
			$("#namaInfoBPKB option").remove();
			$("<option></option>").text("").val(0).appendTo("#namaInfoBPKB");
			$("#infoBPKB-validation").val("null");
		} else
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
	}
	else
	{
		$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:$("#license").val()},function(json){
			$("#"+id+"-address").val(json.address);
			$("#"+id+"-postalCode").val(json.postalCode);

			if(id == "delivery")
			{
				$("#"+id+"-province").val(json.provinceId);

				$("#"+id+"-city option").remove();
				$("<option></option>").text(json.city).val(0).appendTo("#"+id+"-city");

				$("#"+id+"-region option").remove();
				$("<option></option>").text(json.subdistrictParent).val(0).appendTo("#"+id+"-region");
				/* $("#"+id+"-region").val(json.region); */

				$("#"+id+"-subdistrict option").remove();
				$("<option></option>").text(json.subdistrict).val(0).appendTo("#"+id+"-subdistrict");
			}
			else if(id == "infoBPKB")
			{
				$("#namaInfoBPKB option").remove();
				$("<option></option>").text(json.name).val(0).appendTo("#namaInfoBPKB");
				$("#infoBPKB-validation").val("stnk");
			}
			else
			{
				$("#"+id+"-province").val(json.province);
				$("#"+id+"-city").val(json.city);
				$("#"+id+"-subdistrict").val(json.subdistrict);
			}

			$("#"+id+"-village").val(json.village);
			$("#"+id+"-phone").val(json.phone);
			$("#"+id+"-phone2").val(json.phone2);
			$("#"+id+"-email").val(json.email);
			$("#"+id+"-samsat-area").val(json.subdistrictParent);

			$("#"+id).empty()
			$("#"+id).append($("<option value="+$("#cust").val()+">"+$("#cust").text()+"</option>"));
			$("#buttonDetailStnk").val(json.addressId);
		});
	}

	$("#"+id+"-address").attr("disabled");
	$("#"+id+"-address").attr("class","inputbox-ext input-disabled");

	$("#"+id+"-province").attr("class","combobox-ext input-disabled");
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

	$("#delivery-address-validation").val('licence');
}

function validationAddress(id)
{
	$("#"+id+"-address").removeAttr("disabled");
	$("#"+id+"-address").attr("class","inputbox-ext");
	$("#"+id+"-address").val('');

	$("#"+id+"-province").removeAttr("disabled");
	$("#"+id+"-province").attr("class","combobox-ext");
	$("#"+id+"-province").val(0);

	$("#"+id+"-city").removeAttr("disabled");
	$("#"+id+"-city").attr("class","combobox-ext");
	$("#"+id+"-city option").remove();
	$("<option></option>").text("--Kota/Kabupaten--").val(0).appendTo("#"+id+"-city");

	$("#"+id+"-region").removeAttr("disabled");
	$("#"+id+"-region").attr("class","combobox-ext");
	$("#"+id+"-region option").remove();
	$("<option></option>").text("--Wilayah Samsat--").val(0).appendTo("#"+id+"-region");
	/* $("#"+id+"-region").removeAttr("disabled");
	$("#"+id+"-region").attr("class","inputbox-ext");
	$("#"+id+"-region").val(''); */

	$("#"+id+"-subdistrict").removeAttr("disabled");
	$("#"+id+"-subdistrict").attr("class","combobox-ext");
	$("#"+id+"-subdistrict option").remove();
	$("<option></option>").text("--Kecamatan--").val(0).appendTo("#"+id+"-subdistrict");

	$("#"+id+"-village").removeAttr("disabled");
	$("#"+id+"-village").attr("class","");
	$("#"+id+"-village").val('');

	$("#"+id+"-postalCode").removeAttr("disabled");
	$("#"+id+"-postalCode").attr("class","");
	$("#"+id+"-postalCode").val('');
	$("#buttonDetailOther").val(0);

	$("#delivery-address-validation").val('other');
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

function checkavailableregion(target) {
	$.get("<c:url value='/page/geographicsremote.checkavailableregion.json'/>",{id:$("#"+target+"-city").val()},function(json){
		$("#"+target+"-region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#"+target+"-region");
		$("#"+target+"-subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#"+target+"-subdistrict");
		if(json.available)
			getregion(target);
		else
			getsubdistrictnoregion(target);
	});
}

function getregion(target)
{
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target+"-city").val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-region");
		});
	});
}

function getsubdistrict(target)
{
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#"+target+"-region").val()},function(json){
		$("#"+target+"-subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#"+target+"-subdistrict");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-subdistrict");
		});
	});
}

function getsubdistrictnoregion(target)
{
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#"+target+"-city").val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#"+target+"-subdistrict");
		});
	});
}

function getsubdiction(productId, payment)
{
	if(productId != 0)
	{
		for(var x=0;x<=2;x++)
		{
			var index = 0;
			subsidiNonDealer(productId, index, $("#org").val(), payment);
		}
	}
}

function subsidiNonDealer(idProduct, index, idOrganization, paymentType)
{
	$.get("<c:url value='/page/productremote.getsubdiction.json'/>",{productId:idProduct,type:"nondealer",organizationId:idOrganization,payment:paymentType},
	function(json)
	{
		var tbl = document.getElementById("subdictionNonDealerTable");
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
		$.each(json.subdictions,function(idx,val)
		{
			var tbl = document.getElementById("subdictionNonDealerTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				if(t_section)
				{
					if($("#leasing").val() == '0')
					{
						if(val.type != 'LEASING')
						{
							var row = t_section.insertRow(t_section.rows.length);
							row.insertCell(0).appendChild(genCheck(index,val.id,1));
							row.insertCell(1).appendChild(genCategory(index,val.type));
							row.insertCell(2).appendChild(genProgram(index));
							row.insertCell(3).appendChild(genBudget(index,val.amount));
							row.insertCell(4).appendChild(genCustomer(index));
							row.insertCell(5).appendChild(genMediator(index));
							row.insertCell(6).appendChild(genTotal(index));
							row.insertCell(7).appendChild(genRemaining(index));
							row.insertCell(8).appendChild(genStatus(index));
							row.insertCell(9).appendChild(genSubType(index, val.type));
							index++;
						}
					}
					else
					{
						if(val.type == 'LEASING')
						{
							$.get("<c:url value='/page/productremote.getsubdictionleasing.json'/>",{productId:idProduct,leasingId:$("#leasing").val(),organizationId:idOrganization},
							function(json)
							{
								if(json.subdictions.length > 0)
								{
									$.each(json.subdictions,function(idx,val)
									{
										/* var $subdiction=$("input[name=subdictionIdx]");
										$.each($subdiction,function(idx,elem){
											ada = elem.value;
											$("#leasing-temporary-id").val(new Number(val.id));
											$("#leasing-temporary").val(new Number(val.amount));
										}); */
										$("#leasing-temporary-id").val(new Number(val.id));
										$("#leasing-temporary").val(new Number(val.amount));
									});
								}
								else
									$("#leasing-temporary").val(new Number(0));
							});

							if($("#leasing-temporary").val() != '0')
							{
								var row = t_section.insertRow(t_section.rows.length);
								row.insertCell(0).appendChild(genCheck(index,new Number($("#leasing-temporary-id").val()),1));
								row.insertCell(1).appendChild(genCategory(index,val.type));
								row.insertCell(2).appendChild(genProgram(index));
								row.insertCell(3).appendChild(genBudget(index, new Number($("#leasing-temporary").val())));
								row.insertCell(4).appendChild(genCustomer(index));
								row.insertCell(5).appendChild(genMediator(index));
								row.insertCell(6).appendChild(genTotal(index));
								row.insertCell(7).appendChild(genRemaining(index));
								row.insertCell(8).appendChild(genStatus(index));
								row.insertCell(9).appendChild(genSubType(index, val.type));
								index++;
							}
						}
						else
						{
							var row = t_section.insertRow(t_section.rows.length);
							row.insertCell(0).appendChild(genCheck(index,val.id,1));
							row.insertCell(1).appendChild(genCategory(index,val.type));
							row.insertCell(2).appendChild(genProgram(index));
							row.insertCell(3).appendChild(genBudget(index,val.amount));
							row.insertCell(4).appendChild(genCustomer(index));
							row.insertCell(5).appendChild(genMediator(index));
							row.insertCell(6).appendChild(genTotal(index));
							row.insertCell(7).appendChild(genRemaining(index));
							row.insertCell(8).appendChild(genStatus(index));
							row.insertCell(9).appendChild(genSubType(index, val.type));
							index++;
						}
					}
				}
			}
		});
		subsidiDealer(idProduct, index, idOrganization, paymentType);
	});
}

function subsidiDealer(idProduct, index, idOrganization, paymentType)
{
	$.get("<c:url value='/page/productremote.getsubdiction.json'/>",{productId:idProduct,type:"dealer",organizationId:idOrganization,payment:paymentType},
	function(json)
	{
		var tbl = document.getElementById("subdictionDealerTable");
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
		$.each(json.subdictions,function(idx,val)
		{
			var tbl = document.getElementById("subdictionDealerTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				if(t_section)
				{
					var row = t_section.insertRow(t_section.rows.length);
					row.insertCell(0).appendChild(genCheck(index,val.id,0));
					row.insertCell(1).appendChild(genCategory(index,val.type));
					row.insertCell(2).appendChild(genProgram(index));
					row.insertCell(3).appendChild(genBudget(index,val.amount));
					row.insertCell(4).appendChild(genCustomer(index));
					row.insertCell(5).appendChild(genMediator(index));
					row.insertCell(6).appendChild(genTotal(index));
					row.insertCell(7).appendChild(genStatus(index));
					row.insertCell(8).appendChild(genSubType(index, val.type));
					index++;
				}
			}
		});
	});
}

function genCheck(index,val,type)
{
	var check = document.createElement("input");
	check.type = "checkbox";
	check.name = "subdiction";
	check.id = "subdiction["+index+"]";
	check.setAttribute('onclick', 'checkSubdiction('+index+')');
	check.value = val;

	if(type!=null){
		var typeCheck=document.createElement("input");
		typeCheck.type="hidden";
		typeCheck.id="sub-type["+index+"]";
		typeCheck.value=type;

		var div=document.createElement("div");
		div.appendChild(check);
		div.appendChild(typeCheck);
		return div;
	}else{
		return check;
	}
}

function genCategory(index, val)
{
	var category = document.createElement("input");
	category.name = 'subdiction-category';
	category.id = "subdiction-category["+index+"]";
	category.setAttribute('class',"inputbox-medium input-disabled");
	category.disabled = true;

	if(val == 'DISC_DEALER')
		category.value = "DISCOUNT DEALER";
	else if(val == 'DISC_PROGRAM')
		category.value = "DISCOUNT PROGRAM";
	else if(val == 'LEASING')
		category.value = "LEASING";
	else if(val == 'MAIN_DEALER')
		category.value = "MAIN DEALER";

	return category;
}

function genProgram(index)
{
	var program = document.createElement("input");
	program.name = 'subdiction-name';
	program.id = "subdiction-name["+index+"]";
	program.setAttribute('class',"inputbox-medium input-disabled");
	program.disabled = true;
	program.value = '';

	return program;
}

function genBudget(index, val)
{
	var budget = document.createElement("input");
	budget.name = 'subdiction-bugdet';
	budget.id = "subdiction-budget["+index+"]";
	budget.setAttribute('class',"input-disabled");
	budget.disabled = true;
	budget.value = val.numberFormat('#,#');

	return budget;
}

function genCustomer(index)
{
	var customer = document.createElement("input");
	customer.name = 'subdiction-customer';
	customer.id = "subdiction-customer["+index+"]";
	customer.setAttribute('class',"input-disabled");
	customer.setAttribute('onblur', 'calculateSubdiction('+index+');');
	customer.disabled = true;
	customer.value = '0';
	customer.setAttribute('onkeyup', "separator('subdiction-customer["+index+"]');");

	return customer;
}

function genMediator(index)
{
	var mediator = document.createElement("input");
	mediator.name = 'subdiction-mediator';
	mediator.id = "subdiction-mediator["+index+"]";
	mediator.setAttribute('class',"input-disabled");
	mediator.setAttribute('onblur', 'calculateSubdiction('+index+');');
	mediator.setAttribute('onkeyup', "separator('subdiction-mediator["+index+"]');");
	mediator.disabled = true;
	mediator.value = '0';

	return mediator;
}

function genTotal(index)
{
	var total = document.createElement("input");
	total.name = 'subdiction-total';
	total.id = "subdiction-total["+index+"]";
	total.setAttribute('class',"input-disabled");
	total.disabled = true;
	total.value = '0';

	return total;
}

function genRemaining(index)
{
	var remaining = document.createElement("input");
	remaining.name = 'subdiction-remaining';
	remaining.id = "subdiction-remaining["+index+"]";
	remaining.setAttribute('class',"input-disabled");
	remaining.disabled = true;
	remaining.value = '0';

	return remaining;
}

function genStatus(index)
{
	var status = document.createElement("input");
	status.type = "hidden";
	status.name = 'subdictionIdx';
	status.value = index;

	return status;
}

function genSubType(index, val)
{
	var subType = document.createElement("input");
	subType.type = "hidden";
	subType.id = "subdiction-type["+index+"]";
	subType.value = val;

	return subType;
}

var prepaymentIdx=0;
function newprepayment()
{
	var tbl = document.getElementById("pendanaanTable");
	if(tbl)
	{
		var t_section = tbl.tBodies[0];
		if(t_section)
		{
			var row = t_section.insertRow(t_section.rows.length);
			row.insertCell(0).appendChild(genCheckPrepayment(prepaymentIdx));
			row.insertCell(1).appendChild(genPrepayment(prepaymentIdx));
			row.insertCell(2).appendChild(genAvailablePrepayment(prepaymentIdx));
			row.insertCell(3).appendChild(genAmountPrepayment(prepaymentIdx));
			row.insertCell(4).appendChild(genStatusPrepayment(prepaymentIdx));
			prepaymentIdx++;
		}
	}
}
function genCheckPrepayment(index){
	var check = document.createElement("input");
	check.type = "checkbox";
	check.name = "checkprepayment";
	check.id = "checkprepayment["+index+"]";
	return check;
}
function genPrepayment(index){
	var divContainer=document.createElement("div");

	var product = document.createElement("select");
	product.name="unitPrepayment";
	product.id="unitPrepayment["+index+"]";
	product.setAttribute('class','combobox');

	var _popup = document.createElement('img');
	_popup.id = '_popup_line['+index+']';
	_popup.src = 'assets/icons/list_extensions.gif';
	_popup.onclick = function()
	{
		openPrepayment(product.id,null,true);
	}
	_popup.setAttribute('style','CURSOR:pointer;');
	_popup.title='Prepayment';


	divContainer.appendChild(product);
	divContainer.appendChild(_popup);
	return divContainer;
}
function genAvailablePrepayment(index){
	var check = document.createElement("input");
	check.type = "text";
	check.name = "unitPrepaymentAvailable";
	check.id = "unitPrepayment["+index+"]-available";
	check.setAttribute("class","inputbox input-disabled");
	check.value=0;
	return check;
}

function genAmountPrepayment(index){
	var check = document.createElement("input");
	check.type = "text";
	check.name = "unitPrepaymentAmount";
	check.id = "unitPrepayment["+index+"]-amount";
	check.setAttribute("onkeyup","separator('unitPrepayment["+index+"]-amount')");
	check.value="0";
	check.onblur=function(){
		var val=Number.parse(check.value);
		if($.isNumeric(val)){
			if(Number.parse($("#unitPrepayment\\["+index+"\\]-available").val())>=val)
				check.value=new Number(val).numberFormat("#,###");
			else{
				alert("Jumlah yang anda masukan melebihi yang tersedia("+Number.parse($("#unitPrepayment\\["+index+"\\]-available").val())+")");
				check.value="0";
			}
		}else
			check.value="0";
		calc();
	};
	return check;
}

function genStatusPrepayment(index){
	var stprep = document.createElement("input");
	stprep.type = "hidden";
	stprep.name = 'prepaymentIdx';
	stprep.value = index;

	return stprep;
}

function flagPayment(type)
{
	if(type=="cash"){
		$("#leasing option").remove();
		$("<option></option>").text("--Leasing--").val(0).appendTo("#leasing");
		$("#leasing-term").val(0);
		$("#unit-installment").val(0);
		$("#unit-prepayment-po").val(0);
		$("#unit-pureprepayment-po").val(0);
		$("#unit-pureprepayment-po-hidden").val(0);

		$("#leasing").attr("disabled", "true");
		$("#leasing-browse").attr("hidden", "true");
		$("#leasing-term").attr("disabled", "true");
		$("#unit-installment").attr("disabled");
		$("#unit-prepayment-po").attr("disabled");
		//$("#unit-pureprepayment-po").attr("disabled");
		$("#leasing").attr("class","combobox-medium input-disabled");
		$("#leasing-term").attr("class","input-disabled");
		$("#unit-installment").attr("class","input-disabled");
		$("#unit-prepayment-po").attr("class","input-disabled");
		//$("#unit-pureprepayment-po").attr("class","input-disabled");
		
		$("#buttonDetailBPKBPelanggan").removeAttr("disabled");
		$("#buttonDetailBPKBStnk").removeAttr("disabled");

		if($("#unit").val() == 0)
		{
			alert('Mohon pilih Product terlebih dahulu agar data Subsidi bisa muncul !!!');
			return;
		}
		getsubdiction($("#unit").val(), 'CASH');
		calc();
	}else{
		$("#leasing").removeAttr("disabled");
		$("#leasing-browse").removeAttr("hidden");
		$("#leasing-term").removeAttr("disabled");
		$("#unit-installment").removeAttr("disabled");
		$("#unit-prepayment-po").removeAttr("disabled");
		//$("#unit-pureprepayment-po").removeAttr("disabled");
		$("#leasing").attr("class","combobox-medium");
		$("#leasing-term").removeAttr("class");
		$("#unit-installment").attr("class","");
		$("#unit-prepayment-po").attr("class","");
		//$("#unit-pureprepayment-po").attr("class","");
		
		$("#buttonDetailBPKBPelanggan").attr("disabled","true");
		$("#buttonDetailBPKBStnk").attr("disabled","true");
		
		$("#namaInfoBPKB option").remove();
		$("<option></option>").text("").val(0).appendTo("#namaInfoBPKB");

		if($("#unit").val() == 0)
		{
			alert('Mohon pilih Product terlebih dahulu agar data Subsidi bisa muncul !!!');
			return;
		}
		getsubdiction($("#unit").val(), 'CREDIT');
	}
}

var t = 0;
function validation()
{
	if($("#org").val() == null || $("#org").val() == '')
	{
		alert('Please select Company first !!!');
		return;
	}

	if($("#referenceCode").val() == '')
	{
		alert('No Referensi SPK tidak boleh kosong !!!');
		return;
	}

	if($("#dateId").val() == '')
	{
		alert('Tanggal tidak boleh kosong !!!');
		return;
	}

	if($("#salesPerson").val() == null || $("#salesPerson").val() == '')
	{
		alert('Mohon pilih Salesman terlebih dahulu !!!');
		return;
	}

	if($("#unit-price").val() == null || $("#unit-price").val() <= 0 || $("#unit-price").val() == '')
	{
		alert('Harga OTR tidak boleh kosong !!!');
		return;
	}

	if($("#cust").val() == 0)
	{
		alert('Mohon pilih Pemesannya terlebih dahulu !!!');
		return;
	}

	if($("#license").val() == 0)
	{
		alert('Mohon pilih Detail Pelanggan terlebih dahulu !!!');
		return;
	}

	if($("#delivery-address").val() == '')
	{
		alert('Detail Pengiriman tidak boleh kosong !!!');
		return;
	}
	
	if($("#delivery-address-validation").val() == 'other')
	{
		if($("#delivery-province").val() == '0')
		{
			alert('Pilih Provinsi pengiriman terlebih dahulu !!!');
			return;
		}
		
		if($("#delivery-city").val() == '0')
		{
			alert('Pilih Kota/Kabupaten pengiriman terlebih dahulu !!!');
			return;
		}
		
		if($("#delivery-subdistrict").val() == '0')
		{
			alert('Pilih Kecamatan pengiriman terlebih dahulu !!!');
			return;
		}
	}

	if($("#unit").val() == 0)
	{
		alert('Mohon pilih Product-nya terlebih dahulu !!!');
		return;
	}

	if($("#credit-payment").attr('checked'))
	{
		if($("#leasing").val() == 0)
		{
			alert('Mohon pilih Leasing terlebih dahulu !!!');
			return;
		}

		if($("#leasing-term").val() <= 0 || $("#leasing-term").val() == '')
		{
			alert('Tenor tidak boleh kosong dan harus > 0 !!!');
			return;
		}

		if($("#unit-installment").val().replace(/,/g,'') <= 0 || $("#unit-installment").val() == '')
		{
			alert('Top Angsuran tidak boleh kosong dan harus > 0 !!!');
			return;
		}

		if($("#unit-prepayment-po").val().replace(/,/g,'') <= 0 || $("#unit-prepayment-po").val() == '')
		{
			alert('Uang Muka PO tidak boleh kosong dan harus > 0 !!!');
			return;
		}
	}

	var $subdiction=$("input[name=subdictionIdx]");
	var total = 0;
	var count = 0;
	$.each($subdiction,function(idx,elem)
	{
		var i=elem.value;
		total++;
		if($("#subdiction\\["+i+"\\]").attr("checked"))
		{
			count++;
		}
	});

	t = total;
	
	if(count < total)
	{
		alert('Subsidi Beban Dealer dan Subsidi Bukan Beban Dealer harus dipilih semua !!!');
		return;
	}

	if(parseFloat($("#mediator-commission-validation").val()) > 0)
	{
		if($("#mediator").val() == 0)
		{
			alert('Mohon pilih Mediator terlebih dahulu !!!');
			return;
		}
	}
	return true;
}

var status=true;
var $confirmDialog=$("<div></div>").dialog({
	title:"Warning",
	modal:true,
	autoOpen:false,
	buttons:{
		"Yes":function(){$(this).dialog("close");},
		"No":function(){$(this).dialog("close");}
	}
});

function chkcustsub(idx){
	var thisName=$("#subdiction-category\\["+idx+"\\]").val();
	var isChecked=$("#subdiction\\["+idx+"\\]").is(":checked");
	var isExist=($("#subdiction\\["+idx+"\\]").length>0);
	var isZeroValue=($("#subdiction-customer\\["+idx+"\\]").val()=="0");
	var thisType=$("#sub-type\\["+idx+"\\]").val();

	switch(thisType){
		case 0:
			thisType="Beban Dealer";
			break;
		case 1:
			thisType="Bukan Beban Dealer";
			break;
		default:
			break;
	}
	if(isExist){
		if(isChecked){
			if(isChecked && isZeroValue){
				$confirmDialog.html("Subsidi "+thisType+"("+thisName+") untuk konsumen tidak diisi, Lanjutkan Transaksi?").dialog("option","buttons",{
					"Yes":function(){chkmedsub(idx);},
					"No":function(){$confirmDialog.dialog('close');}
				}).dialog('open');
			}else{
				chkmedsub(idx+1);
			}
		}else{
			chkcustsub(idx+1);
		}
	}else{
		if($("#credit-payment").is(":checked")){
			var status=true;
			$.each($("input[name=subdiction]"),function(idx,val){
				if(val.checked){
					status=false;
					return false;
				}
			});
			/* if(status){
				$confirmDialog.dialog("close");
				alert("Subsidi Bukan Beban Dealer harus dipilih!");
			}else{
				chkmediator();
			} */
			if(!status){
				chkmediator();
			}
		}else{
			$confirmDialog.dialog("close");
			chkmediator();
		}
	}
}
function chkmedsub(idx){
	var thisName=$("#subdiction-category\\["+idx+"\\]").val();
	var isChecked=$("#subdiction\\["+idx+"\\]").is(":checked");
	var isExist=($("#subdiction\\["+idx+"\\]").length>0);
	var isZeroValue=($("#subdiction-mediator\\["+idx+"\\]").val()=="0");
	var thisType=$("#sub-type\\["+idx+"\\]").val();

	switch(thisType){
		case 0:
			thisType="Beban Dealer";
			break;
		case "1":
			thisType="Bukan Beban Dealer";
			break;
		default:
			break;
	}
	if(isExist){
		if(isChecked){
			if(isChecked && isZeroValue){
				$confirmDialog.html("Subsidi "+thisType+"("+thisName+") untuk mediator tidak diisi, Lanjutkan Transaksi?").dialog({
					buttons:{"Yes":function(){chkcustsub(idx+1)},"No":function(){$confirmDialog.dialog('close');}}
				}).dialog('open');
			}else{
				chkcustsub(idx+1);
			}
		}else{
			chkcustsub(idx+1);
		}
	}else{
		$confirmDialog.dialog("close");
		chkmediator();
	}
}
function chkmediator(){
	if($("#mediator").val()=="0"){
		$confirmDialog.html("Mediator tidak diisi, Lanjutkan Transaksi?").dialog({
			buttons:{"Yes":function(){chkaccs();},"No":function(){$confirmDialog.dialog('close');}}
		}).dialog('open');
	}else{
		chkaccs();
	}
}
function chkaccs(){
	var $extras=$("input[name='extraIdx']");
	var $elem;
	$.each($extras,function(idx,elem){
		var ex=$("#extras\\["+elem.value+"\\]");
		var exName=ex.parent().parent().children(":nth-child(2)");
		if((exName.text().contains("Aksesoris")) && (ex.is(":checked"))){
			$elem=elem;
			return false;
		}
	});
	if($elem!=null){
		var amount=$("#extras-amount\\["+$elem.value+"\\]");
		if(amount.val()=="0"){
			$confirmDialog.html("Assesories tidak diisi, Lanjutkan Transaksi?").dialog({
				buttons:{"Yes":function(){b_save();},"No":function(){$confirmDialog.dialog('close');}}
			}).dialog('open');
		}else{
			b_save();
		}
	}else{
		b_save();
	}
}

function b_save(){
	$confirmDialog.dialog('close');
	$('.b_save').hide();
	$.ajax({
		url:"<c:url value='/page/unitsalesorderadd.htm'/>",
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
					window.location="<c:url value='/page/unitsalesorderview.htm'/>";
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

$(function()
{
	$('.b_save').click(function(e){
		$target = $(e.target);
		
		var tbl = document.getElementById("pendanaanTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len > 0)
			{
				$.each($("input[name=unitPrepaymentAmount]"),function(idx,elem){
					var i=elem.value;
			 		if($("#unitPrepayment\\["+idx+"\\]-amount").val() == '0')
					{
						alert("Uang Muka Harus di isi atau lebih besar dari 0");
						return;
					}
			 		else if($("#unitPrepayment\\["+idx+"\\]-amount").val() == '')
					{
			 			alert("Uang Muka Harus di isi !!");
			 			return;
					}
			 		else if($("#unitPrepayment\\["+idx+"\\]-amount").val() < 0)
			 		{
			 			alert("Uang Muka Harus lebih besar dari 0 !!");
			 			return;
					}else{
						if(validation())
						{
							if(t > 0)
								chkcustsub(0);
							else
								b_save();
						}
					}
				});
			}else{
				if(validation())
				{
					if(t > 0)
						chkcustsub(0);
					else
						b_save();
				}
			}
		}

	});
	
	$("#delivery-postalCode").keydown(function(event)
	{
        numberOnly(event);
    }).keyup(function(event)
	{
        //limit();
    });
	
	$("#leasing-term").keydown(function(event)
	{
        numberOnly(event);
    }).keyup(function(event)
	{
        //limit();
    });

	$("#leasing").focus(function()
	{
		var idProduct = $("#unit").val();
		var idLeasing = $("#leasing").val();
		var idOrganization = $("#org").val();
		if(idProduct != 0)
		{
			$.get("<c:url value='/page/productremote.getsubdictionleasing.json'/>",{productId:idProduct,leasingId:idLeasing,organizationId:idOrganization},
			function(json)
			{
				getsubdiction(idProduct, 'CREDIT');
				if(json.subdictions.length > 0)
				{
					$.each(json.subdictions,function(idx,val)
					{
						var $subdiction=$("input[name=subdictionIdx]");
						$.each($subdiction,function(idx,elem){
							var i=elem.value;
							var type=$("#subdiction-type\\["+i+"\\]").val();
							if(type == 'LEASING'){
								$("#subdiction\\["+i+"\\]").val(val.id);
								$("#subdiction-budget\\["+i+"\\]").val(val.amount.numberFormat('#,#'));
							}
						});
					});
				}
			});
		}
	});
	
	$("#mediator").focus(function()
	{
		if($(this).val()!=0){
			/* $("#mediator-commission").attr("class","");
			$("#mediator-commission").removeAttr("disabled"); */
			$("#commission-mediator-manual").removeAttr("disabled");
			$("#commission-mediator-manual").attr("class","");
			calc();
		}
		else
		{
			/* $("#mediator-commission").attr("class","input-disabled");
			$("#mediator-commission").attr("disabled"); */
			$("#commission-mediator-manual").attr("disabled");
			$("#commission-mediator-manual").attr("class","input-disabled");
			$("#mediator-commission").val(0);
			$("#commission-mediator").val(0);
		}
	}).change(function()
	{
		if($(this).val()!=0)
		{
			/* $("#mediator-commission").attr("class","");
			$("#mediator-commission").removeAttr("disabled"); */
			if($("#cash-payment").attr("checked"))
			{
				$("#commission-mediator-manual").removeAttr("disabled");
				$("#commission-mediator-manual").attr("class","");
			}
			else
			{
				$("#commission-mediator-manual").attr("disabled");
				$("#commission-mediator-manual").attr("class","input-disabled");
			}
			calc();
		}
		else
		{
			/* $("#mediator-commission").attr("class","input-disabled");
			$("#mediator-commission").attr("disabled"); */
			$("#commission-mediator-manual").attr("disabled");
			$("#commission-mediator-manual").attr("class","input-disabled");
			$("#mediator-commission").val(0);
			$("#commission-mediator").val(0);
		}
	});

	$("#commission-mediator-manual").change(function()
	{
		var commission = new Number($("#commission-mediator").val().replace(/,/g,''));
		var commission_manual = new Number($("#commission-mediator-manual").val().replace(/,/g,''));
		$("#commission-mediator-total").val(commission+commission_manual);
		$("#mediator-com").val(commission+commission_manual);
		//$("#mediator-commission").val(new Number(commission)+new Number(commission_manual));
		calc();
	});

	$("#unit-prepayment-po").change(function()
	{
		$("#unit-prepayment").val($("#unit-prepayment-po").val().replace(/,/g,''));
		calc();
	});

	$("#unit-pureprepayment-po").change(function()
	{
		$("#unit-pureprepayment").val($("#unit-pureprepayment-po").val());
	});

	/* $("#mediator-commission").change(function()
	{
		$("#mediator-com").val($("#mediator-commission").val());
	}); */
});

function addCustomer(target)
{
	openpopup("<c:url value='/page/customerpreaddpopup.htm?target='/>"+target);
}

function newSubdiction(target)
{
	var paymentType = "";
	if($('#unitPayment').val() == 'CASH')
		paymentType = "cash";
	else
		paymentType = "credit";
	
	openpopup("<c:url value='/page/unitsalesordersubdictionpreaddpopup.htm?target='/>"+target+"&type="+paymentType);
}

function addCustomerInstant(target)
{
	openpopup("<c:url value='/page/customerinstantpreaddpopup.htm?target='/>"+target);
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

function limit()
{
	var limit = parseInt($(this).attr('maxlength'));
    var text = $(this).val();
    var chars = text.length;

    if(chars > limit){
        var new_text = text.substr(0, limit);
        $(this).val(new_text);
    }
}

function separator(target)
{
	var amount = document.getElementById(target);
	
	if(amount.value != '')
	{
		var minus = "";
		if(amount.value.substring(0,1) == '-')
		{
			minus = "-";
			amount.value = amount.value.replace('-','0');
		}
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		amount.value = minus+amount.value;
	}
}
</script>
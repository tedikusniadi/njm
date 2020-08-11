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
							<a class="item-button-list" href="<c:url value='/page/unitdeliveryorderview.htm'/>"><span><spring:message code="list"/></span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer"><span><spring:message code="save"/></span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_add">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">No. SJ :</td>
                                  	<td width="80%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right"><spring:message code="facility"/> :</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext input-disabled">
                                        <c:if test='${not empty order_add.organization}'>
                                            <form:option value='${order_add.organization.id}' label='${order_add.organization.firstName} ${order_add.organization.lastName} ${order_add.organization.middleName}' />
                                        </c:if>
                                    	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right"><spring:message code="date"/> :</td>
                                    <td><input id="date" name="date" formatLength="long" value="<fmt:formatDate value='${order_add.date}' pattern='MM/dd/yyyy'/>" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Pelanggan :</td>
                                    <td width="80%"><input value="${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.firstName} ${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.middleName} ${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customer.lastName}" class='input-disabled' size='45'/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Nama STNK :</td>
                                    <td width="80%"><input value="${order_add.deliveryPlanningSequence.deliveryPlanning.planable.customerUnit.name}" class='input-disabled' size='45'/></td>
                                </tr>
                                <tr>
                                    <td width="20%" nowrap="nowrap" align="right">Reference :</td>
                                    <td width="80%"><a href="<c:url value='/page/unitsalesorderpreedit.htm?id=${order_add.deliveryPlanningSequence.deliveryPlanning.planable.id}'/>"><c:out value='${order_add.deliveryPlanningSequence.deliveryPlanning.planable.code}'/></a></td>
                                </tr>
                                <tr>
                                    <td align="right">Gudang : </td>
                                    <td>
                                        <form:select id="facility" path="deliveryPlanningSequence.facility" class="combobox-ext">
                                        </form:select>&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openfacility();clearSerials();" style="CURSOR:pointer;" title="Facility" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"><spring:message code="note"/> : </td>
                                    <td><form:textarea path='note' rows='6' cols='55'/></td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100%;height:200px;">
                                   	<div id="product" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                    	<table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                        <thead>
                                        <tr>
                                            <th width="17%">Tipe</th>
                                            <th width="17%">Nama Tipe</th>
                                            <th width="11%">Warna</th>
                                            <th width="17%">No.Mesin</th>
                                            <th width="13%">No.Rangka</th>
                                            <th width="10%">Tahun</th>
                                            <th width="15%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${order_add.items}" var="line" varStatus='status'>
                                        <tr>
                                        	<td><c:out value='${line.item.sequenceable.product.types}'/></td>
                                            <td><c:out value='${line.item.sequenceable.product.typeNames}'/></td>
                                            <td><c:out value='${line.item.sequenceable.product.colors}'/></td>
                                            <td>
                                            	<form:input id="serial[${status.index}]" path='items[${status.index}].details[0].serial' size='20' readonly="true"/>
                                            	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openItemSerial(${line.item.sequenceable.product.id}, 'serial[${status.index}]');" style="CURSOR:pointer;" title="Popup Serial" />
                                            </td>
                                            <td><form:input id="serial[${status.index}]2" path='items[${status.index}].details[0].serialExt1' size='20' readonly="true"/></td>
                                            <td><form:input id="serial[${status.index}]3" path='items[${status.index}].details[0].year' size='10' readonly="true"/></td>
                                            <td>
                                            	<form:input path='items[${status.index}].note' size='30'/>
                                            	<form:input type="hidden" id="quantity[${status.index}]" path='items[${status.index}].details[0].quantity' value='1' size='20'/>
                                            	<form:input type="hidden" id="unissued[${status.index}]" path='items[${status.index}].details[0].unissued' value='1' size='20'/>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                    </div>
                                    <div id="accessories" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
                                    	<div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addItem();"><span>Tambah</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('accTable')"><span>Hapus</span></a>
                                             <div class="item-navigator">&nbsp;</div>
                                        </div>
                                    	<table id="accTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    		<thead>
                                    		<tr>
                                    			<th width="1%"><input type="checkbox" id="check_accTable" onclick="clickAll('accTable')"/></th>
                                    			<th width="25%">Barang</th>
                                    			<th>Jumlah</th>
                                    			<th>Serial</th>
                                    			<th>Satuan</th>
                                    			<th colspan="2">Catatan</th>
                                    		</tr>
                                    		</thead>
                                    		<tbody>
                                    		</tbody>
                                    		<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                    	</table>
                                    </div>
                                    <div id="exp" dojoType="ContentPane" label="Pengiriman & Ekspedisi" class="tab-pages" refreshOnShow="true">
                                    <table width="100%">
                                    	<tr>
                                    		<td valign="top">
                                    			<table style="border:none" width="100%">
			                                    	<tr>
			                                            <td width="20%" align="right">Alamat Kirim : </td>
			                                            <td width="80%">
			                                            	 <input value="${order_add.deliveryPlanningSequence.postalAddress.address}" disabled class="inputbox-ext input-disabled"/>
			                                          	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Provinsi:</td>
			                                        	<td>
			                                        		<input value="${order_add.deliveryPlanningSequence.postalAddress.province.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kota/Kabupaten:</td>
			                                        	<td>
			                                        		<input value="${order_add.deliveryPlanningSequence.postalAddress.city.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kecamatan:</td>
			                                        	<td>
			                                        		<input value="${order_add.deliveryPlanningSequence.postalAddress.subdistrict.name}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
			                                        <tr>
			                                        	<td align="right">Kodepos:</td>
			                                        	<td>
			                                        		<input value="${order_add.deliveryPlanningSequence.postalAddress.postalCode}" disabled class="inputbox-medium input-disabled"/>
			                                        	</td>
			                                        </tr>
		                                        </table>
                                    		</td>
                                    		<td valign="top">
                                    			<table>
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Vehicle :</td>
			                                            <td>
			                                                <form:select id="vehicle" path="vehicle" cssClass="combobox-ext">
			                                                    <c:if test='${not empty order_add.vehicle}'>
			                                                        <form:option value='${order_add.vehicle.id}' label='${order_add.vehicle.name}' />
			                                                    </c:if>
			                                            	</form:select>
			                                                &nbsp;
			                                                <img src="assets/icons/list_extensions.gif" onclick="openVehicle();" style="CURSOR:pointer;" title="Vehicle" />
			                                            </td>
			                                        </tr>
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Driver :</td>
			                                            <td>
			                                                <form:select id="driver" path="driver" cssClass="combobox-ext">
			                                                    <c:if test='${not empty order_add.driver}'>
			                                                        <form:option value='${order_add.driver.id}' label='${order_add.driver.firstName} ${order_add.driver.lastName} ${order_add.driver.middleName}' />
			                                                    </c:if>
			                                                </form:select>
			                                                &nbsp;
			                                                <img src="assets/icons/list_extensions.gif" onclick="openDriver();" style="CURSOR:pointer;" title="Company Structure" />
			                                            </td>
			                                        </tr>
                                    			</table>
                                    		</td>
                                    	</tr>
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
<script type="text/javascript">
	$(function(){
		$('.item-button-save').click(function(){
			if(validation())
			{
				$('.item-button-save').hide();
				$.ajax({
					url:"<c:url value='/page/unitdeliveryorderadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Delivery Order data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitdeliveryorderprint.htm?id='/>"+json.id;
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

	function openfacility()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupfacilityview.htm?target=facility&organization='/>"+org.value);
	}

	function openItemSerial(id, target)
	{
		var facility = $("#facility").val();
		if(facility == '' || facility == null)
		{
			alert('Please select Warehouse first !!!');
			return;
		}
		openpopup("<c:url value='/page/onhandquantitypopupserialview.htm?id="+id+"&target="+target+"&facility="+facility+"&pdi=true&available=true'/>");
	}

	function validation()
	{
		var tblMotor = document.getElementById("lineItemTable");
		if(tblMotor)
		{
			var i = 0;
			var t_section = tblMotor.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Detail Item (Tab Motor) first before saving the transaction!');
				return;
			}

			while(i != len) {
				var mesin = document.getElementById("serial["+i+"]");
				var rangka = document.getElementById("serial["+i+"]2");
				var tahun = document.getElementById("serial["+i+"]3");
				if(mesin != null && rangka!=null && tahun != null) {
					if(mesin.value == '') {
						alert('Mesin cannot be empty !!!');
						return;
					}

					if(rangka.value == '') {
						alert('Rangka cannot be empty !!!');
						return;
					}

					if(tahun.value == '') {
						alert('Tahun cannot be empty !!!');
						return;
					} else if(tahun.value.length != 4){
						alert('Tahun must be 4 character !!!');
						return;
					}
				}
				i++;
			}
		}

		var tblAksesoris = document.getElementById("accTable");
		if(tblAksesoris)
		{
			var i = 0;
			var t_section = tblAksesoris.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Detail Assesories first before saving the transaction!');
				return;
			}

			while(i != len) {
				var product = document.getElementById("product["+i+"]");
				var quantity = document.getElementById("quan["+i+"]");
				if(product != null && quantity!=null) {
					if(product.value == '') {
						alert('Accessories cannot be empty !!!');
						return;
					}

					if(quantity.value == '') {
						alert('Quantity cannot be empty !!!');
						return;
					} else if(new Number(quantity.value) <= 0){
						alert('Quantity must be greater than 0 !!!');
						return;
					}
				}
				i++;
			}
		}

		var vehicle = document.getElementById("vehicle");
		if(vehicle.value == '')
		{
			alert('Please select Vehicle !!!');
			return;
		}

		var driver = document.getElementById("driver");
		if(driver.value == '')
		{
			alert('Please select Driver first !!!');
			return;
		}

		return true;
	}

	var index = 0;
	function addItem()
	{
		var tbl = document.getElementById("accTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genQuan(index));
				row.insertCell(3).appendChild(genSerial(index));
				row.insertCell(4).appendChild(genUom(index));
				row.insertCell(5).appendChild(genNotes(index));
				row.insertCell(6).appendChild(genHiddenYear(index));

				index++;
			}
		}
	}
	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";

		return check;
	}
	function genProduct(index)
	{
		var elem=document.createElement("div");

		var product = document.createElement("select");
		product.name="products";
		product.id="product["+index+"]";
		product.setAttribute('class','combobox-medium');

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function() {openProductOnHandByCategory(product.id,'3',index);}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product';

		elem.appendChild(product);
		elem.appendChild(document.createTextNode(" "));
		elem.appendChild(_popup);

		return elem;
	}

	function genQuan(index)
	{
		var quan = document.createElement("input");
		quan.type = "text";
		quan.name = "quantitys";
		quan.id = "quan["+index+"]";
		quan.setAttribute('size',"5");
		quan.value = "1";

		return quan;
	}

	function genSerial(index)
	{
		var elem=document.createElement("div");

		var serial = document.createElement("input");
		serial.type = "text";
		serial.name = "serials";
		serial.id = "product["+index+"]-serial";
		serial.setAttribute('size',"20");
		serial.setAttribute('readonly','readonly');

		var _popup = document.createElement('img');
		_popup.id = 'popup_line_accessories['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function() {
			if($("#product\\["+index+"\\]").val() == '' || $("#product\\["+index+"\\]").val() == null)
			{
				alert('Please select Product first !!!');
				return;
			}
			
			if($("#facility").val() == '')
			{
				alert('Please select facility first !!!');
				return;
			}
			openpopup("<c:url value='/page/onhandquantitypopupserialaccessoriesview.htm?id='/>"+$("#product\\["+index+"\\]").val()+"&organization="+$("#org").val()+"&target=product["+index+"]&available=true"+"&facility="+$("#facility").val());
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Serial Aksesoris';

		elem.appendChild(serial);
		elem.appendChild(document.createTextNode(" "));
		elem.appendChild(_popup);

		return elem;
	}

	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.name = "uom";
		uom.id = "product["+index+"]-uom";
		uom.disabled = true;
		uom.setAttribute('size',"20");
		uom.setAttribute('class','input-disabled');

		return uom;
	}

	function genNotes(index)
	{
		var notes = document.createElement("input");
		notes.type = "text";
		notes.name = "notes";
		notes.id = "notes["+index+']';
		notes.setAttribute('size',"25");

		return notes;
	}

	function genHiddenYear(index)
	{
		var year = document.createElement("input");
		year.type = "text";
		year.name = "years";
		year.id = "product["+index+"]-year";
		year.setAttribute('hidden','true');

		return year;
	}

	function clearSerials()
	{
		document.getElementById('serial[0]').value = '';
		document.getElementById('serial[0]2').value = '';
		document.getElementById('serial[0]3').value = '';
	}
</script>
</body>
</html>
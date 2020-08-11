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
			<td width="60%">${breadcrumb }</td>
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
							<a class="item-button-list" href="<c:url value='/page/accessoriesstockadjustmentview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-next" href="javascript:save();"><span><spring:message code='next'/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="adjustment_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input id="date" value="<fmt:formatDate value='${now}'/>" name="date" inputid="dateid" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
										<form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility :</td>
									<td>
										<form:select id="facility" path="facility" cssClass="combobox-ext">
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea path="reason" cols="45" rows="5"/></td>
								</tr>
							</table>
                            <div class="toolbar-clean">
                                <div class="item-navigator">&nbsp;</div>
                                <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                            </div>
                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                            <thead>
                            <tr>
                              	<th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                <th colspan="2">Grid</th>
                                <th colspan="2">Product</th>
                                <th width="10%">Tipe</th>
                                <th width="10%">Nama Tipe</th>
                                <th width="10%">Warna</th>
                                <th width="12%">On Hand</th>
                                <th width="12%">Adjustment</th>
                                <th width="8%">UoM</th>
                                <th width="10%">Price</th>
                                <th width="8%">Curr</th>
                                <th width="8%">Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="14">&nbsp;</td></tr>
                            </tfoot>
                            </table>
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
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Stock Adjustment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_save').click(function(e){
			$target = $(e.target);

			$.ajax({
				url:"<c:url value='/page/accessoriesstockadjustmentadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Stock Adjustment data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/accessoriesstockadjustmentview.htm'/>";
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason :<br/>'+json.message);
						}
					}
				}
			});
		});
	});

	function save()
	{
		var date = document.getElementById('dateid').value;
		var org = document.getElementById('org').value;
		var facility = document.getElementById('facility').value;

		if(date == null || date == '') {
			alert('Please select the Date first !!!');
			return;
		}
		if(org == null || org == '') {
			alert('Please select Organization first !!!');
			return;
		}
		if(facility == null || facility == '') {
			alert('Please select Facility first !!!');
			return;
		}

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Line Item first before saving Stock Adjustment !!!');
				return;
			}
			else
			{
				var arr = new Array();
		        arr = document.getElementsByName("checkIdx");
		        for(var i = 0; i < arr.length; i++)
		        {
		            var obj = document.getElementsByName("checkIdx").item(i);

					if($("#grid\\["+obj.value+"\\]").val() == '' || $("#grid\\["+obj.value+"\\]").val() == null) {
						alert('Please select Grid first !!!');
						return;
					}

					if($("#product\\["+obj.value+"\\]").val() == '' || $("#product\\["+obj.value+"\\]").val() == null) {
						alert('Please select Product first!');
						return;
					}

					if(new Number($("#quan\\["+obj.value+"\\]").val()) <= 0) {
						alert('Adjustment quantity must be greater than 0 !!!');
						return;
					}
		        }
			}
		}

		document.addForm.action = "<c:url value='/page/accessoriesstockadjustmentpreaddtwo.htm'/>";
		document.addForm.submit();
	}

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
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				/* if(t_section.rows.length > 0 )
					index = t_section.rows.length+1; */

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genGrid(index));
				row.insertCell(2).appendChild(genGridPopup(index));
				row.insertCell(3).appendChild(genProduct(index));
				row.insertCell(4).appendChild(genProdPopup(index));
				row.insertCell(5).appendChild(genTipe(index));
				row.insertCell(6).appendChild(genNamaTipe(index));
				row.insertCell(7).appendChild(genWarna(index));
				row.insertCell(8).appendChild(genOnHand(index));
				row.insertCell(9).appendChild(genQuan(index));
				row.insertCell(10).appendChild(genUom(index));
				row.insertCell(11).appendChild(genPrice(index));
				row.insertCell(12).appendChild(genCurr(index));
				row.insertCell(13).appendChild(genType(index));

				index++;
			}
		}
	}

	function genCbx(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "checkIdx";
		check.id = "check["+index+"]";
		check.value = index;

		return check;
	}

	function genGrid(index)
	{
		var grid = document.createElement("select");
		grid.name="grids";
		grid.id="grid["+index+"]";
		grid.setAttribute('class','combobox');

		return grid;
	}

	function genGridPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			opengridpopup("grid["+index+"]");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Grid';

		return _popup;
	}

	function opengridpopup(target)
	{
		var fac = document.getElementById('facility');

		if(fac.value == '')
		{
			alert('Please select Facility first!');
			return;
		}

		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

	function genProduct(index)
	{
		var product = document.createElement("select");
		product.name="products";
		product.id="product["+index+"]";
		product.setAttribute('class','combobox');

		return product;
	}

	function genProdPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			openproduct(index);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product';

		return _popup;
	}

	function openproduct(index)
	{
		var org = document.getElementById('org');
		var grid = document.getElementById('grid['+index+']');

		if(org.value == null || org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		if(grid.value == null || grid.value == '')
		{
			alert('Please select Grid first !!!');
			return;
		}

		openpopup("<c:url value='/page/popupproductforadjustmentview.htm?target=product['/>"+index+"]&index="+index+"&organization="+org.value+"&grid="+grid.value+"&categoryId=3");
	}

	function genTipe(index)
	{
		var tipe = document.createElement("input");
		tipe.type = "text";
		tipe.id = "type["+index+"]";
		tipe.setAttribute('size',"15");
		tipe.setAttribute('class',"input-disabled");
		tipe.disabled = true;

		return tipe;
	}

	function genNamaTipe(index)
	{
		var nama = document.createElement("input");
		nama.type = "text";
		nama.id = "typeName["+index+"]";
		nama.setAttribute('size',"15");
		nama.setAttribute('class',"input-disabled");
		nama.disabled = true;

		return nama;
	}

	function genWarna(index)
	{
		var warna = document.createElement("input");
		warna.type = "text";
		warna.id = "color["+index+"]";
		warna.setAttribute('size',"15");
		warna.setAttribute('class',"input-disabled");
		warna.disabled = true;

		return warna;
	}

	function genOnHand(index)
	{
		var onhand = document.createElement("input");
		onhand.type = "text";
		onhand.id = "onhand["+index+"]";
		onhand.setAttribute('class','input-disabled');
		onhand.setAttribute('size',"5");
		onhand.disabled = true;
		onhand.value = "0";

		return onhand;
	}


	function genQuan(index)
	{
		var quan = document.createElement("input");
		quan.type = "text";
		quan.name = "quantitys";
		quan.id = "quan["+index+"]";
		quan.setAttribute('size',"5");
		quan.value = "0";

		return quan;
	}

	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.name = "notes";
		uom.id = "uom["+index+']';
		uom.disabled = true;
		uom.setAttribute('size',"5");
		uom.setAttribute('class','input-disabled');

		return uom;
	}

	function genPrice(index)
	{
		var price = document.createElement("input");
		price.name = "prices";
		price.id = "price["+index+']';
		price.setAttribute('size',"10");
		price.value = '0';
		price.setAttribute('onkeyup','separator("price['+index+']");');

		return price;
	}

	function genCurr(index)
	{
		var currency = document.createElement("select");
		currency.name="currencys";
		currency.id="currency["+index+"]";

		<c:forEach items='${currencys}' var='curr'>
			var opt = document.createElement("option");
			opt.value = '${curr.id}';
			opt.text = '${curr.symbol}';

			currency.appendChild(opt);
		</c:forEach>

		return currency;
	}

	function genType(index)
	{
		var type = document.createElement("select");
		type.name="types";
		type.id="type["+index+"]";

		var middle = document.createElement("option");
		middle.value = 'MIDDLE';
		middle.text = 'MIDDLE';

		type.appendChild(middle);

		var spot = document.createElement("option");
		spot.value = 'SPOT';
		spot.text = 'SPOT';

		type.appendChild(spot);

		var tax = document.createElement("option");
		tax.value = 'TAX';
		tax.text = 'TAX';

		type.appendChild(tax);

		return type;
	}

	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			for(var idx=len-1;idx>=0;idx--){
				var cname=t_section.rows[idx].cells[0].firstChild.id;
				cname=cname.replace("[","\\[");
				cname=cname.replace("]","\\]");
				var $chk=$("#"+cname);
				if(checked)
					$chk.attr("checked",true);
				else
					$chk.removeAttr("checked");
			}
		}
		else
		{
			alert('Table doesnot exsist!');
		}
	}

	function deleteRow()
	{
		var tbl = document.getElementById("lineItemTable");

		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}

		var check = document.getElementById("checkMaster");
		if(check)
			check.checked = false;
	}
</script>
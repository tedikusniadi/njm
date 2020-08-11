<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Product Price</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onload="error();validasiProductCategory();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Inventory > Product Management > Product Price</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<c:set var="priceType" value=""/>
						<c:if test="${type == 'BUYING'}">
							<c:set var="priceType" value="Buying"/>
						</c:if>
						<c:if test="${type == 'SELLING'}">
							<c:set var="priceType" value="Selling"/>
						</c:if>
						<c:if test="${from == 'UNIT'}">
							<h1 class="page-title">I01 - Product Unit - ${priceType} Price</h1>
						</c:if>
						<c:if test="${from == 'SPAREPART'}">
							<h1 class="page-title">I01 - Product Sparepart - ${priceType} Price</h1>
						</c:if>
						<c:if test="${from == 'SERVICE'}">
							<h1 class="page-title">I01 - Product Service - ${priceType} Price</h1>
						</c:if>

					  	<div class="toolbar">
						  	<c:if test="${from == 'UNIT'}">
								<a class="item-button-list" href="<c:url value='/page/productstandardpriceview.htm'/>"><span>List</span></a>
							</c:if>
						  	<c:if test="${from == 'SPAREPART'}">
								<a class="item-button-list" href="<c:url value='/page/productstandardpricesparepartview.htm'/>"><span>List</span></a>
							</c:if>
						  	<c:if test="${from == 'SERVICE'}">
								<a class="item-button-list" href="<c:url value='/page/productstandardpriceserviceview.htm'/>"><span>List</span></a>
							</c:if>
							<a class="item-button-save" style="cursor:pointer"><span><spring:message code="save"/></span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="price">
								<table width="100%" style="border:none">
                                <tr>
                                    <td><div align="right">Date From :</div></td>
                                    <td><input inputId="dateFrom" name="dateFrom" dojotype="dropdowndatepicker" displayformat="dd-MM-yyyy" saveFormat="dd-MM-yyyy" lang="en-us" containerToggle="explode" containerToggleDuration="300"/></td>
                                </tr>
                                <tr>
	                              	<td align="right">Product Category : </td>
	                              	<td>
	                                  	<select id='productCategory' name='productCategory' class='combobox'>
	                                  	<c:if test="${from == 'UNIT'}">
	                                  		<option value="1">UNIT</option>
	                                  	</c:if>
	                                  	<c:if test="${from == 'SPAREPART'}">
	                                  		<option value="2">SPAREPART</option>
	                                  	</c:if>
	                                  	<c:if test="${from == 'SERVICE'}">
	                                  		<option value="3">SERVICE</option>
                                  		</c:if>
	                                  	</select>
	                              	</td>
                                </tr>
			 					<tr>
									<td align="right">Tipe Unit :</td>
									<td>
										<select id="productType" name="productType" class="combobox input-disabled" disabled>
										</select>
										<img id="browseProductType" hidden="hidden" src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupproducttypeview.htm?target=productType&feature=1'/>');" style="CURSOR:pointer;" title="Product Type" />
									</td>
								</tr>
			 					<tr>
									<td align="right">Nama Barang :</td>
									<td>
										<select id="product" name="productId" class="combobox-ext input-disabled" disabled>
										</select>
										<img id="browseProduct" hidden="hidden" src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:cekProductCategory();" style="CURSOR:pointer;" title="Product Type" />
									</td>
								</tr>
								<c:if test="${type == 'SELLING'}">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">Tipe :</td>
								  	<td width="80%">
                                       	<form:radiobutton path="unitPriceType" id="unitPriceTypeOn" value='ON_THE_ROAD' label='On The Road'/>
                                       	<form:radiobutton path="unitPriceType" id="unitPriceTypeOff" value='OFF_THE_ROAD' label='Off The Road' />
                                       	<form:radiobutton path="unitPriceType" id="unitPriceTypeNone" value='NONE' style="visibility:hidden"/>
								  	</td>
								</tr>
								</c:if>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Currency :</td>
								  	<td width="80%">
                                    	<form:select path='money.currency'>
                                        	<form:options items='${currencys}' itemValue='id' itemLabel='symbol'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path='money.exchangeType'>
                                        	<form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                    </td>
								</tr>
                                <tr>
                                	<c:if test="${type == 'SELLING'}">
										<td width="20%" nowrap="nowrap" align="right">Selling Price :</td>
									</c:if>
									<c:if test="${type == 'BUYING'}">
										<td width="20%" nowrap="nowrap" align="right">Buying Price :</td>
									</c:if>
								  	<td width="80%"><form:input id="amount" path='money.amount' size="20" onkeyup="separator();"/></td>
								</tr>
								</table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                                <a class="item-button-new" href="javascript:addItem();"><span>New Row</span></a>
	                                <a class="item-button-delete" href="javascript:deleteRow('lineItemTable');"><span>Delete Row</span></a>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0">
	                            <thead>
	                            <tr>
	                           	  	<th width="1%"><input type="checkbox" name="checkMaster" id="check_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
	                                <th width="99%">Company</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="2">&nbsp;</td></tr>
	                            </tfoot>
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
<script type="text/javascript" src="<c:url value='/js/format.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.item-button-save').click(function(){
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/productstandardpriceadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Product Standard Price data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								if($("#productCategory").val() == '1')
									window.location="<c:url value='/page/productstandardpriceview.htm'/>";
								else if($("#productCategory").val() == '2')
									window.location="<c:url value='/page/productstandardpricesparepartview.htm'/>";
								else
									window.location="<c:url value='/page/productstandardpriceserviceview.htm'/>";
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
		
		$("#productCategory").change(function()
		{
			$("#productType option").remove();
			$("#product option").remove();
			
			if($("#productCategory").val() == '1')
			{
				$("#productType").removeAttr("disabled");
				$("#productType").attr("class","combobox");
				$("#browseProductType").removeAttr("hidden");
				
				$("#product").attr("disabled", "true");
				$("#product").attr("class","combobox-ext input-disabled");
				$("#browseProduct").attr("hidden", "hidden");
				$("#unitPriceTypeOn").removeAttr("disabled");
				$("#unitPriceTypeOff").removeAttr("disabled");
				$("#unitPriceTypeOff").attr("checked", "checked");
			}
			else if($("#productCategory").val() == '2' || $("#productCategory").val() == '3')
			{
				$("#product").removeAttr("disabled");
				$("#product").attr("class","combobox-ext");
				$("#browseProduct").removeAttr("hidden");
				
				$("#productType").attr("disabled", "true");
				$("#productType").attr("class","combobox input-disabled");
				$("#browseProductType").attr("hidden", "hidden");
				$("#unitPriceTypeOn").attr("disabled", "true");
				$("#unitPriceTypeOff").attr("disabled", "true");
				$("#unitPriceTypeNone").attr("checked", "checked");
			}
			else
			{
				$("#product").attr("disabled", "true");
				$("#product").attr("class","combobox-ext input-disabled");
				$("#browseProduct").attr("hidden", "hidden");

				$("#productType").attr("disabled", "true");
				$("#productType").attr("class","combobox input-disabled");
				$("#browseProductType").attr("hidden", "hidden");
				$("#unitPriceTypeOn").removeAttr("disabled");
				$("#unitPriceTypeOff").removeAttr("disabled");
			}
		});
	});
	
	function validasiProductCategory()
	{
		$("#productType option").remove();
		$("#product option").remove();
		
		if($("#productCategory").val() == '1')
		{
			$("#productType").removeAttr("disabled");
			$("#productType").attr("class","combobox");
			$("#browseProductType").removeAttr("hidden");
			
			$("#product").attr("disabled", "true");
			$("#product").attr("class","combobox-ext input-disabled");
			$("#browseProduct").attr("hidden", "hidden");
			$("#unitPriceTypeOn").removeAttr("disabled");
			$("#unitPriceTypeOff").removeAttr("disabled");
			$("#unitPriceTypeOff").attr("checked", "checked");
		}
		else if($("#productCategory").val() == '2' || $("#productCategory").val() == '3')
		{
			$("#product").removeAttr("disabled");
			$("#product").attr("class","combobox-ext");
			$("#browseProduct").removeAttr("hidden");
			
			$("#productType").attr("disabled", "true");
			$("#productType").attr("class","combobox input-disabled");
			$("#browseProductType").attr("hidden", "hidden");
			$("#unitPriceTypeOn").attr("disabled", "true");
			$("#unitPriceTypeOff").attr("disabled", "true");
			$("#unitPriceTypeNone").attr("checked", "checked");
		}
		else
		{
			$("#product").attr("disabled", "true");
			$("#product").attr("class","combobox-ext input-disabled");
			$("#browseProduct").attr("hidden", "hidden");

			$("#productType").attr("disabled", "true");
			$("#productType").attr("class","combobox input-disabled");
			$("#browseProductType").attr("hidden", "hidden");
			$("#unitPriceTypeOn").removeAttr("disabled");
			$("#unitPriceTypeOff").removeAttr("disabled");
		}
	}
	
	function cekProductCategory()
	{
		if($("#productCategory").val() == '2')
			openProductByCategory('product','2');
		else
			openProductByCategory('product','4');
	}

	function validation()
	{
		var date = document.getElementById('dateFrom').value;
		var category = document.getElementById('productCategory').value;
		var amount = document.getElementById('amount').value;
	
		if(date == '')
		{
			alert('Date cannot be empty !!!');
			return;
		}
	
		if(category == '0')
		{
			alert('Please select Product Category first !!!');
			return;
		}
	
		if(amount == '' || parseFloat(amount.replace(/,/g,'')) <= 0)
		{
			alert('Amount cannot be empty and must be greater than zero !!!');
			return;
		}
		
		var tblAksesoris = document.getElementById("lineItemTable");
		if(tblAksesoris)
		{
			var i = 0;
			var t_section = tblAksesoris.tBodies[0];
			var len = t_section.rows.length;

			while(i != len) {
				var facility = document.getElementById("facility["+i+"]");
				if(facility != null) {
					if(facility.value == '') {
						alert('Please select company first !!!');
						return;
					}
				}
				i++;
			}
		}
		
		return true;
	}
	
	function separator()
	{
		var amount = document.getElementById('amount');
	
		if(amount.value != '')
		{
			amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		}
	}
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}

	var index = 0;
	function addItem()
	{
		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genFacility(index));

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
	
	function genFacility(index)
	{
		var elem=document.createElement("div");

		var facility = document.createElement("select");
		facility.name="facilities";
		facility.id="facility["+index+"]";
		facility.setAttribute('class','combobox-medium');

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function() {openOrg("facility["+index+"]");}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Company';

		elem.appendChild(facility);
		elem.appendChild(document.createTextNode(" "));
		elem.appendChild(_popup);

		return elem;
	}
</script>
</body>
</html>
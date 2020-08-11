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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
</head>

<body onload="error();">

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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordersubdealerview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-next" href="javascript:save(false);"><span>Next</span></a>
							</c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
										<c:if test='${not empty salesOrder_add.organization}'>
											<form:option value='${salesOrder_add.organization.id}' label='${salesOrder_add.organization.name}' />
										</c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Subdealer :</td>
									<td>
										<form:select id="subDealer" path="subDealer" cssClass="combobox-ext">
										<c:if test='${not empty salesOrder_add.subDealer}'>
											<form:option value='${salesOrder_add.subDealer.id}' label='${salesOrder_add.subDealer.name}' />
										</c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=subDealer'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input inputId="dateId" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Transfer Source :</td>
									<td>
										<form:select id="source" path="source" cssClass="combobox-ext">
                                           	<c:if test='${not empty salesOrder_add.source}'>
                                               	<form:option value='${salesOrder_add.source.id}' label='${salesOrder_add.source.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="openfacility('source');" style="CURSOR:pointer;" title="Facility" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Transfer Destination :</td>
									<td>
										<form:select id="destination" path="destination" cssClass="combobox-ext">
                                           	<c:if test='${not empty salesOrder_add.destination}'>
                                               	<form:option value='${salesOrder_add.destination.id}' label='${salesOrder_add.destination.name}' />
                                            </c:if>
										</form:select>
										<img src="assets/icons/list_extensions.gif" onclick="openfacilitydestination('destination');" style="CURSOR:pointer;" title="Facility" />
									</td>
								</tr>
                                <%-- <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="55" rows="7"/><input type="hidden" name="transferType" value="${transferType}"/></td>
								</tr> --%>
							</table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                            <div id="unit" dojoType="ContentPane" label="Produk" class="tab-pages" refreshOnShow="true">
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                                <a class="item-button-new" href="javascript:addLineItem('lineItemTable_unit');"><span>New Row</span></a>
	                                <a class="item-button-delete" href="javascript:deleteRow('lineItemTable_unit')"><span>Delete Row</span></a>
	                            </div>
	                            <table class="table-list" id="lineItemTable_unit" cellspacing="0" cellpadding="0">
	                            <thead>
	                            <tr>
	                           	  	<th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable_unit" onclick="clickAll('lineItemTable_unit');"/></th>
	                                <th colspan="2" align="left">Product</th>
	                                <th width="10%">Tipe</th>
	                                <th width="10%">Nama Tipe</th>
	                                <th width="10%">Warna</th>
	                                <th width="36%">Available</th>
	                              	<th width="25%">Quantity</th>
	                                <th width="1%">&nbsp;</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            <div id="acc" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                                <a class="item-button-new" href="javascript:addLineItem('lineItemTable_acc');"><span>New Row</span></a>
	                                <a class="item-button-delete" href="javascript:deleteRow('lineItemTable_acc')"><span>Delete Row</span></a>
	                            </div>
	                            <table class="table-list" id="lineItemTable_acc" cellspacing="0" cellpadding="0">
	                            <thead>
	                            <tr>
	                           	  	<th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable_acc" onclick="clickAll('lineItemTable_acc');"/></th>
	                                <th colspan="2" align="left">Product</th>
	                                <th width="10%">Tipe</th>
	                                <th width="10%">Nama Tipe</th>
	                                <th width="10%">Warna</th>
	                                <th width="36%">Available</th>
	                              	<th width="25%">Quantity</th>
	                                <th width="1%">&nbsp;</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
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
	function save(_forward)
	{
		if(validation())
		{
			document.addForm.action = "<c:url value='/page/unitsalesordersubdealerpreaddtwo.htm?new='/>"+_forward;
			document.addForm.submit();
		}
	}
			
	function savenew()
	{
		if(validation())
		{
			document.addForm.action = "<c:url value='/page/transferorderaddnew.htm'/>";
			document.addForm.submit();
		}
	}
	
	function openfacility(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?organization='/>"+org.value+"&target="+target);
	}
	
	function openfacilitydestination(target)
	{
		var org = document.getElementById('subDealer');
		if(org.value == '')
		{
			alert('Please select Sub Dealer first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?organization='/>"+org.value+"&target="+target);
	}
	
	function validation()
	{
		var org = document.getElementById('org').value;
		var dealer = document.getElementById('subDealer').value;
		var source = document.getElementById('source').value;
		var destination = document.getElementById('destination').value;
		
		if(!$("#org").val())
		{
			alert('Please select Organization first !!!');
			return;
		}
		
		if(!$("#subDealer").val())
		{
			alert('Please select Sub Dealer first !!!');
			return;
		}
		
		if(org == dealer)
		{
			alert('Please select another Organization or Sub Dealer !!!');
			return;
		}
		
		if(!$("#dateId").val())
		{
			alert('Date cannot be empty !!!');
			return;
		}
		
		if(!$("#source").val())
		{
			alert('Please select Transfer Source first !!!');
			return;
		}
		
		if(!$("#destination").val())
		{
			alert('Please select Transfer Destination first !!!');
			return;
		}
		
		if(source == destination)
		{
			alert('Please select another Transfer Source or Transfer Destination !!!');
			return;
		}
		
		var tbl = document.getElementById("lineItemTable_unit");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Transaction Item first before saving the transaction!');
				return;
			}

			var products=document.getElementsByName("items");
			for(var i=0;i<products.length;i++)
			{
				if(products[i].value == null || products[i].value == '')
				{
					alert('Please select Product first!');
					return;
				}
			}

			var qtys=document.getElementsByName("quantitys");
			for(var i=0;i<qtys.length;i++)
			{
				if(parseFloat(qtys[i].value) <= 0)
				{
					alert('Quantity must be greater than 0!');
					return;
				}
			}
		}
		
		var tblAcc = document.getElementById("lineItemTable_acc");
		if(tblAcc)
		{
			var t_sectionAcc = tblAcc.tBodies[0];
			var lenAcc = t_sectionAcc.rows.length;

			if(lenAcc == 0)
			{
				alert('You need to provide Accessories Item first before saving the transaction!');
				return;
			}
		}
		
		var tblSparepart = document.getElementById("lineItemTable_sparepart");
		if(tblSparepart)
		{
			var t_sectionSparepart = tblSparepart.tBodies[0];
			var lenSparepart = t_sectionSparepart.rows.length;

			if(lenSparepart == 0)
			{
				alert('You need to provide Sparepart Item first before saving the transaction!');
				return;
			}

			var products=document.getElementsByName("items");
			for(var i=0;i<products.length;i++)
			{
				if(products[i].value == null || products[i].value == '')
				{
					alert('Please select Product first!');
					return;
				}
			}

			var qtys=document.getElementsByName("quantitys");
			for(var i=0;i<qtys.length;i++)
			{
				if(parseFloat(qtys[i].value) <= 0)
				{
					alert('Quantity must be greater than 0!');
					return;
				}
			}
		}
		
		return true;
	}
			
	function display(index)
	{
		var _hidquan = document.getElementById('hidquan['+index+']');
		var _quan = document.getElementById('quan['+index+']');
		
		if(_quan.value == null || _quan.value == '')
		{
			alert('Quantity cannot be empty!');
			_quan.value = 0;
			return;
		}
		
		if(parseFloat(_hidquan.value) < parseFloat(_quan.value))
		{
			alert('Quantity must be lower or equal to Available Quantity!');
			return;
		}
	}
			
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}

	var index = 0;
	
	function addLineItem(table)
	{
		var popupVal = "";
		if(table == 'lineItemTable_unit')
			popupVal = "unit";
		else if (table == 'lineItemTable_acc')
			popupVal = "acc";
		else
			popupVal = "sparepart";
		
		var tbl = document.getElementById(table);
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				/* if(t_section.rows.length > 0 )
					index = t_section.rows.length+1; */
			
				var row = t_section.insertRow(t_section.rows.length);
	
				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genItem(index));
				row.insertCell(2).appendChild(genPopup(index, popupVal));
				row.insertCell(3).appendChild(genTipe(index));
				row.insertCell(4).appendChild(genNamaTipe(index));
				row.insertCell(5).appendChild(genWarna(index));
				row.insertCell(6).appendChild(genAv(index));
				row.insertCell(7).appendChild(genQuan(index));
				row.insertCell(8).appendChild(genHidQuan(index));
				
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
	
	function genItem(index)
	{
		var item = document.createElement("select");
		item.name="items";
		item.id="item["+index+"]";
		item.setAttribute('class','combobox-ext');
					
		return item;
	}
	
	function popup(target,index,popupVal)
	{
		var source = document.getElementById('source');
		if(source.value == '')
		{
			alert('Please select Warehouse Source first!');
			return;
		}
		
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		if(popupVal == "unit")
			openpopup("<c:url value='/page/popupproductbyfacilityview.htm?facility='/>"+source.value+"&target="+target+"&index="+index+"&organization="+org.value+"&categoryId=1");
		else if(popupVal == "acc")
			openpopup("<c:url value='/page/popupproductbyfacilityview.htm?facility='/>"+source.value+"&target="+target+"&index="+index+"&organization="+org.value+"&categoryId=3");
		else
			openpopup("<c:url value='/page/popupproductbyfacilityview.htm?facility='/>"+source.value+"&target="+target+"&index="+index+"&organization="+org.value+"&categoryId=2");
	}
	
	function genPopup(index, popupVal)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			popup('item['+index+']',index, popupVal);
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Facility';

		return _popup;
	}
	
	function genTipe(index)
	{
		var tipe = document.createElement("input");
		tipe.type = "text";
		tipe.id = "type["+index+"]";
		tipe.setAttribute('size',"20");
		tipe.setAttribute('class',"input-disabled");
		tipe.disabled = true;
		
		return tipe;
	}
	
	function genNamaTipe(index)
	{
		var nama = document.createElement("input");
		nama.type = "text";
		nama.id = "typeName["+index+"]";
		nama.setAttribute('size',"20");
		nama.setAttribute('class',"input-disabled");
		nama.disabled = true;
		
		return nama;
	}
	
	function genWarna(index)
	{
		var warna = document.createElement("input");
		warna.type = "text";
		warna.id = "color["+index+"]";
		warna.setAttribute('size',"20");
		warna.setAttribute('class',"input-disabled");
		warna.disabled = true;
		
		return warna;
	}
	
	function genAv(index)
	{
		var av = document.createElement("input");
		av.type = "text";
		av.id = "av["+index+"]";
		av.setAttribute('size',"10");
		av.setAttribute('class',"input-disabled");
		av.disabled = true;
		av.value = "0";
		
		return av;
	}
	
	function genQuan(index)
	{
		var quan = document.createElement("input");
		quan.type = "text";
		quan.name = "quantitys";
		quan.id = "quan["+index+"]";
		quan.setAttribute('size',"20");
		quan.setAttribute('onchange','display('+index+')');
		quan.setAttribute('onblur','display('+index+')');
		quan.value = "0";
		
		return quan;
	}
	
	function genHidQuan(index)
	{
		var hidquan = document.createElement("input");
		hidquan.type = "hidden";
		hidquan.id = "hidquan["+index+"]";
		hidquan.value = "0";
		
		return hidquan;
	}
	
	function clickAll(table)
	{
		var checked = false;
		if(document.getElementById("checkMaster_"+table).checked == true)
			checked = true;
		
		var tbl = document.getElementById(table);
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
			
	function deleteRow(table)
	{
		var tbl = document.getElementById(table);
			
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;
				
		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}
		
		var check = document.getElementById("checkMaster_"+table);
		if(check)
			check.checked = false;
	}
</script>
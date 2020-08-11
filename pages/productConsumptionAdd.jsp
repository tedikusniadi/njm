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
							<a class="item-button-list" href="<c:url value='/page/productconsumptionview.htm'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save(false);"><span>Save</span></a>
							<a class="item-button-save-new" href="javascript:save(true);"><span>Save &amp; New</span></a>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="consumption_add">
								<table width="100%" style="border:none">
								<tr>
									<td width="20%" nowrap="nowrap" align="right">ID :</td>
								  	<td width="80%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Company :</td>
									<td>
										<form:select id="org" path="organization" cssClass="combobox-ext">
                                           	< <c:if test='${not empty consumption_add.organization}'>
                                               	<form:option value='${consumption_add.organization.id}' label='${consumption_add.organization.firstName} ${consumption_add.organization.lastName} ${consumption_add.organization.middleName}' />
                                            </c:if> 
                                            <form:option value='${profile.organization.id}' label='${profile.organization.firstName} ${profile.organization.middleName} ${profile.organization.lastName}'/>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <%--< tr>
                                    <td nowrap="nowrap" align="right">Requester :</td>
                                    <td>
                                        <form:select id="requester" path="requester" cssClass="combobox-ext">
                                            <c:if test='${not empty consumption_add.requester}'>
                                                <form:option value='${consumption_add.requester.id}' label='${consumption_add.requester.firstName} ${consumption_add.requester.lastName} ${consumption_add.requester.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openrequester();" style="CURSOR:pointer;" title="Customer" />
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Approver :</td>
                                    <td>
                                        <form:select id="approver" path="approver" cssClass="combobox-ext">
                                            <c:if test='${not empty consumption_add.approver}'>
                                                <form:option value='${consumption_add.approver.id}' label='${consumption_add.approver.firstName} ${consumption_add.approver.lastName} ${consumption_add.approver.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="openapprover();" style="CURSOR:pointer;" title="Approver" />
                                    </td>
                                </tr >--%>
                                <tr>
									<td nowrap="nowrap" align="right">Warehouse :</td>
									<td>
										<form:select id="warehouse" path="warehouse" cssClass="combobox-ext">
                                           	<c:if test='${not empty consumption_add.warehouse}'>
                                               	<form:option value='${consumption_add.warehouse.id}' label='${consumption_add.warehouse.name}' />
                                            </c:if>
										</form:select>
										&nbsp;
										<img src="assets/icons/list_extensions.gif" onclick="openfacility();" style="CURSOR:pointer;" title="Company Structure" />
									</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Reason :</td>
									<td><form:textarea path="note" cols="55" rows="7"/></td>
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
                              	<th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                <th>Grid</th>
                                <th width="1%"></th>
                                <th>Product</th>
                                <th width="1%"></th>
                                <th width="8%">Quantity</th>
                                <th width="60%">UoM</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
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
</body>
</html>
<script type="text/javascript">
	function save(forward)
	{
		var send = true;
		if(dojo.widget.byId('date').getDate() == '')
		{
			alert('Date cannot be empty!');
			return;
		}

		if(dojo.byId('org').value == '')
		{
			alert('Company cannot be empty!');
			return;
		}

		var tbl = dojo.byId("lineItemTable");
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		if(len <= 0)
		{
			alert('Consumption item must be more than 1 row!');
			return;
		}

		for(var idx=len-1;idx>=0;idx--)
		{
			var grid = t_section.rows[idx].cells[1].firstChild.value;
			if(grid == null || grid == '' || parseFloat(grid) <= 0)
			{
				alert('Grid cannot be empty!');
				return;
			}
			
			var product = t_section.rows[idx].cells[3].firstChild;
			if(product.value == null || product.value == '')
			{
				alert('Product cannot be empty!');
				return;
			}

			var quan = t_section.rows[idx].cells[5].firstChild.value;
			if(quan == null || quan == '' || parseFloat(quan) <= 0)
			{
				alert('Quantity cannot be empty and must be more than 0!');
				return;
			}

			var action = function(onstock)
			{
				if(onstock == 'false' || !onstock)
				{
					send = false;
					alert('Quantity for product '+product.options[product.selectedIndex].text+' > available stock!');
					return;
				}
			};
			$.get('<c:url value="/page/inventoryitemremote.onstock.json"/>',
			{
				product: product.value,
				organization:dojo.byId('org').value,
				grid:grid,
				required:quan
			},action);
		}

		if(send)
		{
			document.addForm.action = "<c:url value='/page/productconsumptionadd.htm?new='/>"+forward;
			document.addForm.submit();
		}
	}

	function openfacility()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupfacilityview.htm?target=warehouse&organization='/>"+org.value);
	}

	function openrequester()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupproductconsumptionrequesterview.htm?target=requester&organization='/>"+org.value);
	}

	function openapprover()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupproductconsumptionapproverview.htm?target=approver&organization='/>"+org.value);
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
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
					index = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genGrid(index));
				row.insertCell(2).appendChild(genGridPopup(index));
				row.insertCell(3).appendChild(genProduct(index));
				row.insertCell(4).appendChild(genProdPopup(index));
				row.insertCell(5).appendChild(genQuan(index));
				row.insertCell(6).appendChild(genUom(index));

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

	function genGrid(index)
	{
		var grid = document.createElement("select");
		grid.name="grid";
		grid.id="grid["+index+"]";
		grid.setAttribute('class','combobox-medium');

		return grid;
	}

	function genGridPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var fac = document.getElementById('warehouse');
			if(fac.value == '')
			{
				alert('Please select Facility first!');
				return;
			}
			openpopup("<c:url value='/page/popupgridview.htm?target=grid['/>"+index+"]&facility="+fac.value);
		}
		_popup.setAttribute('style','CURSOR:pointer;');

		_popup.title='Grid';

		return _popup;
	}

	function genProduct(index)
	{
		var product = document.createElement("select");
		product.name="products";
		product.id="product["+index+"]";
		product.setAttribute('class','combobox-medium');

		return product;
	}

	function genProdPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
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

			openpopup("<c:url value='/page/popupproductforadjustmentview.htm?target=product['/>"+index+"]&index="+index+"&organization="+org.value+"&grid="+grid.value+"&categoryId=2");
		}

		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product';

		return _popup;
	}

	function genQuan(index)
	{
		var quan = document.createElement("input");
		quan.type = "text";
		quan.name = "quantitys";
		quan.id = "quan["+index+"]";
		quan.setAttribute('size',"15");
		quan.value = "0";

		return quan;
	}

	function genUom(index)
	{
		var uom = document.createElement("input");
		uom.type = "text";
		uom.id = "uom["+index+']';
		uom.disabled = true;
		uom.setAttribute('size',"5");
		uom.setAttribute('class','input-disabled');

		return uom;
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
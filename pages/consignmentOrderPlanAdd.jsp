<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Order Plan >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
    <script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{		
			document.addForm.action = "<c:url value='/page/consignmentorderplanadd.htm'/>";
			document.addForm.submit();
		}
		
		function opensales()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Company first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupsalespersonview.htm?target=salesPerson&organization='/>"+org.value);
		}
		
		function opencustomer()
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcustomerview.htm?target=customer&organization='/>"+org.value);
		}
		
		function opencontact()
		{
			var customer = document.getElementById('customer');
			if(customer.value == '')
			{
				alert('Please select Customer first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupcontactpersonview.htm?target=contact&organization='/>"+customer.value);
		}
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
    <script language="javascript" type="application/javascript">
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
					row.insertCell(1).appendChild(genProduct(index));
					row.insertCell(2).appendChild(genPopup(index));
					row.insertCell(3).appendChild(genQuan(index));
					row.insertCell(4).appendChild(genUom(index));
					row.insertCell(5).appendChild(genNote(index));
					
					index++;
				}
			}
		}
						
		function genCbx(index)
		{
			var check = document.createElement("input");
			check.type = "checkbox";
			check.name = "check";
			check.id = "check";
			
			return check;
		}
		
		function genProduct(index)
		{
			var product = document.createElement("select");
			product.name="products";
			product.id="product["+index+"]";
			product.setAttribute('class','combobox-ext');
						
			return product;
		}
		
		function popup(target,index)
		{			
			var _date = dojo.widget.byId("date");
			if(_date.getValue() == null || _date.getValue() == '')
			{
				alert('Plase select date first!');
				return;
			}
			
			openpopup("<c:url value='/page/popupproductprice4customerview.htm?party=${plan.consignmentOrder.customer.id}&organization=${plan.consignmentOrder.organization.id}&currency=${plan.consignmentOrder.currency.id}&exchangeType=${plan.consignmentOrder.exchangeType}&target='/>"+target+"&index="+index+"&date="+_date.getValue());
		}
		
		function genPopup(index)
		{
			var _popup = document.createElement('img');
			_popup.id = '_popup_line['+index+']';
			_popup.src = 'assets/icons/list_extensions.gif';
			_popup.onclick = function()
			{
				popup("product["+index+"]",index);
			}
			_popup.setAttribute('style','CURSOR:pointer;');
			_popup.title='Product Price';
			
			return _popup;
		}
		
		function genQuan(index)
		{
			var quantity = document.createElement("input");
			quantity.type = "text";
			quantity.name = "quantitys";
			quantity.id = "quantity["+index+"]";
			quantity.setAttribute('size',"15");
			quantity.value = "0";
			
			return quantity;
		}
		
		function genUom(index)
		{
			var uom = document.createElement("input");
			uom.type = "text";
			uom.id = "uom["+index+"]";
			uom.setAttribute('size',"8");
			uom.setAttribute('class','input-disabled');
			uom.disabled = true;
			
			return uom;
		}
		
		function genNote(index)
		{
			var note = document.createElement("input");
			note.type = "text";
			note.name = 'notes';
			note.id = "note["+index+"]";
			note.setAttribute('size',"60");
			note.value = "-";
			
			return note;
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
					
				for(var idx=len-1;idx>=0;idx--)
					t_section.rows[idx].cells[0].firstChild.setAttribute('checked',true);
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
			<td width="60%">Sales > Consignment > Consignment Order > Consignment Order Plan > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Consignment Order Plan</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentorderpreedit.htm?id=${plan.consignmentOrder.id}'/>"><span>List</span></a>
							<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="plan">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="21%" nowrap="nowrap" align="right">ID :</td>
                                    <td width="79%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company :</td>
                                    <td>
                                        <select id="org" path="organization" class="combobox-ext" disabled>
                                            <option value="${plan.consignmentOrder.organization.id}"><c:out value='${plan.consignmentOrder.organization.firstName} ${plan.consignmentOrder.organization.lastName} ${plan.consignmentOrder.organization.middleName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="21%" align="right">Date :</td>
                                    <td width="79%"><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Currency :</td>
                                    <td>
                                        <form:select path="consignmentOrder.currency" disabled='true'>
                                            <form:option value='${plan.consignmentOrder.currency.id}' label='${plan.consignmentOrder.currency.symbol}'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select path="consignmentOrder.exchangeType" disabled='true'>
                                            <form:option value='SPOT'>SPOT</form:option>
                                            <form:option value='MIDDLE'>MIDDLE</form:option>
                                            <form:option value='TAX'>TAX</form:option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Customer :</td>
                                    <td>
                                        <select id="customer" class="combobox-ext" disabled>
                                            <option value="${plan.consignmentOrder.customer.id}"><c:out value='${plan.consignmentOrder.customer.firstName} ${plan.consignmentOrder.customer.middleName} ${plan.consignmentOrder.customer.lastName}'/></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Note :</td>
                                    <td><form:textarea path='note' cols='55' rows='6'/></td>
                                </tr>
                                </table>
                                <br/>
                                <div class="toolbar-clean">
                                    <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                    <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                     <div class="item-navigator">&nbsp;</div>
                                </div>
                                <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                <thead>
                                <tr>
                                  	<th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                    <th width="44%">Product</th>
                                    <th width="0%">&nbsp;</th>
                                    <th width="16%">Qty</th>
                                  	<th width="7%">UoM</th>
                                    <th width="31%">Note</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="6">&nbsp;</td></tr></tfoot>
                                </table>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Vehicle Maintenance >> Add</title>
    <%@ include file="/common/sirius-header.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
    <%@ include file="/common/popup.jsp"%>
	<script type="text/javascript">
		function save(goform)
		{			
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				var len = t_section.rows.length;
				
				if(len == 0)
				{
					alert('You need to provide Product/Service Item first before saving the transaction!');
					return;
				}
				
				for(var idx=len-1;idx>=0;idx--)
				{
					var product = t_section.rows[idx].cells[1].firstChild.value;
					var quantity = parseFloat(t_section.rows[idx].cells[3].firstChild.value);
					var price = parseFloat(t_section.rows[idx].cells[5].firstChild.value);
					var date = t_section.rows[idx].cells[6].firstChild.firstChild.value;
					
					if(product == '' || product == '0')
					{
						alert('Product/Service cant be empty!');
						return;
					}

					if(quantity == '' || quantity == '0')
					{
						alert('Quantity cant be empty!');
						return;
					}
					
					if(price == '' || price == '0')
					{
						alert('Buying Price cant be empty!');
						return;
					}
					
					if(date == '')
					{
						alert('Delivery Date cant be empty!');
						return;
					}
				}
			}
		
			document.addForm.action = "<c:url value='/page/vehiclemaintenanceadd.htm?new='/>"+goform;
			document.addForm.submit();
		}
		
		function openpostal(target)
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select Organization first!');
				return;
			}
			openpopup("<c:url value='/page/popuppostaladdressview.htm?target='/>"+target+"&party="+org.value);
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
		
		function disableservice()
		{
			document.getElementById('currency').disabled = true;
			document.getElementById('exchangeType').disabled = true;
			document.getElementById('methodType').disabled = true;
			document.getElementById('tax').disabled = true;
			document.getElementById('billTo').disabled = true;
			document.getElementById('shipTo').disabled = true;
			document.getElementById('issuedfrom').disabled = false;
			
			document.getElementById('billicon').setAttribute('onclick','');
			document.getElementById('shipicon').setAttribute('onclick','');
			document.getElementById('issuedfrom').setAttribute('onclick',"openfacility('source')");
		}
		
		function enableservice()
		{
			document.getElementById('currency').disabled = false;
			document.getElementById('exchangeType').disabled = false;
			document.getElementById('methodType').disabled = false;
			document.getElementById('tax').disabled = false;
			document.getElementById('billTo').disabled = false;
			document.getElementById('shipTo').disabled = false;
			document.getElementById('issuedfrom').disabled = true;
			
			document.getElementById('billicon').setAttribute('onclick',"openpostal('billTo')");
			document.getElementById('shipicon').setAttribute('onclick',"openfacility('shipTo')");
			document.getElementById('issuedfrom').setAttribute('onclick',"");
		}
		
		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
    <script type="text/javascript">
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
		
					row.insertCell(0).appendChild(genCbx(row.rowIndex));
					row.insertCell(1).appendChild(genPrd(row.rowIndex));
					row.insertCell(2).appendChild(genPrdPopup(row.rowIndex));
					row.insertCell(3).appendChild(genQty(row.rowIndex));
					row.insertCell(4).appendChild(genStd(row.rowIndex));
					row.insertCell(5).appendChild(genPrice(row.rowIndex));
					
					var _date = genDate(index);
					
					row.insertCell(6).appendChild(_date);
					
					var node = dojo.widget.createWidget("DropdownDatePicker", {inputName:"dates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_date);
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
		
		function genPrd(index)
		{
			var prd = document.createElement("select");
			prd.name="products";
			prd.id="product["+index+"]";
			prd.setAttribute('class','combobox-ext');
						
			return prd;
		}
		
		function genPrdPopup(index)
		{
			var _popup = document.createElement('img');
			_popup.id = '_popup_line['+index+']';
			_popup.src = 'assets/icons/list_extensions.gif';
			_popup.onclick = function()
			{
				popup("product["+index+"]",index);
			}
			_popup.setAttribute('style','CURSOR:pointer;');
			_popup.title='Product/Service';

			return _popup;
		}
		
		function popup(target,index)
		{
			var org = document.getElementById('org');
			if(org.value == '')
			{
				alert('Please select valid Company first!');
				return;
			}
			
			var supplier = document.getElementById('supplier');
			if(supplier.value == '')
			{
				alert('Please select valid Supplier first!');
				return;
			}
			
			var _date = dojo.widget.byId("date");
			if(_date.getValue() == null || _date.getValue() == '')
			{
				alert('Plase select date first!');
				return;
			}
			
			var currency = document.getElementById('currency');
			var type = document.getElementById('exchangeType');
			
			openpopup("<c:url value='/page/popupproductprice4procurementview.htm?organization='/>"+org.value+"&target="+target+"&party="+supplier.value+"&index="+index+"&currency="+currency.value+"&exchangeType="+type.value+"&date="+_date.getValue()+"&defCurrency=${default.id}");
		}
		
		function genQty(index)
		{
			var quant = document.createElement("input");
			quant.name="quantitys";
			quant.id="quant["+index+"]";
			quant.setAttribute('size','15');
						
			return quant;
		}
		
		function genStd(index)
		{
			var std = document.createElement("input");
			std.type = "text";
			std.id = "std["+index+"]";
			std.setAttribute('size',"15");
			std.value = "0";
			std.setAttribute('class','input-disabled');
			std.disabled = true;
			
			return std;
		}
		
		function genPrice(index)
		{
			var price = document.createElement("input");
			price.name="prices";
			price.id="price["+index+"]";
			price.setAttribute('size','15');
						
			return price;
		}
		
		function genDate(index)
		{
			var date = document.createElement("select");
			date.name="dates";
			date.id="date["+index+"]";
			date.setAttribute('class','combobox-ext');
						
			return date;
		}
		
		function clickAll()
		{
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
		}
	</script>
</head>

<body onload="error();enableservice();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">
	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">ransport Outsource > Transport Management > Vehicle Maintenance > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">D11 - Vehicle Maintenance</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/vehiclepreedit.htm?id=${maintenance.vehicle.id}'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" href="javascript:save('false');"><span>Save</span></a>
								<a class="item-button-save-new" href="javascript:save('true');"><span>Save &amp; New</span></a>									
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="maintenance">
 								<table width="100%" border="0" cellpadding="0" cellspacing="3" id="tableRecord">
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">ID :</td>
							  	  	<td width="45%"><input size="25" disabled class="input-disabled" value="Auto Generated"/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Date :</td>
									<td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Company :</td>
									<td>
                                    	<select id="org" class="combobox-ext" disabled>
                                        	<option value="${maintenance.vehicle.organization.id}"><c:out value='${maintenance.vehicle.organization.firstName} ${maintenance.vehicle.organization.middleName} ${maintenance.vehicle.organization.lastName}'/></option>
                                        </select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Vehicle :</td>
									<td>
                                    	<select class="combobox" >
                                        	<option>${maintenance.vehicle.name}</option>
                                        </select>
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
									<td width="20%" align="right" nowrap="nowrap">Total Kilometer :</td>
							  	  	<td width="45%"><form:input size="15" path='kilometer'/></td>
                                  	<td width="35%">&nbsp;</td>
								</tr>
                                <tr>
 									<td align="right">Maintenance Type :</td>
									<td>
                                        <form:select path='maintenanceType'>
                                        	<form:option value='SERVICE' label='SERVICE MAINTENANCE' onclick='enableservice();'/>
                                            <form:option value='PART' label='SPARE PART MAINTENANCE' onclick='disableservice();'/>
                                        </form:select>
                                  	</td>
									<td width="35%">&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Vendor :</td>
									<td>
                                    	<form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                            <c:if test='${not empty maintenance.supplier}'>
                                                <form:option value='${maintenance.supplier.id}' label='${maintenance.supplier.firstName} ${maintenance.supplier.middleName} ${maintenance.supplier.lastName}' />
                                            </c:if>
                                        </form:select>
                                       	&nbsp;
										<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="javascript:openpopup('<c:url value='/page/popupsupplierview.htm?target=supplier&organization=${maintenance.vehicle.organization.id}'/>');" style="CURSOR:pointer;" title="Vendor" />
                                    </td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Currency :</td>
                                    <td>
                                        <form:select id="currency" path="currency">
                                            <form:options items='${currencys}' itemLabel='symbol' itemValue='id'/>
                                        </form:select>
                                        &nbsp;
                                        <form:select id="exchangeType" path="exchangeType">
                                            <form:option value='SPOT'>SPOT</form:option>
                                            <form:option value='MIDDLE'>MIDDLE</form:option>
                                            <form:option value='TAX'>TAX</form:option>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Payment Method Type : </td>
                                    <td >
                                        <form:select id='methodType' path='paymentMethodType'>
                                            <form:option value='CASH' label='CASH'/>
                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                            <form:option value='CLEARING' label='CLEARING'/>
                                        </form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Tax :</td>
                                    <td>
                                        <form:select id='tax' path='tax'>
                                            <c:forEach items='${taxes}' var='tax'>
                                                <form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};"/>
                                            </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <input size="7" id="taxRate" class="input-disabled" disabled/>
                                    </td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Valid To :</td>
									<td><input id="validTo" name="validTo" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path='note' cols='55' rows='6'/></td>
                                   <td width="35%">&nbsp;</td>
								</tr>
 								</table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                	<div id="address" dojoType="ContentPane" label="Shipping & Billing" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                            <td width="14%" align="right">Bill To Address : </td>
                                            <td width="35%">
                                            	 <form:select id="billTo" path="billTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty maintenance.billTo}'>
                                                        <form:option value='${maintenance.billTo.id}' label='${maintenance.billTo.party.firstName} ${maintenance.billTo.party.middleName} ${maintenance.billTo.party.lastName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img id="billicon" src="assets/icons/list_extensions.gif" onclick="openpostal('billTo');" style="CURSOR:pointer;" title="Address" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Ship To Address : </td>
                                            <td>
                                            	<form:select id="shipTo" path="shipTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty maintenance.shipTo}'>
                                                        <form:option value='${maintenance.shipTo.id}' label='${maintenance.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img id="shipicon" src="assets/icons/list_extensions.gif" onclick="openfacility('shipTo');" style="CURSOR:pointer;" title="Address" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Issued from Address : </td>
                                            <td>
                                            	<form:select id="source" path="source" cssClass="combobox-ext">
                                                    <c:if test='${not empty maintenance.source}'>
                                                        <form:option value='${maintenance.source.id}' label='${maintenance.source.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img id="issuedfrom" src="assets/icons/list_extensions.gif" onclick="openfacility('source');" style="CURSOR:pointer;" title="Facility" />
                                            </td>
                                        </tr>
                                        </table>
                                	</div>
                                    <div id="line" dojoType="ContentPane" label="Line Item" class="tab-pages" refreshOnShow="true">
                                        <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
                                        </div>
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                          <th width="2%"><input type="checkbox" name="checkMaster" id="checkMaster" onclick="clickAll();"/></th>
                                            <th width="30%" >Product/Service</th>
                                          <th width="0%">&nbsp;</th>
                                            <th width="17%">Quantity</th>
                                            <th width="18%">Std Price</th>
                                          <th width="17%">Price</th>
                                          <th width="16%">Del Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
	
  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer">
		<div>
			<span>&copy; 2011 siriusERP v1.6-GA&nbsp;&nbsp;&nbsp;&nbsp;</span>
		</div>
	</div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
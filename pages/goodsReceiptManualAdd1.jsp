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
							<a class="item-button-list" href="<c:url value='/page/goodsreceiptmanualview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-next" style="cursor:pointer;"><span>Next</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="goodsReceipt">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%">
                                    	 <table width="100%" style="border:none">
                                         <tr>
                                          	<td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          	<td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                         </tr>
		                                 <tr>
											<td nowrap="nowrap" align="right">Organization :</td>
											<td>
												<form:select id="org" path="organization" cssClass="combobox-ext">
												<c:if test='${not empty goodsReceipt.organization}'>
		                                            <form:option value='${goodsReceipt.organization.id}' label='${goodsReceipt.organization.name}' />
		                                        </c:if>
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
												<img src="assets/icons/list_extensions.gif" onclick="openFacilityByOrg('facility')" style="CURSOR:pointer;" title="Company Structure" />
											</td>
										</tr>
										<tr>
											<td nowrap="nowrap" align="right">Grid :</td>
											<td>
												<select id='allgrid' class="combobox-ext"></select>
												&nbsp;
												<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('allgrid');" style="CURSOR:pointer;" title="Grid" />
												<input id='gridName' type="hidden"/>
		                                   	</td>
		                                </tr>
		                                <tr>
		                                	<td nowrap="nowrap" align="right">Date :</td>
		                                	<td><input value="<fmt:formatDate value='${now}'/>" id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
		                                </tr>
		                                <tr>
		                                	<td nowrap="nowrap" align="right">DO No :</td>
		                                	<td><form:input path='doNo' size='30' maxlength='50'/></td>
		                                </tr>
		                                <tr>
		                                	<td nowrap="nowrap" align="right">Note :</td>
		                                	<td><form:textarea path="note" cols="55" rows="7"/></td>
		                                </tr>
		                               	</table>
		                            </td>
                                </tr>
                                </table>
                                <br/>
                                <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                                <a class="item-button-new" href="javascript:addLineItem();"><span>New Row</span></a>
	                                <a class="item-button-delete" href="javascript:deleteRow()"><span>Delete Row</span></a>
	                            </div>
                                <table id="lineItemTableReceiptManual" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                <thead>
                                <tr>
	                                <th width="10px"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></th>
                                    <th width="29%">Product</th>
	  	  	  	  	  	  			<th width="12%">Tipe</th>
	  	  	  	  	  	  			<th width="15%">Merk</th>
                                    <th width="12%">Warna</th>
                                  	<th width="8%">Jumlah</th>
                                    <th width="8%">Satuan</th>
                                    <th width="27%">Grid</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
	$(function(){
		$('.item-button-next').click(function(){
			if(validation())
			{
				$("#addForm").attr("action","<c:url value='/page/goodsreceiptmanualpreadd2.htm'/>");
				$("#addForm").submit();
			}
		});
	});
	
	function validation()
	{
		if($("#facility").val() == null || $("#facility").val() == '')
		{
			alert('Please select Facility first !!!');
			return;
		}
		
		if($("#allgrid").val() == null || $("#allgrid").val() == '')
		{
			alert('Please select Grid first !!!');
			return;
		}

		var tbl = document.getElementById("lineItemTableReceiptManual");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Line Item first before saving !!!');
				return;
			}
			else
			{
				var arr = new Array();
		        arr = document.getElementsByName("checkIdx");
		        for(var i = 0; i < arr.length; i++)
		        {
		            var obj = document.getElementsByName("checkIdx").item(i);
					
					if($("#product\\["+obj.value+"\\]").val() == '' || $("#product\\["+obj.value+"\\]").val() == null ||
							$("#product\\["+obj.value+"\\]").val() == '0') {
						alert('Please select Product first!');
						return;
					}
	
					if(new Number($("#receipt\\["+obj.value+"\\]").val()) <= 0) {
						alert('Quantity tidak boleh kosong !!!');
						return;
					}
		        }
			}
		}
		
		return true;
	}
	
	function opengrid(target)
	{
		var fac = document.getElementById('facility');
		if(fac.value == null || fac.value == '')
		{
			alert('Please select Facility first !!!');
			return;
		}
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}
	
	var index=0;
	function addLineItem(){
		var grid = document.getElementById('allgrid');
		var gridName = document.getElementById('gridName');
		
		if(grid.value == null || grid.value == '')
		{
			alert('Please select Grid first !!!');
			return;
		}
		
		var tbl = document.getElementById("lineItemTableReceiptManual");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				/* if(t_section.rows.length > 0 )
					index = t_section.rows.length+1; */

				var row = t_section.insertRow(t_section.rows.length);

				row.insertCell(0).appendChild(genCbx(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genType(index));
				row.insertCell(3).appendChild(genMerk(index));
				row.insertCell(4).appendChild(genColor(index));
				row.insertCell(5).appendChild(genReceipt(index));
				row.insertCell(6).appendChild(genMeasure(index));
				row.insertCell(7).appendChild(genGrid(index,grid,gridName));

				index++;
			}
		}
	}
	function genCbx(index){
		var elem=document.createElement("input");
		elem.type="checkbox";
		elem.name = "checkIdx";
		elem.id="check["+index+"]";
		elem.value = index;
		
		return elem;
	}
	function genProduct(index){
		var div=document.createElement("div");

		var elem=document.createElement("select");
		elem.name="product";
		elem.id="product["+index+"]";
		elem.setAttribute('class','inputbox-medium');

		var opt=document.createElement("option");
		opt.value="0";
		opt.text="--Product--";
		elem.appendChild(opt);

		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			openProductByParam("product["+index+"]","categoryId=3");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Produk';


		div.appendChild(elem);
		div.appendChild(document.createTextNode(" "));
		div.appendChild(_popup);

		return div;
	}
	function genType(index){
		var elem=document.createElement("input");
		elem.id="product["+index+"]-type";
		elem.disabled=true;
		elem.setAttribute('class','input-disabled');
		return elem;
	}
	function genMerk(index){
		var elem=document.createElement("input");
		elem.id="product["+index+"]-brand-name";
		elem.disabled=true;
		elem.setAttribute('class','input-disabled');
		return elem;
	}
	function genColor(index){
		var elem=document.createElement("input");
		elem.id="product["+index+"]-color";
		elem.disabled=true;
		elem.setAttribute('class','input-disabled');
		return elem;
	}
	function genReceipt(index){
		var elem=document.createElement("input");
		elem.id="receipt["+index+"]";
		elem.name="quantity";
		elem.setAttribute('size','5');
		return elem;
	}
	function genMeasure(index){
		var elem=document.createElement("input");
		elem.id="product["+index+"]-uom";
		elem.name="receipt";
		elem.disabled=true;
		elem.setAttribute('class','input-disabled');
		return elem;
	}

	function genGrid(index,grid,gridName){
		var div=document.createElement('div');

		var elem=document.createElement("select");
		elem.id="grid["+index+"]";
		elem.name="grids";
		
		var opt=document.createElement("option");
		opt.value=grid.value;
		opt.text=gridName.value;
		elem.appendChild(opt);

		div.appendChild(elem);
		
		return div;
	}

	function display(product,target)
	{
		var _target = document.getElementById(target);
		var _unrec = document.getElementById('unrec-'+product);

		var _quan = document.getElementById('pro-'+product);
		var _rec = document.getElementById('rec-'+product);

		var rec = 0.0;
		var av = _quan.value.toNumber() - _rec.value.toNumber();

		if(!_target.value)
		{
			alert('Receipted Quantity can not be empty!');
			return;
		}

		if(_target.value.toNumber() > av)
		{
			alert('Receipted Quantity exceeded allowed quantity!');
			return;
		}

		_unrec.value = _target.value.toNumber().numberFormat('#,#.00');
	}
	
	function clickAll()
	{
		var checked = false;
		if(document.getElementById("checkMaster").checked == true)
			checked = true;

		var tbl = document.getElementById("lineItemTableReceiptManual");
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
		var tbl = document.getElementById("lineItemTableReceiptManual");

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
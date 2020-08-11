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
							<a class="item-button-list" href="<c:url value='/page/accessoriespurchaseorderview.htm'/>"><span><spring:message code="list"/></span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" next='DONE' style="cursor:pointer;"><span><spring:message code="save"/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="purchaseOrder">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right"><spring:message code="id"/></td>
                                          <td width="72%"><input value="<spring:message code='autonumber'/>" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder.organization}'>
                                                        <form:option value='${purchaseOrder.organization.id}' label='${purchaseOrder.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                          <tr>
                                            <td nowrap="nowrap" align="right">Gudang Penerimaan :</td>
                                            <td>
                                                <form:select id="loc" path="shipTo" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder.shipTo}'>
                                                        <form:option value='${purchaseOrder.shipTo.id}' label='${purchaseOrder.shipTo.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openFacilityByOrg('loc');" style="CURSOR:pointer;" title="Gudang" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" name="date" inputId="inputDate" value="<fmt:formatDate value='${purchaseOrder.date}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Pemasok :</td>
                                            <td>
                                                <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty purchaseOrder.supplier}'>
                                                        <form:option value='${purchaseOrder.supplier.id}' label='${purchaseOrder.supplier.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Pemasok" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No. Nota Debit :</td>
                                            <td><form:input path='invoiceNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No. Sales Order :</td>
                                            <td><form:input id="salesOrderNo" path='salesOrderNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Catatan :</td>
                                            <td><form:textarea path='note' cols='37' rows='4'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                <div id="info" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="javascript:addLineItem();"><span>Tambah</span></a>
                                        <a class="item-button-delete" href="javascript:deleteRow('lineItemTable')"><span>Hapus</span></a>
                                         <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="1%"><input type="checkbox" name="checkMaster" id="checkMaster_lineItemTable" onclick="clickAll('lineItemTable');"/></th>
                                        <th width="15%"><spring:message code='product'/></th>
                                        <th width="1%">&nbsp;</th>
                                        <th width="10%"><spring:message code="type"/></th>
                                        <th width="10%"><spring:message code="typename"/></th>
                                        <th width="10%"><spring:message code="color"/></th>
                                        <th width="53%"><spring:message code="quantity"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
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
	$(function()
	{
		$('.item-button-save').click(function(e)
		{
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/accessoriespurchaseorderadd.htm'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType:'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Accessories Purchase Order data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/accessoriespurchaseorderview.htm'/>";
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

	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}

		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
	}

	function validation()
	{
		var org = document.getElementById('org').value;
		if(org == null || org == '')
		{
			alert('Please select Organization first !!!');
			return;
		}

		var loc = document.getElementById('loc').value;
		if(loc == null || loc == '')
		{
			alert('Please select Warehouse first !!!');
			return;
		}

		var date = document.getElementById('inputDate').value;
		if(date == null || date == '')
		{
			alert('Verification Date cannot be empty !!!');
			return;
		}

		var supplier = document.getElementById('supplier').value;
		if(supplier == null || supplier == '')
		{
			alert('Please select Supplier first !!!');
			return;
		}

		var tbl = document.getElementById("lineItemTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			var len = t_section.rows.length;

			if(len == 0)
			{
				alert('You need to provide Transaction Item first before saving the transaction!');
				return;
			}

			var products=document.getElementsByName("products");
			for(var i=0;i<products.length;i++)
			{
				if(products[i].value == null || products[i].value == '')
				{
					alert('Please select Product first!');
					return;
				}
			}

			var qtys=document.getElementsByName("receiveds");
			for(var i=0;i<qtys.length;i++)
			{
				if(parseFloat(qtys[i].value) <= 0)
				{
					alert('Product Quantity must be greater than 0!');
					return;
				}
			}
		}

		return true;
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
				if(t_section.rows.length > 0 )
					index = t_section.rows.length;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCheck(index));
				row.insertCell(1).appendChild(genProduct(index));
				row.insertCell(2).appendChild(genPopup(index));
				row.insertCell(3).appendChild(genType(index));
				row.insertCell(4).appendChild(genTypeName(index));
				row.insertCell(5).appendChild(genColor(index));
				row.insertCell(6).appendChild(genQty(index));

				index++;
			}
		}
	}

	function genCheck(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.name = "check";
		check.id = "check["+index+"]";
		return check;
	}

	function genProduct(index)
	{
		var itemx = document.createElement("select");
		itemx.name="products";
		itemx.id="product["+index+"]";
		itemx.setAttribute('class','combobox-ext');

		return itemx;
	}

	function genPopup(index)
	{
		var _popup = document.createElement('img');
		_popup.id = '_popup_line['+index+']';
		_popup.src = 'assets/icons/list_extensions.gif';
		_popup.onclick = function()
		{
			var org = document.getElementById('org');
			if(org.value == null || org.value == '') {
				alert('Please select Organization first !!!');
				return;
			}
			var target="product["+index+"]";
			openpopup("<c:url value='/page/popupproductview.htm?target='/>"+target+"&index="+index+"&categoryId=3&active=true");
		}
		_popup.setAttribute('style','CURSOR:pointer;');
		_popup.title='Product Accessories';

		return _popup;

	}

	function genType(index)
	{
		var producttype = document.createElement("input");
		producttype.type = "text";
		producttype.id = "type["+index+"]";
		producttype.setAttribute('size',"15");
		producttype.value = "";
		producttype.setAttribute('class','input-disabled');
		producttype.disabled = true;

		return producttype;
	}

	function genTypeName(index)
	{
		var producttypename = document.createElement("input");
		producttypename.type = "text";
		producttypename.id = "typename["+index+"]";
		producttypename.setAttribute('size',"20");
		producttypename.value = "";
		producttypename.setAttribute('class','input-disabled');
		producttypename.disabled = true;

		return producttypename;
	}

	function genColor(index)
	{
		var productcolor = document.createElement("input");
		productcolor.type = "text";
		productcolor.id = "color["+index+"]";
		productcolor.setAttribute('size',"20");
		productcolor.value = "";
		productcolor.setAttribute('class','input-disabled');
		productcolor.disabled = true;

		return productcolor;
	}

	function genQty(index)
	{
		var received = document.createElement("input");
		received.type = "text";
		received.name = "quantities";
		received.id = "received["+index+"]";
		received.setAttribute('size',"6");
		received.value = "0";
		received.setAttribute('onblur','calculateSubTotal('+index+');');

		return received;
	}
</script>
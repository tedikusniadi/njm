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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordercrosscompanyview.htm'/>"><span>List</span></a>
							<%-- <c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
							</c:if> --%>
							<c:if test='${access.delete and cancel}'>
								<a class="item-button-delete" style="cursor:pointer;"><span>Delete</span></a>
							</c:if>
							<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/unitsalesordercrosscompanyprint.htm?id=${salesOrder_edit.id}'/>"><span>Print</span></a>
					  		</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID : </td>
                                          	<td width="73%"><input id="soCode" value="${salesOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>" disabled class='inputbox-medium input-disabled'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                            	<select id="org" class="combobox-ext">
                                            		<option value='${salesOrder_edit.organization.id}'>${salesOrder_edit.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="10%" align="right" valign="top">Catatan: </td>
                               		  	  	<td width="40%"><textarea cols="35" rows="5" disabled class='input-disabled'>${salesOrder_edit.note}</textarea></td>
                                        </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <div id="rekapTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                				<div id="transactionTab" dojoType="ContentPane" label="Rekap Transaksi" class="tab-pages" refreshOnShow="true">
                                                    <table width="100%" style="border:none">
		                                            <tr>
		                                            	<th width="60%">&nbsp;</th>
		                                           	  	<th width="20%"><div id="trx">Jumlah</div></th>
		                                           	  	<th width="20%">Jumlah (<c:out value='${currency.symbol}'/>)</th>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Transaksi : </td>
		                                                <td><input id="transaction" value="<fmt:formatNumber value='${salesOrder_edit.totalAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13" /></td>
		                                                <td><input id="transactionDef" value="<fmt:formatNumber value='${salesOrder_edit.totalAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Biaya Pelanggaran Wilayah :</td>
		                                                <td><input id="crossDistrictAmount" name="rounding" value="<fmt:formatNumber value='${salesOrder_edit.crossDistrictAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="crossDistrictAmountDef" value="<fmt:formatNumber value='${salesOrder_edit.crossDistrictAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Potongan Harga Satuan :</td>
		                                                <td><input id="discount" value="<fmt:formatNumber value='${salesOrder_edit.discAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="discountDef" value="<fmt:formatNumber value='${salesOrder_edit.discAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">DPP :</td>
		                                                <td><input id="nett" value="<fmt:formatNumber value='${salesAdapter.dppForCustomerDealer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="neffDef" value="<fmt:formatNumber value='${salesAdapter.dppForCustomerDealer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">PPN :</td>
		                                                <td><input id="tax" value="<fmt:formatNumber value='${salesOrder_edit.taxAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="taxDef" value="<fmt:formatNumber value='${salesOrder_edit.taxAmount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
		                                            <tr>
		                                            	<td align="right">Total :</td>
		                                                <td><input id="total" value="<fmt:formatNumber value='${salesAdapter.totalForCustomerDealer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                                <td><input id="totalDef" value="<fmt:formatNumber value='${salesAdapter.totalForCustomerDealer}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
		                                            </tr>
                                                    </table>
                                                </div>
                                				<div id="deliveryTab" dojoType="ContentPane" label="Pengiriman" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
			                                			<c:if test="${deliveryOrder.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h1>Terkirim</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${deliveryOrder.id}'/>">
				                                          			<c:out value='${deliveryOrder.code}'/>
				                                                </a>
				                                            </td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${deliveryOrder.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h1>Belum Terkirim</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                		</table>
                                				</div>
                                              </div>
                                            </td>
                                        </tr>
                                		</table>
                           	  	  </td>
                                </tr>
                                </table>
                               	<div id="mainTab1" dojoType="TabContainer" style="width:100% ; height: 230px;">
                                	<div id="customerTab" dojoType="ContentPane" label="Informasi Pelanggan" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Nama Pemesan</td>
                                				<td>: <select id="cust" disabled class="combobox-ext input-disabled"><option value="${salesOrder_edit.customer.id}">${salesOrder_edit.customer.name}</option></select>
                                				</td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='cust-postalCode' disabled class='input-disabled' size="10"/></td>
                                			</tr>
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="cust-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Email</td>
                                				<td>: <input id='cust-email' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="cust-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 1</td>
                                				<td>: <input id='cust-phone' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id="cust-city" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 2</td>
                                				<td>: <input id='cust-phone2'disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kecamatan</td>
                                				<td>: <input id="cust-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id='cust-samsat-area' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="cust-village" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab2" dojoType="TabContainer" style="width:100% ; height: 170px;">
                                	<div id="licenseTab" dojoType="ContentPane" label="Informasi STNK" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Nama STNK</td>
                                				<td>: <input value="${salesOrder_edit.customerUnit.name}" disabled class='inputbox-ext input-disabled'/>
                                				<td>Kecamatan</td>
                                				<td>: <input id="license-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="license-address" disabled class='inputbox-ext input-disabled'/></td>
                                				</td>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="license-village" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="license-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='license-postalCode' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id='license-city' disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id="license-samsat-area" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab3" dojoType="TabContainer" style="width:100% ; height: 230px;">
                                	<div id="deliveryTab" dojoType="ContentPane" label="Pengiriman" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Nama Pemesan</td>
                                				<td>: <select id="cust-delivery" disabled class="combobox-ext input-disabled"><option value="${salesOrder_edit.customer.id}">${salesOrder_edit.customer.name}</option></select>
                                				</td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='cust-postalCode-delivery' disabled class='input-disabled' size="10"/></td>
                                			</tr>
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="cust-address-delivery" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Email</td>
                                				<td>: <input id='cust-email-delivery' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="cust-province-delivery" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 1</td>
                                				<td>: <input id='cust-phone-delivery' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id="cust-city-delivery" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 2</td>
                                				<td>: <input id='cust-phone2-delivery'disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kecamatan</td>
                                				<td>: <input id="cust-subdistrict-delivery" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id='cust-samsat-area-delivery' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="cust-village-delivery" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab4" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="unitTab" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Product</td>
                                				<td>:
                                					<c:forEach items="${salesOrder_edit.items}" var="items">
                                						<c:set var="item" value="${items}"/>
                                					</c:forEach>
                                					<input value="${item.product.name}" disabled class='inputbox-ext input-disabled'/>
                                				</td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                			<tr>
                                				<td>Tipe</td>
                                				<td>:&nbsp;<input id="unit-type" value="${item.product.types}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                			<tr>
                                				<td>Nama Tipe</td>
                                				<td>:&nbsp;<input id="unit-type-name" value="${item.product.typeNames}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                			<tr>
                                				<td>Warna</td>
                                				<td>:&nbsp;<input id="unit-color" value="${item.product.colors}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
function setCustomerInfo(id,cust)
{
	$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:cust},function(json){
		$("#"+id+"-address").val(json.address);
		$("#"+id+"-postalCode").val(json.postalCode);
		$("#"+id+"-province").val(json.province);
		$("#"+id+"-phone").val(json.phone);
		$("#"+id+"-city").val(json.city);
		$("#"+id+"-samsat-area").val(json.region);
		$("#"+id+"-subdistrict").val(json.subdistrict);
		$("#"+id+"-village").val(json.village);
		$("#"+id+"-email").val(json.email);

		if(id == 'cust')
		{
			$("#"+id+"-phone2").val(json.phone2);
			
			$("#"+id+"-address-delivery").val(json.address);
			$("#"+id+"-postalCode-delivery").val(json.postalCode);
			$("#"+id+"-province-delivery").val(json.province);
			$("#"+id+"-phone-delivery").val(json.phone);
			$("#"+id+"-phone2-delivery").val(json.phone2);
			$("#"+id+"-city-delivery").val(json.city);
			$("#"+id+"-samsat-area-delivery").val(json.region);
			$("#"+id+"-subdistrict-delivery").val(json.subdistrict);
			$("#"+id+"-village-delivery").val(json.village);
			$("#"+id+"-email-delivery").val(json.email);
		}
	});
}

setCustomerInfo("cust","${salesOrder_edit.customer.id}");
setCustomerInfo("license","${salesOrder_edit.customerUnit.id}");

$(".item-button-save").click(function(){
	$.ajax({
		url:"<c:url value='/page/unitsalesordercrosscompanyupdate.htm'/>",
		data:$('#addForm').serialize(),
		type : 'POST',
		dataType : 'json',
		beforeSend:function()
		{
			$dialog.empty();
			$dialog.html('Update Unit Sales Order data......');
			$dialog.dialog('open');
		},
		success : function(json) {
			if(json)
			{
				if(json.status == 'OK')
				{
					$dialog.dialog('close');
					window.location="<c:url value='/page/unitsalesordercrosscompanypreedit.htm?id=${salesOrder_edit.id}'/>";
				}
				else
				{
					$dialog.empty();
					$dialog.html('Proccess fail,reason:<br/>'+json.message);
				}
			}
		}
	});
});

$(".item-button-delete").click(function(){
	var $dialog_confirm = $('<div title="Cancel Unit Sales Order"></div>')
	.html('Anda yakin akan membatalkan transaksi SO dengan kode '+$("#soCode").val()+' ?');

	$dialog_confirm.dialog({
		resizable: false,
		height:140,
		modal: true,
		buttons: {
			"Yes": function()
			{
				$( this ).dialog( "close" );
				$.ajax({
					url:"<c:url value='/page/unitsalesordercrosscompanydelete.htm?id=${salesOrder_edit.id}'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType:'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Canceling Unit Sales Order data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitsalesordercrosscompanyview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			},
			"No": function()
			{
				$( this ).dialog( "close" );
			}
		}
	});
});

function separator(id)
{
	var amount = document.getElementById(id);
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
	}
}
</script>
</body>
</html>
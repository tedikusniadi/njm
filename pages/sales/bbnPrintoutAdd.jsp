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
							<a class="item-button-list" href="<c:url value='/page/bbnprintoutview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="bbn_add">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">Company :</td>
                                            <td width="73%">
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty bbn_add.organization}'>
                                                        <form:option value='${bbn_add.organization.id}' label='${bbn_add.organization.name}' />
                                                    </c:if>
                                                </form:select>
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openOrg('org')" style="CURSOR:pointer;" title="Organisasi" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td>
                                            	<input inputId="dateId" id="date" name="date" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td align="right">Tipe BBN : </td>
		                                    <td>
		                                        <select id='bbnType' name='bbnType' class='combobox'>
		                                        	<option value="SERVICEAGENT">BIRO JASA</option>
		                                        	<option value="REGION">SAMSAT</option>
		                                        </select>
		                                    </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Pengurus BBN :</td>
		                                    <td>
		                                        <select id="bbnService" name="bbnService" class="combobox-ext">
		                                        	<option></option>
		                                        </select>
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openServiceAgent();" style="CURSOR:pointer;" title="Salesman" />
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Provinsi :</td>
                                          	<td>
                                          		<select id="province" onchange="javascript:getcity('province')" class="combobox-medium">
			 							  			<option id="province" value="0">--Provinsi--</option>
			 							  			<c:forEach items="${provinces}" var="prov">
			 							  				<option value="${prov.id}">${prov.name}</option>
			 							  			</c:forEach>
			 							  		</select>
                                          	</td>
                                        </tr>
			 							<tr>
			 							  	<td align="right">Kota/Kabupaten :</td>
			 							  	<td>
			 							  		<select id="city" name="city" id='city' onchange="javascript:checkavailableregion('city')" class="combobox-medium">
			 							  			<option value="0">--Kota/Kabupaten--</option>
			 							  		</select>
			 							  		<input type="hidden" id="cityRegion" name="cityRegion" val=''/>
			 							  		<input type="hidden" id="haveSamsat" val=''/>
			 							  	</td>
			 							</tr>
			 							<tr>
			 							  	<td align="right">Wilayah Samsat :</td>
			 							  	<td>
			 							  		<select id='region' name="region" onchange="javascript:addLineItem()" class="combobox-medium">
			 							  			<option value="0">--Wilayah Samsat--</option>
			 							  		</select>
			 							  	</td>
			 							</tr>
		                                <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><textarea name="note" cols="55" rows="7"></textarea></td>
                                        </tr>
                                      	</table>
                                  	</td>
                              		<td width="44%" valign="top">
		  							  	<table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <fieldset>
                                                    <legend><strong>Rekap Transaksi</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="40%"align="right">Total Notice :</td>
                                                        <td width="60%"><input id="total-notice" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Jasa :</td>
                                                        <td><input id="total-service" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya Lain-lain 1 :</td>
                                                        <td><input id="total-others1" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya Lain-lain 2 :</td>
                                                        <td><input id="total-others2" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Acc Tahun :</td>
                                                        <td><input id="total-acc" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Biaya STCK :</td>
                                                        <td><input id="total-stck" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total Biaya :</td>
                                                        <td><input id="subtotal" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Total :</td>
                                                        <td><input id="total" value="0.00" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                		</table>
                           	  		</td>
                                </tr>
                                </table>
	                            <div class="toolbar-clean">
	                                <div class="item-navigator">&nbsp;</div>
	                            </div>
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                            <thead>
	                            <tr>
	                              	<th width="1%"><input type="checkbox" id="checkMaster" onclick="javascript:clickAll();"/></th>
	                              	<th width="1%" nowrap="nowrap">&nbsp;</th>
	                                <th width="10%" nowrap="nowrap">No SPK</th>
	                                <th width="10%" nowrap="nowrap">Nama STNK</th>
	                                <th width="15%" nowrap="nowrap">Alamat</th>
	                                <th width="10%" nowrap="nowrap">Tipe</th>
	                                <th width="10%" nowrap="nowrap">Nama Tipe</th>
	                                <th width="8%" nowrap="nowrap">Notice</th>
	                                <th width="7%" nowrap="nowrap">Jasa</th>
	                                <th width="7%" nowrap="nowrap">Acc Thn</th>
	                                <th width="8%" nowrap="nowrap">Stck</th>
	                                <th width="12%" nowrap="nowrap">No Mesin</th>
	                                <th width="12%" nowrap="nowrap">No Rangka</th>
	                                <th width="5%" nowrap="nowrap">Tahun</th>
	                                <th width="8%" nowrap="nowrap">Lain-lain 1</th>
	                                <th width="8%" nowrap="nowrap">Lain-lain 2</th>
	                                <th width="0%" nowrap="nowrap">&nbsp;</th>
	                                <th width="0%" nowrap="nowrap">&nbsp;</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="18">&nbsp;</td></tr>
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

function getcity(target){
	$.get("<c:url value='/page/geographicsremote.getcity.json'/>",{id:$("#"+target).val()},function(json){
		$("#city option").remove();
		$("<option></option>").	text("--Kota/Kabupaten--").val(0).appendTo("#city");
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#city");
		});
	});
}

/* function getregion(target){
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target).val()},function(json){
		$("#region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#region");
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#region");
		});
	});
	
	if($("#city option:selected").text().indexOf('KODYA') >= 0)
		$("#cityRegion").val("CITY");
	else
		$("#cityRegion").val("REGION");
	
	addLineItem();
} */

function checkavailableregion(target) {
	$.get("<c:url value='/page/geographicsremote.checkavailableregion.json'/>",{id:$("#"+target).val()},function(json){
		$("#region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#region");
		if(json.available)
		{
			$("#haveSamsat").val('true');
			getregion(target);
		} else
			$("#haveSamsat").val('false');

		addLineItem();
	});
}

function getregion(target){
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target).val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#region");
		});
	});
	
	if($("#city option:selected").text().indexOf('KAB') >= 0 || $("#city option:selected").text().indexOf('KABUPATEN') >= 0)
		$("#cityRegion").val("REGION");
	else
		$("#cityRegion").val("CITY");
}

function openServiceAgent()
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Organization first !!!');
		return;
	}
	if($('#bbnType').val() == 'SERVICEAGENT')
		openpopup("<c:url value='/page/bbnagentpopupview.htm?target=bbnService&organization='/>"+org.value);
	else
		openpopup("<c:url value='/page/popupregionview.htm?target=bbnService&organization='/>"+org.value);
}

function validation()
{
	if($("#org").val() == null || $("#org").val() == '')
	{
		alert('Mohon pilih Organisasi terlebih dahulu !!!');
		return;
	}
	
	if($("#dateId").val() == '')
	{
		alert('Tanggal BBN tidak boleh kosong !!!');
		return;
	}
	
	if($("#bbnService").val() == null || $("#bbnService").val() == '')
	{
		alert('Mohon pilih Pengurus BBN terlebih dahulu !!!');
		return;
	}
	
	if($("#city").val() == 0)
	{
		alert('Mohon pilih Kota/Kabupaten terlebih dahulu !!!');
		return;
	}
	
	if($("#haveSamsat").val() == 'true')
	{
		if($("#region").val() == 0)
		{
			alert('Mohon pilih Wilayah Samsat terlebih dahulu !!!');
			return;
		}
	}
	
	/* if($("#region").val() == 0)
	{
		alert('Mohon pilih Wilayah Samsat terlebih dahulu !!!');
		return;
	} */
	
	var total = 0;
	var $cek=$("input[name=cekIdx]");
	$.each($cek,function(idx,elem)
	{
		var i=elem.value;
		if($("#check\\["+i+"\\]").attr("checked"))
		{
			total++;
		}
	});
	
	if(total == 0)
	{
		alert('Mohon pilih Item yang akan diproses !!!');
		return;
	}
	
	return true;
}

$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'BBN',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/bbnprintoutadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving BBN data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/bbnprintoutprint.htm?id='/>"+json.id;
						}
						else
						{
							$dialog.empty();
							$dialog.html('Proccess fail,reason:<br/>'+json.message);
						}
					}
				}
			});
		}
	});
});

function calculateTransaction()
{
	var totalNotice = 0;
	var totalService = 0;
	var totalAcc = 0;
	var totalStck = 0;
	var totalOther1 = 0;
	var totalOther2 = 0;
	var subTotal = 0;
	var total = 0;
	
	var $cek=$("input[name=cekIdx]");
	$.each($cek,function(idx,elem)
	{
		var i=elem.value;
		if($("#check\\["+i+"\\]").attr("checked"))
		{
			var notice=new Number($("#notice\\["+i+"\\]").val().replace(/,/g,''));
			var service=new Number($("#service\\["+i+"\\]").val().replace(/,/g,''));
			var acc=new Number($("#acc\\["+i+"\\]").val().replace(/,/g,''));
			var stck=new Number($("#stck\\["+i+"\\]").val().replace(/,/g,''));
			var other1=new Number($("#othersAmt1\\["+i+"\\]").val().replace(/,/g,''));
			var other2=new Number($("#othersAmt2\\["+i+"\\]").val().replace(/,/g,''));
			
			totalNotice = totalNotice+notice;
			totalService = totalService+service;
			totalAcc = totalAcc+acc;
			totalStck = totalStck+stck;
			totalOther1 = totalOther1+other1;
			totalOther2 = totalOther2+other2;
			
			$("#noticeAmount\\["+i+"\\]").removeAttr('disabled');
			$("#serviceAmount\\["+i+"\\]").removeAttr('disabled');
			$("#acc\\["+i+"\\]").removeAttr('disabled');
			$("#stck\\["+i+"\\]").removeAttr('disabled');
			$("#othersAmt1\\["+i+"\\]").removeAttr('disabled');
			$("#othersAmt2\\["+i+"\\]").removeAttr('disabled');
			$("#acc\\["+i+"\\]").removeAttr('class');
			$("#stck\\["+i+"\\]").removeAttr('class');
			$("#othersAmt1\\["+i+"\\]").removeAttr('class');
			$("#othersAmt2\\["+i+"\\]").removeAttr('class');
		} else {
			$("#noticeAmount\\["+i+"\\]").attr('disabled','true');
			$("#serviceAmount\\["+i+"\\]").attr('disabled','true');
			$("#acc\\["+i+"\\]").attr('disabled','true');
			$("#stck\\["+i+"\\]").attr('disabled','true');
			$("#othersAmt1\\["+i+"\\]").attr('disabled','true');
			$("#othersAmt2\\["+i+"\\]").attr('disabled','true');
			$("#acc\\["+i+"\\]").attr('class',"input-disabled");
			$("#stck\\["+i+"\\]").attr('class',"input-disabled");
			$("#othersAmt1\\["+i+"\\]").attr('class',"input-disabled");
			$("#othersAmt2\\["+i+"\\]").attr('class',"input-disabled");
		}
	});
	
	/* var totalOther = new Number($("#total-others").val().replace(/,/g,'')); */
	subTotal = totalAcc + totalStck + totalOther1 + totalOther2;
	total = subTotal + totalNotice + totalService;
	
	$("#total-notice").val(new Number(totalNotice).numberFormat("#,###.00"));
	$("#total-stck").val(new Number(totalStck).numberFormat("#,###.00"));
	$("#total-service").val(new Number(totalService).numberFormat("#,###.00"));
	$("#total-others1").val(new Number(totalOther1).numberFormat("#,###.00"));
	$("#total-others2").val(new Number(totalOther2).numberFormat("#,###.00"));
	$("#total-acc").val(new Number(totalAcc).numberFormat("#,###.00"));
	$("#subtotal").val(new Number(subTotal).numberFormat("#,###.00"));
	$("#total").val(new Number(total).numberFormat("#,###.00"));
}

function addLineItem()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'References',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$dialog.empty();
	$dialog.html('Loading data......');
	$dialog.dialog('open');

	clearTable();
	var index = 0;
	var org = $("#org").val();
	var serviceType = "";
	var city = $("#city").val();
	var region = $("#region").val();
	
	$.get("<c:url value='/page/bbnremote.getitem.json'/>",{organization:org,type:serviceType,cityId:city,regionId:region,pengajuan:'Y'},
	function(json)
	{
		//clearTable();
		
		$.each(json.itemAdapters,function(idx,val)
		{
			var tbl = document.getElementById("lineItemTable");
			if(tbl)
			{
				var t_section = tbl.tBodies[0];
				if(t_section)
				{
					var row = t_section.insertRow(t_section.rows.length);
					row.insertCell(0).appendChild(genCheck(index,val.id));
					row.insertCell(1).appendChild(genCheckHidden(index));
					row.insertCell(2).appendChild(genCode(index,val.code));
					row.insertCell(3).appendChild(genCustomer(index,val.customerUnit));
					row.insertCell(4).appendChild(genAddress(index,val.addressUnit));
					row.insertCell(5).appendChild(genTypes(index,val.types));
					row.insertCell(6).appendChild(genTypeNames(index,val.typeNames));
					row.insertCell(7).appendChild(genNotice(index,val.notice));

					if($("#city option:selected").text().indexOf('KAB') >= 0 || $("#city option:selected").text().indexOf('KABUPATEN') >= 0)
						row.insertCell(8).appendChild(genService(index,val.serviceRegion));
					else
						row.insertCell(8).appendChild(genService(index,val.serviceCity));
					
					row.insertCell(9).appendChild(genAcc(index));
					row.insertCell(10).appendChild(genStck(index));
					row.insertCell(11).appendChild(genSerial(index,val.serial));
					row.insertCell(12).appendChild(genSerialExt(index,val.serialExt));
					row.insertCell(13).appendChild(genYear(index,val.year));
					row.insertCell(14).appendChild(genOthers1(index));
					row.insertCell(15).appendChild(genOthers2(index));
					row.insertCell(16).appendChild(genNoticeHidden(index,val.notice));

					if($("#city option:selected").text().indexOf('KAB') >= 0 || $("#city option:selected").text().indexOf('KABUPATEN') >= 0)
						row.insertCell(17).appendChild(genServiceHidden(index,val.serviceRegion));
					else
						row.insertCell(17).appendChild(genServiceHidden(index,val.serviceCity));
					
					index++;
				}
			}
		});
		
		if(json.status == 'OK')
		{
			if(index == 0) {
				$dialog.empty();
				$dialog.html('Data referensi tidak ada !!!');
			}
			else
			{
				$dialog.dialog('close');
			}
		}
	});
}

function clearTable()
{
	var tbl = document.getElementById("lineItemTable");
	if(tbl)
	{
		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		if(len > 0)
		{
			for(var idx=len-1;idx>=0;idx--)
			{
				t_section.deleteRow(idx);
			}
		}
	}
}

function genCheck(index,val)
{
	var check = document.createElement("input");
	check.type = "checkbox";
	check.name = "salesId";
	check.id = "check["+index+"]";
	check.setAttribute('onclick', 'pilih('+index+');calculateTransaction()');
	check.value = val;

	return check;
}

function genCheckHidden(index)
{
	var status = document.createElement("input");
	status.type = "hidden";
	status.name = 'cekIdx';
	status.value = index;

	return status;
}

function genCode(index,val)
{
	var code = document.createElement("input");
	code.setAttribute('class',"input-disabled");
	code.disabled = true;
	code.value = val;

	return code;
}

function genCustomer(index,val)
{
	var customer = document.createElement("input");
	customer.setAttribute('class',"input-disabled");
	customer.disabled = true;
	customer.value = val;

	return customer;
}

function genAddress(index,val)
{
	var address = document.createElement("input");
	address.setAttribute('class',"input-disabled inputbox-medium");
	address.disabled = true;
	address.value = val;

	return address;
}

function genTypes(index,val)
{
	var tipe = document.createElement("input");
	tipe.setAttribute('class',"input-disabled");
	tipe.disabled = true;
	tipe.value = val;

	return tipe;
}

function genTypeNames(index,val)
{
	var name = document.createElement("input");
	name.setAttribute('class',"input-disabled");
	name.disabled = true;
	name.value = val;

	return name;
}

function genNotice(index,val)
{
	var notice = document.createElement("input");
	notice.id = "notice["+index+"]";
	notice.setAttribute('class',"input-disabled");
	notice.setAttribute('size',"12");
	notice.disabled = true;
	notice.value = val;

	return notice;
}

function genService(index,val)
{
	var service = document.createElement("input");
	service.id = "service["+index+"]";
	service.setAttribute('class',"input-disabled");
	service.setAttribute('size',"12");
	service.disabled = true;
	service.value = val;

	return service;
}

function genAcc(index)
{
	var acc = document.createElement("input");
	acc.setAttribute('onchange',"calculateTransaction()");
	acc.id = "acc["+index+"]";
	acc.name = "accAmount";
	acc.value = "0";
	acc.disabled = true;
	acc.setAttribute('class',"input-disabled");
	acc.setAttribute('size',"12");
	acc.setAttribute('onkeyup', "separator('acc["+index+"]');");

	return acc;
}

function genStck(index)
{
	var stck = document.createElement("input");
	stck.setAttribute('onchange',"calculateTransaction()");
	stck.id = "stck["+index+"]";
	stck.name = "stckAmounts";
	stck.value = "0";
	stck.disabled = true;
	stck.setAttribute('class',"input-disabled");
	stck.setAttribute('size',"12");
	stck.setAttribute('onkeyup', "separator('stck["+index+"]');");

	return stck;
}

function genSerial(index,val)
{
	var serial = document.createElement("input");
	serial.setAttribute('class',"input-disabled");
	serial.disabled = true;
	serial.value = val;

	return serial;
}

function genSerialExt(index,val)
{
	var serialExt = document.createElement("input");
	serialExt.setAttribute('class',"input-disabled");
	serialExt.disabled = true;
	serialExt.value = val;

	return serialExt;
}

function genYear(index,val)
{
	var year = document.createElement("input");
	year.setAttribute('class',"input-disabled");
	year.setAttribute('size',"5");
	year.disabled = true;
	year.value = val;

	return year;
}

function genOthers1(index)
{
	var other = document.createElement("input");
	other.setAttribute('onchange',"calculateTransaction()");
	other.id = "othersAmt1["+index+"]";
	other.name = "othersAmounts1";
	other.value = "0";
	other.disabled = true;
	other.setAttribute('class',"input-disabled");
	other.setAttribute('size',"12");
	other.setAttribute('onkeyup', "separator('other["+index+"]');");

	return other;
}

function genOthers2(index)
{
	var other = document.createElement("input");
	other.setAttribute('onchange',"calculateTransaction()");
	other.id = "othersAmt2["+index+"]";
	other.name = "othersAmounts2";
	other.value = "0";
	other.disabled = true;
	other.setAttribute('class',"input-disabled");
	other.setAttribute('size',"12");
	other.setAttribute('onkeyup', "separator('other["+index+"]');");

	return other;
}

function genNoticeHidden(index,val)
{
	var notice = document.createElement("input");
	notice.id = "noticeAmount["+index+"]";
	notice.name = "noticeAmount";
	notice.value = val;
	notice.hidden = true;

	return notice;
}

function genServiceHidden(index,val)
{
	var service = document.createElement("input");
	service.id = "serviceAmount["+index+"]";
	service.name = "serviceAmount";
	service.value = val;
	service.hidden = true;

	return service;
}

function pilih(index)
{
	var check = document.getElementById('check['+index+']');
	
	var notice = document.getElementById('noticeAmount['+index+']');
	var jasa = document.getElementById('serviceAmount['+index+']');
	
	if(parseFloat(notice.value) == 0)
	{
		alert('Notice tidak boleh kosong !!!');
		check.checked = false;
		$("#acc\\["+i+"\\]").attr('disabled','true');
		$("#acc\\["+i+"\\]").attr('class','input-disabled');
		$("#other\\["+i+"\\]").attr('disabled','true');
		$("#other\\["+i+"\\]").attr('class','input-disabled');
		return;
	}
	
	if(parseFloat(jasa.value) == 0)
	{
		alert('Jasa tidak boleh kosong !!!');
		check.checked = false;
		$("#acc\\["+i+"\\]").attr('disabled','true');
		$("#acc\\["+i+"\\]").attr('class','input-disabled');
		$("#other\\["+i+"\\]").attr('disabled','true');
		$("#other\\["+i+"\\]").attr('class','input-disabled');
		return;
	}
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
		var i = 0;
		while(i <= len-1)
		{
			var cname=document.getElementById('check['+i+']');
			if(cname)
			{
				var notice = document.getElementById('noticeAmount['+i+']');
				var jasa = document.getElementById('serviceAmount['+i+']');
				
				cname=cname.id;
				cname=cname.replace("[","\\[");
				cname=cname.replace("]","\\]");
				var $chk=$("#"+cname);
				if(checked)
				{
					if(parseFloat(notice.value) == 0 || parseFloat(jasa.value) == 0)
						$chk.removeAttr("checked");
					else
						$chk.attr("checked",true);
				}
				else
					$chk.removeAttr("checked");
			}
			i++;
		}

		/* for(var idx=len-1;idx>=0;idx--){
			var cname="cek\\["+idx+"\\]";
			var $chk=$("#"+cname);
			if(checked)
				$chk.attr("checked",true);
			else
				$chk.removeAttr("checked");
		} */
		calculateTransaction();
	}
	else
	{
		alert('Table doesnot exsist!');
	}
}

function separator(target)
{
	var amount = document.getElementById(target);
	
	if(amount.value != '')
	{
		var minus = "";
		if(amount.value.substring(0,1) == '-')
		{
			minus = "-";
			amount.value = amount.value.replace('-','0');
		}
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,#');
		amount.value = minus+amount.value;
	}
}
</script>
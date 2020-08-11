<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Facility >> Add</title>
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
			<td width="60%">Company Administration > Facility > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title">A03 - Facility</h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/facilityview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="facility_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="67%" valign="top">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="25%" nowrap="nowrap" align="right">Code :</td>
                                          	<td width="75%"><input class="input-disabled inputbox-ext" disabled value="AUTO GENERATED"/></td>
                                        </tr>
                                        <tr>
                                            <td width="25%" nowrap="nowrap" align="right">Name :</td>
                                          <td width="75%"><form:input id='name' path='name' class="inputbox-ext"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Facilty Type :</td>
                                            <td>
                                                <form:select id="facilityType" path="facilityType" class="combobox">
                                                    <c:forEach items='${types}' var='type'>
                                                    <c:if test="${type.name == 'SHOWROOM' or type.name == 'POS HONDA' or type.name == 'WAREHOUSE' or type.name == 'WORKSHOP'}">
                                                        <form:option value='${type.id}' label='${type.name}' />
                                                    </c:if>
                                                    </c:forEach>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Area :</td>
                                          	<td ><form:input id='area' path='area' class="inputbox-ext input-disabled" disabled="true"/></td>
                                        </tr>
                                        <tr>
											<td nowrap="nowrap" align="right">Status Aktif :</td>
											<td>
												<form:radiobutton path='active' id="activeYes" value='true' label='Yes' disabled="true"/>
		                                        <form:radiobutton path='active' id="activeNo" value='false' label='No' disabled="true"/>
											</td>
										</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">POS Code :</td>
                                          	<td ><form:input id='POSCode' path='POSCode' class="inputbox-ext input-disabled" disabled="true"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">PIC POS Honda :</td>
                                          	<td ><form:input id='PICPOSCode' path='PICPOSCode' class="inputbox-ext input-disabled" disabled="true"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Category :</td>
                                            <td>
                                                <form:select id="implementation" path="implementation" class="combobox">
                                                    <form:option value='REAL' label='REAL' />
                                                    <form:option value='VIRTUAL' label='VIRTUAL' />
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
			 							  	<td align="right">No. Telepon PIC :</td>
			 							  	<td>
			 							  		<input id="phoneCode" maxlength="4" size="5" class="input-disabled" disabled/>
			 							  		-
			 							  		<input id="phoneNumber" class="input-disabled" disabled/>
			 							  		<input type="hidden" id="phone" name="PICPhone"/>
			 							  	</td>
			 							</tr>
			 							<tr>
			 							  	<td align="right">No. HP PIC :</td>
			 							  	<td>
			 							  		<input id="mobileCode" maxlength="4" size="5" class="input-disabled" disabled/>
			 							  		-
			 							  		<input id="mobileNumber" class="input-disabled" disabled/>
			 							  		<input type="hidden" id="mobile" name="PICMobile"/>
			 							  	</td>
			 							</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Status :</td>
                                            <td>
                                                <select id="POSStatus" name="POSStatus" class="combobox input-disabled" disabled>
                                                    <option value="PERMANENT">TETAP</option>
													<option value="CONTRACT">KONTRAK</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Facility Owner :</td>
                                            <td>
                                                <form:select id="org" path="owner" cssClass="combobox-ext">
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppartyview.htm?target=org&partyRole=6'/>');" style="CURSOR:pointer;" title="Party Popup" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Nama Pemilik Sertifikat Tanah :</td>
                                          	<td><form:input id='certificateName' path='certificateName' class="inputbox-ext input-disabled" disabled="true"/></td>
                                        </tr>
			 							<tr>
		 									<td align="right">Kontrak :</td>
											<td>
												<input inputId="contractDateFromId" id="contractDateFrom" name="contractDateFrom" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/> -
												<input inputId="contractDateToId" id="contractDateTo" name="contractDateTo" value="<fmt:formatDate value='${now}' pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
											</td>
			 							</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Status Pengelolaan POS Honda :</td>
                                            <td>
                                                <select id="statusManage" name="manageStatus" class="combobox input-disabled" disabled>
                                                    <option value="OWNHOUSE">MILIK DEALER</option>
													<option value="RENT">MILIK ORANG LAIN</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Nama Dealer Terdekat :</td>
                                          	<td ><form:input id='nearDealerName' path='nearDealerName' class="inputbox-ext input-disabled" disabled="true"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Jarak Dengan Dealer Terdekat :</td>
                                          	<td ><form:input id='nearDealerDistance' path='nearDealerDistance' size="34" class="input-disabled" disabled="true"/></td>
                                        </tr>
                                        <tr>
                                            <td align="right">Address Type :</td>
                                            <td>
                                                <c:forEach items='${facility_add.postalAddress.addressTypes}' var='type' varStatus='status'>
                                                    <form:checkbox path="postalAddress.addressTypes[${status.index}].enabled" value="true" label="${type.type}"/>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
			 							  	<td nowrap="nowrap" align="right">Alamat :</td>
			 							  	<td><input id="address" name="postalAddress.address" class="inputbox-ext"/></td>
			 							</tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Provinsi :</td>
			 							  	<td>
			 							  		<select name="postalAddress.province" id="province" onchange="javascript:getcity('province')" class="combobox-medium">
			 							  			<option id="province" value="0">--Provinsi--</option>
			 							  			<c:forEach items="${provinces}" var="prov">
			 							  				<option value="${prov.id}">${prov.name}</option>
			 							  			</c:forEach>
			 							  		</select>
			 							  	</td>
			 							</tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Kota/Kabupaten :</td>
			 							  	<td><select id="city" name="postalAddress.city" id='city' onchange="javascript:checkavailableregion('city')" class="combobox-medium"><option value="0">--Kabupaten--</option></select></td>
			 							</tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Wilayah Samsat :</td>
			 							  	<td><select id='region' onchange="javascript:getsubdistrict('region')" class="combobox-medium"><option value="0">--Wilayah Samsat--</option></select></td>
			 							</tr>
			 							<!-- <tr>
			 							  	<td align="right">Wilayah Samsat :</td>
			 							  	<td><input name="postalAddress.region" size="34"/></td>
			 							</tr> -->
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Kecamatan :</td>
			 							  	<td><select name="postalAddress.subdistrict" id='subdistrict' class="combobox-medium"><option value="0">--Kecamatan--</option></select></td>
			 							</tr>
			 							<tr>
			 							  	<td nowrap="nowrap" align="right">Kelurahan :</td>
			 							  	<td><input name="postalAddress.village" size="34"/></td>
			 							</tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="41" rows="6"/></td>
                                        </tr>
                                    </table>
                                    </td>
                                </tr>
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
			$("<option></option>").	text(val.name).val(val.id).appendTo("#city");
		});
	});
}

function checkavailableregion(target) {
	$.get("<c:url value='/page/geographicsremote.checkavailableregion.json'/>",{id:$("#"+target).val()},function(json){
		$("#region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#region");
		$("#subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#subdistrict");
		if(json.available)
			getregion(target);
		else
			getsubdistrict(target);
	});
}

function getregion(target){
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#"+target).val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#region");
		});
	});
}

function getsubdistrict(target){
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#"+target).val()},function(json){
		$("#subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#subdistrict");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.id).appendTo("#subdistrict");
		});
	});
}

function validation()
{
	if(!$('#name').val())
    {
        alert('Name cannot be empty!');
        return;
    }
	
	if($("#facilityType").val() == '2')
	{
		if($("#phoneCode").val() != '')
		{
			if($("#phoneCode").val().length < 3 || $("#phoneCode").val().length > 4)
			{
				alert('Kode Area minimal 3 digit dan maksimal 4 digit !!!');
				return;
			}
		}
		else
		{
			if($("#phoneNumber").val() != '01234')
			{
				alert('Phone Number cannot be empty, please at least input 01234 !!!');
				return;
			}
		}

		if($("#phoneNumber").val() != '')
		{
			if($("#phoneNumber").val().length < 5)
			{
				alert('Phone Number cannot less than 5 characters !!!');
				return;
			}
		}
		else
		{
			alert('Phone Number cannot be empty, please at least input 01234 !!!');
			return;
		}

		if($("#mobileCode").val() != '')
		{
			if($("#mobileCode").val().length < 3 || $("#mobileCode").val().length > 4)
			{
				alert('Kode Operator minimal 3 digit dan maksimal 4 digit !!!');
				return;
			}
		}
		else
		{
			if($("#mobileNumber").val() != '01234')
			{
				alert('Mobile Number cannot be empty, please at least input 01234 !!!');
				return;
			}
		}

		if($("#mobileNumber").val() != '')
		{
			if($("#mobileNumber").val().length < 5)
			{
				alert('Mobile Number cannot less than 5 characters !!!');
				return;
			}
		}
		else
		{
			alert('Mobile Number cannot be empty, please at least input 01234 !!!');
			return;
		}
	}
    
    if(!$("#org").val())
   	{
    	alert('Please select Facility Owner first !!!');
    	return;
   	}

	if(!$('#address').val())
    {
        alert('Address cannot be empty!');
        return;
    }
    
    if($("#province").val() == '0')
   	{
    	alert('Mohon pilih Provinsi terlebih dahulu !!!');
    	return;
   	}
    
    if($("#city").val() == '0')
   	{
    	alert('Mohon pilih Kota/Kabupaten terlebih dahulu !!!');
    	return;
   	}
    
    if($("#subdistrict").val() == '0')
   	{
    	alert('Mohon pilih Kecamatan terlebih dahulu !!!');
    	return;
   	}
    
    return true;
}

$(function(){
    var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Facility',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

    $('.item-button-save').click(function(){

        if(validation())
		{
	        $.ajax({
	            url:"<c:url value='/page/facilityadd.htm'/>",
	            data:$('#addForm').serialize(),
	            method : 'POST',
	            dataType : 'json',
	            beforeSend:function()
	            {
	                $dialog.empty();
	                $dialog.html('Saving Facility data......');
	                $dialog.dialog('open');
	            },
	            success : function(json) {
	                if(json)
	                {
	                    if(json.status == 'OK')
	                    {
	                        $dialog.dialog('close');
	                        window.location="<c:url value='/page/facilityview.htm'/>";
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

    $("#facilityType").change(function()
	{
		if($("#facilityType").val() == '2')
		{
			$("#area").removeAttr('disabled');
			$("#area").attr('class','inputbox-ext');
			$("#activeYes").removeAttr('disabled');
			$("#activeNo").removeAttr('disabled');
			$("#POSCode").removeAttr('disabled');
			$("#POSCode").attr('class','inputbox-ext');
			$("#PICPOSCode").removeAttr('disabled');
			$("#PICPOSCode").attr('class','inputbox-ext');
			$("#phoneCode").removeAttr('disabled');
			$("#phoneCode").attr('class','');
			$("#phoneNumber").removeAttr('disabled');
			$("#phoneNumber").attr('class','');
			$("#mobileCode").removeAttr('disabled');
			$("#mobileCode").attr('class','');
			$("#mobileNumber").removeAttr('disabled');
			$("#mobileNumber").attr('class','');
			$("#POSStatus").removeAttr('disabled');
			$("#POSStatus").attr('class','combobox');
			$("#certificateName").removeAttr('disabled');
			$("#certificateName").attr('class','inputbox-ext');
			$("#contractDateFromId").removeAttr('disabled');
			$("#contractDateToId").removeAttr('disabled');
			$("#statusManage").removeAttr('disabled');
			$("#statusManage").attr('class','combobox');
			$("#nearDealerName").removeAttr('disabled');
			$("#nearDealerName").attr('class','inputbox-ext');
			$("#nearDealerDistance").attr('class','');
			$("#nearDealerDistance").removeAttr('disabled');
		}
		else
		{
			$("#area").attr('disabled', 'true');
			$("#area").attr('class','inputbox-ext input-disabled');
			$("#activeYes").attr('disabled', 'true');
			$("#activeNo").attr('disabled', 'true');
			$("#POSCode").attr('disabled', 'true');
			$("#POSCode").attr('class','inputbox-ext input-disabled');
			$("#PICPOSCode").attr('disabled', 'true');
			$("#PICPOSCode").attr('class','inputbox-ext input-disabled');
			$("#phoneCode").attr('disabled', 'true');
			$("#phoneCode").attr('class','input-disabled');
			$("#phoneNumber").attr('disabled', 'true');
			$("#phoneNumber").attr('class','input-disabled');
			$("#mobileCode").attr('disabled', 'true');
			$("#mobileCode").attr('class','input-disabled');
			$("#mobileNumber").attr('disabled', 'true');
			$("#mobileNumber").attr('class','input-disabled');
			$("#POSStatus").attr('disabled', 'true');
			$("#POSStatus").attr('class','combobox input-disabled');
			$("#certificateName").attr('disabled', 'true');
			$("#certificateName").attr('class','inputbox-ext input-disabled');
			document.getElementById('contractDateFromId').setAttribute('disabled', 'true');
			document.getElementById('contractDateToId').setAttribute('disabled', 'true');
			/* $("#contractDateFromId").attr('disabled', 'true');
			$("#contractDateToId").attr('disabled', 'true'); */
			$("#statusManage").attr('disabled', 'true');
			$("#statusManage").attr('class','combobox input-disabled');
			$("#nearDealerName").attr('disabled', 'true');
			$("#nearDealerName").attr('class','inputbox-ext input-disabled');
			$("#nearDealerDistance").attr('class','input-disabled');
			$("#nearDealerDistance").attr('disabled', 'true');
		}
	});
    
    $("#phoneCode").keydown(function(event)
	{
    	numberOnly(event);
    }).keyup(function(event)
	{
        limit();
    }).change(function()
	{
    	var phoneCode = ''+$("#phoneCode").val();
    	var phoneNumber = ''+$("#phoneNumber").val();
    	$("#phone").val(phoneCode+phoneNumber);
	});

	$("#phoneNumber").keydown(function(event)
	{
        numberOnly(event);
    }).change(function()
	{
    	var phoneCode = ''+$("#phoneCode").val();
    	var phoneNumber = ''+$("#phoneNumber").val();
    	$("#phone").val(phoneCode+phoneNumber);
	});

	$("#mobileCode").keydown(function(event)
	{
        numberOnly(event);
    }).keyup(function(event)
	{
        limit();
    }).change(function()
	{
    	var mobileCode = ''+$("#mobileCode").val();
    	var mobileNumber = ''+$("#mobileNumber").val();
    	$("#mobile").val(mobileCode+mobileNumber);
	});

	$("#mobileNumber").keydown(function(event)
	{
        numberOnly(event);
    }).change(function()
	{
    	var mobileCode = ''+$("#mobileCode").val();
    	var mobileNumber = ''+$("#mobileNumber").val();
    	$("#mobile").val(mobileCode+mobileNumber);
	});
});

function numberOnly(event)
{
	if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 ))
	{
	    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || (event.keyCode >= 37 && event.keyCode <= 40))
	    {
	    }
	    else
	   	{
	    	event.preventDefault();
	   	}
	}
}

function limit()
{
	var limit = parseInt($(this).attr('maxlength'));
    var text = $(this).val();
    var chars = text.length;

    if(chars > limit){
        var new_text = text.substr(0, limit);
        $(this).val(new_text);
    }
}
</script>
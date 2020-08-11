<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<html>
<head>
	<title>${title}</title>
</head>
<body>
<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>
<div id="se-containers">
	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
					  	<div class="toolbar">
							<a class="item-button-cancel b_cancel_customer_popup" style="cursor:pointer;"><span><spring:message code="cancel"/></span></a>
							<a class="item-button-save b_save_customer_popup" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="formCustomer" name="formCustomer" method="post" modelAttribute="customer_add" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
                                <tr>
 									<td width="34%" align="right">Party Type</td>
                                    <td width="1%" align="center">:</td>
							  		<td width="64%">
			  					  		<select id="partyType" name="type" class="combobox-ext">
											<option value="personal">PERSON/PERSONAL</option>
											<option value="group">ORGANIZATION/GROUPS</option>
										</select>
									</td>
							  	  	<td width="1%">&nbsp;</td>
 								</tr>
 								<tr>
                                    <td nowrap="nowrap" align="right">Organisasi</td>
                                    <td align="right">:</td>
                                    <td>
                                        <form:select path="organization" id="org2" class="combobox-ext">
                                        	<c:if test='${not empty customer_add.organization}'>
                                               	<form:option value='${customer_add.organization.id}' label='${customer_add.organization.firstName} ${customer_add.organization.middleName} ${customer_add.organization.lastName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org2'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
 								<tr>
 									<td align="right">Customer Type Unit</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="partyClassification" path="classifications[0].type" class="combobox-medium">
			  					  			<c:forEach items="${classificationTypes}" var="type">
			  					  			<c:if test="${type.name != 'Group Customer' and type.id < 19}">
			  					  				<form:option value="${type.id}" label='${type.name}'/>
		  					  				</c:if>
			  					  			</c:forEach>
										</form:select>
									</td>
							  	  	<td width="1%">&nbsp;</td>
 								</tr>
 								<tr>
 									<td align="right">Customer Type Sparepart</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="partyClassification" path="classifications[1].type" class="combobox-medium">
			  					  			<c:forEach items="${classificationTypes}" var="type">
			  					  			<c:if test="${type.id >= 19}">
			  					  				<form:option value="${type.id}" label='${type.name}'/>
		  					  				</c:if>
			  					  			</c:forEach>
										</form:select>
									</td>
							  	  	<td width="1%">&nbsp;</td>
 								</tr>
 								<tr>
 									<td align="right">Discount Rate</td>
                                    <td width="1%" align="center">:</td>
									<td><input name="discountRate" value="0"/></td>
									<td><form:errors path="discountRate"/></td>
 								</tr>
 								<tr>
 									<td align="right">Salutasi</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="salutation"  /></td>
									<td><form:errors path="salutation"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Name Pelanggan</td>
                                    <td width="1%" align="center">:</td>
									<td>
										<form:input cssClass='check_field' id='firstName' path="firstName" size='15'/>
										<form:input cssClass='check_field' id='middleName' path="middleName" size='15'/>
										<form:input cssClass='check_field' id='lastName' path="lastName" size='15'/>
									</td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Wilayah Berikat</td>
	 							  	<td align="center">:</td>
	 							  	<td>
										<form:radiobutton path='regional' value='true' label='Yes'/>
                                        <form:radiobutton path='regional' value='false' label='No' checked="checked"/>
									</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
 									<td align="right">Pelanggan Sejak</td>
                                    <td width="1%" align="center">:</td>
									<td><input inputId="dateFromId" id="dateFrom" class="datepicker" name="partyRoles[0].fromDate" value="<fmt:formatDate value='${now}' pattern='dd-MM-yyyy'/>"/></td>
									<td>&nbsp;</td>
	 							</tr>
                                <%-- <tr>
 									<td align="right">NPWP</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="taxCode" path="taxCode" /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr> --%>
	 							<tr>
	 							  	<td align="right">No. KK</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="familyCard" path="familyCard" class="input-number-noformat" maxlength="16"/></td>
	 							  	<td><form:errors path="familyCard"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">KTP/KITAS</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="nppkp" path="nppkp" class="input-number-noformat" maxlength="16"/></td>
	 							  	<td><form:errors path="nppkp"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">NPWP</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="taxCode" path="taxCode"/></td>
	 							  	<td><form:errors path="taxCode"/></td>
	 							</tr>
	 							<%-- <tr>
 									<td align="right">Other Code</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="otherCode" path="otherCode" /></td>
									<td><form:errors path="otherCode"/></td>
	 							</tr> --%>
	 							<!-- <tr>
 									<td align="right">Customer PKP Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="pkpDate" name="pkpDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr> -->
	 							<tr>
 									<td align="right">Tanggal Lahir</td>
                                    <td width="1%" align="center">:</td>
									<td><input inputId="birthDateId" id="birthDate" class="datepicker" name="dateOfBirth"/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Gender</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="genderMan" name="gender" type='radio' value='MALE' checked/>Laki-laki&nbsp;<input id="genderWoman" name="gender" type='radio' value='FEMALE'/>Perempuan</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
 									<td align="right">Agama</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<select id="religion" name="religion" class="combobox">
			  					  		<c:forEach items="${religions}" var="rel">
											<option value="${rel.id}">${rel.name}</option>
										</c:forEach>
										</select>
									</td>
							  	  	<td></td>
 								</tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td><input type="file" name="file"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<%-- <tr>
                                    <td nowrap="nowrap" align="right">Salesman</td>
                                    <td align="right">:</td>
                                    <td>
                                        <select name="salesman" id="salesman" class="combobox-ext">
                                        	<option></option>
                                        </select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=salesman'/>');" style="CURSOR:pointer;" title="Salesman" />
                                    </td>
                                </tr> --%>
                                <tr>
                                	<td nowrap="nowrap" align="right">Status</td>
 									<td align="right">:</td>
									<td><input type="checkbox" name="active" ${(customer_add.active)?"checked":""}/>Active&nbsp;<input type="checkbox" name="blacklist" ${(customer_add.blacklist)?"checked":""}/>Blacklist</td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Alamat</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="address" name="postalAddresses[0].address" size="58"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Provinsi</td>
	 							  	<td align="center">:</td>
	 							  	<td>
	 							  		<select name="postalAddresses[0].province" id="province" onchange="javascript:getcity('province')" class="combobox-medium">
	 							  			<option id="province" value="0">--Provinsi--</option>
	 							  			<c:forEach items="${provinces}" var="prov">
	 							  				<option value="${prov.id}">${prov.name}</option>
	 							  			</c:forEach>
	 							  		</select>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kota/Kabupaten</td>
	 							  	<td align="center">:</td>
	 							  	<td><select id="city" name="postalAddresses[0].city" onchange="javascript:checkavailableregion('city')" class="combobox-medium"><option value="0">--Kabupaten--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Wilayah Samsat</td>
	 							  	<td align="center">:</td>
	 							  	<td><select id='region' onchange="javascript:getsubdistrict('region')" class="combobox-medium"><option value="0">--Wilayah Samsat--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<!-- <tr>
	 							  	<td align="right">Wilayah Samsat</td>
	 							  	<td>:&nbsp;</td>
	 							  	<td><input name="postalAddresses[0].region" size="34"/></td>
	 							  	<td></td>
	 							</tr> -->
	 							<tr>
	 							  	<td align="right">Kecamatan</td>
	 							  	<td align="center">:</td>
	 							  	<td><select id='subdistrict' name="postalAddresses[0].subdistrict" onchange="javascript:getvillage('subdistrict')" class="combobox-medium"><option value="0">--Kecamatan--</option></select></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kelurahan</td>
	 							  	<td align="center">:</td>
	 							  	<td><select id='villageOption' onchange="javascript:setvillage('villageOption')" class="combobox-medium"><option value="">--Desa/Kelurahan--</option></select> <input id="villageCode" name="postalAddresses[0].villageCode" style="visibility: hidden;"/><input id="village" name="postalAddresses[0].village" style="visibility: hidden;"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kodepos</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="postalCode" maxlength="5" name="postalAddresses[0].postalCode"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Telepon</td>
	 							  	<td align="center">:</td>
	 							  	<td>
	 							  		<input id="phoneCode" maxlength="4" size="5"/>
	 							  		-
	 							  		<input id="phoneNumber"/>
	 							  		<input type="hidden" id="phone" name="phone"/>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Handphone</td>
	 							  	<td align="center">:</td>
	 							  	<td>
	 							  		<input id="mobileCode" maxlength="4" size="5"/>
	 							  		-
	 							  		<input id="mobileNumber"/>
	 							  		<input type="hidden" id="mobile" name="mobile"/>
	 							  	</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Email</td>
	 							  	<td align="center">:</td>
	 							  	<td><input name="email" class="inputbox-ext"/></td>
	 							  	<td></td>
	 							</tr>
 								<tr>
 									<td align="right">Note</td>
                                    <td width="1%" align="center">:</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
									<td>&nbsp;</td>
 								</tr>
 								</table>
 							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
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
		$("#region option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#region");
		$("#subdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#subdistrict");
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

function getvillage(target){
	$.get("<c:url value='/page/geographicsremote.getvillage.json'/>",{id:$("#"+target).val()},function(json){
		$("#villageOption option").remove();
		$("<option></option>").	text("--Desa/Kelurahan--").val("").appendTo("#villageOption");
		$.each(json.items,function(idx,val){
			$("<option></option>").	text(val.name).val(val.name).appendTo("#villageOption");
		});
	});
}

function setvillage(target){
	$("#villageCode").val($("#"+target).val());
	$("#village").val($("#"+target+" option:selected").text());
}

function validationPopup()
{
	if($("#org2").val() == null || $("#org2").val() == '')
	{
		alert('Please select Organization first !!!');
		return;
	}

	if($("#firstName").val() == '')
	{
		alert('First Name cannot be empty !!!');
		return;
	}

	if($("#dateFromId").val() == '')
	{
		alert('Date From cannot be empty !!!');
		return;
	}

	/*if($("#taxCode").val().indexOf('914') != 0)
	{
		if($("#taxCode").val().length < 10)
		{
			alert('NPWP kurang dari 10 karakter, mohon tambahkan 914 didepan !!!');
			return;
		}
	}*/

	if($("#nppkp").val().indexOf('914') != 0)
	{
		if($("#nppkp").val().length < 10)
		{
			alert('KTP/SIM harus 10 karakter, mohon tambahkan 914 didepan !!!');
			return;
		}
	}

	if($("#birthDateId").val() == '')
	{
		alert('Birth Date cannot be empty !!!');
		return;
	}

	if($("#address").val() == '')
	{
		alert('Address cannot be empty !!!');
		return;
	}

	if($("#province").val() == 0)
	{
		alert('Please select Province first !!!');
		return;
	}

	if($("#city").val() == 0)
	{
		alert('Please select City first !!!');
		return;
	}

	if($("#subdistrict").val() == 0)
	{
		alert('Please select Subdistrict first !!!');
		return;
	}

	if($("#postalCode").val() != '')
	{
		if($("#postalCode").val().length != 5)
		{
			alert('Kode Pos harus 5 karakter !!!');
			return;
		}
	}
	else
	{
		alert('Postal Code cannot be empty !!!');
		return;
	}

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

	return true;
}

$(function()
{
	//Bugs on init.jsp if included
	$(".datepicker").datepicker({
		showOn: "button",
		buttonImage: "assets/icons/calendar.png",
		buttonImageOnly:true,
		dateFormat: 'dd-mm-yy'
	});

	$('.b_cancel_customer_popup').click(function(){
		closepopup("${param.popupid}");
	});
	$('.b_save_customer_popup').click(function()
	{
		if(validationPopup())
		{
			$.ajax({
				url:"<c:url value='/page/customeradd.htm'/>",
				data:$('#formCustomer').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Customer data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							closepopup("${param.popupid}");
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

	$("#partyType").change(function()
  	{
		$("#partyClassification option").remove();
		if($("#partyType").val() == 'personal')
		{
			<c:forEach items="${classificationTypes}" var="type">
			<c:if test="${type.name != 'Group Customer'}">
				$("<option></option>").	text("${type.name}").val("${type.id}").appendTo("#partyClassification");
			</c:if>
			</c:forEach>
		}
		else
		{
			<c:forEach items="${classificationTypes}" var="type">
			<c:if test="${type.name == 'Group Customer'}">
				$("<option></option>").	text("${type.name}").val("${type.id}").appendTo("#partyClassification");
			</c:if>
			</c:forEach>
		}
  	});

	$("#postalCode").keydown(function(event)
	{
        numberOnly(event);
    }).keyup(function(event)
	{
        limit();
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
</body>
</html>
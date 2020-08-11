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
    <%@ include file="/common/sirius-header.jsp"%>
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
							<a class="item-button-list" href="<c:url value='/page/salesmanview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
					  	</div>
						<div class="main-box">
							<form:form cssClass="ajax-form" id="addForm" name="addForm" method="post" modelAttribute="salesman_add" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Salesman Type</td>
                                    <td width="1%" align="center">:</td>
							  		<td width="64%">
			  					  		<form:select path="type" class="combobox-medium">
											<form:option value="personal" label='PERSON/PERSONAL'/>
											<%-- <form:option value="group" label='ORGANIZATION/GROUPS'/> --%>
										</form:select>
									</td>
							  	  	<td width="1%">&nbsp;</td>
 								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Organization</td>
                                    <td>:</td>
                                    <td>
                                        <form:select path="organization" id="org" class="combobox-ext">
                                        	<c:if test='${not empty salesman_add.organization}'>
                                               	<form:option value='${salesman_add.organization.id}' label='${salesman_add.organization.name}' />
                                            </c:if>
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                    </td>
                                </tr>
 								<tr>
 									<td align="right">Salesman Code</td>
                                    <td width="1%" align="center">:</td>
									<td><input value="Auto Number" disabled class="input-disabled"/></td>
									<td><form:errors path="code"/></td>
 								</tr>
 								<tr>
 									<td align="right">Registration No</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="registrationNo" path="personInformation.registrationNo" value=""/></td>
									<td>&nbsp;</td>
 								</tr>
	 							<tr>
 									<td align="right">Registration Date</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input inputId="regDateId" id="regDate" path="personInformation.registrationDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
	 							<tr>
 									<td align="right">Non Active Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input inputId="nonDateId" id="nonDate" name="personInformation.nonActiveDate" value="" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
 									<td align="right">Membership No</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id="membershipNo" path="personInformation.membershipNo" value=""/></td>
									<td>&nbsp;</td>
 								</tr>
	 							<tr>
 									<td align="right">Membership Date</td>
                                    <td width="1%" align="center">:</td>
									<td><input inputId="memberDateId" id="memberDate" name="personInformation.membershipDate" value="" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
                                <tr>
 									<td align="right">Salutation</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="salutation" size="5"/></td>
									<td><form:errors path="salutation"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Salesman Name</td>
                                    <td width="1%" align="center">:</td>
									<td>
										<form:input id='firstName' path="firstName" size='20'/>
										<form:input id='middleName' path="middleName" size='14'/>
										<form:input id='lastName' path="lastName" size='15'/>
									</td>
									<td><form:errors path="firstName"/></td>
	 							</tr>
                                <tr>
 									<td align="right">NPWP</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="taxCode"  /></td>
									<td><form:errors path="taxCode"/></td>
	 							</tr>
                                <%-- <tr>
 									<td align="right">Legend</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input path="legend" size='30'/></td>
									<td><form:errors path="legend"/></td>
	 							</tr> --%>
	 							<tr>
	 							  	<td align="right">No. KTP</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input path="nppkp"  /></td>
	 							  	<td><form:errors path="nppkp"/></td>
	 							</tr>
	 							<tr>
 									<td align="right">Date of Birth</td>
                                    <td width="1%" align="center">:</td>
									<td><input inputId="birthDateId" id="birthDate" name="dateOfBirth" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
									<td>&nbsp;</td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Place of Birth</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="birthPlace" path="placeOfBirth" size="62"/></td>
	 							  	<td></td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Gender</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="genderMan" path="personInformation.gender" type='radio' value='MALE' checked="true"/>Laki-laki&nbsp;<form:input id="genderWoman" path="personInformation.gender" type='radio' value='FEMALE'/>Perempuan</td>
	 							  	<td></td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Alamat</td>
	 							  	<td align="center">:</td>
	 							  	<td><input id="address" name="postalAddresses[0].address" size="62"/></td>
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
	 							  	<td><select id="city" name="postalAddresses[0].city" id='city' onchange="javascript:checkavailableregion('city')" class="combobox-medium"><option value="0">--Kabupaten--</option></select></td>
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
	 							  	<td><input id="postalCode" maxlength="5" size="5" name="postalAddresses[0].postalCode"/></td>
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
	 							  	<td><input name="email" size="62"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
 									<td align="right">Status</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="salesmanStatus" path="personInformation.salesmanStatus" class="combobox">
											<form:option value="PERMANENT" label="TETAP"/>
											<form:option value="CONTRACT" label="KONTRAK"/>
										</form:select>
									</td>
							  	  	<td></td>
 								</tr>
	 							<tr>
	 							  	<td align="right">Posisi</td>
	 							  	<td align="center">:</td>
	 							  	<td>
			  					  		<form:select id="posisi" path="personInformation.position" class="combobox">
											<form:option value="SALESSUPERVISOR" label="SALES SUPERVISOR"/>
											<form:option value="COORDINATOR" label="COORDINATOR"/>
											<form:option value="PIC" label="PIC"/>
											<form:option value="MARKETING" label="MARKETING"/>
											<form:option value="COUNTER" label="COUNTER"/>
											<form:option value="ADMIN" label="ADMIN"/>
											<form:option value="CHANNEL" label="CHANNEL"/>
											<form:option value="SALESAGENT" label="AGEN SALES"/>
											<form:option value="AGENT" label="AGEN"/>
										</form:select>
									</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Jabatan</td>
	 							  	<td align="center">:</td>
	 							  	<td>
			  					  		<form:select id="jabatan" path="personInformation.subPosition" class="combobox">
			  					  			<form:option value="" label=""/>
										</form:select>
									</td>
	 							  	<td></td>
	 							</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Atasan</td>
                                    <td>:</td>
                                    <td>
                                        <form:select path="personInformation.supervisor" id="supervisor" class="combobox-ext">
                                        	<c:if test='${not empty personInformation.supervisor}'>
                                               	<form:option value='${personInformation.supervisor.id}' label='${personInformation.supervisor.name}' />
                                            </c:if>
                                        </form:select>
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=supervisor&supervisor=true'/>');" style="CURSOR:pointer;" title="Supervisor & Coordinator" />
                                    </td>
                                </tr>
	 							<tr>
 									<td align="right">Agama</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="religion" path="personInformation.religion" class="combobox">
			  					  		<c:forEach items="${religions}" var="rel">
											<form:option value="${rel.id}" label="${rel.name}"/>
										</c:forEach>
										</form:select>
									</td>
							  	  	<td></td>
 								</tr>
	 							<tr>
 									<td align="right">Pendidikan Tingkat</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="educationLevel" path="personInformation.educationLevel" class="combobox-medium">
			  					  		<c:forEach items="${educationLevels}" var="education">
				  					  		<c:if test="${education == 'UNIVERSITY'}">
												<form:option value="${education}" label="UNIVERSITAS/SARJANA"/>
											</c:if>
				  					  		<c:if test="${education == 'COLLEGE'}">
												<form:option value="${education}" label="AKADEMI/DIPLOMA"/>
											</c:if>
				  					  		<c:if test="${education == 'SCHOOL'}">
												<form:option value="${education}" label="SLTA/SMA/SMU/SMK"/>
											</c:if>
										</c:forEach>
										</form:select>
									</td>
							  	  	<td></td>
 								</tr>
	 							<tr>
	 							  	<td align="right">Nama Sekolah</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="educationName" path="personInformation.educationName" size="62"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Fakultas/Jurusan</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="track" path="personInformation.educationMajor" class="inputbox-medium"/></td>
	 							  	<td></td>
	 							</tr>
 								<tr>
	 							  	<td align="right">Status Nikah</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input path="personInformation.maritalStatus" type='radio' value='SINGLE' checked="true"/>Nikah&nbsp;<form:input path="personInformation.maritalStatus" type='radio' value='MARRIED'/>Belum Nikah</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Jumlah Anak</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="childs" path="personInformation.childs" size="5"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Status Rumah</td>
	 							  	<td align="center">:</td>
	 							  	<td>
			  					  		<form:select id="homeStatus" path="personInformation.homeStatus" class="combobox">
			  					  		<c:forEach items="${homeStatus}" var="home">
				  					  		<c:if test="${home == 'RENT'}">
												<form:option value="${home}" label="SEWA"/>
											</c:if>
				  					  		<c:if test="${home == 'PARENTHOUSE'}">
												<form:option value="${home}" label="RUMAH ORANG TUA"/>
											</c:if>
				  					  		<c:if test="${home == 'OWNHOUSE'}">
												<form:option value="${home}" label="RUMAH SENDIRI"/>
											</c:if>
										</c:forEach>
										</form:select>
									</td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Lama Rumah</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="longStay" path="personInformation.longStay" size="5"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Kode Dealer</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="dealerCode" path="personInformation.dealerCode"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">No Registrasi Atasan</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="superiorCode" path="personInformation.superiorCode"/></td>
	 							  	<td></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">Jumlah Bawahan</td>
	 							  	<td align="center">:</td>
	 							  	<td><form:input id="subordinate" path="personInformation.subordinate" size="5"/></td>
	 							  	<td></td>
	 							</tr>
	 							<%-- <tr>
 									<td align="right">Jabatan</td>
                                    <td align="center">:</td>
							  		<td>
			  					  		<form:select id="position" path="personInformation.position" class="combobox">
											<form:option value="SALESMAN" label="SALESMAN"/>
										</form:select>
									</td>
							  	  	<td></td>
 								</tr> --%>
	 							<tr>
 									<td align="right">Status Membership</td>
                                    <td align="center">:</td>
							  		<td><form:input id="subordinate" path="personInformation.membershipStatus" class="inputbox-medium"/></td>
							  	  	<td></td>
 								</tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td><input type="file" name="file"/></td>
									<td>&nbsp;</td>
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
</body>
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
			$("<option></option>").	text(val.name).val(val.code).appendTo("#villageOption");
		});
	});
}

function setvillage(target){
	$("#villageCode").val($("#"+target).val());
	$("#village").val($("#"+target+" option:selected").text());
}

function validation()
{
	if($("#org").val() == null || $("#org").val() == '')
	{
		alert('Please select Organization first !!!');
		return;
	}

	if($("#firstName").val() == '')
	{
		alert('First Name cannot be empty !!!');
		return;
	}

	if($("#taxCode").val().indexOf('914') != 0)
	{
		if($("#taxCode").val().length < 10)
		{
			alert('NPWP kurang dari 10 karakter, mohon tambahkan 914 didepan !!!');
			return;
		}
	}

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
			alert('Please input 01234 in Phone Number field !!!');
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
	$('.item-button-save').click(function(){
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/salesmanadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'post',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Salesman data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/salesmanview.htm'/>";
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
	
	$("#posisi").change(function()
	{
		$("#jabatan option").remove();
		$("<option></option>").text("").val("").appendTo("#jabatan");
		
		if($("#posisi").val() == 'MARKETING')
		{
			$("<option></option>").text("SALES TRAINING").val("SALESTRAINING").appendTo("#jabatan");
			$("<option></option>").text("SALES JUNIOR").val("SALESJUNIOR").appendTo("#jabatan");
			$("<option></option>").text("SALES SENIOR").val("SALESSENIOR").appendTo("#jabatan");
		}
		else if($("#posisi").val() == 'COUNTER')
		{
			$("<option></option>").text("COUNTER SENIOR").val("COUNTERSENIOR").appendTo("#jabatan");
			$("<option></option>").text("COUNTER JUNIOR").val("COUNTERJUNIOR").appendTo("#jabatan");
		}
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
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
    <%@ include file="/common/sirius-header.jsp"%>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function updateSalesman()
		{
			document.addForm.submit();
		}
	</script>
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
							<a class="item-button-list" href="<c:url value='/page/salesmanview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-save"><span><spring:message code="save"/></span></a>
					  	</div>

                        <div class="main-box">
                        <form:form id="form" name="form" method="post" modelAttribute="salesman_edit">
                            <table width="100%" style="border:none">
                            <tr>
                                <td width="20%" align="right">ID :</td>
                                <td width="80%"><input type="text" value="${salesman_edit.code}" class="input-disabled" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Organization :</td>
                                <td><input type="text" value="${salesman_edit.organization.name}" size="50" disabled/></td>
                            </tr>
							<tr>
								<td align="right">Registration No :</td>
                                <td><input name="personInformation.registrationNo" value="${salesman_edit.personInformation.registrationNo}"/></td>
							</tr>
                            <tr>
                                <td align="right">Registration Date :</td>
                                <td><input name="personInformation.registrationDate" value="${salesman_edit.personInformation.registrationDate}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                            </tr>
                            <tr>
                                <td align="right">Non Active Date :</td>
                                <td>
	                                <c:if test="${not empty salesman_edit.personInformation.nonActiveDate}">
	                                	<input disabled value="<fmt:formatDate value='${salesman_edit.personInformation.nonActiveDate}' pattern='dd-MM-yyyy'/>"/>
	                                </c:if>
	                                <c:if test="${empty salesman_edit.personInformation.nonActiveDate}">
	                                	<input inputId="nonDateId" id="nonDate" name="personInformation.nonActiveDate" value="${salesman_edit.personInformation.nonActiveDate}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/>
	                                </c:if>
                                </td>
                            </tr>
							<tr>
								<td align="right">Membership No :</td>
                                <td><input name="personInformation.membershipNo" value="${salesman_edit.personInformation.membershipNo}"/></td>
							</tr>
                            <tr>
                                <td align="right">Membership Date :</td>
                                <td><input name="personInformation.membershipDate" value="${salesman_edit.personInformation.membershipDate}" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                            </tr>
                            <tr>
                                <td align="right">Salutation :</td>
                                <td><input type="text" value="${salesman_edit.salutation}" size="5" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Salesman Name :</td>
                                <td><input type="text" value="${salesman_edit.name}" size="50" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">NPWP :</td>
                                <td><input type="text" value="${salesman_edit.taxCode}" class="inputbox" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">No. KTP :</td>
                                <td><input type="text" value="${salesman_edit.nppkp}" class="inputbox" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Date Of Birth :</td>
                                <td><input inputId="birthDateId" id="birthDate" name="dateOfBirth" value='${salesman_edit.dateOfBirth}' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                            </tr>
                            <tr>
                                <td align="right">Place Of Birth :</td>
                                <td><input type="text" value="${salesman_edit.placeOfBirth}" class="inputbox" disabled/></td>
                            </tr>
                            <tr>
                                <td align="right">Gender :</td>
                                <td><input name="gender" type='radio' ${salesman_edit.personInformation.gender == 'MALE' ? 'checked':''}/>Laki-laki&nbsp;<input name="gender" type='radio' ${salesman_edit.personInformation.gender == 'FEMALE' ? 'checked':''}/>Perempuan</td>
                            </tr>
                            <tr>
                                <td align="right">Status :</td>
                                <td><input disabled value="${salesman_edit.personInformation.salesmanStatus == 'CONTRACT'?'KONTRAK':'TETAP'}"/></td>
                            </tr>
                            <tr>
								<c:set var="since" value=""/>
                                <td align="right">Aktif :</td>
                                <c:forEach items="${salesman_edit.partyRoles}" var="role" varStatus="status">
								<c:if test="${role.partyRoleType.name == 'SALES PERSON'}">
								<c:set var="since" value="${role.fromDate}"/>
                                <td>
                                	<%-- <c:if test="${role.active}">
                                		<input type="text" value="ACTIVE" size="15" disabled/>
                                	</c:if>
                                	<c:if test="${!role.active}">
                                		<input type="text" value="INACTIVE" size="15" disabled/>
                                	</c:if> --%>
                            		<form:radiobutton path='partyRoles[${status.count-1}].active' value='true' label='Ya'/>
                            		<form:radiobutton path='partyRoles[${status.count-1}].active' value='false' label='Tidak'/>
                               	</td>
                                </c:if>
								</c:forEach>
                           	</tr>
                            <tr>
                                <td align="right">Posisi :</td>
                                
                                <c:set var="position" value=""/>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'SALESSUPERVISOR'}">
									<c:set var="position" value="SALES SUPERVISOR"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'PIC'}">
									<c:set var="position" value="PIC"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'MARKETING'}">
									<c:set var="position" value="MARKETING"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'COUNTER'}">
									<c:set var="position" value="COUNTER"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'ADMIN'}">
									<c:set var="position" value="ADMIN"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'CHANNEL'}">
									<c:set var="position" value="CHANNEL"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'SALESAGENT'}">
									<c:set var="position" value="AGEN SALES"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.position == 'AGENT'}">
									<c:set var="position" value="AGEN"/>
								</c:if>
                                <%-- <td><input disabled value="${position}"/></td> --%>
                                <td>
		  					  		<form:select id="posisi" path="personInformation.position" class="combobox">
		  					  			<form:option value="" label="" selected="true"/>
		  					  			<c:forEach items="${positions}" var="pot">
		  					  				<c:if test="${pot == salesman_edit.personInformation.position}">
		  					  					<form:option value="${pot}" label="${pot}" selected="true"/>
		  					  				</c:if>
		  					  				<c:if test="${pot != salesman_edit.personInformation.position}">
		  					  					<form:option value="${pot}" label="${pot}"/>
		  					  				</c:if>
										</c:forEach>
									</form:select>
								</td>
                            </tr>
                            <tr>
                                <td align="right">Jabatan :</td>
                                
                                <c:set var="position" value=""/>
	  					  		<c:if test="${salesman_edit.personInformation.subPosition == 'SALESTRAINING'}">
									<c:set var="position" value="SALES TRAINING"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.subPosition == 'SALESJUNIOR'}">
									<c:set var="position" value="SALES JUNIOR"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.subPosition == 'SALESSENIOR'}">
									<c:set var="position" value="SALES SENIOR"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.subPosition == 'COUNTERJUNIOR'}">
									<c:set var="position" value="COUNTER JUNIOR"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.subPosition == 'COUNTERSENIOR'}">
									<c:set var="position" value="COUNTER SENIOR"/>
								</c:if>
                                <%-- <td><input disabled value="${position}"/></td> --%>
                                <td>
		  					  		<form:select id="jabatan" path="personInformation.subPosition" class="combobox">
		  					  			<form:option value="" label="" selected="true"/>
			  					  		<c:if test="${salesman_edit.personInformation.position == 'MARKETING'}">
			  					  			<c:forEach items="${subPositionsMarketing}" var="potMark">
			  					  				<c:if test="${potMark == salesman_edit.personInformation.subPosition}">
			  					  					<form:option value="${potMark}" label="${potMark}" selected="true"/>
			  					  				</c:if>
			  					  				<c:if test="${potMark != salesman_edit.personInformation.subPosition}">
			  					  					<form:option value="${potMark}" label="${potMark}"/>
			  					  				</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${salesman_edit.personInformation.position == 'COUNTER'}">
			  					  			<c:forEach items="${subPositionsCounter}" var="potCount">
			  					  				<c:if test="${potCount == salesman_edit.personInformation.subPosition}">
			  					  					<form:option value="${potCount}" label="${potCount}" selected="true"/>
			  					  				</c:if>
			  					  				<c:if test="${potCount != salesman_edit.personInformation.subPosition}">
			  					  					<form:option value="${potCount}" label="${potCount}"/>
			  					  				</c:if>
											</c:forEach>
										</c:if>
									</form:select>
								</td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" align="right">Atasan :</td>
                                <td>
                                    <form:select path="personInformation.supervisor" id="supervisor" class="combobox-ext">
                                    	<c:if test='${not empty salesman_edit.personInformation.supervisor}'>
                                           	<form:option value='${salesman_edit.personInformation.supervisor.id}' label='${salesman_edit.personInformation.supervisor.name}' />
                                        </c:if>
                                    </form:select>
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpopupview.htm?target=supervisor&supervisor=true'/>');" style="CURSOR:pointer;" title="Supervisor & Coordinator" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Agama :</td>
                                <td><input disabled value="${salesman_edit.personInformation.religion.name}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Pendidikan Tingkat :</td>
                                <c:set var="education" value=""/>
                                <c:if test="${salesman_edit.personInformation.educationLevel == 'UNIVERSITY'}">
                                	<c:set var="education" value="UNIVERSITAS/SARJANA"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.educationLevel == 'COLLEGE'}">
                                	<c:set var="education" value="AKADEMI/DIPLOMA"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.educationLevel == 'SCHOOL'}">
                                	<c:set var="education" value="SLTA/SMA/SMU/SMK"/>
								</c:if>
                                <td><input disabled value="${education}" class="inputbox"/></td>
                                <c:remove var="education"/>
                            </tr>
                            <tr>
                                <td align="right">Nama Sekolah :</td>
                                <td><input name="personInformation.educationName" value="${salesman_edit.personInformation.educationName}" size="50"/></td>
                            </tr>
                            <tr>
                                <td align="right">Fakultas/Jurusan :</td>
                                <td><input name="personInformation.educationMajor" value="${salesman_edit.personInformation.educationMajor}" size="50"/></td>
                            </tr>
                            <tr>
                                <td align="right">Status Nikah :</td>
                                <td><input disabled value="${salesman_edit.personInformation.maritalStatus == 'MARRIED'?'Nikah':'Belum Nikah'}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Jumlah Anak :</td>
                                <td><input disabled value="${salesman_edit.personInformation.childs}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Status Rumah :</td>
                                <c:set var="homeStatus" value=""/>
                                <c:if test="${salesman_edit.personInformation.homeStatus == 'RENT'}">
									<c:set var="homeStatus" value="SEWA"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.homeStatus == 'PARENTHOUSE'}">
									<c:set var="homeStatus" value="RUMAH ORANG TUA"/>
								</c:if>
	  					  		<c:if test="${salesman_edit.personInformation.homeStatus == 'OWNHOUSE'}">
									<c:set var="homeStatus" value="RUMAH SENDIRI"/>
								</c:if>
                                <td><input disabled value="${homeStatus}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Kode Dealer :</td>
                                <td><input disabled value="${salesman_edit.personInformation.dealerCode}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Nomor Registrasi Atasan :</td>
                                <td><input name="personInformation.superiorCode" value="${salesman_edit.personInformation.superiorCode}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Jumlah Bawahan :</td>
                                <td><input name="personInformation.subordinate" value="${salesman_edit.personInformation.subordinate}"/></td>
                            </tr>
                            <tr>
                                <td align="right">Status Membership :</td>
                                <td><input name="personInformation.membershipStatus" value="${salesman_edit.personInformation.membershipStatus}"/></td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">Note :</td>
                                <td><form:textarea path="note" rows="6" cols="45"/></td>
                            </tr>
                            </table>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages" refreshOnShow="true">
                                    <table width="100%" style="border:none">
                                    <c:set var="mobile" value="-"/>
                                    <c:set var="phone" value="-"/>
                                    <c:set var="email" value="-"/>
                                    	<c:forEach items="${salesman_edit.contactMechanisms}" var="contact">
                                    		<c:if test="${contact.active}">
                                    			<c:if test="${contact.contactMechanismType == 'MOBILE'}">
                                    				<c:set var="mobile" value="${contact.contact}"/>
                                    			</c:if>
                                    			<c:if test="${contact.contactMechanismType == 'PHONE'}">
                                    				<c:set var="phone" value="${contact.contact}"/>
                                    			</c:if>
                                    			<c:if test="${contact.contactMechanismType == 'EMAIL'}">
                                    				<c:set var="email" value="${contact.contact}"/>
                                    			</c:if>
                                    		</c:if>
                                    	</c:forEach>
                                   		<c:forEach items="${salesman_edit.postalAddresses}" var="postal">
                                    	<tr>
			                                <td width="15%" align="right">Alamat :</td>
			                                <td width="30%"><input type="text" value="${postal.address}" class="input-disabled" disabled size="80"/></td>
			                                <td width="15%" align="right">Kode Pos :</td>
			                                <td width="30%"><input type="text" value="${postal.postalCode}" class="input-disabled" disabled size="10"/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Provinsi :</td>
			                                <td width="30%"><input type="text" value="${postal.province.name}" class="input-disabled" disabled size="30"/></td>
			                                <td width="15%" align="right">Telepon 1 :</td>
			                                <td width="30%"><input type="text" value="${phone}" class="input-disabled" disabled/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Kota/Kabupaten :</td>
			                                <td width="30%"><input type="text" value="${postal.city.name}" class="input-disabled" disabled size="30"/></td>
			                                <td width="15%" align="right">Telepon 2 :</td>
			                                <td width="30%"><input type="text" value="${mobile}" class="input-disabled" disabled/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Kecamatan :</td>
			                                <td width="30%"><input type="text" value="${postal.subdistrict.name}" class="input-disabled" disabled size="30"/></td>
			                                <td width="15%" align="right">Email :</td>
			                                <td width="30%"><input type="text" value="${email}" class="input-disabled" disabled size="50"/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Kelurahan :</td>
			                                <td width="30%"><form:input path="postalAddresses[0].villageCode" type="text" value="${postal.villageCode}" size="10"/><form:input path="postalAddresses[0].village" type="text" value="${postal.village}" size="34"/></td>
			                                <td width="15%">&nbsp;</td>
			                                <td width="20%">&nbsp;</td>
			                            </tr>
			                            </c:forEach>
                                    </table>
                                </div>
                                <div id="contactPerson" class="tab-pages" dojoType="ContentPane" label="Contact Mechanism">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <th width="32%">Contact</th>
                                      	<th width="15%">Type</th>
                                      	<th width="8%">Status</th>
                                      	<th width="38%">Note</th>
                                    </tr>
                                    <c:forEach items="${salesman_edit.contactMechanisms}" var="con">
                                    <tr>
                                        <td><c:out value="${con.contact}"/></td>
                                        <td><c:out value="${con.contactMechanismType}"/></td>
                                        <td>
                                            <c:if test='${con.active}'>Active</c:if>
                                            <c:if test='${not con.active}'>Inactive</c:if>
                                        </td>
                                        <td><c:out value="${con.note}"/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
							</div>
                            </form:form>
							</div>
						<div class="info">Created by : ${salesman_edit.createdBy.name} (<fmt:formatDate value='${salesman_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${salesman_edit.updatedBy.name} (<fmt:formatDate value='${salesman_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
<script type="text/javascript">
$(function(){
	$('.item-button-save').click(function(){
		$.ajax({
			url:"<c:url value='/page/salesmanedit.htm'/>",
			data:$('#form').serialize(),
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
		else if($("#posisi").val() == 'SALESSUPERVISOR')
		{
			$("#supervisor option").remove();
			$("<option></option>").text("").val("").appendTo("#supervisor");
		}
	});
});
</script>
</body>
<!-- END OF BODY -->
</html>

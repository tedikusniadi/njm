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
							<a class="item-button-list" href="<c:url value='/page/personnelmanagementview.htm'/>"><span><spring:message code="list"/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="personnel_add" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td width="34%" align="right">Employee ID</td>
                                    <td width="1%" align="center">:</td>
									<td width="65%"><form:input id="employeeId" path="code" size='25'/></td>
 								</tr>
	                            <tr>
	                            	<td align="right">Type</td>
                                    <td width="1%" align="center">:</td>
	                            	<td>
	                                	<form:select path="personnelManagementType">
	                                		<form:option value="NON_EMPLOYEE" label="NON EMPLOYEE"/>
	                                		<form:option value="EMPLOYEE" label="EMPLOYEE"/>
	                                		<%-- <form:option value="TRAINEE" label="TRAINEE"/> --%>
	                                	</form:select>
	                                </td>
	                            </tr>
 								<tr>
 									<td align="right">First Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id='firstName' path="firstName" size='35'/></td>
	 							</tr>
 								<tr>
 									<td align="right">Middle Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id='middleName' path="middleName" size='35'/></td>
	 							</tr>
 								<tr>
 									<td align="right">Last Name</td>
                                    <td width="1%" align="center">:</td>
									<td><form:input id='lastName' path="lastName" size='35'/></td>
	 							</tr>
                                <tr>
 									<td align="right">Picture</td>
                                    <td width="1%" align="center">:</td>
									<td><input id="fileImage" type="file" name="file"/></td>
	 							</tr>
 								<tr>
 									<td align="right">Note</td>
                                    <td width="1%" align="center">:</td>
									<td><form:textarea path="note" rows="6" cols="45"/></td>
 								</tr>
 								</table>
 								<div class="clears">&nbsp;</div>
	                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
	                                <div id="personInfo" dojoType="ContentPane" label="Personal Information" class="tab-pages" refreshOnShow="true">
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">Identification Number :</td>
			                                <td width="30%"><form:input id="identificationNumber" path="personalInformation.identificationNo" type="text" size="20"/></td>
			                            </tr>
			                            <tr>
			                            	<td align="right">Gender :</td>
			                            	<td>
			                                	<form:select path="personalInformation.gender">
			                                		<form:option value="MALE" label="MALE"/>
			                                		<form:option value="FEMALE" label="FEMALE"/>
			                                	</form:select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td align="right">Place of Birth :</td>
			                                <td><form:input id="placeOfBirth" path="personalInformation.placeOfBirth" type="text" size="50"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Date of Birth :</td>
			                                <td><form:input inputId="birthDateId" id="birthDate" path="personalInformation.dateOfBirth" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Blood Type :</td>
			                                <td>
			                                	<form:select path="personalInformation.bloodType">
			                                		<form:option value="O" label="O"/>
			                                		<form:option value="A" label="A"/>
			                                		<form:option value="B" label="B"/>
			                                		<form:option value="AB" label="AB"/>
			                                	</form:select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td align="right">Religion :</td>
			                                <td>
					  					  		<form:select id="religion" path="personalInformation.religion" class="combobox">
					  					  		<c:forEach items="${religions}" var="rel">
													<form:option value="${rel.id}" label="${rel.name}"/>
												</c:forEach>
												</form:select>
											</td>
			                            </tr>
	                                    </table>
	                                </div>
	                                <div id="contactInfo" dojoType="ContentPane" label="Contact Information" class="tab-pages" refreshOnShow="true">
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">Residence Adress :</td>
			                                <td width="30%"><form:input id="residenceAddress" path="postalAddresses[0].address" type="text" size="50"/></td>
			                                <td width="15%" align="right">Emergency Contact Name :</td>
			                                <td width="30%"><form:input id="emergencyContactName" path="emergencyContact.contactName" type="text" size="35"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Postal Code :</td>
			                                <td><form:input id="residencePostalCode" path="postalAddresses[0].postalCode" type="text" size="15"/></td>
			                                <td align="right">Relationship :</td>
			                                <td><form:input id="emergencyContactRelationship" path="emergencyContact.relationship" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">City :</td>
			                                <td><form:input id="residenceCity" path="postalAddresses[0].cityName" type="text" size="35"/></td>
			                                <td align="right">Mobile 1 :</td>
			                                <td><form:input id="emergencyContactMobile1" path="emergencyContact.phoneFirst" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Home Phone :</td>
			                                <td>
			                                	<form:input path="contactMechanisms[0].contact" type="text" size="25"/>
			                                	<form:input path="contactMechanisms[0].contactMechanismType" value="PHONE" type="text" hidden="hidden" size="15"/>
			                                </td>
			                                <td align="right">Mobile 2 :</td>
			                                <td><form:input path="emergencyContact.phoneSecond" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Mobile 1 :</td>
			                                <td>
			                                	<form:input id="residenceMobile1" path="contactMechanisms[1].contact" type="text" size="25"/>
			                                	<form:input path="contactMechanisms[1].contactMechanismType" value="MOBILE" type="text" hidden="hidden" size="15"/>
			                                </td>
			                                <td align="right">&nbsp;</td>
			                                <td>&nbsp;</td>
			                            </tr>
			                            <tr>
			                                <td align="right">Mobile 2 :</td>
			                                <td>
			                                	<form:input path="contactMechanisms[2].contact" type="text" size="25"/>
			                                	<form:input path="contactMechanisms[2].contactMechanismType" value="MOBILE2" type="text" hidden="hidden" size="15"/>
			                                </td>
			                                <td align="right">&nbsp;</td>
			                                <td>&nbsp;</td>
			                            </tr>
			                            <tr>
			                                <td align="right">Email Address :</td>
			                                <td>
			                                	<form:input path="contactMechanisms[3].contact" type="text" size="50"/>
			                                	<form:input path="contactMechanisms[3].contactMechanismType" value="EMAIL" type="text" hidden="hidden" size="15"/>
			                                </td>
			                                <td align="right">&nbsp;</td>
			                                <td>&nbsp;</td>
			                            </tr>
	                                    </table>
	                                </div>
	                                <div id="employmentInfo" dojoType="ContentPane" label="Employment Information" class="tab-pages" refreshOnShow="true">
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">Join Date :</td>
			                                <td width="30%"><form:input inputId="joinDateId" id="joinDate" path="employmentInformation.joinDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Company :</td>
			                                <td>
			                                	<form:select path="employmentInformation.organization" id="org" class="combobox-ext">
		                                        </form:select>
		                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
			                                </td>
			                            </tr>
			                            <!-- <tr>
			                                <td align="right">Position :</td>
			                                <td><input name="position" type="text" size="25"/></td>
			                            </tr> -->
	                                    </table>
	                                </div>
	                                <div id="education" dojoType="ContentPane" label="Education" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addEducation();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('educationTable')"><span>Delete Row</span></a>
                                        	 <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="educationTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="check_educationTable" id="check_educationTable" onclick="clickAll('educationTable');"/></th>
                                            <th width="8%">Start Date</th>
                                            <th width="8%">End Date</th>
                                            <th width="10%">Education Level</th>                                    
                                            <th width="20%">Institution Name</th>
                                            <th width="20%">Major</th>
                                            <th width="40%">GPA/Equal</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="7">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
	                                </div>
	                                <div id="training" dojoType="ContentPane" label="Training" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addTraining();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('trainingTable')"><span>Delete Row</span></a>
                                        	 <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="trainingTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="check_trainingTable" id="check_trainingTable" onclick="clickAll('trainingTable');"/></th>
                                            <th width="8%">Date</th>
                                            <th width="15%">Name</th>
                                            <th width="15%">Institution</th>
                                            <th width="60%">Note</th>                                    
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="5">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
	                                </div>
	                                <div id="workExperience" dojoType="ContentPane" label="Work Experience" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addWorkExperience();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('workExperienceTable')"><span>Delete Row</span></a>
                                        	 <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="workExperienceTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="check_workExperienceTable" id="check_workExperienceTable" onclick="clickAll('workExperienceTable');"/></th>
                                            <th width="8%">Start Date</th>
                                            <th width="8%">End Date</th>
                                            <th width="15%">Company</th>                                    
                                            <th width="15%">Position</th>
                                            <th width="50%">Note</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="6">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
	                                </div>
	                                <div id="bankAccount" dojoType="ContentPane" label="Bank Account" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addBankAccount();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('bankAccountTable')"><span>Delete Row</span></a>
                                        	 <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="bankAccountTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="check_bankAccountTable" id="check_bankAccountTable" onclick="clickAll('bankAccountTable');"/></th>
                                            <th width="10%">Bank Account No</th>
                                            <th width="20%">Account Name</th>
                                            <th width="12%">Bank Name</th>
                                            <th width="56%">Bank Branch</th>                                    
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="5">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
                                        </table>
	                                </div>
	                                <div id="taxing" dojoType="ContentPane" label="Taxing" class="tab-pages" refreshOnShow="true">
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">NPWP :</td>
			                                <td width="30%"><form:input path="taxing.taxNumber" type="text" size="35"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Marital Status :</td>
			                                <td>
			                                	<form:select path="taxing.maritalStatus">
			                                		<form:option value="SINGLE" label="SINGLE"/>
			                                		<form:option value="MARRIED" label="MARRIED"/>
			                                		<form:option value="DIVORCE" label="DIVORCED"/>
			                                	</form:select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td align="right">Spouse Working Status :</td>
			                                <td>
			                                	<form:select path="taxing.spouseWorkingStatus">
			                                		<form:option value="NOTWORKING" label="NOT WORKING"/>
			                                		<form:option value="WORKING" label="WORKING"/>
			                                	</form:select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td align="right">Children :</td>
			                                <td><form:input path="taxing.children" type="text" size="10"/></td>
			                            </tr>
	                                    </table>
	                                </div>
	                                <div id="personnelNote" dojoType="ContentPane" label="Personnel Notes" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
                                            <a class="item-button-new" href="javascript:addPersonnelNotes();"><span>New Row</span></a>
                                            <a class="item-button-delete" href="javascript:deleteRow('personnelNotesTable')"><span>Delete Row</span></a>
                                        	 <div class="item-navigator">&nbsp;</div>
                                        </div>
                                        <table class="table-list" id="personnelNotesTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="1%"><input type="checkbox" name="check_personnelNotesTable" id="check_personnelNotesTable" onclick="clickAll('personnelNotesTable');"/></th>
                                            <th width="8%">Date</th>
                                            <th width="15%">Notes From</th>
                                            <th width="8%">Type</th>
                                            <th width="88%">Note</th>                                    
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table">
                                            <td colspan="5">&nbsp;</td>
                                        </tr>    
                                        </tfoot>
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
  	<%@ include file="/common/sirius-footer.jsp"%>
</div>
</body>
<script type="text/javascript">

	function validation()
	{
		if($("#employeeId").val() == '')
		{
			alert('Employee ID cannot be empty !!!');
			return;
		}
		
		if($("#firstName").val() == '')
		{
			alert('First Name cannot be empty !!!');
			return;
		}
		
		if($("#identificationNumber").val() == '')
		{
			alert('Identification Number cannot be empty !!!');
			return;
		}
		
		if($("#placeOfBirth").val() == '')
		{
			alert('Place of Birth cannot be empty !!!');
			return;
		}
		
		if($("#residenceAddress").val() == '')
		{
			alert('Residence Address cannot be empty !!!');
			return;
		}
		
		if($("#residencePostalCode").val() == '')
		{
			alert('Residence Postal Code cannot be empty !!!');
			return;
		}
		
		if($("#residenceCity").val() == '')
		{
			alert('Residence City cannot be empty !!!');
			return;
		}
		
		if($("#residenceMobile1").val() == '')
		{
			alert('Residence Mobile 1 cannot be empty !!!');
			return;
		}
		
		if($("#emergencyContactName").val() == '')
		{
			alert('Emergency Contact Name cannot be empty !!!');
			return;
		}
		
		if($("#emergencyContactRelationship").val() == '')
		{
			alert('Emergency Contact Relationship cannot be empty !!!');
			return;
		}
		
		if($("#emergencyContactMobile1").val() == '')
		{
			alert('Emergency Contact Mobile 1 cannot be empty !!!');
			return;
		}
		
		if($("#org").val() == '' || $("#org").val() == null)
		{
			alert('Please select Employment Company 1st !!!');
			return;
		}

		return true;
	}

	$(function()
	{
		$('.item-button-save').click(function()
		{
			if(validation())
			{
				var fileImg = $('#fileImage').val();
				var data = new FormData();
				if(fileImg != '') {
				    data.append( 'file', $('#fileImage')[0].files[0] );
				}

			    var other_data = $('#addForm').serializeArray();
			    $.each(other_data,function(key,input){
			        data.append(input.name,input.value);
			    });
			    
				$.ajax({
					url:"<c:url value='/page/personnelmanagementadd.htm'/>",
					data:data,
				    contentType: false,
				    processData: false,
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Personnel Management data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/personnelmanagementview.htm?'/>";
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

	
	//Education Table
	var educationIdx = 0;
	function addEducation()
	{
		var tbl = document.getElementById("educationTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					educationIdx = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCbxEdu(educationIdx));
				
				var _startDate = genStartDateEdu(educationIdx);
				row.insertCell(1).appendChild(_startDate);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"eduStartDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_startDate);
				
				var _endDate = genEndDateEdu(educationIdx);
				row.insertCell(2).appendChild(_endDate);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"eduEndDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_endDate);
				
				row.insertCell(3).appendChild(genEducationLevel(educationIdx));
				row.insertCell(4).appendChild(genInstitution(educationIdx));
				row.insertCell(5).appendChild(genMajor(educationIdx));
				row.insertCell(6).appendChild(genGpa(educationIdx));

				educationIdx++;
			}
		}
	}

	function genCbxEdu(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.id = "checkEducation["+index+"]";
		check.name = "checkEducations";

		return check;
	}

	function genStartDateEdu(index)
	{
		var startDate = document.createElement("input");
		startDate.type = "text";
		startDate.id="eduStartDate["+index+"]";
		startDate.name="eduStartDates";

		return startDate;
	}

	function genEndDateEdu(index)
	{
		var endDate = document.createElement("input");
		endDate.id="eduEndDate["+index+"]";
		endDate.name="eduEndDates";

		return endDate;
	}

	function genEducationLevel(index)
	{
		var eduLvl = document.createElement("select");
		eduLvl.id="educationLevel["+index+"]";
		eduLvl.name="educationLevels";
		eduLvl.setAttribute('class','combobox');

		var play = document.createElement("option");
		play.value = 'PLAYGROUP';
		play.text = 'PLAYGROUP';
		eduLvl.appendChild(play);

		var kind = document.createElement("option");
		kind.value = 'KINDERGARDEN';
		kind.text = 'KINDERGARDEN';
		eduLvl.appendChild(kind);

		var elem = document.createElement("option");
		elem.value = 'ELEMENTARY';
		elem.text = 'ELEMENTARY';
		eduLvl.appendChild(elem);
		
		var junior = document.createElement("option");
		junior.value = 'JUNIORHIGH';
		junior.text = 'JUNIORHIGH';
		eduLvl.appendChild(junior);

		var senior = document.createElement("option");
		senior.value = 'SENIORHIGH';
		senior.text = 'SENIORHIGH';
		eduLvl.appendChild(senior);

		var bache = document.createElement("option");
		bache.value = 'BACHELOR';
		bache.text = 'BACHELOR';
		eduLvl.appendChild(bache);

		var pos = document.createElement("option");
		pos.value = 'POSGRADUATE';
		pos.text = 'POSGRADUATE';
		eduLvl.appendChild(pos);

		var doc = document.createElement("option");
		doc.value = 'DOCTORAL';
		doc.text = 'DOCTORAL';
		eduLvl.appendChild(doc);

		return eduLvl;
	}

	function genInstitution(index)
	{
		var institution = document.createElement("input");
		institution.type = "text";
		institution.id = "institution["+index+"]";
		institution.name = "institutions";
		institution.setAttribute('size',"45");

		return institution;
	}

	function genMajor(index)
	{
		var major = document.createElement("input");
		major.type = "text";
		major.id = "major["+index+"]";
		major.name = "majors";
		major.setAttribute('size',"35");

		return major;
	}

	function genGpa(index)
	{
		var gpa = document.createElement("input");
		gpa.type = "text";
		gpa.id = "gpa["+index+']';
		gpa.name = "gpas";
		gpa.setAttribute('size',"5");
		gpa.value = 0;

		return gpa;
	}

	
	//Training Table
	var trainingIdx = 0;
	function addTraining()
	{
		var tbl = document.getElementById("trainingTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					trainingIdx = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCbxTraining(trainingIdx));
				
				var _date = genTrainingDate(trainingIdx);
				row.insertCell(1).appendChild(_date);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"trainingDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_date);

				row.insertCell(2).appendChild(genTrainingName(trainingIdx));
				row.insertCell(3).appendChild(genTrainingInstitution(trainingIdx));
				row.insertCell(4).appendChild(genTrainingNote(trainingIdx));

				trainingIdx++;
			}
		}
	}

	function genCbxTraining(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.id = "checkTraining["+index+"]";
		check.name = "checkTrainings";

		return check;
	}

	function genTrainingDate(index)
	{
		var date = document.createElement("input");
		date.type = "text";
		date.id="trainingDate["+index+"]";
		date.name="trainingDates";

		return date;
	}

	function genTrainingName(index)
	{
		var name = document.createElement("input");
		name.type = "text";
		name.id = "trainingName["+index+"]";
		name.name = "trainingNames";
		name.setAttribute('size',"35");

		return name;
	}

	function genTrainingInstitution(index)
	{
		var institution = document.createElement("input");
		institution.type = "text";
		institution.id = "trainingInstitution["+index+"]";
		institution.name = "trainingInstitutions";
		institution.setAttribute('size',"45");

		return institution;
	}

	function genTrainingNote(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.id = "trainingNote["+index+']';
		note.name = "trainingNotes";
		note.setAttribute('size',"55");

		return note;
	}
	
	
	//Work Experience Table
	var workExperienceIdx = 0;
	function addWorkExperience()
	{
		var tbl = document.getElementById("workExperienceTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					workExperienceIdx = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCbxWork(workExperienceIdx));
				
				var _startDate = genStartDateWork(educationIdx);
				row.insertCell(1).appendChild(_startDate);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"workStartDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_startDate);
				
				var _endDate = genEndDateWork(educationIdx);
				row.insertCell(2).appendChild(_endDate);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"workEndDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_endDate);
				
				row.insertCell(3).appendChild(genCompany(workExperienceIdx));
				row.insertCell(4).appendChild(genPosition(workExperienceIdx));
				row.insertCell(5).appendChild(genNoteWork(workExperienceIdx));

				workExperienceIdx++;
			}
		}
	}

	function genCbxWork(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.id = "checkWorkExperience["+index+"]";
		check.name = "checkWorkExperiences";

		return check;
	}

	function genStartDateWork(index)
	{
		var startDate = document.createElement("input");
		startDate.type = "text";
		startDate.id="workStartDate["+index+"]";
		startDate.name="workStartDates";

		return startDate;
	}

	function genEndDateWork(index)
	{
		var endDate = document.createElement("input");
		endDate.id="workEndDate["+index+"]";
		endDate.name="workEndDates";

		return endDate;
	}

	function genCompany(index)
	{
		var company = document.createElement("input");
		company.type = "text";
		company.id = "company["+index+"]";
		company.name = "companys";
		company.setAttribute('size',"45");

		return company;
	}

	function genPosition(index)
	{
		var pos = document.createElement("input");
		pos.type = "text";
		pos.id = "position["+index+"]";
		pos.name = "positions";
		pos.setAttribute('size',"45");

		return pos;
	}

	function genNoteWork(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.id = "workNote["+index+"]";
		note.name = "workNotes";
		note.setAttribute('size',"55");

		return note;
	}

	
	//Bank Account Table
	var bankAccountIdx = 0;
	function addBankAccount()
	{
		var tbl = document.getElementById("bankAccountTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					bankAccountIdx = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCbxBank(bankAccountIdx));
				row.insertCell(1).appendChild(genAccountNo(bankAccountIdx));
				row.insertCell(2).appendChild(genAccountName(bankAccountIdx));
				row.insertCell(3).appendChild(genBankName(bankAccountIdx));
				row.insertCell(4).appendChild(genAccountBranch(bankAccountIdx));

				bankAccountIdx++;
			}
		}
	}

	function genCbxBank(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.id = "checkBankAccount["+index+"]";
		check.name = "checkBankAccount";

		return check;
	}

	function genAccountNo(index)
	{
		var accNo = document.createElement("input");
		accNo.type = "text";
		accNo.id = "accountNumber["+index+"]";
		accNo.name = "accountNumbers";
		accNo.setAttribute('size',"25");

		return accNo;
	}

	function genAccountName(index)
	{
		var accName = document.createElement("input");
		accName.type = "text";
		accName.id = "accountName["+index+"]";
		accName.name = "accountNames";
		accName.setAttribute('size',"45");
		
		return accName;
	}

	function genBankName(index)
	{
		var bankName = document.createElement("select");
		bankName.type = "text";
		bankName.id = "bankName["+index+"]";
		bankName.name = "bankNames";
		bankName.setAttribute('class','combobox');
		
		<c:forEach items="${banks}" var="bank">
			var b = document.createElement("option");
			b.value = '${bank.id}';
			b.text = '${bank.name}';
			bankName.appendChild(b);
		</c:forEach>

		return bankName;
	}

	function genAccountBranch(index)
	{
		var accBranch = document.createElement("input");
		accBranch.type = "text";
		accBranch.id = "accountBranchs["+index+"]";
		accBranch.name = "accountBranchs";
		accBranch.setAttribute('size',"55");

		return accBranch;
	}

	
	//Personnel Notes Table
	var personnelNotesIdx = 0;
	function addPersonnelNotes()
	{
		var tbl = document.getElementById("personnelNotesTable");
		if(tbl)
		{
			var t_section = tbl.tBodies[0];
			if(t_section)
			{
				if(t_section.rows.length > 0 )
					personnelNotesIdx = t_section.rows.length+1;

				var row = t_section.insertRow(t_section.rows.length);
				row.insertCell(0).appendChild(genCbxNotes(personnelNotesIdx));
				
				var _date = genDate(personnelNotesIdx);
				row.insertCell(1).appendChild(_date);
				dojo.widget.createWidget("DropdownDatePicker", {inputName:"notesDates",formatLength:"long",saveFormat:"dd-MM-yyyy",displayFormat: "dd-MM-yyyy",lang: "en-us"},_date);
				
				row.insertCell(2).appendChild(genNotesFrom(personnelNotesIdx));
				row.insertCell(3).appendChild(genNotesType(personnelNotesIdx));
				row.insertCell(4).appendChild(genNotePersonnel(personnelNotesIdx));

				personnelNotesIdx++;
			}
		}
	}

	function genCbxNotes(index)
	{
		var check = document.createElement("input");
		check.type = "checkbox";
		check.id = "checkPersonnelNotes["+index+"]";
		check.name = "checkPersonnelNotes";

		return check;
	}

	function genDate(index)
	{
		var date = document.createElement("input");
		date.type = "text";
		date.id = "noteDate["+index+"]";
		date.name = "notesDates";
		date.setAttribute('size',"25");

		return date;
	}

	function genNotesFrom(index)
	{
		var from = document.createElement("input");
		from.type = "text";
		from.id = "notesFrom["+index+"]";
		from.name = "notesFroms";
		from.setAttribute('size',"45");

		return from;
	}

	function genNotesType(index)
	{
		var noteType = document.createElement("select");
		noteType.type = "text";
		noteType.id = "notesType["+index+"]";
		noteType.name = "notesTypes";
		
		var com = document.createElement("option");
		com.value = 'COMPLIMENT';
		com.text = 'COMPLIMENT';
		noteType.appendChild(com);

		var war = document.createElement("option");
		war.value = 'WARNING';
		war.text = 'WARNING';
		noteType.appendChild(war);

		return noteType;
	}

	function genNotePersonnel(index)
	{
		var note = document.createElement("input");
		note.type = "text";
		note.id = "notesPersonnel["+index+"]";
		note.name = "notesPersonnels";
		note.setAttribute('size',"55");

		return note;
	}

	function clickAll(tableId)
	{
		var checked = false;
		if(document.getElementById("check_"+tableId).checked == true)
			checked = true;

		var tbl = document.getElementById(tableId);
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

	function deleteRow(tableId)
	{
		var tbl = document.getElementById(tableId);

		var t_section = tbl.tBodies[0];
		var len = t_section.rows.length;

		for(var idx=len-1;idx>=0;idx--)
		{
			if(t_section.rows[idx].cells[0].firstChild.checked == true)
				t_section.deleteRow(idx);
		}

		var check = document.getElementById("check_"+tableId);
		if(check)
			check.checked = false;
	}
</script>
</html>
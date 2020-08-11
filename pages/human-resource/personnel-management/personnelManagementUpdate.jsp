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
							<a class="item-button-list" href="<c:url value='/page/personnelmanagementview.htm'/>"><span><spring:message code='list'/></span></a>
							<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
					  	</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="personnel_edit" enctype="multipart/form-data">
 								<table style="border:none" width="100%">
 								<tr>
 									<td align="center" valign="center">
 									<c:if test="${not empty personnel_edit.picture}">
 										<table style="border:solid;size: 1px;color: gray;">
 										<tr>
 											<td align="center" valign="center">
 												<img width="186" height="262" src="<c:url value='/static/${personnel_edit.picture}'/>"/>
 											</td>
 										</tr>
 										</table>
 									</c:if>
 									<c:if test="${empty personnel_edit.picture}">
 										<table style="border:solid;size: 1px;color: gray;">
 										<tr>
 											<td align="center" valign="center">
 												<img width="186" height="262" src="<c:url value='/images/no_image_available.jpeg'/>"/>
 											</td>
 										</tr>
 										</table>
 									</c:if>
									</td>
 									<td>
		 								<table style="border:none" width="55%">
		 								<tr>
		 									<td width="34%" align="right">Employee ID</td>
		                                    <td width="1%" align="center">:</td>
										  	<td width="65%"><form:input path="code" cssClass="inputbox" disabled="true"/></td>
		 								</tr>
			                            <tr>
			                            	<td align="right">Type</td>
		                                    <td width="1%" align="center">:</td>
			                            	<td>
			                                	<form:select path="personnelManagementType" disabled="${(personnel_edit.personnelManagementType == 'EMPLOYEE'?'true':'false')}">
			                                		<form:option value="NON_EMPLOYEE" label="NON EMPLOYEE"/>
			                                		<form:option value="EMPLOYEE" label="EMPLOYEE"/>
			                                		<%-- <form:option value="TRAINEE" label="TRAINEE"/> --%>
			                                	</form:select>
			                                </td>
			                            </tr>
		 								<tr>
		 									<td align="right">Party First Name</td>
		                                    <td width="1%" align="center">:</td>
											<td><form:input path="firstName" size='45'/></td>
			 							</tr>
		                                <tr>
		 									<td align="right">Party Middle Name</td>
		                                    <td width="1%" align="center">:</td>
											<td><form:input path="middleName" size='45'/></td>
			 							</tr>
		                                <tr>
		 									<td align="right">Party Last Name</td>
		                                    <td width="1%" align="center">:</td>
											<td><form:input path="lastName" size='45'/></td>
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
									</td>
 								</tr>
 								</table>
 								<br/>
 								<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
									<div id="personInfo" dojoType="ContentPane" label="Personal Information" class="tab-pages" refreshOnShow="true">
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">Identification Number :</td>
			                                <td width="30%"><form:input path="personalInformation.identificationNo" type="text" size="20"/></td>
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
			                                <td><form:input path="personalInformation.placeOfBirth" type="text" size="50"/></td>
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
			                                <td><input value="${personnel_edit.personalInformation.religion.name}" type="text" size="15"/></td>
			                            </tr>
	                                    </table>
	                                </div>
	                                <div id="contactInfo" dojoType="ContentPane" label="Contact Information" class="tab-pages" refreshOnShow="true">
	                                	<c:set var="phone" value=""/>
	                                	<c:set var="mobile1" value=""/>
	                                	<c:set var="mobile2" value=""/>
	                                	<c:set var="email" value=""/>
	                                	<c:forEach items="${personnel_edit.contactMechanisms}" var="contact">
	                                		<c:if test="${contact.contactMechanismType == 'PHONE'}"><c:set var="phone" value="${contact.contact}"/></c:if>
	                                		<c:if test="${contact.contactMechanismType == 'MOBILE'}"><c:set var="mobile1" value="${contact.contact}"/></c:if>
	                                		<c:if test="${contact.contactMechanismType == 'MOBILE2'}"><c:set var="mobile2" value="${contact.contact}"/></c:if>
	                                		<c:if test="${contact.contactMechanismType == 'EMAIL'}"><c:set var="email" value="${contact.contact}"/></c:if>
	                                	</c:forEach>
	                                    <table width="100%" style="border:none">
                                    	<tr>
			                                <td width="15%" align="right">Residence Adress :</td>
			                                <td width="30%"><form:input path="postalAddresses[0].address" type="text" size="50"/></td>
			                                <td width="15%" align="right">Emergency Contact Name :</td>
			                                <td width="30%"><form:input path="emergencyContact.contactName" type="text" size="35"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Postal Code :</td>
			                                <td><form:input path="postalAddresses[0].postalCode" type="text" size="15"/></td>
			                                <td align="right">Relationship :</td>
			                                <td><form:input path="emergencyContact.relationship" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">City :</td>
			                                <td><form:input path="postalAddresses[0].cityName" type="text" size="35"/></td>
			                                <td align="right">Mobile 1 :</td>
			                                <td><form:input path="emergencyContact.phoneFirst" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Home Phone :</td>
			                                <td><input value="${phone}" type="text" size="25"/></td>
			                                <td align="right">Mobile 2 :</td>
			                                <td><form:input path="emergencyContact.phoneSecond" type="text" size="25"/></td>
			                            </tr>
			                            <tr>
			                                <td align="right">Mobile 1 :</td>
			                                <td><input value="${mobile1}" type="text" size="25"/></td>
			                                <td align="right">&nbsp;</td>
			                                <td>&nbsp;</td>
			                            </tr>
			                            <tr>
			                                <td align="right">Mobile 2 :</td>
			                                <td><input value="${mobile2}" type="text" size="25"/></td>
			                                <td align="right">&nbsp;</td>
			                                <td>&nbsp;</td>
			                            </tr>
			                            <tr>
			                                <td align="right">Email Address :</td>
			                                <td><input value="${email}" type="text" size="50"/></td>
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
			                                		<c:if test="${not empty personnel_edit.employmentInformation.organization}">
			                                			<form:option value="${personnel_edit.employmentInformation.organization.id}" label="${personnel_edit.employmentInformation.organization.name}"/>
			                                		</c:if>
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
	                                <div id="positionInfo" dojoType="ContentPane" label="Position Information" class="tab-pages" refreshOnShow="true">
	                                    <div class="toolbar-clean">
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th colspan="3">Current Position</th>
										</tr>
										<tr>
											<th width="1%"><div style="width:15px"></div></th>
                                            <th width="8%">Start Date</th>
                                            <th width="90%">Position</th>
										</tr>
										<c:forEach items="${personnel_edit.organizationStructures}" var="org">
										<tr>
											<td class="tools">&nbsp;</td>
											<td><fmt:formatDate value='${org.positionStartDate}' pattern='dd-MM-yyyy'/></td>
											<td>${org.name}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="3">&nbsp;</td></tr>
										</table>
										
										<div>&nbsp;</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th colspan="4">Past Position</th>
										</tr>
										<tr>
											<th width="1%"><div style="width:15px"></div></th>
                                            <th width="8%">Start Date</th>
                                            <th width="8%">End Date</th>
                                            <th width="80%">Position</th>
										</tr>
										<c:forEach items="${personnel_edit.incumbentHistories}" var="his">
										<tr>
											<td class="tools">&nbsp;</td>
											<td><fmt:formatDate value='${his.startDate}' pattern='dd-MM-yyyy'/></td>
											<td><fmt:formatDate value='${his.endDate}' pattern='dd-MM-yyyy'/></td>
											<td>${his.organizationStructure.name}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="4">&nbsp;</td></tr>
										</table>
	                                </div>
									<div id="education" dojoType="ContentPane" label="Education" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/personaleducationpreadd.htm?id=${personnel_edit.id}'/>"><span>New Personal Education</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="1%"><div style="width:45px"></div></th>
                                            <th width="8%">Start Date</th>
                                            <th width="8%">End Date</th>
                                            <th width="10%">Education Level</th>                                    
                                            <th width="20%">Institution Name</th>
                                            <th width="20%">Major</th>
                                            <th width="40%">GPA/Equal</th>
										</tr>
										<c:forEach items="${personnel_edit.personalEducations}" var="education">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/personaleducationpreedit.htm?id=${education.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                            	<c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/personaleducationdelete.htm?id=${education.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
                                            <td><fmt:formatDate value='${education.startDate}' pattern='dd-MM-yyyy'/></td>
											<td><fmt:formatDate value='${education.endDate}' pattern='dd-MM-yyyy'/></td>
											<td>${education.educationLevel}</td>
											<td>${education.institutionName}</td>
											<td>${education.major}</td>
											<td>${education.gpa}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="7">&nbsp;</td></tr>
										</table>
									</div>
									<div id="training" dojoType="ContentPane" label="Training" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/personnelmanagementtrainingpreadd.htm?id=${personnel_edit.id}'/>"><span>New Training</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
											<th width="1%"><div style="width:45px"></div></th>
                                            <th width="8%">Date</th>
                                            <th width="15%">Name</th>                                    
                                            <th width="15%">Institution</th>
                                            <th width="50%">Note</th>
										</tr>
										<c:forEach items="${personnel_edit.trainings}" var="training">
										<tr>
											<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/personnelmanagementtrainingpreedit.htm?id=${training.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                            	<c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/personnelmanagementtrainingdelete.htm?id=${training.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
                                            <td><fmt:formatDate value='${training.date}' pattern='dd-MM-yyyy'/></td>
											<td>${training.name}</td>
											<td>${training.institution}</td>
											<td>${training.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="workExperience" dojoType="ContentPane" label="Work Experience" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/workexperiencepreadd.htm?id=${personnel_edit.id}'/>"><span>New Work Experience</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                                       	  	<th width="1%"><div style="width:45px"></div></th>
											<th width="8%">Start Date</th>
                                            <th width="8%">End Date</th>
                                            <th width="15%">Company</th>                                    
                                            <th width="15%">Position</th>
                                            <th width="50%">Note</th>
										</tr>
										<c:forEach items="${personnel_edit.workExperiences}" var="work">
										<tr>
                                        	<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/workexperiencepreedit.htm?id=${work.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                            	<c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/workexperiencedelete.htm?id=${work.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
											<td><fmt:formatDate value='${work.startDate}' pattern='dd-MM-yyyy'/></td>
											<td><fmt:formatDate value='${work.endDate}' pattern='dd-MM-yyyy'/></td>
											<td>${work.organizationName}</td>
											<td>${work.position}</td>
											<td>${work.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="6">&nbsp;</td></tr>
										</table>
									</div>
                                    <div id="bankAccount" dojoType="ContentPane" label="Bank Account" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/personalbankaccountpreadd.htm?id=${personnel_edit.id}'/>"><span>New Bank Account</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                                       	  	<th width="1%"><div style="width:45px"></div></th>
											<th width="10%">Account No</th>
                                            <th width="15%">Account Name</th>
                                            <th width="15%">Bank Name</th>
                                            <th width="64%">Bank Branch</th>
										</tr>
										<c:forEach items="${personnel_edit.personalBankAccounts}" var="bank">
										<tr>
                                        	<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/personalbankaccountpreedit.htm?id=${bank.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                            	<c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/personalbankaccountdelete.htm?id=${bank.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
											<td>${bank.accountNumber}</td>
											<td>${bank.accountName}</td>
											<td>${bank.bank.name}</td>
											<td>${bank.bankBranch}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
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
                                    <div id="personnelNotes" dojoType="ContentPane" label="Personnel Notes" class="tab-pages" refreshOnShow="true">
										<div class="toolbar-clean">
											<a class="item-button-new" href="<c:url value='/page/personnelnotespreadd.htm?id=${personnel_edit.id}'/>"><span>New Personnel Notes</span></a>
											<div class="item-navigator">&nbsp;</div>
										</div>
										<table class="table-list" cellspacing="0" cellpadding="0" width="100%">
										<tr>
                                       	  	<th width="1%"><div style="width:45px"></div></th>
											<th width="8%">Date</th>
                                            <th width="15%">Notes From</th>
                                            <th width="8%">Type</th>                                    
                                            <th width="50%">Note</th>
										</tr>
										<c:forEach items="${personnel_edit.personnelNotes}" var="notes">
										<tr>
                                        	<td class="tools">
                                            	<c:if test='${access.edit}'>
													<a class="item-button-edit" href="<c:url value='/page/personnelnotespreedit.htm?id=${notes.id}'/>" title="Edit"><span>Edit</span></a>
                                                </c:if>
                                            	<c:if test='${access.delete}'>
													<a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/personnelnotesdelete.htm?id=${notes.id}'/>');" title="Delete"><span>Del</span></a>
                                                </c:if>
											</td>
											<td><fmt:formatDate value='${notes.date}' pattern='dd-MM-yyyy'/></td>
											<td>${notes.noteFrom}</td>
											<td>${notes.noteType}</td>
											<td>${notes.note}</td>
										</tr>
										</c:forEach>
										<tr class="end-table"><td colspan="5">&nbsp;</td></tr>
										</table>
									</div>
								</div>
 							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${personnel_edit.createdBy.name}'/> (<fmt:formatDate value='${personnel_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${personnel_edit.updatedBy.name}'/> (<fmt:formatDate value='${personnel_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@include file="/common/sirius-footer.jsp" %>
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

			    var other_data = $('#editForm').serializeArray();
			    $.each(other_data,function(key,input){
			        data.append(input.name,input.value);
			    });
				
				$.ajax({
					url:"<c:url value='/page/personnelmanagementedit.htm'/>",
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
</script>
</html>
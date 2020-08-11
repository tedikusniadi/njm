<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Facility >> Edit</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
	<script type="text/javascript">
		function save()
		{
			document.editForm.action = "<c:url value='/page/facilityedit.htm'/>";
			document.editForm.submit();
		}

		function error()
		{
			<c:if test='${not empty message}'>
				alert('${message}');
			</c:if>
		}
	</script>
</head>

<body onload="error();">

<div id="se-r00">
	<div id="se-r01">&nbsp;</div>
	<div id="se-r02">&nbsp;</div>
</div>

<div id="se-containers">

	<%@ include file="/common/sirius-menu.jsp"%>

	<div id="se-navigator">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="60%">Company Administration > Facility > Edit</td>
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
							<c:if test='${access.edit}'>
                            	<a class="item-button-save" href="javascript:save();"><span>Save</span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="facility_edit">
								<table width="100%" style="border:none">
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Code :</td>
								  <td width="80%"><form:input path='code' disabled='true' class='inputbox-ext input-disabled'/></td>
								</tr>
                                <tr>
									<td width="20%" nowrap="nowrap" align="right">Name :</td>
								  	<td width="80%"><form:input path='name' disabled='true' class='inputbox-ext input-disabled'/></td>
								</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Facility Type :</td>
									<td>
										<form:select id="facilityType" path="facilityType" cssClass="combobox input-disabled" disabled='true'>
                                        	<form:option value='${facility_edit.facilityType.id}' label='${facility_edit.facilityType.name}' />
										</form:select>
									</td>
								</tr>
								<c:if test="${facility_edit.facilityType.id == '2'}">
                                <tr>
                                    <td nowrap="nowrap" align="right">Area :</td>
                                  	<td ><form:input id='area' path='area' class="inputbox-ext"/></td>
                                </tr>
                                <tr>
									<td nowrap="nowrap" align="right">Status Aktif :</td>
									<td>
										<form:radiobutton path='active' value='true' label='Yes'/>
                                        <form:radiobutton path='active' value='false' label='No'/>
									</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">POS Code :</td>
                                  	<td ><form:input id='POSCode' path='POSCode' class="inputbox-ext"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">PIC POS Code :</td>
                                  	<td ><form:input id='PICPOSCode' path='PICPOSCode' class="inputbox-ext"/></td>
                                </tr>
								</c:if>
                                <tr>
                                    <td nowrap="nowrap" align="right">Category :</td>
                                    <td>
                                        <form:select id="implementation" path="implementation">
                                            <form:option value='REAL' label='REAL' />
                                            <form:option value='VIRTUAL' label='VIRTUAL' />
                                        </form:select>
                                    </td>
                                </tr>
                                <c:if test="${facility_edit.facilityType.id == '2'}">
                                <tr>
								  	<td align="right">No. Telepon PIC :</td>
								  	<td><form:input path="PICPhone" class="input-disabled" disabled="true"/></td>
								</tr>
								<tr>
								  	<td align="right">No. HP PIC :</td>
								  	<td><form:input path="PICMobile" class="input-disabled" disabled="true"/></td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Status :</td>
                                    <td>
                                        <select id="POSStatus" name="POSStatus" class="combobox input-disabled" disabled>="true"
                                        <c:if test="${facility_edit.POSStatus == 'PERMANENT' }">
                                            <option value="PERMANENT">TETAP</option>
                                        </c:if>
                                        <c:if test="${facility_edit.POSStatus == 'CONTRACT' }">
											<option value="CONTRACT">KONTRAK</option>
                                        </c:if>
                                        </select>
                                    </td>
                                </tr>
                                </c:if>
                                <tr>
                                    <td nowrap="nowrap" align="right">Facility Owner :</td>
                                    <td>
                                        <form:select id="org" path="owner" cssClass="combobox-ext">
                                            <c:if test='${not empty facility_edit.owner}'>
                                                <form:option value='${facility_edit.owner.id}' label='${facility_edit.owner.firstName} ${facility_edit.owner.lastName} ${facility_edit.owner.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popuppartyview.htm?target=org'/>');" style="CURSOR:pointer;" title="Party Popup" />
                                    </td>
                                </tr>
                                <c:if test="${facility_edit.facilityType.id == '2'}">
                                <tr>
                                    <td nowrap="nowrap" align="right">Nama Pemilik Sertifikat Tanah :</td>
                                  	<td><form:input id='certificateName' path='certificateName' class="inputbox-ext"/></td>
                                </tr>
								<tr>
									<td align="right">Kontrak :</td>
								<td>
									<input disabled size="15" value="<fmt:formatDate value='${facility_edit.contractDateFrom}' pattern='dd-MM-yyyy'/>"/> -
									<input disabled size="15" value="<fmt:formatDate value='${facility_edit.contractDateTo}' pattern='dd-MM-yyyy'/>"/>
								</td>
								</tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Status Pengelolaan POS Honda :</td>
                                    <td>
                                        <select id="statusManage" name="manageStatus" class="combobox input-disabled" disabled>
                                        <c:if test="${facility_edit.manageStatus == 'OWNHOUSE'}">
                                            <option value="OWNHOUSE">MILIK DEALER</option>
                                       	</c:if>
                                        <c:if test="${facility_edit.manageStatus == 'RENT'}">
											<option value="RENT">MILIK ORANG LAIN</option>
                                       	</c:if>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Nama Dealer Terdekat :</td>
                                  	<td ><form:input id='nearDealerName' path='nearDealerName' class="inputbox-ext"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Jarak Dengan Dealer Terdekat :</td>
                                  	<td ><form:input id='nearDealerDistance' path='nearDealerDistance' size="34"/></td>
                                </tr>
                                </c:if>
                                <tr>
                                    <td align="right" valign="top">Address Type :</td>
                                    <td>
                                        <c:forEach items='${facility_edit.postalAddress.addressTypes}' var='type' varStatus='status'>
                                            <c:if test='${not empty facility_edit.postalAddress}'>
                                            	<form:checkbox path="postalAddress.addressTypes[${status.index}].enabled" value="true" label="${type.type}"/><br/>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Alamat :</td>
	 							  	<td><form:input id="address" path="postalAddress.address" class="inputbox-ext"/></td>
	 							</tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Provinsi :</td>
	 							  	<td><form:input path="postalAddress.province.name" class="inputbox input-disabled" disabled="true"/></td>
	 							</tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Kota/Kabupaten :</td>
	 							  	<td><form:input path="postalAddress.city.name" class="inputbox input-disabled" disabled="true"/></td>
	 							</tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Wilayah Samsat :</td>
	 							  	<td><form:input path="postalAddress.region" class="inputbox"/></td>
	 							</tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Kecamatan :</td>
	 							  	<td><form:input path="postalAddress.subdistrict.name" class="inputbox input-disabled" disabled="true"/></td>
	 							</tr>
                                <tr>
	 							  	<td nowrap="nowrap" align="right">Kelurahan :</td>
	 							  	<td><form:input path="postalAddress.village" class="inputbox"/></td>
	 							</tr>
                                <tr>
									<td nowrap="nowrap" align="right">Note :</td>
									<td><form:textarea path="note" cols="41" rows="6"/></td>
								</tr>
								</table>
							</form:form>
							<br/>
                            <c:if test="${facility_edit.facilityType.name == 'WAREHOUSE' || facility_edit.facilityType.name == 'SHOWROOM' || facility_edit.facilityType.name == 'POS HONDA'|| facility_edit.facilityType.name == 'WORKSHOP'}">
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="grid" dojoType="ContentPane" label="Grid" class="tab-pages">
                                    <div class="toolbar-clean">
                                        <a class="item-button-new" href="<c:url value='/page/gridpreadd.htm?id=${facility_edit.id}'/>"><span>New Grid</span></a>
                                        <div class="item-navigator">&nbsp;</div>
                                    </div>
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="7%"><div style="width:10px"></div></th>
                                        <th width="25%">Code</th>
                                        <th width="68%">Name</th>
                                    </tr>
                                    <c:forEach items="${facility_edit.grids}" var="grid">
                                    <tr>
                                        <td class="tools">
                                            <a class="item-button-edit" href="<c:url value='/page/gridpreedit.htm?id=${grid.id}'/>" title="Edit"><span>Edit</span></a>
                                            <a class="item-button-delete" href="javascript:deleteDialog('<c:url value='/page/griddelete.htm?id=${grid.id}'/>');"><span>Del</span></a>
                                        </td>
                                        <td>${grid.code}</td>
                                        <td>${grid.name}</td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                            </div>
                        	</c:if>
                        </div>
                        <div class="info">Created by : <c:out value='${facility_edit.createdBy.firstName} ${facility_edit.createdBy.middleName} ${facility_edit.createdBy.lastName}'/> (<fmt:formatDate value='${facility_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${facility_edit.updatedBy.firstName} ${facility_edit.updatedBy.middleName} ${facility_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${facility_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
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
							<a class="item-button-list" href="<c:url value='/page/customerview.htm'/>"><span>List</span></a>
							<c:if test='${access.edit}'>
								<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
							</c:if>
					  	</div>

                        <div class="main-box">
                        	<form:form id="addForm" name="addForm" method="post" modelAttribute="customer_edit">
	                            <table width="100%" style="border:none">
	                            <tr>
	                                <td width="20%" align="right">ID :</td>
	                                <td width="80%"><input type="text" value="${party.code}" disabled class="input-disabled"/></td>
	                            </tr>
	                            <tr>
	                            	<c:set var="type" value=""/>
	                            	<c:if test="${party.type == 'person'}">
	                            		<c:set var="type" value="PERSON"/>
	                            	</c:if>
	                            	<c:if test="${party.type == 'group'}">
	                            		<c:set var="type" value="GROUP"/>
	                            	</c:if>
									<td align="right">Party Type :</td>
									<td><input type="text" value="${type}" size="15" disabled/></td>
									<c:remove var="type"/>
								</tr>
	                            <tr>
	                                <td align="right">Organization :</td>
	                                <td><input type="text" value="${party.organization.firstName} ${party.organization.middleName} ${party.organization.lastName}" class="inputbox-ext input-disabled" disabled/></td>
	                            </tr>
	                            <tr>
	                            	<td align="right">Salutation :</td>
	                                <td><input type="text" value="${party.salutation}" size="15" disabled/></td>
	                            </tr>
	                            <tr>
	                                <td align="right">Customer Name :</td>
	                                <td>
	                                	<form:input path="firstName" type="text" size="15"/>
	                                	<form:input path="middleName" type="text" size="15"/>
	                                	<form:input path="lastName" type="text" size="15"/>
	                                </td>
	                            </tr>
	                            <tr>
	                              	<td align="right">Wilayah Berikat :</td>
	                            	<td>
	                            		<form:radiobutton path='regional' value='true' label='Ya' disabled="true"/>
	                            		<form:radiobutton path='regional' value='false' label='Tidak' disabled="true"/>
	                            	</td>
	                            </tr>
	                            <tr>
	                              	<td align="right">Status Kewarganegaraan :</td>
	                            	<td>
	                            		<form:radiobutton path='indonesian' value='true' label='WNI' disabled="true"/>
	                            		<form:radiobutton path='indonesian' value='false' label='WNA' disabled="true"/>
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td align="right">Date Of Birth :</td>
	                                <td><input inputId="birthDateId" id="birthDate" name="dateOfBirth" value='${party.dateOfBirth}' formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
	                            </tr>
	                            <c:if test="${party.type=='person'}">
	                            <tr>
	                              	<td align="right">Gender :</td>
	                              	<!-- <td><input type="radio" name="personInformation.gender" value="MALE" size="30"/>Male&nbsp;<input type="radio" name="personInformation.gender" value="FEMALE" size="30"/>Female</td> -->
	                            	<td>
	                            		<form:radiobutton path='personInformation.gender' value='MALE' label='Laki-laki' disabled="true"/>
	                            		<form:radiobutton path='personInformation.gender' value='FEMALE' label='Perempuan' disabled="true"/>
	                            	</td>
	                            </tr>
	                            <tr>
									<td align="right">Agama</td>
									<td><input type="text" value="${party.personInformation.religion.name}" size="15" disabled/></td>
								</tr>
	                            </c:if>
	                            <tr>
	                                <td align="right">Customer Type Unit :</td>
	                                <td>
										<select class="combobox-medium input-disabled" disabled>
			  					  			<c:forEach items="${party.classifications}" var="classification">
			  					  			<c:if test="${classification.type.id < 19}">
			  					  				<option>${classification.type.name}</option>
	                                		</c:if>
			  					  			</c:forEach>
										</select>
									</td>
	                            </tr>
	                            <tr>
	                                <td align="right">Customer Type Sparepart :</td>
	                                <td>
	                                	<c:set var="stat" value="selected"/>
			  					  		<form:select id="partyClassification" path="classifications[1].type" class="combobox-medium">
			  					  			<c:forEach items="${classificationTypes}" var="type">
			  					  			<c:if test="${type.id == classification.type.id}">
			  					  				<form:option value="${type.id}" label='${type.name}' selected="true"/>
		  					  				</c:if>
			  					  			<c:if test="${type.id >= 19 and type.id != classification.type.id}">
			  					  				<form:option value="${type.id}" label='${type.name}'/>
		  					  				</c:if>
			  					  			</c:forEach>
										</form:select>
									</td>
	                            </tr>
	                            <tr>
	                                <td align="right">Status Pembelian Sparepart :</td>
	                                <td>
			  					  		<form:select id="sparepartStatus" path="sparepartStatus" class="combobox-medium">
			  					  			<form:option value="CASH" label='CASH'/>
			  					  			<form:option value="AHASS" label='AHASS'/>
			  					  			<form:option value="TOKO UMUM" label='TOKO UMUM'/>
										</form:select>
									</td>
	                            </tr>
	                            <tr>
	                              	<td align="right">Discount Rate :</td>
	                              	<td><input type="text" name="discountRate" value="${party.discountRate}" size="15"/></td>
	                            </tr>
	                            <%-- <tr>
	                              	<td align="right">Tax Code :</td>
	                              	<td><input type="text" value="${party.taxCode}" size="30" disabled/></td>
	                            </tr> --%>
	                            <%-- <tr>
	                              	<td align="right">No KK :</td>
	                              	<td><input type="text" value="${party.familyCard}" size="30" disabled/></td>
	                            </tr>
	                            <tr>
	                              	<td align="right">KTP/KITAS :</td>
	                              	<td><input type="text" value="${party.nppkp}" size="30" disabled/></td>
	                            </tr> --%>
	 							<tr>
	 							  	<td align="right">No. KK :</td>
	 							  	<td><form:input id="familyCard" path="familyCard" class="input-number-noformat" maxlength="16"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">KTP/KITAS :</td>
	 							  	<td><form:input id="nppkp" path="nppkp" class="input-number-noformat" maxlength="16"/></td>
	 							</tr>
	 							<tr>
	 							  	<td align="right">NPWP :</td>
	 							  	<td><form:input id="taxCode" path="taxCode"/></td>
	 							</tr>
	                            <%-- <tr>
	                              	<td align="right">Other Code :</td>
	                              	<td><input type="text" value="${party.otherCode}" size="30" disabled/></td>
	                            </tr> --%>
	                            <tr>
									<c:set var="since" value=""/>
	                                <td align="right">Aktif :</td>
	                                <c:forEach items="${party.partyRoles}" var="role" varStatus="status">
									<c:if test="${role.partyRoleType.name == 'CUSTOMER'}">
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
	                                <td align="right">Blacklist :</td>
	                                <td>
	                                	<%-- <c:if test="${party.blacklist}">
	                                		<input type="text" value="YES" size="15" disabled/>
	                                	</c:if>
	                                	<c:if test="${!party.blacklist}">
	                                		<input type="text" value="NO" size="15" disabled/>
	                                	</c:if> --%>
	                            		<form:radiobutton path='blacklist' value='true' label='Ya'/>
	                            		<form:radiobutton path='blacklist' value='false' label='Tidak'/>
	                               	</td>
	                           	</tr>
	                            <tr>
	                                <td align="right">Pelanggan Sejak :</td>
	                                <td><input disabled size="15" value="<fmt:formatDate value='${since}' pattern='dd-MM-yyyy'/>"/></td>
	                            </tr>
	                            <tr>
	                                <td align="right" valign="top">Note :</td>
	                                <td><textarea  cols="55" rows="6">${party.note}</textarea></td>
	                            </tr>
	                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="address" dojoType="ContentPane" label="Postal Address" class="tab-pages" refreshOnShow="true">
                                    <table width="100%" style="border:none">
                                    <c:set var="mobile" value="-"/>
                                    <c:set var="phone" value="-"/>
                                    <c:set var="email" value="-"/>
                                    	<c:forEach items="${party.contactMechanisms}" var="contact">
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
                                   		<c:forEach items="${party.postalAddresses}" var="postal">
                                    	<tr>
			                                <td width="15%" align="right">Alamat :</td>
			                                <td width="30%"><form:input path="postalAddresses[0].address" type="text" value="${postal.address}" size="50"/></td>
			                                <td width="15%" align="right">Kode Pos :</td>
			                                <td width="30%"><input type="text" value="${postal.postalCode}" class="input-disabled" disabled size="10"/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Provinsi :</td>
			                                <td width="30%"><input type="text" value="${postal.province.name}" class="input-disabled" disabled size="30"/></td>
			                                <td width="15%" align="right">Telepon :</td>
			                                <td width="30%"><input type="text" value="${phone}" class="input-disabled" disabled/></td>
			                            </tr>
			                            <tr>
			                                <td width="15%" align="right">Kota/Kabupaten :</td>
			                                <td width="30%"><input type="text" value="${postal.city.name}" class="input-disabled" disabled size="30"/></td>
			                                <td width="15%" align="right">Handphone :</td>
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
			                            <tr>
			                                <td width="15%" align="right">Wilayah Samsat :</td>
			                                <td width="30%">
			                                	<c:if test="${postal.city.availableRegion}">
			                                		<input type="text" value="${postal.subdistrict.parent.name}" class="input-disabled" disabled size="30"/></td>
			                                	</c:if>
			                                	<c:if test="${!postal.city.availableRegion}">
			                                		<input type="text" value="" class="input-disabled" disabled size="30"/></td>
			                                	</c:if>
			                                <td width="15%">&nbsp;</td>
			                                <td width="20%">&nbsp;</td>
			                            </tr>
			                            </c:forEach>
                                    </table>
                                </div>
                                <div id="followUp" class="tab-pages" dojoType="ContentPane" label="Follow Up">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="1%"><div style="width:10px"></div></th>
                                        <th width="15%">Follow Up Date</th>
                                        <th width="15%">Follow Up Type</th>
                                        <th width="15%">Next Follow Up</th>
                                        <th width="54%">Note</th>
                                    </tr>
                                    <c:forEach items="${followUps}" var="follow">
                                    <tr>
                                    	<td>&nbsp;</td>
                                        <td><fmt:formatDate value='${follow.prevDate}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${follow.type.name}'/></td>
                                        <td><fmt:formatDate value='${follow.nextDate}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${follow.note}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="salesHistory" class="tab-pages" dojoType="ContentPane" label="Riwayat Penjualan">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="1%"><div style="width:10px"></div></th>
                                        <th width="8%">Tanggal</th>
                                        <th width="15%">Transaksi</th>
                                        <th width="10%">Surat Jalan</th>
                                        <th width="15%">Salesman</th>
                                        <th width="20%">Unit Motor</th>
                                        <th width="12%">No Rangka</th>
                                        <th width="12%">No Mesin</th>
                                    </tr>
                                    <c:forEach items='${historys}' var='history'>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><fmt:formatDate value='${history.unitSalesOrder.date}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${history.unitSalesOrder.code}'/></td>
                                        <td>&nbsp;</td>
                                        <td><c:out value='${history.unitSalesOrder.salesPerson.firstName} ${history.unitSalesOrder.salesPerson.middleName} ${history.unitSalesOrder.salesPerson.lastName}'/></td>
                                        <td><c:out value='${history.price.product.name}'/></td>
                                    	<td><c:out value='${history.price.serial}'/></td>
                                    	<td><c:out value='${history.price.serialExt1}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="9">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="BBNHistory" class="tab-pages" dojoType="ContentPane" label="BBN">
                                    <table class="table-list" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                      	<th width="1%"><div style="width:10px"></div></th>
                                        <th width="2%">&nbsp;</th>
                                        <th width="12%">Tgl Terima</th>
                                        <th width="12%">Tgl Penyerahan</th>
                                        <th width="12%">Jenis Dokumen</th>
                                        <th width="12%">Nomor Dokumen</th>
                                        <th width="49%">Leasing</th>
                                    </tr>
                                    <c:forEach items='${historys}' var='history'>
                                    <c:set var="salesCode" value=""/>
	                                    <c:forEach items='${history.price.details}' var='detail'>
                                       	<c:if test="${history.unitSalesOrder.unitPayment == 'CREDIT'}">
                                        	<c:if test="${detail.referenceType != 'BPKB'}">
		                                    <c:if test="${empty salesCode}">
		                                    	<c:set var="salesCode" value="${history.unitSalesOrder.code}"/>
			                                    <tr>
			                                    	<td>&nbsp;</td>
					                            	<td colspan="5"><c:out value='${salesCode} (${history.unitSalesOrder.unitPayment})'/></td>
			                                    </tr>
		                                    </c:if>
		                                    <tr>
		                                        <td colspan="2">&nbsp;</td>
		                                        <td><fmt:formatDate value='${detail.receivedDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><fmt:formatDate value='${detail.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><c:out value='${detail.referenceType}'/></td>
		                                        <td><c:out value='${detail.referenceNo}'/></td>
		                                        <td>&nbsp;</td>
		                                    </tr>
		                                    </c:if>
		                                    <c:if test="${detail.referenceType == 'BPKB'}">
		                                    <c:if test="${empty salesCode}">
		                                    	<c:set var="salesCode" value="${history.unitSalesOrder.code}"/>
			                                    <tr>
			                                    	<td>&nbsp;</td>
					                            	<td colspan="5"><c:out value='${salesCode} (${history.unitSalesOrder.unitPayment})'/></td>
			                                    </tr>
		                                    </c:if>
		                                    <tr>
		                                        <td colspan="2">&nbsp;</td>
		                                        <td><fmt:formatDate value='${detail.receivedDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><fmt:formatDate value='${detail.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><c:out value='${detail.referenceType}'/></td>
		                                        <td><c:out value='${detail.referenceNo}'/></td>
		                                    	<td>
		                                    		<c:forEach items='${history.unitSalesOrder.leasingApps}' var='leasing'>
		                                    		<c:if test="${leasing.status == 'APPROVED'}">
		                                    			<c:out value='${leasing.partyLeasing.name}'/>
		                                    		</c:if>
		                                    		</c:forEach>
		                                    	</td>
		                                    </tr>
		                                    </c:if>
	                                    </c:if>
	                                    <c:if test="${history.unitSalesOrder.unitPayment == 'CASH'}">
		                                    <c:if test="${empty salesCode}">
		                                    	<c:set var="salesCode" value="${history.unitSalesOrder.code}"/>
			                                    <tr>
			                                    	<td>&nbsp;</td>
					                            	<td colspan="5"><c:out value='${salesCode} (${history.unitSalesOrder.unitPayment})'/></td>
			                                    </tr>
		                                    </c:if>
		                                    <tr>
		                                        <td colspan="2">&nbsp;</td>
		                                        <td><fmt:formatDate value='${detail.receivedDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><fmt:formatDate value='${detail.deliveredDate}' pattern='dd-MM-yyyy'/></td>
		                                        <td><c:out value='${detail.referenceType}'/></td>
		                                        <td><c:out value='${detail.referenceNo}'/></td>
		                                        <td>&nbsp;</td>
		                                    </tr>
	                                    </c:if>
	                                    </c:forEach>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="7">&nbsp;</td></tr>
                                    </table>
                                </div>
							</div>
	                        </form:form>
						</div>
						<div class="info">Created by : <c:out value='${party.createdBy.firstName} ${party.createdBy.middleName} ${party.createdBy.lastName}'/> (<fmt:formatDate value='${party.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${party.updatedBy.firstName} ${party.updatedBy.middleName} ${party.updatedBy.lastName}'/> (<fmt:formatDate value='${party.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</body>
</html>
<%@ include file="/common/dialog.jsp"%>
<script type="text/javascript">
$(function()
{
	$('.item-button-save').click(function()
	{
		$.ajax({
			url:"<c:url value='/page/customeredit.htm'/>",
			data:$('#addForm').serialize(),
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
						window.location="<c:url value='/page/customerview.htm?'/>";
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
});
</script>
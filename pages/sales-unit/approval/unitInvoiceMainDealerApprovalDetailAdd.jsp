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
<body onload="cekPosition();showInformationAddress();cekExpense();cekEducation();cekInfo();cekModel();cekType();cekUsedTo();cekUser();cekCard();cekSms();">
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
							<a class="item-button-list" href="<c:url value='/page/unitinvoicemaindealerapprovalpreedit.htm?id=${detail_edit.dealerApproval.id}'/>"><span>List</span></a>
							<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
							<!-- <a class="item-button-print printLabel"><span>Print Label</span></a> -->
					  	</div>
						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="detail_edit">
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 950px;">
                                	<div id="distributionTab" dojoType="ContentPane" label="Distribusi" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Transaksi</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="35%" align="right">Tanggal Beli</td>
                                          							<td width="65%">: <input class="input-disabled" disabled value="<fmt:formatDate value='${salesAdapter.unitSalesOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Pembayaran</td>
                                          							<td>: <input value="${salesAdapter.unitSalesOrder.unitPayment}" class="input-disabled" disabled/></td>
	                                                    		</tr>
																<%-- <tr>
																	<td align="right">Pembayaran 2</td>
																	<td>:
																		<select id="unitPayment2" name="unitPayment2" onchange="checkLeasing2();">
																		<c:if test="${not empty detail_edit.unitPayment}">
																			<option value="CASH" ${detail_edit.unitPayment == 'CASH' ? "selected" : ""}>CASH</option>
																			<option value="CREDIT" ${detail_edit.unitPayment == 'CREDIT' ? "selected" : ""}>CREDIT</option>
																		</c:if>
																		<c:if test="${empty detail_edit.unitPayment}">
																			<option value="CASH" ${salesAdapter.unitSalesOrder.unitPayment == 'CASH' ? "selected" : ""}>CASH</option>
																			<option value="CREDIT" ${salesAdapter.unitSalesOrder.unitPayment == 'CREDIT' ? "selected" : ""}>CREDIT</option>
																		</c:if>
																		</select>
															        </td>
																</tr> --%>
	                                                    		<tr>
	                                                    			<td align="right">Nama Leasing</td>
                                          							<td>: <input value="${leasing.partyLeasing.name}" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<%-- <tr>
	                                                    			<td align="right">Nama Leasing 2</td>
                                          							<td>:
                                          								<select id='leasing' name=leasing class='combobox-medium'>
																		<c:if test="${not empty detail_edit.partyLeasing}">
																			<option value="${detail_edit.partyLeasing.id}">${detail_edit.partyLeasing.name}</option>
																		</c:if>
																		<c:if test="${empty detail_edit.partyLeasing}">
																			<option value="${leasing.partyLeasing.id}">${leasing.partyLeasing.name}</option>
																		</c:if>
                                          								</select>
                                          								<c:if test="${empty detail_edit.unitPayment and salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
                               												<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" hidden="true"/>
                               											</c:if>
                                          								<c:if test="${not empty detail_edit.unitPayment and detail_edit.unitPayment == 'CASH'}">
                               												<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" hidden="true"/>
                               											</c:if>
                                          								<c:if test="${empty detail_edit.unitPayment and salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
                                											<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" />
                                										</c:if>
                                          								<c:if test="${not empty detail_edit.unitPayment and detail_edit.unitPayment == 'CREDIT'}">
                                											<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" />
                                										</c:if>
                                          							</td>
	                                                    		</tr> --%>
	                                                    		<tr>
	                                                    			<td align="right">PO Leasing</td>
                                          							<td>: <input value="${leasing.poLeasing}" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    	<td>
		                                                    	<c:set var="POSCode" value=""/>
		                                                    	<c:set var="POSName" value=""/>
		                                                    	<c:if test="${deliveryOrder.deliveryPlanningSequence.facility.facilityType.name != 'SHOWROOM'}">
		                                                    		<c:set var="POSCode" value="${deliveryOrder.deliveryPlanningSequence.facility.POSCode}"/>
		                                                    		<c:set var="POSName" value="${deliveryOrder.deliveryPlanningSequence.facility.name}"/>
		                                                    	</c:if>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="35%" align="right">Unit Jual</td>
                                          							<td width="65%">: <input value="${salesAdapter.unitSalesOrder.warehouse.facilityType.name}" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Kode Pos Honda</td>
                                          							<td>: <input value="" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Nama Pos Honda</td>
                                          							<td>: <input value="" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Tgl Approval</td>
                                          							<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${approval.date}' pattern='dd-MM-yyyy'/>"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">RO BD ID</td>
                                          							<td>: <input name="salesRefId" value="${detail_edit.salesRefId}" maxlength="10"/></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    		<c:remove var="POSCode"/>
	                                                    		<c:remove var="POSName"/>
	                                                    	</td>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="35%" align="right">Tgl Uang Muka</td>
                                          							<td width="65%">: <input class="input-disabled" disabled value="<fmt:formatDate value='${salesAdapter.unitSalesOrder.listPrepayments[0].date}' pattern='dd-MM-yyyy'/>"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Tenor</td>
                                          							<td>: <input value="${leasing.tenor}" class="input-disabled" disabled size="10"/> Bulan</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Uang Muka</td>
                                          							<td>: <input value="<fmt:formatNumber value="${salesAdapter.poPrepayment}" pattern='#,###.00'/>" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Besar Cicilan</td>
                                          							<td>: <input value="<fmt:formatNumber value="${leasing.installment}" pattern='#,###.00'/>" class="input-disabled" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Ref ID</td>
                                          							<td>: <input name="customerRefId" value="${detail_edit.customerRefId}" maxlength="10"/></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                        	<td>
	                                           	  <fieldset>
	                                                    <legend><strong>Transaksi 2</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
																<tr>
																	<td width="35%" align="right">Pembayaran</td>
																	<td width="65%">:
																		<select id="unitPayment2" name="unitPayment2" onchange="checkLeasing2();">
																		<c:if test="${not empty detail_edit.unitPayment}">
																			<option value="CASH" ${detail_edit.unitPayment == 'CASH' ? "selected" : ""}>CASH</option>
																			<option value="CREDIT" ${detail_edit.unitPayment == 'CREDIT' ? "selected" : ""}>CREDIT</option>
																		</c:if>
																		<c:if test="${empty detail_edit.unitPayment}">
																			<option value="CASH" ${salesAdapter.unitSalesOrder.unitPayment == 'CASH' ? "selected" : ""}>CASH</option>
																			<option value="CREDIT" ${salesAdapter.unitSalesOrder.unitPayment == 'CREDIT' ? "selected" : ""}>CREDIT</option>
																		</c:if>
																		</select>
															        </td>
																</tr>
	                                                    		<tr>
	                                                    			<c:set var="active" value=''/>
	                                                    			<td align="right">Nama Leasing</td>
                                          							<td>:
                                          								<select id='leasing' name=leasing class='combobox-medium'>
																		<c:if test="${not empty detail_edit.partyLeasing}">
																			<option value="${detail_edit.partyLeasing.id}">${detail_edit.partyLeasing.name}</option>
																		</c:if>
																		<c:if test="${empty detail_edit.unitPayment and salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
																			<c:if test="${empty detail_edit.partyLeasing}">
																				<option value="${leasing.partyLeasing.id}">${leasing.partyLeasing.name}</option>
																			</c:if>
																		</c:if>
																		<c:if test="${not empty detail_edit.unitPayment and detail_edit.unitPayment == 'CREDIT'}">
																			<c:if test="${empty detail_edit.partyLeasing}">
																				<option value="${leasing.partyLeasing.id}">${leasing.partyLeasing.name}</option>
																			</c:if>
																		</c:if>
                                          								</select>
                                          								<c:if test="${empty detail_edit.unitPayment and salesAdapter.unitSalesOrder.unitPayment == 'CASH'}">
	                                                    					<c:set var="active" value='class="input-disabled" readonly="true"'/>
                               												<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" hidden="true"/>
                               											</c:if>
                                          								<c:if test="${not empty detail_edit.unitPayment and detail_edit.unitPayment == 'CASH'}">
	                                                    					<c:set var="active" value='class="input-disabled" readonly="true"'/>
                               												<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" hidden="true"/>
                               											</c:if>
                                          								<c:if test="${empty detail_edit.unitPayment and salesAdapter.unitSalesOrder.unitPayment == 'CREDIT'}">
	                                                    					<c:set var="active" value=''/>
                                											<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" />
                                										</c:if>
                                          								<c:if test="${not empty detail_edit.unitPayment and detail_edit.unitPayment == 'CREDIT'}">
	                                                    					<c:set var="active" value=''/>
                                											<img id='leasing-browse' src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Leasing" />
                                										</c:if>
                                          							</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td width="35%" align="right">Tenor</td>
                                          							<td width="65%">: <input id="tenor2" name="tenor" value="<fmt:formatNumber value="${detail_edit.tenor}" pattern=',##0'/>" ${active} size="10" onkeyup="separator('tenor2');"/> Bulan</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Uang Muka</td>
                                          							<td>: <input id="poPrepayment2" name="poPrepayment" value="<fmt:formatNumber value="${detail_edit.poPrepayment}" pattern=',##0.00'/>" ${active} onkeyup="separator('poPrepayment2');"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Besar Cicilan</td>
                                          							<td>: <input id="installment2" name="installment" value="<fmt:formatNumber value="${detail_edit.installment}" pattern=',##0.00'/>" ${active} onkeyup="separator('installment2');"/></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    	<!-- <td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="35%" align="right"><div style="visibility: hidden;">Nama Pos Honda</div></td>
                                          							<td width="65%"><div style="visibility: hidden;">: <input value="0" class="input-disabled" disabled/></div></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="35%" align="right"><div style="visibility: hidden;">Tgl Uang Muka</div></td>
                                          							<td width="65%"><div style="visibility: hidden;">: <input class="input-disabled" disabled value="0"/></div></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td> -->
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                        	<td width="35%">
	                                           	  	<fieldset>
                                                    <legend><strong>Distribusi</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
			                                           	<td>
			                                           		<table width="100%" style="border:none">
			                                           		<tr>
			                                           			<td nowrap="nowrap" width="35%" align="right">Bantuan Penyerahan</td>
			                                					<td nowrap="nowrap" width="65%">: <input name="aidDelivery" type='radio' value='yes' ${detail_edit.aidDelivery == 'true' ? 'checked':''}/>Ya&nbsp;<input name="aidDelivery" type='radio' value='no' ${detail_edit.aidDelivery == 'false' ? 'checked':''}/>Tidak</td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td nowrap="nowrap" align="right">No Mesin</td>
			                                					<td nowrap="nowrap">: <input value="${salesAdapter.item.price.serial}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">No Rangka</td>
			                                					<td>: <input value="${salesAdapter.item.price.serialExt1}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Tipe Motor</td>
			                                					<td>: <input value="${salesAdapter.item.product.types}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Warna</td>
			                                					<td>: <input value="${salesAdapter.item.product.colors}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Tgl PDI Final</td>
			                                					<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${pdi.date}' pattern='dd-MM-yyyy'/>"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Pelaksana PDI</td>
			                                					<td>: <input value="${pdi.user.person.name}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Kondisi Unit</td>
			                                					<td>: <input name="unitCondition" type='checkbox' value='complete' ${complete}/>Lengkap&nbsp;<input name="unitCondition"  type='checkbox' value='clean' ${clean}/>Bersih</td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Tgl Kirim</td>
			                                					<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${deliveryOrder.date}' pattern='dd-MM-yyyy'/>"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td align="right">Delivery Man</td>
			                                					<td>: <input value="${deliveryOrder.driver.name}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
                                                    			<td align="right">Tgl BAST</td>
                                         						<td>: <input inputId="dateBASTId" id="dateBAST" name="BASTDate" value="<fmt:formatDate value="${detail_edit.BASTDate}" pattern='MM/dd/yyyy'/>" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                                    		</tr>
			                                           		<tr>
			                                           			<td align="right">Lead Time</td>
			                                					<td>: <input value="${leadTime} Jam" class="input-disabled" disabled/></td>
			                                           		</tr>
			                                           		<tr>
					                                            <td align="right">KPB Barcode ID</td>
					                               		  	  	<td>: <input name="barcodeId" value="${salesAdapter.item.price.serial}" class="input-disabled" disabled size="30"/></td>
					                                        </tr>
			                                           		<tr>
					                                            <td align="right">Keterangan</td>
					                               		  	  	<td>: <input name="note" value="${detail_edit.note}"/></td>
					                                        </tr>
			                                           		<tr>
					                                            <td align="right">&nbsp;</td>
					                               		  	  	<td><input type="checkbox" style="visibility:hidden;" value=""/></td>
					                                        </tr>
			                                           		</table>
			                                           	</td>
		                                           	</tr>
                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                            <td width="65%">
                                       			<c:set var="stnkAddress" value=""/>
	                                            <table width="100%" style="border:none">
	                                            <tr>
	                                            <td>
	                                            	<fieldset>
                                                    <legend><strong>Data STNK</strong></legend>
                                                    <table width="100%" style="border:none">
	                                           		<tr>
	                                           			<td nowrap="nowrap" width="15%" align="right" nowrap="nowrap">Status Nama</td>
	                                					<td nowrap="nowrap" width="30%">: <input disabled name="statusNama" type='radio' value='same' ${salesAdapter.unitSalesOrder.customer.id == salesAdapter.unitSalesOrder.customerUnit.id ? 'checked':''}/>Sama&nbsp;<input disabled name="statusNama" type='radio' value='different' ${salesAdapter.unitSalesOrder.customer.id != salesAdapter.unitSalesOrder.customerUnit.id ? 'checked':''}/>Beda</td>
	                                           			<td nowrap="nowrap" width="15%" align="right">Alamat STNK</td>
	                                					<td nowrap="nowrap" width="40%">:
	                                						<c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.postalAddresses}" var="postal">
	                                							<input value="${postal.address}" class="input-disabled" disabled size="45"/>
	                                           					<c:set var="stnkAddress" value="${postal.id}"/>
	                                						</c:forEach>
	                                						<input id="stnkAddressId" value="${salesAdapter.unitSalesOrder.customerUnit.id}" hidden="true"/>
	                                					</td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td nowrap="nowrap" align="right">Nama STNK</td>
	                                					<td nowrap="nowrap">: <input value="${salesAdapter.unitSalesOrder.customerUnit.name}" class="input-disabled" disabled size="30"/></td>
	                                					<td nowrap="nowrap" align="right">Kode Pos</td>
	                                					<td nowrap="nowrap">: <c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.postalAddresses}" var="postal"><input value="${postal.postalCode}" class="input-disabled" disabled/></c:forEach></td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td align="right">KTP/KITAS/TDP</td>
	                                					<td>: <input value="${salesAdapter.unitSalesOrder.customerUnit.nppkp}" class="input-disabled" disabled size="20"/></td>
	                                           			<td align="right">Kota/Kab</td>
	                                					<td>: <c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.postalAddresses}" var="postal"><input value="${postal.city.name}" class="input-disabled" disabled size="30"/></c:forEach></td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td align="right">Tgl Lahir</td>
	                                					<td>: <input class="input-disabled" disabled value="<fmt:formatDate value='${salesAdapter.unitSalesOrder.customerUnit.dateOfBirth}' pattern='dd-MM-yyyy'/>"/></td>
	                                           			<td align="right">Kecamatan</td>
	                                					<td>: <c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.postalAddresses}" var="postal"><input value="${postal.subdistrict.name}" class="input-disabled" disabled size="30"/></c:forEach></td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td align="right">Jenis Kelamin</td>
	                                					<td>: <input disabled name="gender" type='radio' ${customer.personInformation.gender == 'MALE' ? 'checked':''}/>Pria&nbsp;<input disabled name="gender" type='radio' ${customer.personInformation.gender == 'FEMALE' ? 'checked':''}/>Wanita</td>
	                                           			<td align="right">Kelurahan</td>
	                                					<td>: <c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.postalAddresses}" var="postal"><input value="${postal.village}" class="input-disabled" disabled size="30"/></c:forEach></td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td align="right">Agama</td>
	                                					<td>: <input value="${customer.personInformation.religion.name}" class="input-disabled" disabled/></td>
	                                           			<td align="right">&nbsp;</td>
	                                					<td>&nbsp;</td>
	                                           		</tr>
                                					<c:set var="phone" value=""/>
                                					<c:set var="mobile" value=""/>
	                                           		<tr>
	                                           			<td align="right">Telepon</td>
	                                					<td>:
	                                					<c:forEach items="${salesAdapter.unitSalesOrder.customer.contactMechanisms}" var="contact">
			                                    		<c:if test="${contact.active}">
			                                    			<c:if test="${contact.contactMechanismType == 'PHONE'}">
			                                    				<c:set var="phone" value="${contact.contact}"/>
			                                    			</c:if>
			                                    			<c:if test="${contact.contactMechanismType == 'MOBILE'}">
			                                    				<c:set var="mobile" value="${contact.contact}"/>
			                                    			</c:if>
		                                    			</c:if>
		                                    			</c:forEach>
	                                    				<input value="${phone}" class="input-disabled" disabled/>
			                                    		</td>
	                                           			<td align="right">&nbsp;</td>
	                                					<td>&nbsp;</td>
	                                           		</tr>
	                                           		<tr>
	                                           			<td align="right">No. HP</td>
	                                					<td>: <input value="${mobile}" class="input-disabled" disabled/></td>
	                                           			<td align="right">&nbsp;</td>
	                                					<td>&nbsp;</td>
	                                           		</tr>
                                					<c:remove var="phone"/>
                                					<c:remove var="mobile"/>
                                                    </table>
	                                                </fieldset>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                	<fieldset>
                                                    <legend><strong>Alamat Pengiriman</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
			                                           	<td>
			                                           		<table width="100%" style="border:none">
			                                           		<tr>
			                                           			<td nowrap="nowrap" width="15%" align="right">Status Nama</td>
			                                					<td nowrap="nowrap" width="40%">: <input disabled type='radio' value='same' ${salesAdapter.unitSalesOrder.shippingAddress.id == stnkAddress?'checked':''}/>Sama&nbsp;<input disabled type='radio' value='different' ${salesAdapter.unitSalesOrder.shippingAddress.id != stnkAddress?'checked':''}/>Beda</td>
			                                           			<td nowrap="nowrap" width="15%" align="right">Kota/Kab</td>
			                                					<td nowrap="nowrap" width="30%">: <input value="${salesAdapter.unitSalesOrder.shippingAddress.city.name}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td nowrap="nowrap" align="right">Alamat</td>
			                                					<td nowrap="nowrap">: <input value="${salesAdapter.unitSalesOrder.shippingAddress.address}" class="input-disabled" disabled size="45"/></td>
			                                           			<td nowrap="nowrap" align="right">Kecamatan</td>
			                                					<td nowrap="nowrap">: <input value="${salesAdapter.unitSalesOrder.shippingAddress.subdistrict.name}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		<tr>
			                                           			<td nowrap="nowrap" align="right">Kode Pos</td>
			                                					<td nowrap="nowrap">: <input value="${salesAdapter.unitSalesOrder.shippingAddress.postalCode}" class="input-disabled" disabled/></td>
			                                           			<td nowrap="nowrap" align="right">Kelurahan</td>
			                                					<td nowrap="nowrap">: <input value="${salesAdapter.unitSalesOrder.shippingAddress.village}" class="input-disabled" disabled size="30"/></td>
			                                           		</tr>
			                                           		</table>
			                                           	</td>
		                                           	</tr>
                                                    </table>
	                                                </fieldset>
                                                </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                	<table width="100%" style="border:none">
	                                           		<tr>
	                                           			<td>No. Reg Sales Force</td>
	                                					<td>: <input id="registrationNo" value="${detail_edit.salesForce.personInformation.registrationNo}" class="input-disabled" disabled/></td>
	                                           			<td>Sales Force</td>
	                                					<td>:
					                                        <form:select path="salesForce" id="salesForce" class="combobox-ext">
					                                        	<c:if test='${not empty detail_edit.salesForce}'>
					                                               	<form:option value='${detail_edit.salesForce.id}' label='${detail_edit.salesForce.name}' />
					                                            </c:if>
					                                        </form:select>
					                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/salesmanpersonpopupview.htm?target=salesForce&registrationNo=true'/>');" style="CURSOR:pointer;" title="Sales Force" />
	                                					</td>
	                                           		</tr>
                                                	</table>
                                                </td>
                                                </tr>
                                                </table>
	                                            </td>
	                                    	</tr>
	                                    	<tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Penyampaian Informasi</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td colspan="3">Alamat yang digunakan untuk korespondensi / penyampaian informasi :</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td colspan="3">
	                                                    				<input name="newAddress" type='radio' value='no' ${detail_edit.newAddress == 'false' ? 'checked':''} onclick="checkInformationAddress('no')"/>Alamat sesuai KTP
	                                                    				<input name="newAddress" type='radio' value='yes' ${detail_edit.newAddress == 'true' ? 'checked':''} onclick="checkInformationAddress('yes')"/>Alamat surat menyurat/tempat tinggal saat ini
	                                                    			</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td colspan="3">&nbsp;</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td width="10%" align="right">Alamat :</td>
	                                								<td colspan="2"><input id="informationAddress" name="informationAddress" value="${detail_edit.approvalAddress.address}" size="100" class="input-disabled" readonly="readonly"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Provinsi :</td>
	                                								<td colspan="2">
					                                					<select id="informationProvince" name="informationProvince" onchange="javascript:getcity('informationProvince')" disabled class='combobox-ext input-disabled'>
									 							  			<!-- <option value="0">--Provinsi--</option> -->
									 							  			<c:forEach items="${provinces}" var="province">
									 							  				<option value="${province.id}">${province.name}</option>
									 							  			</c:forEach>
									 							  		</select>
									 							  	</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Kota :</td>
	                                								<td colspan="2">
	                                									<select name="informationCity" id='informationCity' onchange="javascript:checkavailableregion('informationCity')" disabled class='combobox-ext input-disabled'>
                                											<!-- <option value="0">--Kota/Kabupaten--</option> -->
                                										</select>
                                									</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Wilayah Samsat :</td>
	                                								<td colspan="2">
			                                                    		<select id='informationRegion' onchange="javascript:getsubdistrict('informationRegion')" disabled class='combobox-ext input-disabled'>
					                                						<!-- <option value="0">--Wilayah Samsat--</option> -->
					                                					</select>
                                									</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Kecamatan :</td>
	                                								<td colspan="2">
	                                									<select name="informationSubdistrict" id='informationSubdistrict' disabled class='combobox-ext input-disabled'>
					                                						<!-- <option value="0">--Kecamatan--</option> -->
					                                					</select>
					                                				</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td align="right">Kelurahan :</td>
	                                								<td colspan="2"><input id="informationVillage" name="informationVillage" value="${detail_edit.approvalAddress.village}" size="70" class="input-disabled" readonly="readonly"/> &nbsp;Kode Pos&nbsp; <input id="informationPostalCode" name="informationPostalCode" maxlength="5" value="${detail_edit.approvalAddress.postalCode}" size="10" class="input-disabled" readonly="readonly"/></td>
	                                                    		</tr>
	                                                    		<c:if test="${salesAdapter.unitSalesOrder.customer.type != 'group'}">
		                                                    		<tr>
		                                                    			<td align="right">Status Rumah :</td>
		                                                    			<td colspan="2">
		                                                    				<input name="homeStatus" type='radio' value='OWNHOUSE' ${detail_edit.approvalAddress.homeStatus == 'OWNHOUSE' ? 'checked':''}/>Rumah Sendiri
		                                                    				<input name="homeStatus" type='radio' value='PARENTHOUSE' ${detail_edit.approvalAddress.homeStatus == 'PARENTHOUSE' ? 'checked':''}/>Rumah Orang Tua / Keluarga
		                                                    				<input name="homeStatus" type='radio' value='RENT' ${detail_edit.approvalAddress.homeStatus == 'RENT' ? 'checked':''}/>Rumah Sewa
		                                                    			</td>
		                                                    		</tr>
		                                                    	</c:if>
							                                	<c:if test="${salesAdapter.unitSalesOrder.customer.type == 'group'}">
							                                		<tr>
							                                			<td>&nbsp;</td>
							                                		</tr>
							                                		<tr>
							                                			<td colspan="3">Penanggung Jawab</td>
							                                		</tr>
		                                                    		<tr>
		                                                    			<td align="right">Nama :</td>
		                                								<td colspan="2"><input id="responsiblePersonName" name="responsiblePersonName" value="${detail_edit.approvalAddress.responsiblePersonName}" size="100"/></td>
		                                                    		</tr>
		                                                    		<tr>
		                                                    			<td align="right">Email :</td>
		                                								<td colspan="2"><input id="responsiblePersonEmail" name="responsiblePersonEmail" value="${detail_edit.approvalAddress.responsiblePersonEmail}" size="100"/></td>
		                                                    		</tr>
		                                                    		<tr>
		                                                    			<td align="right">No. HP :</td>
		                                								<td colspan="2"><input id="responsiblePersonMobile" name="responsiblePersonMobile" value="${detail_edit.approvalAddress.responsiblePersonMobile}" size="25"/></td>
		                                                    		</tr>
							                                	</c:if>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
                                		</table>
                                	</div>
                                	<div id="surveryTab" dojoType="ContentPane" label="Survey" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Pekerjaan</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<c:set var="checked" value=""/>
	                                                    		<c:forEach items="${positions}" var="pos" varStatus="stat">
                                                    			<tr>
                                                    				<c:if test="${pos.id == 11}">
                                                    					<td>
                                                    						${stat.index+1}.
                                                    						<input id="position-other" name="personPosition" type='radio' value='${pos.id}' onclick="activeField('position');"/>${pos.positionName}
	                                                    					<input id="position" name="position" value="${detail_edit.approvalSurvey.position}" class="input-disabled inputbox-medium" disabled/>
	                                                    				</td>
                                                    				</c:if>
	                                                    			<c:if test="${pos.id != 11}">
                                                    					<td>
                                                    						<c:if test="${stat.index+1 < 10}">0${stat.index+1}.</c:if>
                                                    						<c:if test="${stat.index+1 >= 10}">${stat.index+1}.</c:if>
                                                    						<input name="personPosition" type='radio' value='${pos.id}' onclick="activeField('position');"/>${pos.positionName}
                                                    					</td>
                                                    				</c:if>
                                                    			</tr>
	                                                    		</c:forEach>
	                                                    		<%-- <tr>
	                                                    			<td>1. <input name="personPosition" type='radio' value='1' onclick="activeField('position');"/>Pegawai Negeri</td>
                                          							<td>4. <input name="personPosition" type='radio' value='4' onclick="activeField('position');"/>Pedangang/Pengusaha/Wiraswasta</td>
                                          							<td>7. <input name="personPosition" type='radio' value='7' onclick="activeField('position');"/>TNI/POLRI</td>
                                          							<td>10. <input name="personPosition" type='radio' value='10' onclick="activeField('position');" disabled="disabled"/>Default</td>
                                          							<td>12. <input name="personPosition" type='radio' value='12' onclick="activeField('position');"/>Dokter</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>2. <input name="personPosition" type='radio' value='2' onclick="activeField('position');"/>Pegawai Swasta</td>
	                                                    			<td>5. <input name="personPosition" type='radio' value='5' onclick="activeField('position');"/>Mahasiswa/Pelajar</td>
	                                                    			<td>8. <input name="personPosition" type='radio' value='8' onclick="activeField('position');"/>Ibu Rumah Tangga</td>
	                                                    			<td>11. <input id="position-other" name="personPosition" type='radio' value='11' onclick="activeField('position');"/>Lainnya, sebutkan...</td>
                                          							<td>13. <input name="personPosition" type='radio' value='13' onclick="activeField('position');"/>Pengacara</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>3. <input name="personPosition" type='radio' value='1' onclick="activeField('position');"/>Pegawai Negeri</td>
                                          							<td>4. <input name="personPosition" type='radio' value='4' onclick="activeField('position');"/>Pedangang/Pengusaha/Wiraswasta</td>
                                          							<td>7. <input name="personPosition" type='radio' value='7' onclick="activeField('position');"/>TNI/POLRI</td>
                                          							<td>10. <input name="personPosition" type='radio' value='10' onclick="activeField('position');" disabled="disabled"/>Default</td>
                                          							<td>12. <input name="personPosition" type='radio' value='12' onclick="activeField('position');"/>Dokter</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>4. <input name="personPosition" type='radio' value='1' onclick="activeField('position');"/>Pegawai Negeri</td>
                                          							<td>4. <input name="personPosition" type='radio' value='4' onclick="activeField('position');"/>Pedangang/Pengusaha/Wiraswasta</td>
                                          							<td>7. <input name="personPosition" type='radio' value='7' onclick="activeField('position');"/>TNI/POLRI</td>
                                          							<td>10. <input name="personPosition" type='radio' value='10' onclick="activeField('position');" disabled="disabled"/>Default</td>
                                          							<td>12. <input name="personPosition" type='radio' value='12' onclick="activeField('position');"/>Dokter</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>5. <input name="personPosition" type='radio' value='3' onclick="activeField('position');"/>Ojek</td>
	                                                    			<td>6. <input name="personPosition" type='radio' value='6' onclick="activeField('position');"/>Guru/Dosen</td>
	                                                    			<td>9. <input name="personPosition" type='radio' value='9' onclick="activeField('position');"/>Petani/Nelayan</td>
	                                                    			<td>&nbsp;&nbsp;<input style="visibility:hidden;" type='radio' value=''/>
	                                                    			<c:if test="${detail_edit.approvalSurvey.personPosition.id == 11}">
	                                                    				<input id="position" name="position" value="${detail_edit.approvalSurvey.position}" class="input-disabled inputbox-medium" disabled/></td>
                                                    				</c:if>
	                                                    			<c:if test="${detail_edit.approvalSurvey.personPosition.id != 11}">
	                                                    				<input id="position" name="position" value="" class="input-disabled inputbox-medium" disabled/></td>
                                                    				</c:if>
                                          							<td>14. <input name="personPosition" type='radio' value='14' onclick="activeField('position');"/>Wartawan</td>
	                                                    		</tr> --%>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Pengeluaran Dalam 1 Bulan Termasuk Pengeluaran Keluarga</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="25%">1. <input name="expense" type='radio' value='1'/>&lt; Rp. 900.000,-</td>
                                          							<td width="28%">3. <input name="expense" type='radio' value='3'/>Rp. 1.250.001,- s/d Rp. 1.750.000,-</td>
                                          							<td width="28%">4. <input name="expense" type='radio' value='5'/>Rp. 2.500.001,- s/d Rp. 4.000.000,-</td>
                                          							<td width="19%">7. <input name="expense" type='radio' value='7'/>&gt; Rp. 6.000.000,-</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>2. <input name="expense" type='radio' value='2'/>Rp. 900.001,- s/d Rp. 1.250.000,-</td>
	                                                    			<td>4. <input name="expense" type='radio' value='4'/>Rp. 1.750.001,- s/d Rp. 2.500.000,-</td>
	                                                    			<td>6. <input name="expense" type='radio' value='6'/>Rp. 4.000.001,- s/d Rp. 6.000.000,-</td>
	                                                    			<td>&nbsp;</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Pendidikan Terakhir</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="15%">1. <input name="education" type='radio' value='1'/>Tidak Tamat SD</td>
                                          							<td width="8%">2. <input name="education" type='radio' value='2'/>SD</td>
                                          							<td width="12%">3. <input name="education" type='radio' value='3'/>SLTP/SMP</td>
                                          							<td width="12%">4. <input name="education" type='radio' value='4'/>SLTA/SMA</td>
                                          							<td width="18%">5. <input name="education" type='radio' value='5'/>Akademi/Diploma</td>
                                          							<td width="15%">6. <input name="education" type='radio' value='6'/>Sarjana (S1)</td>
                                          							<td width="20%">7. <input name="education" type='radio' value='7'/>Pasca Sarjana (S2/S3)</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr><tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Kontak</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="18%">No. HP(GSM/CDMA)</td>
	                                                    			<td width="82%">No. Telp Rumah</td>
	                                                    		</tr>
			                                                    <tr>
			                                                    	<c:if test="${empty detail_edit.approvalSurvey.mobile}">
				                                                    	<td nowrap="nowrap">
										 							  		<input id="mobileCode" maxlength="4" size="5"/>
										 							  		-
										 							  		<input id="mobileNumber"/>
										 							  		<input type="hidden" id="mobile" name="mobile"/>
				                                                    	</td>
			                                                    	</c:if>
			                                                    	<c:if test="${not empty detail_edit.approvalSurvey.mobile}">
			                                                    		<td><input id="mobile" name="mobile" value="${detail_edit.approvalSurvey.mobile}"/></td>
			                                                    	</c:if>
			                                                    	<c:if test="${empty detail_edit.approvalSurvey.phone}">
										 							  	<td nowrap="nowrap">
										 							  		<input id="phoneCode" maxlength="4" size="5"/>
										 							  		-
										 							  		<input id="phoneNumber"/>
										 							  		<input type="hidden" id="phone" name="phone"/>
										 							  	</td>
									 							 	</c:if>
			                                                    	<c:if test="${not empty detail_edit.approvalSurvey.phone}">
			                                                    		<td><input id="phone" name="phone" value="${detail_edit.approvalSurvey.phone}"/></td>
			                                                    	</c:if>
			                                                    </tr>
			                                                    <tr>
			                                                    	<td colspan="2">&nbsp;</td>
			                                                    </tr>
			                                                    <tr>
			                                                    	<td colspan="2">Status Kepemilikan No HP/ No Telp Rumah</td>
			                                                    </tr>
			                                                    <tr>
			                                                    	<td colspan="2">
			                                                    		<input id="defaultPhonePayment" name="phonePaymentType" type='radio' value='NONE' hidden="true" checked/>
			                                                    		<input name="phonePaymentType" type='radio' value='PRABAYAR' ${detail_edit.approvalSurvey.phonePaymentType == 'PRABAYAR' ? 'checked':''} onclick="checkPhone();"/>Pra Bayar (Isi Ulang)
			                                                    		<input name="phonePaymentType" type='radio' value='PASCABAYAR' ${detail_edit.approvalSurvey.phonePaymentType == 'PASCABAYAR' ? 'checked':''} onclick="checkPhone();"/>Pasca Bayar / Billing / Tagihan
			                                                    	</td>
			                                                    </tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Bersedia Dikirimkan Info Terbaru Program Honda</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="8%">1. <input name="info" type='radio' value='true'/>Ya</td>
                                          							<td width="92%">2. <input name="info" type='radio' value='false'/>Tidak</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Merk Motor Yang Pernah Dimiliki Sebelumnya</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="12%">1. <input name="model" type='radio' value='1' onclick="cekModelBefore('1');"/>Honda</td>
                                          							<td width="12%">2. <input name="model" type='radio' value='2' onclick="cekModelBefore('2');"/>Yamaha</td>
                                          							<td width="15%">3. <input name="model" type='radio' value='3' onclick="cekModelBefore('3');"/>Suzuki</td>
                                          							<td width="12%">4. <input name="model" type='radio' value='4' onclick="cekModelBefore('4');"/>Kawasaki</td>
                                          							<td width="12%">5. <input name="model" type='radio' value='5' onclick="cekModelBefore('5');"/>Motor Lain</td>
                                          							<td width="37%">6. <input id="didNotHaveModel" name="model" type='radio' value='6' onclick="cekModelBefore('6');"/>Belum Pernah Memiliki</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td colspan="2">
	                                           	  <fieldset>
	                                                    <legend><strong>Jenis Motor Yang Pernah Dimiliki Sebelumnya</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="12%">1. <input id="sportType" name="type" type='radio' value='1' onclick="cekTypeBefore('1');"/>Sport</td>
                                          							<td width="12%">2. <input name="type" type='radio' value='2' onclick="cekTypeBefore('2');"/>Cub(Bebek)</td>
                                          							<td width="15%">3. <input name="type" type='radio' value='3' onclick="cekTypeBefore('3');"/>Skuter(Matik)</td>
                                          							<td width="61%">4. <input id="didNotHaveType" name="type" type='radio' value='4' onclick="cekTypeBefore('4');"/>Belum Pernah Memiliki</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
	                                        <tr><td>&nbsp;</td></tr>
	                                        <tr>
	                                        	<td>
	                                           	  <fieldset>
	                                                    <legend><strong>Motor Yang Dibeli Akan Digunakan Untuk</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="50%">1. <input name="usedTo" type='radio' value='1' onclick="activeField('usedTo');"/>Berdagang</td>
                                          							<td width="50%">5. <input name="usedTo" type='radio' value='5' onclick="activeField('usedTo');"/>Kebutuhan Keluarga</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>2. <input name="usedTo" type='radio' value='2' onclick="activeField('usedTo');"/>Pemakaian Jarak Dekat</td>
                                          							<td>6. <input id="usedTo-other" name="usedTo" type='radio' value='LAINNYA' onclick="activeField('usedTo');"/>Lain-lain, sebutkan...</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>3. <input name="usedTo" type='radio' value='3' onclick="activeField('usedTo');"/>Kesekolah/Kekampus</td>
                                          							<td>&nbsp;&nbsp;<input style="visibility:hidden;" type='radio' value=''/><input id="usedTo" name="usedTo" value="" class="input-disabled inputbox-medium" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>4. <input name="usedTo" type='radio' value='4' onclick="activeField('usedTo');"/>Rekreasi/Olahraga</td>
                                          							<td>7. <input name="usedTo" type='radio' value='7' onclick="activeField('usedTo');"/>Bekerja</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                            <td>
	                                           	  <fieldset>
	                                                    <legend><strong>Yang Akan Menggunakan</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="50%">1. <input name="productUser" type='radio' value='1' onclick="activeField('user');"/>Saya Sendiri</td>
                                          							<td width="50%">4. <input id="user-other" name="productUser" type='radio' value='LAINNYA' onclick="activeField('user');"/>Lain-lain, sebutkan...</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>2. <input name="productUser" type='radio' value='2' onclick="activeField('user');"/>Anak</td>
                                          							<td>&nbsp;&nbsp;<input style="visibility:hidden;" type='radio' value=''/><input id="productUser" name="productUser" value="" class="input-disabled inputbox-medium" disabled/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>3. <input name="productUser" type='radio' value='3' onclick="activeField('user');"/>Pasangan(Suami/Istri)</td>
                                          							<td>&nbsp;</td>
	                                                    		</tr>
	                                                    		<tr>
                                          							<td>&nbsp;&nbsp;<input style="visibility:hidden;" type='radio' value=''/></td>
                                          							<td>&nbsp;</td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
                                		</table>
                                	</div>
                                	<div id="alwaysHondaTab" dojoType="ContentPane" label="Always Honda" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
	                                        <tr>
	                                        	<td>
	                                           	  <fieldset>
	                                                    <legend><strong>Always Honda</strong></legend>
	                                                    <table width="100%" style="border:none">
	                                                    <tr>
	                                                    	<td>
	                                                    		<table width="100%" style="border:none">
	                                                    		<tr>
	                                                    			<td width="10%">Nama Tercetak</td>
	                                                    			<c:set var="namaTercetak" value=""/>
	                                                    			<c:set var="noHp" value=""/>
	                                                    			<c:if test="${not empty detail_edit.approvalMember.name}">
	                                                    				<c:set var="namaTercetak" value="${detail_edit.approvalMember.name}"/>
	                                                    				<c:set var="noHp" value="${detail_edit.approvalMember.phone}"/>
	                                                    			</c:if>
	                                                    			<c:if test="${empty detail_edit.approvalMember.name}">
	                                                    				<c:set var="namaTercetak" value="${salesAdapter.unitSalesOrder.customerUnit.name}"/>
	                                                    				<c:forEach items="${salesAdapter.unitSalesOrder.customerUnit.contactMechanisms}" var="con">
	                                                    				<c:if test="${con.contactMechanismType == 'MOBILE'}">
	                                                    					<c:set var="noHp" value="${con.contact}"/>
	                                                    				</c:if>
	                                                    				</c:forEach>
	                                                    			</c:if>
                                          							<td width="90%">: <input name="alwaysName" value="${namaTercetak}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Jenis Kartu</td>
	                                                    			<td>: <input name="alwaysCardType" type='radio' value='ASIMO'/>Asimo<input name="alwaysCardType" type='radio' value='RACING'/>Racing</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>No. Handphone</td>
	                                                    			<td>: <input name="alwaysMobile" value="${noHp}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>SMS Broadcast</td>
	                                                    			<td>: <input name="alwaysSms" type='radio' value='true'/>Ya<input name="alwaysSms" type='radio' value='false'/>Tidak</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Email</td>
	                                                    			<td>: <input name="alwaysEmail" value="${detail_edit.approvalMember.email}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Facebook</td>
	                                                    			<td>: <input name="alwaysFacebook" value="${detail_edit.approvalMember.facebook}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Twitter</td>
	                                                    			<td>: <input name="alwaysTwitter" value="${detail_edit.approvalMember.twitter}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Instagram</td>
	                                                    			<td>: <input name="alwaysInstagram" value="${detail_edit.approvalMember.instagram}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Youtube</td>
	                                                    			<td>: <input name="alwaysYoutube" value="${detail_edit.approvalMember.youtube}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Hobi</td>
	                                                    			<td>:
	                                                    				<select id="alwaysHobi" name="alwaysHobi">
	                                                    					<option value="A1">Adventure (Petualangan)</option>
																			<option value="A2">Aeromodeling</option>
																			<option value="A3">Bercocok Tanam</option>
																			<option value="A4">Berkaraoke</option>
																			<option value="A5">Bermain Drama</option>
																			<option value="A6">Bermain Sulap</option>
																			<option value="A7">Fotografi</option>
																			<option value="A8">Kaligrafi</option>
																			<option value="A9">Koleksi Perangko (Filateli)</option>
																			<option value="A10">Makan</option>
																			<option value="A11">Massage</option>
																			<option value="A12">Melukis</option>
																			<option value="A13">Memancing</option>
																			<option value="A14">Memasak</option>
																			<option value="A15">Membaca</option>
																			<option value="A16">Membaca Puisi</option>
																			<option value="A17">Memelihara Binatang Peliharaan</option>
																			<option value="A18">Menanam Bunga</option>
																			<option value="A19">Menari</option>
																			<option value="A20">Mendongeng</option>
																			<option value="A21">Mengaji</option>
																			<option value="A22">Mengarang Cerita</option> 
																			<option value="A23">Menggambar</option>
																			<option value="A24">Mengkoleksi Barang Antik</option>
																			<option value="A25">Menjahit</option>
																			<option value="A26">Menulis Buku</option>
																			<option value="A27">Menyanyi</option>
																			<option value="A28">Origami</option>
																			<option value="A29">Otomotif</option>
																			<option value="A30">Pantomim</option>
																			<option value="A31">Shopping</option>
																			<option value="A32">Surat Menyurat</option>
																			<option value="A33">Travelling</option>
																			<option value="B1">Badminton</option>
																			<option value="B2">Basket</option>
																			<option value="B3">Bersepeda</option>
																			<option value="B4">Bowling</option>
																			<option value="B5">Fitness</option>
																			<option value="B6">Golf</option>
																			<option value="B7">Hiking</option>
																			<option value="B8">Jogging</option>
																			<option value="B9">Renang</option>
																			<option value="B10">Senam</option>
																			<option value="B11">Sepakbola</option>
																			<option value="B12">Sepatu Roda</option>
																			<option value="B13">Surfing</option>
																			<option value="B14">Tennis</option>
																			<option value="B15">Volley</option>
																			<option value="B16">Yoga</option>
																			<option value="C1">Bermain Games</option> 
																			<option value="C2">Bermain Komputer</option>
																			<option value="C3">Bermain Musik</option>
																			<option value="C4">Browsing Internet</option>
																			<option value="C5">Chatting</option>
																			<option value="C6">Mendengarkan Musik</option> 
																			<option value="C7">Mendengarkan Radio</option>
																			<option value="C8">Menonton Bioskop</option>
																			<option value="C9">Menonton Film</option>
																			<option value="C10">Menonton TV</option>
	                                                    				</select>
	                                                    			</td>
	                                                    		</tr>
	                                                    		<tr>
	                                                    			<td>Karakteristik Konsumen</td>
	                                                    			<td>: <input name="alwaysKarakteristik" value="${detail_edit.approvalMember.karakteristik}" class="inputbox-medium"/></td>
	                                                    		</tr>
	                                                    		</table>
	                                                    	</td>
	                                                    </tr>
	                                                    </table>
	                                                </fieldset>
	                                            </td>
	                                        </tr>
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
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
<script type="text/javascript">
$(function()
{
	var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Main Dealer Approval Detail',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	$('.b_save').click(function(e)
	{
		if(validation())
		{
			$.ajax({
				url:"<c:url value='/page/unitinvoicemaindealerapprovaldetailedit.htm'/>",
				data:$('#editForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Main Dealer Approval Detail data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/unitinvoicemaindealerapprovalpreedit.htm?id='/>"+json.id;
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

	$("#responsiblePersonMobile").keydown(function(event)
	{
        numberOnly(event);
    });

	$("#informationPostalCode").keydown(function(event)
	{
        numberOnly(event);
    }).keyup(function(event)
	{
        limit();
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

	/* $(".printLabel").click(function(){
		window.location="<c:url value='/page/unitinvoicemaindealerapprovaldetailprintlabel.htm?id=${detail_edit.id}'/>";
	}); */
});

function validation()
{
	if (!$("input[name='unitCondition']:checked").val())
	{
		alert('Mohon pilih Kondisi Unit terlebih dahulu !!!');
        return;
    }
	
	if($("#registrationNo").val() == '')
	{
		alert('No Registrastion Sales Force tidak boleh kosong !!!');
		return;
	}
	
	var mobile = "";
	mobile = "${detail_edit.approvalSurvey.mobile}";
	
	var phone = "";
	phone = "${detail_edit.approvalSurvey.phone}";
	
	var partyType = "";
	partyType = "${salesAdapter.unitSalesOrder.customer.type}";
	
	if($("#informationAddress").val() == '')
	{
		alert('Alamat Penyampaian Informasi tidak boleh kosong !!!');
		return;
	}
	
	/* if($("#informationVillage").val() == '')
	{
		alert('Kelurahan Penyampaian Informasi tidak boleh kosong !!!');
		return;
	} */

	if(partyType != "group")
	{
		if (!$("input[name='homeStatus']:checked").val())
		{
			alert('Mohon pilih Status Rumah terlebih dahulu !!!');
	        return;
	    }
	}
	
	if($("#informationPostalCode").val() == '')
	{
		alert('Kode Pos Penyampaian Informasi tidak boleh kosong !!!');
		return;
	}
	
	if($("#informationSubdistrict").val() == '')
	{
		alert('Kecamatan Penyampaian Informasi tidak boleh kosong !!!');
		return;
	}
	
	if($("#informationCity").val() == '')
	{
		alert('Kota Penyampaian Informasi tidak boleh kosong !!!');
		return;
	}
	
	if($("#informationProvince").val() == '')
	{
		alert('Provinsi Penyampaian Informasi tidak boleh kosong !!!');
		return;
	}
	
	if (!$("input[name='personPosition']:checked").val())
	{
		alert('Mohon pilih Pekerjaan terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='expense']:checked").val())
	{
		alert('Mohon pilih Pengeluaran terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='education']:checked").val())
	{
		alert('Mohon pilih Pendidikan Terakhir terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='info']:checked").val())
	{
		alert('Mohon pilih Info terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='model']:checked").val())
	{
		alert('Mohon pilih Merk Motor terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='type']:checked").val())
	{
		alert('Mohon pilih Jenis Motor terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='usedTo']:checked").val())
	{
		alert('Mohon pilih Penggunaan Motor terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='productUser']:checked").val())
	{
		alert('Mohon pilih yang menggunakan Motor terlebih dahulu !!!');
        return;
    }
	
	if (!$("input[name='unitCondition']:checked").val())
	{
		alert('Mohon pilih Kondisi Unit terlebih dahulu !!!');
        return;
    }

	if(mobile == "")
	{
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

	if(phone == "")
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
	}
	
	return true;
}

function openLeasing(target)
{
	openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization=${salesAdapter.unitSalesOrder.organization.id}'/>");
}

function checkPhone()
{
	/* if($("#phone").val() == '' || $("#phone").val().length < 6)
	{
		alert('Phone Number empty or only 01234 !!!');
		$("#defaultPhonePayment").attr("checked","checked");
		return;
	} */
	if($("#mobile").val() == '' || $("#mobile").val().length < 6)
	{
		alert('Mobile Number empty or only 01234 !!!');
		$("#defaultPhonePayment").attr("checked","checked");
		return;
	}
}

function activeField(stat)
{
	if(stat == "position")
	{
		if($("#position-other").attr("checked"))
		{
			$("#position").removeAttr("disabled");
			$("#position").attr("class", "inputbox-medium");
		}
		else
		{
			$("#position").attr("disabled","true");
			$("#position").val('');
			$("#position").attr("class", "input-disabled inputbox-medium");
		}
	}
	else if(stat == "usedTo")
	{
		if($("#usedTo-other").attr("checked"))
		{
			$("#usedTo").removeAttr("disabled");
			$("#usedTo").attr("class", "inputbox-medium");
		}
		else
		{
			$("#usedTo").attr("disabled","true");
			$("#usedTo").val('');
			$("#usedTo").attr("class", "input-disabled inputbox-medium");
		}
	}
	else if(stat == "user")
	{
		if($("#user-other").attr("checked"))
		{
			$("#productUser").removeAttr("disabled");
			$("#productUser").attr("class", "inputbox-medium");
		}
		else
		{
			$("#productUser").attr("disabled","true");
			$("#productUser").val('');
			$("#productUser").attr("class", "input-disabled inputbox-medium");
		}
	}
}

function cekPosition()
{
	var val1 = "${detail_edit.approvalSurvey.position}";
	var val2 = "${detail_edit.approvalSurvey.personPosition.id}";
	if(val1 != "")
	{
		if(val2 != "")
		{
			$("[name=personPosition]").filter("[value="+val2+"]").attr("checked","checked");
		}
		else
		{
			$("#position-other").attr("checked","checked");
		}
	}
	else
	{
		if(val2 != "")
			$("[name=personPosition]").filter("[value="+val2+"]").attr("checked","checked");
	}
}

function cekExpense()
{
	var val = "${detail_edit.approvalSurvey.expense.id}";
	if(val != "")
		$("[name=expense]").filter("[value="+val+"]").attr("checked","checked");
}

function cekEducation()
{
	var val = "${detail_edit.approvalSurvey.education.id}";
	if(val != "")
		$("[name=education]").filter("[value="+val+"]").attr("checked","checked");
}

function cekInfo()
{
	var val = "${detail_edit.approvalSurvey.info}";
	if(val != "")
		$("[name=info]").filter("[value="+val+"]").attr("checked","checked");
}

function cekModel()
{
	var val = "${detail_edit.approvalSurvey.model.id}";
	if(val != "")
		$("[name=model]").filter("[value="+val+"]").attr("checked","checked");
}

function cekType()
{
	var val = "${detail_edit.approvalSurvey.type.id}";
	if(val != "")
		$("[name=type]").filter("[value="+val+"]").attr("checked","checked");
}

function cekUsedTo()
{
	var val = "${detail_edit.approvalSurvey.usedTo}";
	if(val != "")
	{
		if(val.contains('LAINNYA'))
		{
			var con = val.split(",");
			val = "LAINNYA";
			$("[name=usedTo]").filter("[value="+val+"]").attr("checked","checked");
			$("#usedTo").val(con[1]);
		}
		else
			$("[name=usedTo]").filter("[value="+val+"]").attr("checked","checked");
	}
}

function cekUser()
{
	var val = "${detail_edit.approvalSurvey.productUser}";
	if(val != "")
	{
		if(val.contains('LAINNYA'))
		{
			var con = val.split(",");
			val = "LAINNYA";
			$("[name=productUser]").filter("[value="+val+"]").attr("checked","checked");
			$("#productUser").val(con[1]);
		}
		else
			$("[name=productUser]").filter("[value="+val+"]").attr("checked","checked");
	}
}

function cekCard()
{
	var val = "${detail_edit.approvalMember.type}";
	if(val != "")
		$("[name=alwaysCardType]").filter("[value="+val+"]").attr("checked","checked");
}

function cekSms()
{
	var val = "${detail_edit.approvalMember.broadcast}";
	if(val != "")
		$("[name=alwaysSms]").filter("[value="+val+"]").attr("checked","checked");
	
	$('#alwaysHobi').val('${detail_edit.approvalMember.hobi}');
}

function cekModelBefore(id)
{
	if(id == '6')
		$("#didNotHaveType").attr("checked","checked");
	else
		$("#sportType").attr("checked","checked");
}

function cekTypeBefore(id)
{
	if($("#didNotHaveModel").attr("checked"))
	{
		if(id != '4')
		{
			$("#didNotHaveType").attr("checked","checked");
			alert('Mohon pilih Model yang pernah dimiliki sebelumnya terlebih dahulu !!!');
			return;
		}
	}
	else
	{
		if(id == '4')
		{
			$("#sportType").attr("checked","checked");
			alert('Anda harus memilih Jenis Motor sebelumnya !!!');
			return;
		}
	}
}

function showInformationAddress()
{
	$("#informationAddress").val("${detail_edit.approvalAddress.address}");

	$("#informationProvince option").remove();
	$("<option></option>").text("${detail_edit.approvalAddress.province.name}").val("${detail_edit.approvalAddress.province.id}").appendTo("#informationProvince");

	$("#informationCity option").remove();
	$("<option></option>").text("${detail_edit.approvalAddress.city.name}").val("${detail_edit.approvalAddress.city.id}").appendTo("#informationCity");

	$("#informationRegion option").remove();
	var available = "${detail_edit.approvalAddress.city.availableRegion}";
	if(available == "true")
		$("<option></option>").text("${detail_edit.approvalAddress.subdistrict.parent.name}").val("${detail_edit.approvalAddress.subdistrict.parent.id}").appendTo("#informationRegion");
	else
		$("<option></option>").text("--Wilayah Samsat--").val(0).appendTo("#informationRegion");
	
	$("#informationSubdistrict option").remove();
	$("<option></option>").text("${detail_edit.approvalAddress.subdistrict.name}").val("${detail_edit.approvalAddress.subdistrict.id}").appendTo("#informationSubdistrict");

	$("#informationVillage").val('${detail_edit.approvalAddress.village}');

	$("#informationPostalCode").val('${detail_edit.approvalAddress.postalCode}');
}

function checkInformationAddress(newAdd)
{
	if(newAdd == 'no')
	{
		$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:$("#stnkAddressId").val()},function(json){
			$("#informationAddress").val(json.address);

			$("#informationProvince option").remove();
			$("<option></option>").text(json.province).val(0).appendTo("#informationProvince");
			
			if(json.availableRegion)
			{
				$("#informationRegion option").remove();
				$("<option></option>").text(json.subdistrictParent).val(0).appendTo("#informationRegion");
			}
			else
			{
				$("#informationRegion option").remove();
				$("<option></option>").text("--Wilayah Samsat--").val(0).appendTo("#informationRegion");
			}

			$("#informationCity option").remove();
			$("<option></option>").text(json.city).val(0).appendTo("#informationCity");

			$("#informationSubdistrict option").remove();
			$("<option></option>").text(json.subdistrict).val(0).appendTo("#informationSubdistrict");

			$("#informationVillage").val(json.village);
			$("#informationPostalCode").val(json.postalCode);
		});
		
		$("#informationAddress").attr("disabled");
		$("#informationAddress").attr("class","input-disabled");

		$("#informationProvince").attr("class","combobox-ext input-disabled");
		$("#informationProvince").attr("disabled");

		$("#informationRegion").attr("disabled");
		$("#informationRegion").attr("class","combobox-ext input-disabled");

		$("#informationCity").attr("disabled");
		$("#informationCity").attr("class","combobox-ext input-disabled");

		$("#informationSubdistrict").attr("disabled");
		$("#informationSubdistrict").attr("class","combobox-ext input-disabled");

		$("#informationVillage").attr("disabled");
		$("#informationVillage").attr("class","input-disabled");

		$("#informationPostalCode").attr("disabled");
		$("#informationPostalCode").attr("class","input-disabled");
	}
	else
	{
		$("#informationAddress").val('');
		$("#informationAddress").removeAttr("disabled");
		$("#informationAddress").removeAttr("readonly");
		$("#informationAddress").attr("class","");

		$("#informationProvince").attr("class","combobox-ext");
		$("#informationProvince").removeAttr("disabled");
		$("#informationProvince option").remove();
		$("<option></option>").text("--Provinsi--").val(0).appendTo("#informationProvince");
		//$("<option></option>").text("Jawa Barat").val(2).appendTo("#informationProvince");
		$.get("<c:url value='/page/geographicsremote.getprovince.json'/>",{},function(json){
			$.each(json.items,function(idx,val){
				$("<option></option>").text(val.name).val(val.id).appendTo("#informationProvince");
			});
		});

		$("#informationRegion option").remove();
		$("<option></option>").	text("--Wilayah Samsat--").val(0).appendTo("#informationRegion");
		$("#informationRegion").removeAttr("disabled");
		$("#informationRegion").attr("class","combobox-ext");

		$("#informationCity option").remove();
		$("<option></option>").	text("--Kota/Kabupaten--").val(0).appendTo("#informationCity");
		$("#informationCity").removeAttr("disabled");
		$("#informationCity").attr("class","combobox-ext");

		$("#informationSubdistrict option").remove();
		$("<option></option>").	text("--Kecamatan--").val(0).appendTo("#informationSubdistrict");
		$("#informationSubdistrict").removeAttr("disabled");
		$("#informationSubdistrict").attr("class","combobox-ext");

		$("#informationVillage").val('');
		$("#informationVillage").removeAttr("disabled");
		$("#informationVillage").removeAttr("readonly");
		$("#informationVillage").attr("class","");

		$("#informationPostalCode").val('');
		$("#informationPostalCode").removeAttr("disabled");
		$("#informationPostalCode").removeAttr("readonly");
		$("#informationPostalCode").attr("class","");
	}
}

function getcity(target)
{
	$.get("<c:url value='/page/geographicsremote.getcity.json'/>",{id:$("#informationProvince").val()},function(json){
		$("#informationCity option").remove();
		$("<option></option>").text("--Kota/Kabupaten--").val(0).appendTo("#informationCity");
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#informationCity");
		});
	});
}

function checkavailableregion(target) {
	$.get("<c:url value='/page/geographicsremote.checkavailableregion.json'/>",{id:$("#informationCity").val()},function(json){
		$("#informationRegion option").remove();
		$("<option></option>").text("--Wilayah Samsat--").val(0).appendTo("#informationRegion");
		$("#informationSubdistrict option").remove();
		$("<option></option>").text("--Kecamatan--").val(0).appendTo("#informationSubdistrict");
		if(json.available)
			getregion(target);
		else
			getsubdistrictnoregion(target);
	});
}

function getregion(target)
{
	$.get("<c:url value='/page/geographicsremote.getregion.json'/>",{id:$("#informationCity").val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#informationRegion");
		});
	});
}

function getsubdistrict(target)
{
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#informationRegion").val()},function(json){
		$("#informationSubdistrict option").remove();
		$("<option></option>").text("--Kecamatan--").val(0).appendTo("#informationSubdistrict");
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#informationSubdistrict");
		});
	});
}

function getsubdistrictnoregion(target)
{
	$.get("<c:url value='/page/geographicsremote.getsubdistrict.json'/>",{id:$("#informationCity").val()},function(json){
		$.each(json.items,function(idx,val){
			$("<option></option>").text(val.name).val(val.id).appendTo("#informationSubdistrict");
		});
	});
}

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

function checkLeasing2()
{
	var paymentType = $('#unitPayment2 option:selected').val();
	$('#leasing option').remove();
	if(paymentType == 'CASH') {
		$("<option></option>").text('').val('').appendTo("#leasing");
		$('#leasing-browse').attr('hidden', 'true');
		$('#tenor2').attr('readonly', true);
		$('#tenor2').attr('class', 'input-disabled');
		$('#tenor2').val(0);
		$('#poPrepayment2').attr('readonly', true);
		$('#poPrepayment2').attr('class', 'input-disabled');
		$('#poPrepayment2').val(0);
		$('#installment2').attr('readonly', true);
		$('#installment2').attr('class', 'input-disabled');
		$('#installment2').val(0);
	}
	else {
		if('${detail_edit.partyLeasing.id}')
			$("<option></option>").text('${detail_edit.partyLeasing.name}').val('${detail_edit.partyLeasing.id}').appendTo("#leasing");
		else
			$("<option></option>").text('${leasing.partyLeasing.name}').val('${leasing.partyLeasing.id}').appendTo("#leasing");
		
		$('#leasing-browse').removeAttr('hidden');
		$('#tenor2').removeAttr('readonly');
		$('#tenor2').removeAttr('class');
		$('#poPrepayment2').removeAttr('readonly');
		$('#poPrepayment2').removeAttr('class');
		$('#installment2').removeAttr('readonly');
		$('#installment2').removeAttr('class');
	}
}

function separator(id)
{
	var amount = document.getElementById(id);
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
	}
}
</script>
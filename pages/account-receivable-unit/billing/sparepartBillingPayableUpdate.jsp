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
							<a class="item-button-back" href="<c:url value='/page/sparepartbillingpayableview.htm'/>"><span><spring:message code='back'/></span></a>
					  		<a class="item-button-print" href="<c:url value='/page/sparepartbillingpayableprint.htm?id=${billing_edit.id}'/>"><span>Kwitansi</span></a>
					  	</div>
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="billing_edit">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">No.Tagihan :</td>
                                       	  <td width="71%"><input value="${billing_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <select id="org" name="organization" class="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${billing_edit.organization.id}'>${billing_edit.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td nowrap="nowrap" align="right">Tipe Kwitansi :</td>
                                            <td>
                                            	<select disabled class="combobox input-disabled">
                                            		<option>${billing_edit.methodType}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" class='input-disabled' disabled name="date" value="<fmt:formatDate value='${billing_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                    <td width="25%" colspan="2" align="left" valign="top">
										<fieldset>
                                        	<legend><strong>Journal Reference</strong></legend>
                                            <table style="border:none" width="100%">
											<tr>
												<td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
												<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${billing_edit.journalEntry.id}'/>">${billing_edit.journalEntry.code}</td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                    	<fieldset>
                                            <legend><strong>Informasi Penerimaan</strong></legend>
                                            <table width="" style="border:none" align="right">
                                            <tr>
                                            	<td align="right" colspan="2" style='font-size:12px;font-weight:bold;color:red;'>${billing_edit.status}</td>
                                            </tr>
                                            <tr>
                                                <td align="right">Piutang :</td>
                                                <td><input id="totalAmount" value="<fmt:formatNumber value='${billing_edit.unpaid}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                             <tr>
                                                <td align="right" colspan="2"><strong>Referensi Penerimaan</strong></td>
                                            </tr>
                                             <tr>
                                                <td align="right" colspan="2">
                                                	<c:forEach items='${billing_edit.payments}' var='application'>
														<a href="<c:url value='/page/sparepartreceiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
													</c:forEach>
												</td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                		<fieldset>
                                            <legend><strong>Jumlah Transaksi</strong></legend>
                                            <table width="" style="border:none"  align="right">
                                             <tr>
                                                <td align="right"><strong>Total :</strong></td>
                                                <td><input id="totalAmount" value="<fmt:formatNumber value='${billing_edit.amount}' pattern=',##0.00'/>" size="15" style="text-align:right" class="input-disabled" disabled/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;" selectedTab='address'>
                                <div id="address" dojoType="ContentPane" label="Detail Penagihan" class="tab-pages" refreshOnShow="true">
                                    <table width="100%" align="right">
                                     <tr>
                                    	<td width="11%" align="right">Supplier / Pelanggan</td>
                                      	<td width="40%">
                                      		<c:if test="${not empty billing_edit.customer}">
                                        		<input type="text" size="40" value="${billing_edit.customer.name}" disabled class="input-disabled"/>
                                        	</c:if>
                                        	<c:if test="${not empty billing_edit.supplier}">
                                        		<input type="text" size="40" value="${billing_edit.supplier.name}" disabled class="input-disabled"/>
                                        	</c:if>
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td width="11%" align="right">Alamat Penagihan : </td>
                                      	<td width="40%">
                                        	<select id='billAddress' name='customerbillingAddress' class='combobox-ext'>
                                             	<option value='${billing_edit.customerbillingAddress.id}'>${address.address}</option>
                                            </select>
                               	  	  	</td>
                                    </tr>
                                    <tr>
                                    	<td align="right">Kota/Kabupaten : </td>
                                        <td>
                                        	<input name="city" value="${billing_edit.customerbillingAddress.city.name}" disabled class="input-disabled"/>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td width="9%" align="right">Kecamatan : </td>
                                  		<td width="40%">
						  					<input name="city" value="${billing_edit.customerbillingAddress.subdistrict.name}" disabled class="input-disabled"/>
                                      </td>
                                    </tr>
                                      <tr>
                                    	<td width="9%" align="right">Kelurahan : </td>
                                  		<td width="40%">
						  					<input name="city" value="${billing_edit.customerbillingAddress.village}" disabled class="input-disabled"/>
                                      </td>
                                    </tr>
                                    <tr>
                                    	<td nowrap="nowrap" align="right">Kode Pos : </td>
                                        <td>
                                            <input name="city" value="${billing_edit.customerbillingAddress.postalCode}" disabled class="input-disabled"/>
                                        </td>
                                    </tr>
                                    </table>
                                </div>
                                <div id="line" dojoType="ContentPane" label="Barang" class="tab-pages" refreshOnShow="true">
                                     <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
                                        <th width="1%">&nbsp;</th>
                                        <th width="15%">Reference</th>
                                        <th width="15%">SO Code</th>
                                      	<th width="60%" align="right">Total Tagihan</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${billing_edit.sparepartPaymentApplications}" var="paymentApplication">
                                    <tr>
                                    	<td>&nbsp;</td>
                                        <td><c:out value='${paymentApplication.referenceCode}'/></td>
                                        <td><c:out value='${paymentApplication.sparepartSalesOrder.code}'/></td>
                                        <c:if test="${billing_edit.methodType != 'KPB'}">
                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='${paymentApplication.amount}' pattern=',##0.00'/>" disabled/></td>
                                        </c:if>
                                        <c:if test="${billing_edit.methodType == 'KPB'}">
                                        	<td><input style="text-align:right;" size="25" class='input-disabled' value="<fmt:formatNumber value='1500' pattern=',##0.00'/>" disabled/></td>
                                        </c:if>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot><tr class="end-table"><td colspan="4">&nbsp;</td></tr></tfoot>
                                    </table>
                                </div>
                            </div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${billing_edit.createdBy.firstName} ${billing_edit.createdBy.middleName} ${billing_edit.createdBy.lastName}'/> (<fmt:formatDate value='${billing_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${billing_edit.updatedBy.firstName} ${billing_edit.updatedBy.middleName} ${billing_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${billing_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>
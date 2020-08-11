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
							<c:if test="${!return}">
								<c:if test="${salesOrder_edit.status != 'CANCEL'}">
									<a class="item-button-list" href="<c:url value='/page/unitsalesorderview.htm'/>"><span>List</span></a>
									<c:if test="${access.edit and not leasApproved}">
										<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
									</c:if>
									<c:if test="${cancel && canEdit != 'false'}">
										<a class="item-button-delete" style="cursor:pointer;"><span>Cancel</span></a>
									</c:if>
									<c:if test="${access.print}">
										<a class="item-button-print" href="<c:url value='/page/unitsalesorderprint.htm?id=${salesOrder_edit.id}'/>"><span>Print</span></a>
									</c:if>
								</c:if>
								<c:if test="${salesOrder_edit.status == 'CANCEL'}">
									<a class="item-button-list" href="<c:url value='/page/unitsalesorderview.htm'/>"><span>List</span></a>
									<a class="item-text" style="color:red">SPK telah di cancel</a>
								</c:if>
							</c:if>
							<c:if test="${return}">
								<a class="item-button-list" href="<c:url value='/page/unitsalesorderview.htm'/>"><span>List</span></a>
								<a class="item-text" style="color:red">Surat Jalan telah di retur</a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_edit">
								<table width="100%" border="0">
                                <tr>
                                	<td width="56%" valign="top" align="left">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="27%" nowrap="nowrap" align="right">ID : </td>
                                          	<td width="73%"><input id="soCode" value="${salesOrder_edit.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                         <tr>
                                            <td width="27%" nowrap="nowrap" align="right">No.Referensi SPK :</td>
                                          	<td width="73%"><input class="input-disabled" disabled value="${salesOrder_edit.referenceCode}" size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input id="date" value="<fmt:formatDate value='${salesOrder_edit.date}' pattern='dd-MM-yyyy'/>" disabled class='inputbox-medium input-disabled'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                            	<select id="org" class="combobox-ext">
                                            		<option value='${salesOrder_edit.organization.id}'>${salesOrder_edit.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
		                                    <td nowrap="nowrap" align="right">Salesman :</td>
		                                    <td>
		                                    	<input value="${salesOrder_edit.salesPerson.name}" disabled class='input-disabled inputbox'/>
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td width="10%" align="right" valign="top">Catatan: </td>
                               		  	  	<td width="40%"><textarea cols="35" rows="5" disabled class='input-disabled'>${salesOrder_edit.note}</textarea></td>
                                        </tr>
                                      </table>
                                  </td>
                              		<td width="44%" valign="top">
		  							  <table width="100%" style="border:none">
                                        <tr>
                                        	<td>
                                           	  <div id="rekapTab" dojoType="TabContainer" style="width:100% ; height: 340px;">
                                				<div id="transactionTab" dojoType="ContentPane" label="Rekap Transaksi" class="tab-pages" refreshOnShow="true">
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <td width="60%"align="right">OTR : </td>
                                                        <td width="40%"><input id="unit-price" value="<fmt:formatNumber value='${salesAdapter.OTR}' pattern='#,###'/>" name="priceAmount" class="input-disabled" readonly="true" style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="60%"align="right">Uang Muka PO : </td>
                                                        <td width="40%"><input id="unit-prepayment" value="<fmt:formatNumber value="${salesAdapter.poPrepayment}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Leasing : </td>
                                                        <td><input id="sub-leasing" value="<fmt:formatNumber value="${salesAdapter.subdictionLeasing}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Main Dealer :</td>
                                                        <td><input id="sub-maindealer" value="<fmt:formatNumber value="${salesAdapter.mainDealer}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Diskon Konsumen : </td>
                                                        <td>
                                                        	<input id="sub-discount" value="<fmt:formatNumber value="${salesAdapter.discount}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/>
                                                        	<input id="sub-discount-hidden" value='${salesAdapter.discount}' type="hidden"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Discount Program : </td>
                                                        <td><input id="sub-program" value="<fmt:formatNumber value="${salesAdapter.program}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Uang Muka Murni : </td>
                                                        <td><input id="unit-pureprepayment" value="<fmt:formatNumber value="${salesAdapter.prepayment}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tambahan : </td>
                                                        <td><input id="unit-extra" value="<fmt:formatNumber value="${salesAdapter.extra}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Komisi Mediator : </td>
                                                        <td>
                                                        	<input id="mediator-com" value="<fmt:formatNumber value="${salesAdapter.mediatorCommission+salesAdapter.mediatorCommissionManual}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/>
                                                        	<input id="mediator-com-hidden" value='${salesAdapter.mediatorCommission+salesAdapter.mediatorCommissionManual}' type="hidden"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Subsidi Dealer Murni : </td>
                                                        <td><input id="sub-puredealer" value="<fmt:formatNumber value="${salesAdapter.programCustomer+salesAdapter.programMediator+salesAdapter.discDealerCustomer+salesAdapter.discDealerMediator+salesAdapter.extra}" pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                    </tr>
                                                    </table>
                                                </div>
                                				<div id="deliveryTab" dojoType="ContentPane" label="Pengiriman" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
			                                			<c:if test="${deliveryOrder.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h1>Terkirim</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='/page/unitdeliveryorderpreedit.htm?id=${deliveryOrder.id}'/>">
				                                          			<c:out value='${deliveryOrder.code}'/>
				                                                </a>
				                                            </td>
				                                            </tr>
			                                			</c:if>
			                                			<c:if test="${deliveryOrder.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h1>Belum Terkirim</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                		</table>
                                				</div>
                                				<div id="fakturTab" dojoType="ContentPane" label="Faktur" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
			                                			<c:if test="${invoiceApprovalDetail.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h1>Sudah Approval</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='page/unitinvoicemaindealerapprovaldetailpreedit.htm?id=${invoiceApprovalDetail.id}'/>">
				                                          			<c:out value='${invoiceApprovalDetail.dealerApproval.code}'/>
				                                                </a>
				                                            </td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${invoiceApprovalDetail.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h1>Belum Approval</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${invoice.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h1>Terima</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='/page/unitinvoicemaindealerpreedit.htm?id=${invoice.id}'/>">
				                                          			<c:out value='${invoice.code}'/>
				                                                </a>
				                                            </td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${invoice.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h1>Belum Terima</h1></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                		</table>
                                				</div>
                                				<div id="bbnTab" dojoType="ContentPane" label="BBN" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
		                                				<tr>
		                                					<td align="right"><h2>BBN Status : ${price.bbn}</h2></td>
		                                				</tr>
                                						<c:if test="${bbnPrintoutDetail.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h2>BBN Telah Diajukan</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='/page/bbnprintoutpreedit.htm?id=${bbnPrintoutDetail.bbnPrintout.id}'/>">
				                                          			<c:out value='${bbnPrintoutDetail.bbnPrintout.code}'/>
				                                                </a>
				                                            </td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${bbnPrintoutDetail.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h2>BBN Belum Diajukan</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${bbnDetail.id != null}">
			                                				<tr>
			                                				<!--  style="background-color:white" -->
			                                					<td align="right" style="color:green"><h2>BBN Telah Diproses</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                				<td align="right">
			                                					<a href="<c:url value='/page/bbnpreedit.htm?id=${bbnDetail.bbn.id}'/>">
				                                          			<c:out value='${bbnDetail.bbn.code}'/>
				                                                </a>
				                                            </td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${bbnDetail.id == null}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h2>BBN Belum Diproses</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                			<c:if test="${price.stnk == 'RECEIVED' || price.stnk == 'DELIVERED'}">
                                						<c:forEach items="${price.details}" var="detail">
				                                			<c:if test="${detail.referenceType == 'STNK'}">
				                                				<tr>
				                                				<!--  style="background-color:white" -->
				                                					<td align="right" style="color:green"><h2>STNK Selesai</h2></td>
				                                				</tr>
				                                				<tr>
				                                					<td align="right">Referensi :</td>
				                                				</tr>
				                                				<tr>
				                                				<td align="right">
				                                					<a href="<c:url value='/page/stnkpreedit.htm?id=${detail.id}'/>">
					                                          			<c:out value='${detail.referenceNo}'/>
					                                                </a>
					                                            </td>
				                                				</tr>
				                                			</c:if>
			                                			</c:forEach>
			                                			</c:if>
			                                			<c:if test="${price.stnk == 'UNRECEIVED'}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h2>STNK Belum Selesai</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                			<tr>&nbsp;</tr>
			                                			<c:if test="${price.plat == 'RECEIVED' || price.plat == 'DELIVERED'}">
                                						<c:forEach items="${price.details}" var="detail">
				                                			<c:if test="${detail.referenceType == 'PLAT'}">
				                                				<tr>
				                                				<!--  style="background-color:white" -->
				                                					<td align="right" style="color:green"><h2>Plat Nomor Selesai</h2></td>
				                                				</tr>
				                                				<tr>
				                                					<td align="right">Referensi :</td>
				                                				</tr>
				                                				<tr>
				                                				<td align="right">
				                                					<a href="<c:url value='/page/platpreedit.htm?id=${detail.id}'/>">
					                                          			<c:out value='${detail.referenceNo}'/>
					                                                </a>
					                                            </td>
				                                				</tr>
				                                			</c:if>
			                                			</c:forEach>
			                                			</c:if>
			                                			<c:if test="${price.plat == 'UNRECEIVED'}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h2>Plat Nomor Belum Selesai</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                			<tr>&nbsp;</tr>
			                                			<c:if test="${price.bpkb == 'RECEIVED' || price.bpkb == 'DELIVERED'}">
                                						<c:forEach items="${price.details}" var="detail">
				                                			<c:if test="${detail.referenceType == 'BPKB'}">
				                                				<tr>
				                                				<!--  style="background-color:white" -->
				                                					<td align="right" style="color:green"><h2>BPKB Selesai</h2></td>
				                                				</tr>
				                                				<tr>
				                                					<td align="right">Referensi :</td>
				                                				</tr>
				                                				<tr>
				                                				<td align="right">
				                                					<a href="<c:url value='/page/bpkbpreedit.htm?id=${detail.id}'/>">
					                                          			<c:out value='${detail.referenceNo}'/>
					                                                </a>
					                                            </td>
				                                				</tr>
				                                			</c:if>
			                                			</c:forEach>
			                                			</c:if>
			                                			<c:if test="${price.bpkb == 'UNRECEIVED'}">
			                                				<tr>
			                                					<td align="right" style="color:red"><h2>BPKB Belum Selesai</h2></td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">Referensi :</td>
			                                				</tr>
			                                				<tr>
			                                					<td align="right">-</td>
			                                				</tr>
			                                			</c:if>
			                                		</table>
                                				</div>
                                				<%-- <div id="journalTab" dojoType="ContentPane" label="Journal Entry" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
		                                				<tr>
		                                					<td align="right" style="color:green"><h1>Journal</h1></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty salesOrder_edit.journalEntry}">
		                                					<a href="<c:url value='/page/journalentrypreview.htm?id=${salesOrder_edit.journalEntry.id}'/>">${prepayment.journalEntry.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty salesOrder_edit.journalEntry}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
			                                		</table>
                                				</div> --%>
                                				<div id="journalTab" dojoType="ContentPane" label="Billing" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Customer</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingCustomer}">
		                                					<a href="<c:url value='/page/unitbillingpreedit.htm?id=${billingCustomer.id}'/>">${billingCustomer.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty billingCustomer}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Leasing</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingLeasing}">
		                                					<a href="<c:url value='/page/unitbillingpreedit.htm?id=${billingLeasing.id}'/>">${billingLeasing.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty billingLeasing}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Subsidi Leasing</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingSubLeasing}">
		                                					<a href="<c:url value='/page/unitbillingpreedit.htm?id=${billingSubLeasing.id}'/>">${billingSubLeasing.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty billingSubLeasing}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Main Dealer</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingMainDealer}">
		                                					<a href="<c:url value='/page/unitbillingpreedit.htm?id=${billingMainDealer.id}'/>">${billingMainDealer.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty billingMainDealer}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Insentive Leasing</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty refundDealerDetail}">
		                                					<a href="<c:url value='/page/refunddealerreportpreedit.htm?id=${refundDealerDetail.refundDealerGroup.id}'/>">${refundDealerDetail.refundDealerGroup.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty refundDealerDetail}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Billing Progressive Tax</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingProgressiveTax}">
		                                					<a href="<c:url value='/page/unitbillingpreedit.htm?id=${billingProgressiveTax.id}'/>">${billingProgressiveTax.code}</a>
			                                            </c:if>
		                                				<c:if test="${empty billingProgressiveTax}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
			                                		</table>
                                				</div><div id="receiptTab" dojoType="ContentPane" label="Receipt" class="tab-pages" refreshOnShow="true">
                                					<table width="100%">
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Receipt Customer</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingCustomer}">
		                                                	<c:forEach items='${billingCustomer.payments}' var='application'>
																<a href="<c:url value='/page/receiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
															</c:forEach>
			                                            </c:if>
		                                				<c:if test="${empty billingCustomer}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Receipt Leasing</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingLeasing}">
		                                                	<c:forEach items='${billingLeasing.payments}' var='application'>
																<a href="<c:url value='/page/receiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
															</c:forEach>
			                                            </c:if>
		                                				<c:if test="${empty billingLeasing}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Receipt Subsidi Leasing</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingSubLeasing}">
		                                                	<c:forEach items='${billingSubLeasing.payments}' var='application'>
																<a href="<c:url value='/page/receiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
															</c:forEach>
			                                            </c:if>
		                                				<c:if test="${empty billingSubLeasing}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right" style="color:green"><h2>Receipt Main Dealer</h2></td>
		                                				</tr>
		                                				<tr>
		                                					<td align="right">Referensi :</td>
		                                				</tr>
		                                				<tr>
		                                				<td align="right">
		                                				<c:if test="${not empty billingMainDealer}">
		                                                	<c:forEach items='${billingMainDealer.payments}' var='application'>
																<a href="<c:url value='/page/receiptpreedit.htm?id=${application.receipt.id}'/>">${application.receipt.code}</a><br/>
															</c:forEach>
			                                            </c:if>
		                                				<c:if test="${empty billingMainDealer}">
		                                					-
			                                            </c:if>
			                                            </td>
		                                				</tr>
			                                		</table>
                                				</div>
                                              </div>
                                            </td>
                                        </tr>
                                		</table>
                           	  	  </td>
                                </tr>
                                </table>
                               	<div id="mainTab1" dojoType="TabContainer" style="width:100% ; height: 230px;">
                                	<div id="customerTab" dojoType="ContentPane" label="Informasi Pelanggan" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Nama Pemesan</td>
                                				<td>: <select id="cust" disabled class="combobox-ext input-disabled"><option value="${salesOrder_edit.customer.id}">${salesOrder_edit.customer.name}</option></select>
                                				</td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='cust-postalCode' disabled class='input-disabled' size="10"/></td>
                                			</tr>
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="cust-address" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Email</td>
                                				<td>: <input id='cust-email' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="cust-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 1</td>
                                				<td>: <input id='cust-phone' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id="cust-city" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Telepon 2</td>
                                				<td>: <input id='cust-phone2'disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kecamatan</td>
                                				<td>: <input id="cust-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id='cust-samsat-area' disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="cust-village" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab2" dojoType="TabContainer" style="width:100% ; height: 170px;">
                                	<div id="licenseTab" dojoType="ContentPane" label="Informasi STNK" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Nama STNK</td>
                                				<td>: <input value="${salesOrder_edit.customerUnit.name}" disabled class='inputbox-ext input-disabled'/>
                                				<td>Kecamatan</td>
                                				<td>: <input id="license-subdistrict" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="license-address" disabled class='inputbox-ext input-disabled'/></td>
                                				</td>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="license-village" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="license-province" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='license-postalCode' disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id='license-city' disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id="license-samsat-area" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab3" dojoType="TabContainer" style="width:100% ; height: 200px;">
                                	<div id="deliveryTab" dojoType="ContentPane" label="Pengiriman" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Alamat</td>
                                				<td>: <input id="delivery-address" value="${salesOrder_edit.shippingAddress.address}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Kelurahan/Desa</td>
                                				<td>: <input id="delivery-village" value="${salesOrder_edit.shippingAddress.village}" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Provinsi</td>
                                				<td>: <input id="delivery-province" value="${salesOrder_edit.shippingAddress.province.name}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Kode Pos</td>
                                				<td>: <input id='delivery-postalCode' value="${salesOrder_edit.shippingAddress.postalCode}" disabled class='input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kota/Kabupaten</td>
                                				<td>: <input id="delivery-city" value="${salesOrder_edit.shippingAddress.city.name}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Wilayah Samsat</td>
                                				<td>: <input id="delivery-samsat-area" value="${salesOrder_edit.shippingAddress.subdistrict.parent.name}" disabled class='inputbox-ext input-disabled'/></td>
                                			</tr>
                                			<tr>
                                				<td>Kecamatan</td>
                                				<td>: <input id="delivery-subdistrict" value="${salesOrder_edit.shippingAddress.subdistrict.name}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                               				</tr>
                                			<tr>
                                				<td>Informasi BPKB</td>
                                				<td>: <input id="delivery-subdistrict" value="${salesOrder_edit.bpkbInfo.name}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td></td>
                                				<td></td>
                               				</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab4" dojoType="TabContainer" style="width:100% ; height: 230px;">
                                	<div id="unitTab" dojoType="ContentPane" label="Motor" class="tab-pages" refreshOnShow="true">
                                		<table width="100%">
                                			<tr>
                                				<td>Product</td>
                                				<td>:
                                					<c:forEach items="${salesOrder_edit.items}" var="items">
                                						<c:set var="item" value="${items}"/>
                                					</c:forEach>
                                					<%-- <c:if test="${deliveryOrder.id != null or !cancel}">
                                						<input value="${item.product.name}" disabled class='inputbox-ext input-disabled'/>
                                					</c:if>
                                					<c:if test="${deliveryOrder.id == null and cancel}">
                                						<form:select id='unit' path='items[0].product' class='combobox-ext'>
                                							<form:option value="${item.product.id}" label="${item.product.name}"/>
                                						</form:select>
	                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openProductByType('unit','${item.product.types}')" style="CURSOR:pointer;" title="Motor" />
                                					</c:if> --%>
                                					<c:if test="${deliveryOrder.id != null}">
                                						<input value="${item.product.name}" disabled class='inputbox-ext input-disabled'/>
                                					</c:if>
                                					<c:if test="${deliveryOrder.id == null}">
                                						<form:select id='unit' path='items[0].product' class='combobox-ext'>
                                							<form:option value="${item.product.id}" label="${item.product.name}"/>
                                						</form:select>
	                                					<img src="assets/icons/list_extensions.gif" onclick="javascript:openProductByType('unit','${item.product.types}')" style="CURSOR:pointer;" title="Motor" />
                                						<input type="hidden" id="unit-price-on" value="0"/><input type="hidden" id="unit-price-off" value="0"/>
                                					</c:if>
                                				</td>
                                				<td>Pembayaran</td>
                                				<td>:&nbsp;${salesOrder_edit.unitPayment}
                                			</tr>
                                			<tr>
                                				<td>Tipe</td>
                                				<td>:&nbsp;<input id="unit-type" value="${item.product.types}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Leasing</td>
                                				<td>:
                                					<c:if test="${canEdit == 'insert'}">
	                                					<select id="leasing" name="leasing" class="combobox-medium">
				                                            <c:if test='${not empty leasing}'>
				                                                <option value='${leasing.partyLeasing.id}'>${leasing.partyLeasing.name}</option>
				                                            </c:if>
				                                        </select>
				                                        <img src="assets/icons/list_extensions.gif" onclick="javascript:openLeasing('leasing');" style="CURSOR:pointer;" title="Payment Leasing" />
			                                        </c:if>
			                                        <c:if test="${canEdit == 'update'}">
			                                        	<select id="leasing" name="leasing" class="combobox-medium">
				                                            <c:if test='${not empty leasing}'>
				                                                <option value='${leasing.partyLeasing.id}'>${leasing.partyLeasing.name}</option>
				                                            </c:if>
				                                        </select>
			                                        </c:if>
			                                        <c:if test="${canEdit == 'false'}">
			                                        	<select id="leasing" name="leasing" disabled class="input-disabled combobox-medium">
				                                            <c:if test='${not empty leasing}'>
				                                                <option value='${leasing.partyLeasing.id}'>${leasing.partyLeasing.name}</option>
				                                            </c:if>
				                                        </select>
			                                        </c:if>
			                                        Tenor&nbsp;:&nbsp;<input id="leasing-term" name='leasingterm' size="5" value="<fmt:formatNumber value='${leasing.tenor}' pattern='#,###'/>"/>
			                                        <input type="hidden" id="edit-status" name='editstatus' value="${canEdit}"/>
			                                        <input type="hidden" id="leasingApp-id" name='leasingAppId' value="${leasing.id}"/>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td>Nama Tipe</td>
                                				<td>:&nbsp;<input id="unit-type-name" value="${item.product.typeNames}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Top Angsuran</td>
                                				<td>:&nbsp;<input id="unit-installment" name='unitinstallment' class='inputbox' value="<fmt:formatNumber value='${leasing.installment}' pattern='#,###'/>"/></td>
                                			</tr>
                                			<tr>
                                				<td>Warna</td>
                                				<td>:&nbsp;<input id="unit-color" value="${item.product.colors}" disabled class='inputbox-ext input-disabled'/></td>
                                				<td>Uang Muka PO</td>
                                				<td>:&nbsp;<input id="unit-prepayment-po" class='inputbox' name="poPrepayment" value="<fmt:formatNumber value='${(not empty leasing)?salesOrder_edit.poPrepayment:0}' pattern='#,###'/>"/></td>
                                			</tr>
                               				<tr>
                                				<td>Tipe Harga</td>
                                				<td>:
                                					<input type="hidden" id="unit-pricetype" value="${item.priceType}"/>
                                					<c:if test="${item.priceType == 'ON_THE_ROAD'}">
                                						ON THE ROAD
                                					</c:if>
                                					<c:if test="${item.priceType == 'OFF_THE_ROAD'}">
                                						OFF THE ROAD
                                					</c:if>
                                				</td>
                                				<td>Uang Muka Murni</td>
                                				<td>:
                                					<input id="unit-pureprepayment-po" class='input-disabled' disabled value="<fmt:formatNumber value='${(not empty leasing)?salesOrder_edit.prepayment:0}' pattern='#,###'/>"/>
                                					<input type="hidden" id="unit-pureprepayment-po-hidden" class='inputbox' name="prepayment" value="<fmt:formatNumber value='${(not empty leasing)?salesOrder_edit.prepayment:0}' pattern='#,###'/>"/>
                                				</td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab51" dojoType="TabContainer" style="width:100% ; height: 160px;">
                                	<div id="leasingTab" dojoType="ContentPane" label="Uang Muka" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="leasingTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                			<thead>
                                				<tr>
                                					<th>Kode</th>
                                					<th>Jumlah</th>
                                				</tr>
                                			</thead>
                                			<tbody>
                                				<c:forEach items="${salesOrder_edit.prepayments}" var="prep" varStatus="status">
                                					<tr>
	                                					<td>${prep.prepayment.code}</td>
	                                					<td><fmt:formatNumber value='${prep.amount}' pattern='#,###'/></td>
	                                				</tr>
                                				</c:forEach>
                                			</tbody>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab5" dojoType="TabContainer" style="width:100% ; height: 160px;">
                                	<div id="leasingTab" dojoType="ContentPane" label="Pendanaan" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="leasingTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                			<thead>
                                				<tr>
                                					<th>Urutan</th>
                                					<th>Pendanaan</th>
                                					<th>Tenor</th>
                                					<th>TOP Angsuran</th>
                                					<th>Status</th>
                                				</tr>
                                			</thead>
                                			<tbody>
                                				<c:forEach items="${salesOrder_edit.leasingApps}" var="leas" varStatus="status">
                                					<tr>
	                                					<td>${status.index+1}</td>
	                                					<td>${leas.partyLeasing.name}</td>
	                                					<td>${leas.tenor}</td>
	                                					<td>${leas.installment}</td>
	                                					<td>
	                                						<c:if test="${leas.status=='APPROVED'}">Di Setujui</c:if>
															<c:if test="${leas.status=='IN_PROGRESS'}">Dalam Proses</c:if>
															<c:if test="${leas.status=='REJECTED'}">Di Tolak</c:if>
	                                					</td>
	                                				</tr>
                                				</c:forEach>
                                			</tbody>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab6" dojoType="TabContainer" style="width:100% ; height: 150px;">
                                	<div id="subdictionNonDealerTab" dojoType="ContentPane" label="Subsidi Bukan Beban Dealer" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="subdictionTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="15%">Kategori</th>
		                                            <th width="12%">Nama Program</th>
		                                            <th width="8%">Budget</th>
		                                            <th width="12%">Konsumen</th>
		                                            <th width="15%">Mediator</th>
		                                            <th width="15%">Total</th>
		                                            <th width="15%">Sisa Budget</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach items="${salesOrder_edit.subdictions}" var="sub" varStatus="status">
	                                        	<c:if test='${sub.subdiction.type == "LEASING" || sub.subdiction.type == "MAIN_DEALER"}'>
		                                        	<tr>
		                                        		<td>
			                                        		<c:if test='${sub.subdiction.type == "LEASING"}'>
			                                        			LEASING<input type="hidden" value="${status.index}" name="subdictionIdx"/>
			                                        		</c:if>
			                                        		<c:if test='${sub.subdiction.type == "MAIN_DEALER"}'>
			                                        			MAIN DEALER<input type="hidden" value="${status.index}" name="subdictionIdx"/>
			                                        		</c:if>
		                                        		</td>
		                                        		<td>${sub.name}</td>
		                                        		<c:if test="${canEdit == 'insert'}">
		                                        			<c:if test="${sub.subdiction.type == 'LEASING'}">
			                                        			<td>
			                                        				<input id='leasingAmount' value="<fmt:formatNumber value='${sub.subdiction.money.amount}' pattern='#,###'/>" class="input-disabled" disabled/>
			                                        				<input id='leasingAmountHidden' name="subdictionLeasingId" value="0" type="hidden"/>
			                                        			</td>
			                                        			<td>
			                                        				<input id="leasingAmount1" name="amount1" value="<fmt:formatNumber value='${sub.amount}' pattern='#,###'/>" onkeyup="separator('leasingAmount1');" onchange="calculate();"/>
			                                        				<input id="leasingAmount1Hidden" value='${sub.amount}' type="hidden"/>
			                                        			</td>
			                                        			<td>
			                                        				<input id="leasingAmount2" name="amount2" value="<fmt:formatNumber value='${sub.amount2}' pattern='#,###'/>" onkeyup="separator('leasingAmount2');" onchange="calculate();"/>
			                                        				<input id="leasingAmount2Hidden" value='${sub.amount2}' type="hidden"/>
			                                        			</td>
			                                        			<td><input id="leasingAmountTotal" value="<fmt:formatNumber value='${sub.amount+sub.amount2}' pattern='#,###'/>" class="input-disabled"/></td>
			                                        			<td><input id="leasingAmountRemaining" value="<fmt:formatNumber value='${sub.subdiction.money.amount-(sub.amount+sub.amount2)}' pattern='#,###'/>" class="input-disabled"/></td>
		                                        			</c:if>
		                                        			<c:if test="${sub.subdiction.type != 'LEASING'}">
			                                        			<td><fmt:formatNumber value='${sub.subdiction.money.amount}' pattern='#,###'/></td>
			                                        			<td><fmt:formatNumber value='${sub.amount}' pattern='#,###'/></td>
				                                        		<td><fmt:formatNumber value='${sub.amount2}' pattern='#,###'/></td>
				                                        		<td><fmt:formatNumber value='${sub.amount+sub.amount2}' pattern='#,###'/></td>
		                                        				<td><fmt:formatNumber value='${sub.subdiction.money.amount-(sub.amount+sub.amount2)}' pattern='#,###'/></td>
		                                        			</c:if>
		                                        		</c:if>
		                                        		<c:if test="${canEdit != 'insert'}">
		                                        			<td><fmt:formatNumber value='${sub.subdiction.money.amount}' pattern='#,###'/></td>
		                                        			<td><fmt:formatNumber value='${sub.amount}' pattern='#,###'/></td>
			                                        		<td><fmt:formatNumber value='${sub.amount2}' pattern='#,###'/></td>
			                                        		<td><fmt:formatNumber value='${sub.amount+sub.amount2}' pattern='#,###'/></td>
		                                        			<td><fmt:formatNumber value='${sub.subdiction.money.amount-(sub.amount+sub.amount2)}' pattern='#,###'/></td>
	                                        			</c:if>
	                                        		</tr>
                                        		</c:if>
	                                        	</c:forEach>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab7" dojoType="TabContainer" style="width:100% ; height: 150px;">
                                	<div id="subdictionTab" dojoType="ContentPane" label="Subsidi Beban Dealer" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="subdictionTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="15%">Kategori</th>
		                                            <th width="12%">Nama Program</th>
		                                            <th width="8%">Budget</th>
		                                            <th width="12%">Konsumen</th>
		                                            <th width="15%">Mediator</th>
		                                            <th width="15%">Total</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach items="${salesOrder_edit.subdictions}" var="sub" varStatus="status">
	                                        	<c:if test='${sub.subdiction.type == "DISC_PROGRAM" || sub.subdiction.type == "DISC_DEALER"}'>
		                                        	<tr>
		                                        		<td>
			                                        		<c:if test='${sub.subdiction.type == "DISC_DEALER"}'>
			                                        			DISCOUNT DEALER<input type="hidden" value="${status.index}" name="subdictionIdx"/>
			                                        		</c:if>
			                                        		<c:if test='${sub.subdiction.type == "DISC_PROGRAM"}'>
			                                        			DISCOUNT PROGRAM<input type="hidden" value="${status.index}" name="subdictionIdx"/>
			                                        		</c:if>
		                                        		</td>
		                                        		<td>${sub.name}</td>
		                                        		<td><fmt:formatNumber value='${sub.subdiction.money.amount}' pattern='#,###'/></td>
		                                        		<td><fmt:formatNumber value='${sub.amount}' pattern='#,###'/></td>
		                                        		<td><fmt:formatNumber value='${sub.amount2}' pattern='#,###'/></td>
		                                        		<td><fmt:formatNumber value='${sub.amount+sub.amount2}' pattern='#,###'/></td>
	                                        		</tr>
                                        		</c:if>
	                                        	</c:forEach>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="7">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab8" dojoType="TabContainer" style="width:100% ; height: 120px;">
                                	<div id="mediatorTab" dojoType="ContentPane" label="Mediator" class="tab-pages" refreshOnShow="true">
                                		<table>
                                			<tr>
                                				<td>Nama Mediator</td>
                                				<td>: <input value="${salesOrder_edit.secondarySales.name}" disabled class='inputbox-ext input-disabled'/>
                                				</td>
                                			</tr>
                                			<tr>
                                				<td>Jumlah Komisi Mediator</td>
                                				<td>:
                                					<input id="mediator-comission" value="<fmt:formatNumber value='${salesOrder_edit.secondarySalesCom}' pattern='#,###'/>" size="14" disabled class='input-disabled'/>
                                					<%-- <input id="mediator-comission-manual" value="<fmt:formatNumber value='${salesOrder_edit.secondarySalesComManual}' pattern='#,###'/>" size="14" disabled class='input-disabled'/>
                                					<input id="mediator-comission-total" value="<fmt:formatNumber value='${salesOrder_edit.secondarySalesCom+salesOrder_edit.secondarySalesComManual}' pattern='#,###'/>" size="15" disabled class='input-disabled'/> --%>
                                				</td>
                                			</tr>
                                		</table>
                                	</div>
                               	</div>
                               	<div>&nbsp;</div>
                               	<div id="mainTab9" dojoType="TabContainer" style="width:100% ; height: 180px;">
                                	<div id="extrasTab" dojoType="ContentPane" label="Tambahan" class="tab-pages" refreshOnShow="true">
                                		<table class="table-list" id="extrasTable" cellspacing="0" cellpadding="0" align="center" width="100%">
	                                        <thead>
		                                        <tr>
		                                            <th width="1%">&nbsp;</th>
		                                            <th width="25%">Nama</th>
		                                            <th width="74%">Jumlah</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
                                        		<c:forEach items="${salesOrder_edit.subdictions}" var="sub" varStatus="status">
	                                        		<c:if test='${sub.subdiction.type=="EXTRA"}'>
		                                        	<tr>
		                                        		<td>&nbsp;</td>
		                                        		<td>${sub.name}</td>
		                                        		<td><input value="<fmt:formatNumber value='${sub.amount}' pattern='#,###'/>" disabled class='input-disabled'/></td>
	                                        		</tr>
	                                        		</c:if>
	                                        	</c:forEach>
	                                        </tbody>
                                       		<tfoot><tr class="end-table"><td colspan="3">&nbsp;</td></tr></tfoot>
                                        </table>
                                	</div>
                                </div>
							</form:form>
						</div>
						 <div class="info">Created by : <c:out value='${salesOrder_edit.createdBy.firstName} ${salesOrder_edit.createdBy.middleName} ${salesOrder_edit.createdBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${salesOrder_edit.updatedBy.firstName} ${salesOrder_edit.updatedBy.middleName} ${salesOrder_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${salesOrder_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
<script type="text/javascript">
function setCustomerInfo(id,cust)
{
	$.get("<c:url value='/page/partyremote.getdetail.json'/>",{id:cust},function(json){
		$("#"+id+"-address").val(json.address);
		$("#"+id+"-postalCode").val(json.postalCode);
		$("#"+id+"-province").val(json.province);
		$("#"+id+"-phone").val(json.phone);
		$("#"+id+"-phone2").val(json.phone2);
		$("#"+id+"-city").val(json.city);
		$("#"+id+"-samsat-area").val(json.subdistrictParent);
		$("#"+id+"-subdistrict").val(json.subdistrict);
		$("#"+id+"-village").val(json.village);
		$("#"+id+"-email").val(json.email);
	});
}

function checkLeasing(tenor)
{
	if(${canEdit == 'insert' || canEdit == 'update'})
	{
		$("#leasing-term").val(tenor);
		$("#leasing-term").removeAttr("disabled");
		$("#unit-installment").removeAttr("disabled");
		$("#unit-prepayment-po").removeAttr("disabled");
		//$("#unit-pureprepayment-po").attr("disabled","true");
		$("#leasing-term").removeAttr("class");
		$("#unit-installment").attr("class","");
		$("#unit-prepayment-po").attr("class","");
		//$("#unit-pureprepayment-po").attr("class","input-disabled");
	}
	else
	{
		$("#leasing-term").val(tenor);
		$("#leasing-term").attr("disabled","true");
		$("#unit-installment").attr("disabled","true");
		//$("#unit-prepayment-po").attr("disabled","true");
		$("#unit-pureprepayment-po").attr("disabled","true");
		$("#leasing-term").attr("class", "input-disabled");
		$("#unit-installment").attr("class","input-disabled");
		$("#unit-prepayment-po").attr("class","input-disabled");
		//$("#unit-pureprepayment-po").attr("class","input-disabled");
	}
}

function openLeasing(target)
{
	var org = document.getElementById('org');
	if(org.value == '')
	{
		alert('Please select Company first !!!');
		return;
	}
	openpopup("<c:url value='/page/paymentleasingpopupview.htm?target="+target+"&organization="+org.value+"&salesId=${salesOrder_edit.id}'/>");
}

setCustomerInfo("cust","${salesOrder_edit.customer.id}");
setCustomerInfo("license","${salesOrder_edit.customerUnit.id}");
checkLeasing("${leasing.tenor}");

$(".item-button-save").click(function(){
	$(".item-button-save").hide();
	$(".item-button-delete").hide();
	$.ajax({
		url:"<c:url value='/page/unitsalesorderupdate.htm'/>",
		data:$('#addForm').serialize(),
		type : 'POST',
		dataType : 'json',
		beforeSend:function()
		{
			$dialog.empty();
			$dialog.html('Update Unit Sales Order data......');
			$dialog.dialog('open');
		},
		success : function(json) {
			if(json)
			{
				if(json.status == 'OK')
				{
					$dialog.dialog('close');
					window.location="<c:url value='/page/unitsalesorderpreedit.htm?id=${salesOrder_edit.id}'/>";
				}
				else
				{
					$dialog.empty();
					$dialog.html('Proccess fail,reason:<br/>'+json.message);
				}
			}
		}
	});
});

$(".item-button-delete").click(function(){
	var $dialog_confirm = $('<div title="Cancel Unit Sales Order"></div>')
	.html('Anda yakin akan membatalkan transaksi SO dengan kode '+$("#soCode").val()+' ?');

	$dialog_confirm.dialog({
		resizable: false,
		height:140,
		modal: true,
		buttons: {
			"Yes": function()
			{
				$( this ).dialog( "close" );
				$(".item-button-save").hide();
				$(".item-button-delete").hide();
				$.ajax({
					url:"<c:url value='/page/unitsalesorderdelete.htm?id=${salesOrder_edit.id}'/>",
					data:$('#addForm').serialize(),
					method : 'POST',
					dataType:'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Canceling Unit Sales Order data......');
						$dialog.dialog('open');
					},
					success : function(json)
					{
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitsalesorderview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason :<br/>'+json.message);
							}
						}
					}
				});
			},
			"No": function()
			{
				$( this ).dialog( "close" );
			}
		}
	});
});

$(function()
{
	$("#unit-prepayment-po").focus(function()
	{
		var total = 0;
		var prepayment = new Number($("#unit-prepayment-po").val().replace(/,/g,''));
		<c:forEach items="${salesOrder_edit.subdictions}" var="sub">
			<c:if test='${sub.subdiction.type != "EXTRA"}'>
				total = total+${sub.amount};
			</c:if>
		</c:forEach>
		var pureprepayment = prepayment-total;
		$("#unit-pureprepayment-po").val(pureprepayment.numberFormat("#,###"));
		$("#unit-pureprepayment").val(pureprepayment.numberFormat("#,###"));
		$("#unit-pureprepayment-po-hidden").val(pureprepayment.numberFormat("#,###"));
	}).change(function()
	{
		var total = 0;
		var prepayment = new Number($("#unit-prepayment-po").val().replace(/,/g,''));
		<c:forEach items="${salesOrder_edit.subdictions}" var="sub">
			<c:if test='${sub.subdiction.type != "EXTRA"}'>
				total = total+${sub.amount};
			</c:if>
		</c:forEach>
		var pureprepayment = prepayment-total;
		$("#unit-pureprepayment-po").val(pureprepayment.numberFormat("#,###"));
		$("#unit-pureprepayment").val(pureprepayment.numberFormat("#,###"));
		$("#unit-pureprepayment-po-hidden").val(pureprepayment.numberFormat("#,###"));
	});
});

function getSubdictionLeasing()
{
	var idProduct = document.getElementById('unit').value;
	var idOrganization = document.getElementById('org').value;
	
	$.get("<c:url value='/page/productremote.getsubdictionleasing.json'/>",{productId:idProduct,leasingId:$("#leasing").val(),organizationId:idOrganization},
	function(json)
	{
		if(json.subdictions.length > 0)
		{
			$.each(json.subdictions,function(idx,val)
			{
				$("#leasingAmount").val(new Number(val.amount).numberFormat('#,###'));
				$("#sub-leasing").val(new Number(val.amount).numberFormat('#,###'));
				$("#leasingAmount1").val(new Number(0));
				$("#leasingAmount2").val(new Number(0));
				$("#leasingAmountTotal").val(new Number(0));
				$("#leasingAmountRemaining").val(new Number(0));
				$("#leasingAmountHidden").val(val.id);
			});
		}
		else
		{
			$("#leasingAmount").val(new Number(0));
			$("#leasingAmount1").val(new Number(0));
			$("#leasingAmount2").val(new Number(0));
			$("#leasingAmountTotal").val(new Number(0));
			$("#leasingAmountRemaining").val(new Number(0));
			$("#leasingAmountHidden").val(0);
		}
	});
}

function separator(id)
{
	var amount = document.getElementById(id);
	
	if(amount.value != '')
	{
		amount.value = (parseFloat(amount.value.replace(/,/g,''))).numberFormat('#,###');
	}
}

function calculate()
{
	var leasAmt1 = document.getElementById('leasingAmount1');
	var amount1 = new Number(0);
	var amount1Hidden = new Number(0);
	if(leasAmt1)
	{
		amount1 = new Number($("#leasingAmount1").val().replace(/,/g,''));
		amount1Hidden = new Number($("#leasingAmount1Hidden").val().replace(/,/g,''));
	}
	
	var leasAmt2 = document.getElementById('leasingAmount2');
	var amount2 = new Number(0);
	var amount2Hidden = new Number(0);
	if(leasAmt2)
	{
		amount2 = new Number($("#leasingAmount2").val().replace(/,/g,''));
		amount2Hidden = new Number($("#leasingAmount2Hidden").val().replace(/,/g,''));
	}
	var total = amount1+amount2;
	var remaining = new Number(0);
	var leas = document.getElementById('leasingAmount');
	if(leas)
		remaining = new Number($("#leasingAmount").val().replace(/,/g,''))-total;
	
	if(new Number(remaining) < 0)
	{
		$("#leasingAmount1").val(new Number(0));
		$("#leasingAmount2").val(new Number(0));
		$("#leasingAmountTotal").val(new Number(0));
		$("#leasingAmountRemaining").val(new Number(0));
		alert('Total Amount tidak boleh melebihi Budget !!!');
		return;
	}
	var customerAmount = new Number($("#sub-discount-hidden").val().replace(/,/g,''));
	var mediatorAmount = new Number($("#mediator-com-hidden").val().replace(/,/g,''));
	$("#sub-discount").val(new Number(customerAmount-amount1Hidden+amount1).numberFormat('#,###'));
	$("#mediator-com").val(new Number(mediatorAmount-amount2Hidden+amount2).numberFormat('#,###'));
	$("#mediator-comission").val(new Number(mediatorAmount-amount2Hidden+amount2-new Number($("#mediator-comission-manual").val().replace(/,/g,''))).numberFormat('#,###'));
	$("#mediator-comission-total").val(new Number(mediatorAmount-amount2Hidden+amount2).numberFormat('#,###'));
	$("#leasingAmountTotal").val(new Number(total).numberFormat('#,###'));
	$("#leasingAmountRemaining").val(new Number(remaining).numberFormat('#,###'));
}

function flagPrice(status)
{
	var orgId = $("#org").val();
	var productId = $("#unit").val();
	
	if(status == "on")
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"ON_THE_ROAD"},
		function(json)
		{
			/* $.each(json.prices,function(idx,val)
			{ */
				$("#unit-price").val(new Number(json.price).numberFormat("#,###"));
				$("#unit-price-on").val(new Number(json.price).numberFormat("#,###"));
			/* }); */
		});
	}
	else
	{
		$.get("<c:url value='/page/productstandardpriceremote.getsellingprice.json'/>",{org:orgId,product:productId,unitPriceType:"OFF_THE_ROAD"},
		function(json)
		{
			/* $.each(json.prices,function(idx,val)
			{ */
				$("#unit-price").val(new Number(json.price).numberFormat("#,###"));
				$("#unit-price-off").val(new Number(json.price).numberFormat("#,###"));
			/* }); */
		});
	}
}
</script>
</body>
</html>
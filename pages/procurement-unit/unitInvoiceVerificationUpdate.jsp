<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title><spring:message code="unitinvoice.htmltitle"/></title>
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
			<td width="60%"><spring:message code="unitinvoice.breadcrumb"/></td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">

						<h1 class="page-title"><spring:message code="unitinvoice.title"/></h1>

					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/unitinvoiceverificationview.htm'/>"><span><spring:message code="list"/></span></a>
					  	</div>

						<div class="main-box">
								<table width="100%" border="0">
                                <tr>
                                	<td width="59%">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="28%" nowrap="nowrap" align="right"><spring:message code="id"/></td>
                                          <td width="72%"><input value="${verification.code }" class='input-disabled' size='25' disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas</td>
                                            <td>
                                            	<select class="combobox-ext input-disabled" disabled>
                                            		<option>${verification.organization.code} ${verification.organization.name}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Gudang Penerimaan</td>
                                            <td>
                                            	<select class="combobox-ext input-disabled" disabled>
                                            		<option>${verification.location.name}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal</td>
                                            <td><input class="input-disabled" disabled value="<fmt:formatDate value='${verification.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Pemasok</td>
                                            <td>
                                            	<select disabled class="combobox-ext input-disabled">
                                            		<option>${verification.supplier.name}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No. Nota Debit</td>
                                            <td><input class='input-disabled' disabled value="${verification.invoice}"/></td>
                                        </tr>
                                        <%-- <tr>
                                            <td nowrap="nowrap" align="right">No. Surat Jalan</td>
                                            <td><input class='input-disabled' disabled value="${verification.deliveryOrderNo}"/></td>
                                        </tr> --%>
                                        <tr>
                                            <td nowrap="nowrap" align="right">No. Sales Order</td>
                                            <td><input class='input-disabled' disabled value="${verification.salesOrderNo}"/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tanggal Jatuh Tempo</td>
                                            <td><input value="<fmt:formatDate value='${verification.dueDate}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled/></td>
                                         </tr>
                                        <tr>
                                            <td align="right">Mata Uang</td>
                                            <td>
                                               	<select disabled class=" input-disabled">
                                            		<option>${verification.currency.name}</option>
                                            	</select>
                                               	<select disabled class=" input-disabled">
                                            		<option>${verification.exchangeType}</option>
                                            	</select>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Diskon Satuan</td>
                                            <td>
                                            	<select disabled class="input-disabled">
                                            		<option>${verification.discount.name}</option>
                                            	</select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tipe Pajak</td>
                                            <td>
                                            	<select disabled class="input-disabled">
                                            		<option>${verification.tax.taxName}</option>
                                            	</select>
                                                <input size="7" id="taxRate" class="input-disabled" value="<fmt:formatNumber value='${verification.tax.taxRate}'/>" disabled/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Catatan :</td>
                                            <td><textarea cols='37' rows='4' disabled class='input-disabled'>${verification.note }</textarea></td>
                                        </tr>
                                        </table>
                                    </td>
                       		  		<td width="41%" valign="top">
                       		  			<fieldset>
	                       		  			<legend><strong>Journal Reference</strong></legend>
	                                        <table style="border:none" width="100%">
											<tr>
	                                        	<td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
												<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${verification.journalEntry.id}'/>">${verification.journalEntry.code}</td>
	                                        </tr>
	                                        </table>
                                        </fieldset>
                       		  			<fieldset>
                       		  				<legend><strong>Payment</strong></legend>
                                              <table style="border:none" width="100%">
                                              <tr>
                                              	<td colspan="2" align="right"><h2><c:out value='${verification.status}'/></h2></td>
                                              </tr>
                                              <tr>
                                              	<td align="right">Unpaid Amount :</td>
                                                  <td align="right"><input size="12" style="text-align:right" class="input-disabled" disabled value="<fmt:formatNumber value='${verification.unpaid}' pattern=',##0.00'/>"/></td>
                                              </tr>
                                              <tr>
                                              	<td align="right">Payment :</td>
                                                  <td align="right">
                                                  	<c:forEach items='${verification.applications}' var='application'>
                                              			<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a><br/>
                                              		</c:forEach>
                                                  </td>
                                              </tr>
                                              </table>
                                          </fieldset>
										<fieldset>
                                       		<legend><strong>Rekap Transaksi</strong></legend>
                                            <table width="100%" style="border:none"  >
                                            <tr>
                                            	<th width="60%">&nbsp;</th>
                                           	  	<th width="20%"><div id="trx">Jumlah</div></th>
                                           	  	<th width="20%">Jumlah (<c:out value='${default.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                            	<td align="right">Transaksi : </td>
                                                <td><input id="transaction" value="<fmt:formatNumber value='${adapter.transaction}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13" /></td>
                                                <td><input id="transactionDef" value="<fmt:formatNumber value='${adapter.transaction*verification.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Potongan Harga Satuan</td>
                                                <td><input id="discount" value="<fmt:formatNumber value='${adapter.discount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discountDef" value="<fmt:formatNumber value='${adapter.discount}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Potongan Harga Lain-Lain</td>
                                                <td><input id="otherdisc" value="<fmt:formatNumber value='${verification.rounding}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="otherdiscDef" value="<fmt:formatNumber value='${verification.rounding*verification.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">DPP</td>
                                                <td><input id="nett" value="<fmt:formatNumber value='${adapter.nett}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="neffDef" value="<fmt:formatNumber value='${adapter.nett*verification.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">PPN</td>
                                                <td><input id="tax" value="<fmt:formatNumber value='${adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxDef" value="<fmt:formatNumber value='${adapter.tax*verification.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                            	<td align="right">Total</td>
                                                <td><input id="total" value="<fmt:formatNumber value='${adapter.nett+adapter.tax}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="<fmt:formatNumber value='${(adapter.nett+adapter.tax)*verification.exchange.rate}' pattern=',##0.00'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            </table>
                                        </fieldset>
                                  </td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                <div id="info" dojoType="ContentPane" label="Transaksi" class="tab-pages" refreshOnShow="true">
                                    <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                    	<th width="1%">&nbsp;</th>
                                        <th><spring:message code='product'/></th>
                                        <th width="7%"><spring:message code="type"/></th>
                                        <th width="10%"><spring:message code="typename"/></th>
                                        <th width="10%"><spring:message code="color"/></th>
                                        <th width="5%"><spring:message code="quantity"/></th>
                                        <th width="8%"><spring:message code="price"/></th>
                                        <th width="7%"><spring:message code="discount"/></th>
                                        <th width="15%"><spring:message code="total"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    	 <c:forEach items="${verification.items}" var="item" varStatus='itemStatus'>
                                    	 <c:set var="discAmount" value="${(verification.discount.amount*(item.unitPrice*item.received))/100}"/>
		                                <tr>
		                                	<td>&nbsp;</td>
		                                    <td><c:out value='${item.productPrice.product.name}'/></td>
		                                    <td><c:out value='${item.productPrice.product.types}'/></td>
		                                    <td><c:out value='${item.productPrice.product.typeNames}'/></td>
		                                    <td><c:out value='${item.productPrice.product.colors}'/></td>
		                                    <td><fmt:formatNumber value='${item.received}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.unitPrice}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${item.amountDiscount}' pattern=',##0.00'/></td>
		                                    <td><fmt:formatNumber value='${(item.unitPrice * item.received)}' pattern=',##0.00'/></td>
		                                </tr>
		                                </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="13">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div>
                                 <%-- <div id="otherdiscPane" dojoType="ContentPane" label="Potongan Harga" class="tab-pages" refreshOnShow="true">
                                    <table class="table-list" id="otherdisctable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                    <thead>
                                    <tr>
                                        <th><spring:message code="type"/></th>
                                        <th width="50%"><spring:message code="amount"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${verification.components}" var="com">
                                    		<td>${com.component.name}</td>
                                    		<td><fmt:formatNumber value='${com.amount}'/></td>
                                    	</c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <tr class="end-table"><td colspan="10">&nbsp;</td></tr>
                                    </tfoot>
                                    </table>
                                </div> --%>
						</div>
					</div>
					<div class="info">Created by : <c:out value='${verification.createdBy.firstName} ${verification.createdBy.middleName} ${verification.createdBy.lastName}'/> (<fmt:formatDate value='${verification.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${verification.updatedBy.firstName} ${verification.updatedBy.middleName} ${verification.updatedBy.lastName}'/> (<fmt:formatDate value='${verification.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
				</div>
			</div>
		</div>
	</div>
  	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
</html>

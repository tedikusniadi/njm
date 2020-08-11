<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>${title}</title>
	<%@ include file="/common/sirius-header.jsp" %>
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
							<a class="item-button-back" href="javascript:history.back();"><span><spring:message code='back'/></span></a>
                            <c:if test='${access.add}'>
								<a id="save" class="item-button-save" style="cursor:pointer;"><span><spring:message code='save'/></span></a>
                            </c:if>
					  	</div>

						<div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute="verification">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                	<td width="50%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="29%" nowrap="nowrap" align="right">No. Verifikasi :</td>
                                       	  <td width="71%"><input value="${verification.code}" disabled class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Fasilitas :</td>
                                            <td>
                                                <select id="org" class="combobox-ext input-disabled" disabled='true'>
                                                   <option value='${verification.organization.id}'>${verification.organization.name}</option>
                                                </select>
                                            </td>
                                        </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Tanggal :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatDate value='${verification.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">Pemasok :</td>
		                                    <td>
		                                        <form:select id="supplier" path="supplier" class="combobox-ext">
		                                            <c:if test='${not empty verification.supplier}'>
		                                                <form:option value='${verification.supplier.id}' label='${verification.supplier.name}' />
		                                            </c:if>
		                                        </form:select>
		                                    </td
		                                </tr>
                                       <tr>
                                            <td nowrap="nowrap" align="right">Tanggal Jatuh Tempo :</td>
                                            <td><input disabled class="input-disabled" value="<fmt:formatDate value='${verification.dueDate}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
		                                <tr>
		                                    <td nowrap="nowrap" align="right">No. Referensi :</td>
		                                    <td>
		                                        <select id="supplier" class="combobox-ext">
		                                            <c:if test='${not empty verification.purchaseOrder}'>
		                                                <option>${verification.purchaseOrder.code}</option>
		                                            </c:if>
		                                        </select>
		                                    </td
		                                </tr>
                                        <tr>
                                            <td align="right">Currency :</td>
                                            <td>
                                                <form:select id='currency' path='currency'>
                                                    <form:option value='${verification.currency.id}' label='${verification.currency.symbol}' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <form:select id='type' path='exchangeType'>
                                                    <form:option value='${verification.exchangeType}' label='${verification.exchangeType}' onclick='display();'/>
                                                </form:select>
                                                &nbsp;
                                                <input id="trxrate" class="input-disabled" disabled value="<fmt:formatNumber value='${verification.exchange.rate}' pattern=',##0.00'/>" size="10"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Tax :</td>
                                            <td>
                                                <form:select id='taxType' path='tax'>
                                                   	<form:option value='${verification.tax.id}' label='${verification.tax.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" value="<fmt:formatNumber value='${verification.tax.taxRate}' pattern=',##0.00'/>" disabled/>
                                                %
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Note :</td>
                                            <td><form:textarea path="note" cols="55" rows="7"/></td>
                                        </tr>
                                    	</table>
                                    </td>
                                    <td width="44%" align="center" valign="top">
                                    <table style="border:none" width="100%">
                                    <tr>
                                    <td>
                                		<fieldset>
                                            <legend><strong>Referensi</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                              	<td align="right" width="60%">Purchase Order No : </td>
                                                <td><a href="<c:url value='/page/sparepartpurchaseorderpreedit.htm?id=${verification.purchaseOrder.id}'/>">${verification.purchaseOrder.code}</td>
                                            </tr>
                                            <tr>
                                              	<td align="right" valign="top">Good Receipt : </td>
                                                <td>
		                                            <c:forEach items="${receipts}" var="receipt">
		                                                <a href="<c:url value='/page/goodsreceiptsparepartpreedit.htm?id=${receipt.id}'/>">${receipt.code}</a></br>
		                                            </c:forEach>
                                                </td>
                                            </tr>
                                            <c:forEach items='${verification.verifications}' var='ver'>
                                            <tr>
                                              	<td align="right" valign="top">Journal Reference : </td>
                                                <td><a href="<c:url value='/page/journalentrypreview.htm?id=${ver.journalEntry.id}'/>">${ver.journalEntry.code}</td>
                                            </tr>
                                            </c:forEach>
                                      		</table>
                                        </fieldset>
                                    </td>
                                  	</tr>
                                  	<tr>
                                    <td>
                                		<fieldset>
                                            <legend><strong>Pembayaran</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                            <c:if test="${adapter.unpaid > 0}">
                                              	<td colspan="2" align="right" style="color:red;"><h1>Belum Lunas</h1></td>
                                            </c:if>
                                            <c:if test="${adapter.unpaid == 0}">
                                              	<td colspan="2" align="right" style="color:green;"><h1>Lunas</h1></td>
                                            </c:if>
                                            </tr>
                                            <tr>
                                              	<td align="right" width="60%">Jumlah Hutang : </td>
                                                <td><input id="purchase" value="<fmt:formatNumber value='${adapter.unpaid}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right" valign="top">Payment : </td>
                                                <td>
		                                            <c:forEach items="${payments}" var="payment">
		                                                <a href="<c:url value='/page/paymentpreedit.htm?id=${payment.id}'/>">${payment.code}</a></br>
		                                            </c:forEach>
                                                </td>
                                            </tr>
                                      		</table>
                                        </fieldset>
                                    </td>
                                  	</tr>
                                    <tr>
                                   	<td>
                                		<fieldset>
                                            <legend><strong>Transaction Recapitulation</strong></legend>
                                            <table width="100%" style="border:none">
                                            <tr>
                                              <th width="60%">&nbsp;</th>
                                              <th width="20%">Amount (<c:out value='${verification.exchange.from.symbol}'/>)</th>
                                              <th width="20%">Amount (<c:out value='${verification.exchange.to.symbol}'/>)</th>
                                            </tr>
                                            <tr>
                                              	<td align="right">Purchase : </td>
                                                <td><input id="purchase" value="<fmt:formatNumber value='${adapter.transaction}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="purchaseDef" value="<fmt:formatNumber value='${adapter.transaction}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 1 : </td>
                                                <td><input id="discAmount1" value="<fmt:formatNumber value='${adapter.discount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount1Def" value="<fmt:formatNumber value='${adapter.discount1}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">Discount 2 : </td>
                                                <td><input id="discAmount2" value="<fmt:formatNumber value='${adapter.discount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="discAmount2Def" value="<fmt:formatNumber value='${adapter.discount2}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">DPP : </td>
                                                <td><input id="dppAmount" value="<fmt:formatNumber value='${adapter.dpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="dppAmountDef" value="<fmt:formatNumber value='${adapter.dpp}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              	<td align="right">PPN : </td>
                                                <td><input id="taxamount" value="<fmt:formatNumber value='${adapter.tax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="taxamountDef" value="<fmt:formatNumber value='${adapter.tax}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                            <tr>
                                              <td align="right"><strong>Transaction Amount : </strong></td>
                                                <td><input id="total" value="<fmt:formatNumber value='${adapter.total}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                                <td><input id="totalDef" value="<fmt:formatNumber value='${adapter.total}' pattern='#,###'/>" class="input-disabled" disabled style="text-align:right" size="13"/></td>
                                            </tr>
                                      		</table>
                                        </fieldset>
                                    </td>
                                  	</tr>
                                  	</table>
                                  	</td>
                                </tr>
                                </table>
                            	<div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 250px;">
                                <div id="line" dojoType="ContentPane" label="Barang" class="tab-pages" refreshOnShow="true">
                                    <table id="lineItemTable" width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <thead>
                                    <tr>
	                                    <th width="1%">&nbsp;</th>
	                                    <th width="15%">Product</th>
	                                    <th width="8%">Unit</th>
	                                    <th width="8%">UoM</th>
	                                    <th width="10%">Unit Price</th>                                    
	                                    <th width="10%">Sub Total</th>
	                                    <th width="8%">Disc 1</th>
	                                    <th width="8%">Disc 2</th>
	                                    <th width="10%">Total</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items='${verification.verifications}' var='ver'>
                                    <tr><td colspan="9"><strong>${ver.goodsReceipt.code} (Tipe Diskon : ${ver.goodsReceipt.discountType == 'PERCENT'?'%':'Rp'})</strong></td></tr>
	                                    <c:forEach items='${ver.items}' var='line'>
	                                    <tr>
	                                    	<td>&nbsp;</td>
	                                    	<td nowrap="nowrap"><c:out value='${line.product.code}'/> <c:out value='${line.product.name}'/></td>
	                                        <td><fmt:formatNumber value='${line.quantity}' pattern=',##0.00'/></td>
	                                        <td><c:out value='${line.product.unitOfMeasure.measureId}'/></td>
	                                        <td><fmt:formatNumber value='${line.money.amount}' pattern=',##0.00'/></td>
	                                        <td><fmt:formatNumber value='${line.quantity*line.money.amount}' pattern=',##0.00'/></td>
	                                        <td><fmt:formatNumber value='${line.discount1}' pattern=',##0.00'/></td>
	                                        <td><fmt:formatNumber value='${line.discount2}' pattern=',##0.00'/></td>
	                                        <c:if test="${ver.goodsReceipt.discountType == 'PERCENT'}">
	                                        	<td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.money.amount*line.discount1/100)+(line.quantity*line.money.amount*line.discount2/100))}' pattern=',##0.00'/></td>
	                                        </c:if>
	                                        <c:if test="${ver.goodsReceipt.discountType != 'PERCENT'}">
	                                        	<td><fmt:formatNumber value='${line.quantity*line.money.amount-((line.quantity*line.discount1)+(line.quantity*line.discount2))}' pattern=',##0.00'/></td>
	                                        </c:if>
	                                    </tr>
	                                    </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot><tr class="end-table"><td colspan="9">&nbsp;</td></tr></tfoot>
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
	$(function(){
		$('#save').click(function(){
			$.ajax({
				url:"<c:url value='/page/sparepartinvoiceverificationedit.htm'/>",
				data:$('#editForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Sparepart Verification data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/sparepartinvoiceverificationview.htm'/>";
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
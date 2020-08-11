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
	<%@ include file="/common/sirius-header.jsp"%>
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
                            <a class="item-button-list" href="<c:url value='/page/paymentmanualview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                            	<a class="item-button-save b_entry" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/paymentmanualprint.htm?id=${payment_edit.id}'/>"><span>Print</span></a>
			    			</c:if>
                        </div>
                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='payment_edit'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
		                                <tr>
		                                	<td width="53%" align="left" valign="top">
		                                   	  <table width="100%" style="border:none">
		                                        <tr>
		                                            <td width="24%" align="right"> ID :	</td>
		                                          	<td width="76%"><input size="25" value="${payment_edit.code}" class="input-disabled" disabled/></td>
		                                        </tr>
		                                        <tr>
		                                            <td nowrap="nowrap" align="right">Date :</td>
		                                            <td><input value="<fmt:formatDate value='${payment_edit.date}' pattern='dd-MM-yyyy'/>" size="10" class="input-disabled" disabled/></td>
		                                        </tr>
		                                        <tr>
		                                            <td width="24%" align="right"> Company : </td>
		                              				<td>
		                                                <select class="combobox-ext">
		                                                	<option value='${payment_edit.organization.id}'>${payment_edit.organization.name}</option>
		                                                </select>
		                                          	</td>
		                                        </tr>
		                                        <tr>
				                                    <td align="right">Tipe Payment : </td>
				                                    <td>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'SERVICEAGENT'}">
					                                    	<input size="25" value="BIRO JASA" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'MEDIATOR'}">
					                                    	<input size="25" value="MEDIATOR" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'MAINDEALER'}">
					                                    	<input size="25" value="MAIN DEALER" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'SALESMAN'}">
					                                    	<input size="25" value="SALESMAN" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'LEASING'}">
					                                    	<input size="25" value="LEASING" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'REGION'}">
					                                    	<input size="25" value="SAMSAT" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'DEPOSIT'}">
					                                    	<input size="25" value="DEPOSIT" class="input-disabled" disabled/>
					                                    </c:if>
					                                    <c:if test="${payment_edit.paymentInformation.referenceType == 'RETUR'}">
					                                    	<input size="25" value="RETUR" class="input-disabled" disabled/>
					                                    </c:if>
				                                    </td>
		                                        </tr>
		                                        <c:if test="${not empty payment_edit.referenceDetail}">
		                                        <tr>
				                                    <td align="right">Tipe Payment Detail : </td>
				                                    <c:if test="${payment_edit.referenceDetail == 'BBN'}">
				                                    	<td><input value="BBN" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'SPECIAL_NUMBER'}">
				                                    	<td><input value="NOMOR CANTIK" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'PROGRESSIVE_TAX'}">
				                                    	<td><input value="PAJAK PROGRESIF" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'CROSS_DISTRICT'}">
				                                    	<td><input value="PELANGGARAN WILAYAH" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'TEMPORARY'}">
				                                    	<td><input value="OMPANG" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'FINES_INVOICE'}">
				                                    	<td><input value="LOKSUS" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'SHARING_BUDGET'}">
				                                    	<td><input value="SHARING BUDGET" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'ADMINISTRATION_INVOICE'}">
				                                    	<td><input value="DENDA ADM. FAKTUR" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'PREPAYMENT'}">
				                                    	<td><input value="PREPAYMENT" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
				                                    <c:if test="${payment_edit.referenceDetail == 'CUSTOMER_RECEIPT'}">
				                                    	<td><input value="PENCAIRAN PELANGGAN" class='input-disabled' size='25' disabled/></td>
				                                   	</c:if>
		                                        </tr>
		                                        </c:if>
		                                        <tr>
		                                            <td nowrap="nowrap" align="right">Payment To :</td>
		                                            <td>
		                                                <select id="supplier" class="combobox-ext">
		                                                    <c:if test='${not empty payment_edit.supplier}'>
		                                                        <option value='${payment_edit.supplier.id}'>${payment_edit.supplier.name}</option>
		                                                    </c:if>
		                                                </select>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td align="right"> Currency : </td>
		                              				<td>
		                              					<input size="10" value="${payment_edit.currency.symbol}" class="input-disabled" disabled/>
		                                                <input size="8" value="${payment_edit.exchangeType}" class="input-disabled" disabled/>
		                                          	</td>
		                                        </tr>
		                                        <tr>
		                                            <td align="right">Type : </td>
		                       	  	  		  		<td>
		                       	  	  		  			<input size="25" value="${payment_edit.paymentInformation.paymentMethodType}" class="input-disabled" disabled/>
		                                       	  	</td>
		                                        </tr>
		                                        <tr>
		                                            <td align="right">Bank/Cash Account : </td>
		                                            <td>
		                                                <select id='account' class='combobox-ext'>
		                                                    <c:if test='${not empty payment_edit.paymentInformation.bankAccount}'>
		                                                        <option value='${payment_edit.paymentInformation.bankAccount.id}'>${payment_edit.paymentInformation.bankAccount.code}</option>
		                                                    </c:if>
		                                                </select>
		                                            </td>
		                                        </tr>
		                                        <c:if test="${not empty payment_edit.paymentInformation.reference}">
			                                        <tr>
			                                            <td align="right">Transfer/Clearing No : </td>
			                                          	<td><input size="25" value="${payment_edit.paymentInformation.reference}" class="input-disabled" disabled/></td>
			                                        </tr>
		                                        </c:if>
		                                        <tr>
		                                          <td align="right" nowrap="nowrap">Due Date :</td>
		                                            <td><input value="<fmt:formatDate value='${payment_edit.paymentInformation.dueDate}' pattern='dd-MM-yyyy'/>" size="10" class="input-disabled" disabled/></td>
		                                    	</tr>
		                                    	<c:if test="${not empty payment_edit.unitSalesOrder}">
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Reference From :</td>
			                                            <td>
			                                                <input size="25" value="${payment_edit.unitSalesOrder.code}" class="input-disabled" disabled/>
			                                            </td>
			                                        </tr>
		                                        </c:if>
		                                    	<c:if test="${not empty payment_edit.bbn}">
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Reference From :</td>
			                                            <td>
			                                                <input size="25" value="${payment_edit.bbn.code}" class="input-disabled" disabled/>
			                                            </td>
			                                        </tr>
		                                        </c:if>
		                                    	<c:if test="${not empty payment_edit.billing}">
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Reference From :</td>
			                                            <td>
			                                                <input size="25" value="${payment_edit.billing.customer.name}" class="input-disabled" disabled/>
			                                            </td>
			                                        </tr>
		                                        </c:if>
		                                    	<c:if test="${not empty payment_edit.customerReference}">
			                                        <tr>
			                                            <td nowrap="nowrap" align="right">Atas Nama :</td>
			                              				<td>
			                                                <select class="combobox-ext">
			                                                	<option value='${payment_edit.customerReference.id}'>${payment_edit.customerReference.name}</option>
			                                                </select>
			                                          	</td>
			                                        </tr>
		                                        </c:if>
		                                        <tr>
		                                          	<td nowrap="nowrap" align="right">Payment Amount : </td>
		                                            <td>
		                                            	<input value="<fmt:formatNumber value='${payment_edit.paymentInformation.amount}' pattern='#,###'/>" class="input-disabled" style="text-align:right" disabled size="15"/>
		                                            </td>
		                                        </tr>
		                                        <tr>
		                                            <td width="24%" align="right"> Note : </td>
		                                          	<td><form:textarea path='note' cols='45' rows='6'/></td>
		                                        </tr>
		                                        </table>
		                                    </td>
		                                </tr>
		                                </table>
	                                </td>
	                                <td width="35%" align="center" valign="top">
                   						<table style="border:none" width="100%">
                                        <tr>
                                        	<td align="left" valign="top">
												<fieldset>
                                                	<legend><strong>Journal Reference</strong></legend>
                                                    <table style="border:none" width="100%">
 													<tr>
                                                        <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${payment_edit.journalEntry.id}'/>">${payment_edit.journalEntry.code}</td>
                                                      </tr>
                                                    </table>
                                                </fieldset>
                                        	</td>
                                        </tr>
                                		</table>
                            		</td>
                                </table>
                                <br/>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${payment_edit.createdBy.firstName} ${payment_edit.createdBy.middleName} ${payment_edit.createdBy.lastName}'/> (<fmt:formatDate value='${payment_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${payment_edit.updatedBy.firstName} ${payment_edit.updatedBy.middleName} ${payment_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${payment_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/common/sirius-footer.jsp" %>
</div>
</body>
<%@ include file="/common/dialog.jsp"%>
</html>
<script type="text/javascript" language="javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Payment',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.b_entry').click(function(e)
		{
			$.ajax({
				url:"<c:url value='/page/paymentmanualedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Payment data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/paymentmanualview.htm'/>";
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
	});
</script>
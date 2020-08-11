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
	                        <a class="item-button-list" href="<c:url value='/page/unitservicetransactionreceiptview.htm'/>"><span>List</span></a>
                            <c:if test='${access.edit}'>
                            	<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
			    			<c:if test='${access.print}'>
								<a class="item-button-print" href="<c:url value='/page/unitservicetransactionreceiptprint.htm?id=${receipt_edit.id}'/>"><span>Print</span></a>
			    			</c:if>
                        </div>
                        <div class="main-box">
							<form:form id="editForm" name="editForm" method="post" modelAttribute='receipt_edit'>
                            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                	<td width="56%" align="left" valign="top">
                                   	  <table width="100%" style="border:none">
                                        <tr>
                                            <td width="24%" align="right"> ID :	</td>
                                          <td width="76%"><input size="25" value="${receipt_edit.code}" class="input-disabled" disabled/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${receipt_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Company : </td>
                              				<td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext input-disabled" disabled='true'>
                                                    <c:if test='${not empty receipt_edit.organization}'>
                                                        <form:option value='${receipt_edit.organization.id}' label='${receipt_edit.organization.firstName} ${receipt_edit.organization.lastName} ${receipt_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                          </td>
                                        </tr>
                                         <tr>
                                            <td nowrap="nowrap" align="right">Customer :</td>
                                            <td>
                                                <form:select id="customer" path="customer" cssClass="combobox-ext input-disabled">
                                                    <c:if test='${not empty receipt_edit.customer}'>
                                                        <form:option value='${receipt_edit.customer.id}' label='${receipt_edit.customer.name}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="24%" align="right"> Note : </td>
                                          <td><form:textarea path='note' cols='45' rows='6'/></td>
                                        </tr>
                                        </table>
                                        <input type="hidden" name="currency" id="currency" value="${receipt_edit.currency.id}"/>
                                        <input type="hidden" name="exchangeType" id="type" value="${receipt_edit.exchangeType}"/>
                                    </td>
                             		<td width="44%" align="center" valign="top">
                   						<table style="border:none" width="100%">
                                        <tr>
                                        	<td>
                                            	<fieldset>
                                                	<legend><strong>Journal</strong></legend>
                                                	<table style="border:none" width="100%">
 													<tr>
                                                        <td width="32%" align="right">&nbsp;&nbsp;Journal Entry : </td>
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${receipt_edit.journalEntry.id}'/>">${receipt_edit.journalEntry.code}</td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td align="left" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Clearing Information</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td colspan="3" align="right">
                                                        	<c:if test="${receipt_edit.receiptInformation.paymentMethodType == 'CLEARING' && receipt_edit.cleared}">
                                                              <strong><font size="+1"> CLEARED</font></strong>
                                                            </c:if>
                                                            <c:if test="${receipt_edit.receiptInformation.paymentMethodType == 'CLEARING' && !receipt_edit.cleared}">
                                                                <strong><font size="+1">CLEARING</font></strong>
                                                            </c:if>
                                                        </td>
                                                    </tr>
 													<tr>
                                                        <td width="209" align="right">Clearing Reference : </td>
                                                        <td width="309" colspan="2" align="right"><a href="<c:url value='/page/clearreceiptpreedit.htm?id=${receipt_edit.clearReceipt.id}'/>">${receipt_edit.clearReceipt.code}</a></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>
                                            	<fieldset>
                                                    <legend><strong>Receipt Information</strong></legend>
                                                    <table width="100%" style="border:none">
                                                    <tr>
                                                        <th width="46%">&nbsp;</th>
                                                      <th width="26%">Amount (
                                                      <c:out value='${receipt_edit.currency.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Unapplied : </td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Reversed : </td>
                                                        <td><input value="0" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Applied : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.paid}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Write Off : </td>
                                                        <td><input value="<fmt:formatNumber value='${adapter.writeoff}' pattern=',##0.00'/>" class="input-disabled" style="text-align:right" disabled size="15"/></td>
                                                    </tr>
                                                    </table>
                                                </fieldset>
                                            </td>
                                        </tr>
                                        </table>
                                  	</td>
                                </tr>
                                </table>
                                <br/>
                                <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                	<div id="info" dojoType="ContentPane" label="Payment Information" class="tab-pages" refreshOnShow="true">
                                        <table width="100%">
                                        <tr>
                                        	<td width="52%" align="left"  valign="top">
                                           	  <table width="100%">
                                            	<tr>
                                                    <td width="24%" align="right">Type : </td>
                                       	  	  		<td width="76%">
														<form:select id='methodType' path='receiptInformation.paymentMethodType' disabled='true' cssClass="input-disabled">
                                                            <form:option value='CASH' label='CASH'/>
                                                            <form:option value='TRANSFER' label='TRANSFER'/>
                                                            <form:option value='CLEARING' label='CLEARING'/>
                                                    	</form:select>
                                               	  </td>
                                                </tr>
                                                <tr>
                                                    <td width="24%" align="right">Transfer/Clearing No : </td>
                                                  <td width="76%"><form:input path='receiptInformation.reference' size='35' disabled='true' cssClass='input-disabled'/></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Cash/Bank Account : </td>
                                                    <td>
                                                        <form:select id='account' path='receiptInformation.bankAccount' cssClass='combobox-ext input-disabled' disabled='true'>
                                                            <c:if test='${not empty receipt_edit.receiptInformation.bankAccount}'>
                                                                <form:option value='${receipt_edit.receiptInformation.bankAccount.id}' label='${receipt_edit.receiptInformation.bankAccount.code}' />
                                                            </c:if>
                                                        </form:select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Account Name : </td>
                                                    <td><input id='accountName' value="${receipt_edit.receiptInformation.bankAccount.accountName}" disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Name : </td>
                                                    <td><input id='bankName' value="${receipt_edit.receiptInformation.bankAccount.bankName}" disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Branch : </td>
                                                    <td><input id='bankBranch' value="${receipt_edit.receiptInformation.bankAccount.bankBranch}" disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                <tr>
                                                    <td nowrap="nowrap" align="right">Cash/Bank Account No : </td>
                                                    <td><input id='accountNo' value="${receipt_edit.receiptInformation.bankAccount.accountNo}" disabled='true' class='input-disabled' size="30"/></td>
                                                </tr>
                                                </table>
                                            </td>
                                         	<td width="48%" align="left" valign="top">
												<table width="100%">
                                                <tr>
                                                  	<td width="39%" align="right" nowrap="nowrap">Due Date :</td>
                                                  	<td width="61%"><input size="15" value="<fmt:formatDate value='${receipt_edit.receiptInformation.dueDate}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled/></td>
                                            	</tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Payment Amount : </td>
                                                    <td><input disabled class="input-disabled" style="text-align:right;" value="<fmt:formatNumber value='${receipt_edit.receiptInformation.amount}' pattern=',##0.00'/>"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td nowrap="nowrap" align="right">Bank Charges : </td>
                                                    <td><input disabled class="input-disabled" style="text-align:right;" value="<fmt:formatNumber value='${receipt_edit.receiptInformation.bankCharges}' pattern=',##0.00'/>"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                  	<td align="right">Note : </td>
                                                    <td><form:textarea path='receiptInformation.note' cols='40' rows='6'/></td>
                                                </tr>
                                                </table>
                                          	</td>
                                        </tr>
                                        </table>
                                	</div>
                                	<div id="line" dojoType="ContentPane" label="Payment Application" class="tab-pages" refreshOnShow="true">
                                        <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" align="center" width="100%">
                                        <thead>
                                        <tr>
                                            <th width="19%">Invoice</th>
                                            <th width="20%">Write Off Type</th>
                                            <th width="20%">Write Off</th>
                                            <th width="20%">Paid</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items='${receipt_edit.applications}' var='app'>
                                        <tr>
                                        	<td><a href="<c:url value='/page/billingpreedit.htm?id=${app.billing.id}'/>"><c:out value='${app.billing.code}'/></a></td>
                                            <td><c:out value='${app.writeoffType}'/></td>
                                            <td><fmt:formatNumber value='${app.writeOff}' pattern=',##0.00'/></td>
                                            <td><fmt:formatNumber value='${app.paidAmount}' pattern=',##0.00'/></td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
                                        </tfoot>
                                        </table>
                                	</div>
                            	</div>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${receipt_edit.createdBy.firstName} ${receipt_edit.createdBy.middleName} ${receipt_edit.createdBy.lastName}'/> (<fmt:formatDate value='${receipt_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${receipt_edit.updatedBy.firstName} ${receipt_edit.updatedBy.middleName} ${receipt_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${receipt_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Receipt',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});

		$('.item-button-save').click(function(){
			$.ajax({
				url:"<c:url value='/page/sparepartreceiptedit.htm'/>",
				data:$('#editForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Receipt data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/sparepartreceiptview.htm'/>";
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

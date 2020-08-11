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
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
    </style>
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
							<a class="item-button-list" href="<c:url value='/page/unitbillingmanualview.htm'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save b_save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
                            <c:if test='${access.print}'>
					  			<a class="item-button-print" href="<c:url value='/page/unitbillingmanualprint.htm?id=${billing.id}'/>"><span>Kwitansi</span></a>
					  		</c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="billing">
								<table width="100%" style="border:none">
								<tr>
									<td width="65%" align="left" valign="top">
                                   	  	<table width="100%" style="border:none">
										<tr>
											<td width="20%" nowrap="nowrap" align="right">ID :</td>
										  	<td width="80%"><input value="${billing.code}" class='input-disabled' size='25' disabled/></td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Company :</td>
											<td>
												<form:select id="org" path="organization" cssClass="combobox-ext" disabled="true">
		                                           	<c:if test='${not empty billing.organization}'>
		                                               	<form:option value='${billing.organization.id}' label='${billing.organization.name}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Cash/Bank :</td>
											<td>
												<form:select id="bankAccount" path="bankAccount" cssClass="combobox-ext" disabled="true">
		                                           	<c:if test='${not empty billing.bankAccount}'>
		                                               	<form:option value='${billing.bankAccount.id}' label='${billing.bankAccount.bankName}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
									    <tr>
											<td nowrap="nowrap" align="right">Date :</td>
											<td>
												<input value="<fmt:formatDate value='${billing.date}' pattern='MM/dd/yyyy'/>" size="10" class="input-disabled" disabled/>
												&nbsp;&nbsp;Due Date :
												<input value="<fmt:formatDate value='${billing.dueDate}' pattern='MM/dd/yyyy'/>" size="10" class="input-disabled" disabled/>
											</td>
										</tr>
										<tr>
		                                	<td align="right">Type :</td>
		                                    <td><input value="${billing.paymentMethodType}" class='input-disabled' size='25' disabled/></td>
		                                </tr>
										<tr>
		                                	<td align="right">Reference Type :</td>
		                                    <td>
		                                    <c:if test="${billing.referenceFrom == 'SERVICE_AGENT'}">
		                                    	<input value="SERVICE AGENT" class='input-disabled' size='25' disabled/></td>
		                                   	</c:if>
		                                    <c:if test="${billing.referenceFrom != 'SERVICE_AGENT'}">
		                                    	<input value="${billing.referenceFrom}" class='input-disabled' size='25' disabled/></td>
		                                   	</c:if>
		                                </tr>
										<tr>
		                                	<td align="right">Reference Type Detail :</td>
		                                    <td>
			                                    <c:if test="${billing.referenceFromDetail == 'INSURANCE'}">
			                                    	<input value="ASURANSI" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'SPECIAL_NUMBER'}">
			                                    	<input value="NOMOR CANTIK" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'TEMPORARY'}">
			                                    	<input value="OMPANG" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'PROGRESSIVE_TAX'}">
			                                    	<input value="PAJAK PROGRESIF" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'ADDITIONAL_OTR'}">
			                                    	<input value="PENAMBAHAN OTR" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'SHARING_BUDGET'}">
			                                    	<input value="SHARING BUDGET" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'CROSS_DISTRICT'}">
			                                    	<input value="PELANGGARAN WILAYAH" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'ACC_TAHUN'}">
			                                    	<input value="ACC TAHUN" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
			                                    <c:if test="${billing.referenceFromDetail == 'MEDIATOR'}">
			                                    	<input value="MEDIATOR" class='input-disabled' size='25' disabled/>
			                                   	</c:if>
		                                   	</td>
		                                </tr>
										<tr>
											<td nowrap="nowrap" align="right">Customer :</td>
											<td>
												<form:select id="customer" path="customer" cssClass="combobox-ext" disabled="true">
		                                           	<c:if test='${not empty billing.customer}'>
		                                               	<form:option value='${billing.customer.id}' label='${billing.customer.name}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Reference :</td>
											<td>
												<form:select id="reference" path="unitSalesOrder" cssClass="combobox-ext" disabled="true">
		                                           	<c:if test='${not empty billing.unitSalesOrder}'>
		                                               	<form:option value='${billing.unitSalesOrder.id}' label='${billing.unitSalesOrder.code}' />
		                                            </c:if>
												</form:select>
											</td>
										</tr>
		                                <tr>
		                                    <td align="right"> Mata Uang : </td>
		                      				<td>
		                                        <form:select id='currency' path='currency' disabled='true'>
		                                            <form:option value='${billing.currency.id}' label='${billing.currency.symbol}'/>
		                                        </form:select>
		                                  	</td>
		                                </tr>
		                          		<tr>
											<td align="right">Amount :</td>
											<td><input id="amount" value="<fmt:formatNumber value='${billing.amount}' pattern=',##0.00'/>" value="0" size="20" disabled/></td>
										</tr>
		                                <tr>
											<td nowrap="nowrap" align="right">Note :</td>
											<td><form:textarea path="note" cols="55" rows="7"/></td>
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
														<td width="68%">&nbsp;<a href="<c:url value='/page/journalentrypreview.htm?id=${billing.journalEntry.id}'/>">${billing.journalEntry.code}</td>
                                                      </tr>
                                                    </table>
                                                </fieldset>
                                        	</td>
                                        </tr>
                                		</table>
                            		</td>
                           		</tr>
							</table>
							</form:form>
						</div>
						<div class="info">Created by : <c:out value='${billing.createdBy.firstName} ${billing.createdBy.middleName} ${billing.createdBy.lastName}'/> (<fmt:formatDate value='${billing.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${billing.updatedBy.firstName} ${billing.updatedBy.middleName} ${billing.updatedBy.lastName}'/> (<fmt:formatDate value='${billing.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file='/common/sirius-footer.jsp' %>
</div>
</body>
</html>
<script type="text/javascript">
	$(function()
	{
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Unit Billing Manual',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.b_save').click(function(e)
		{
			$.ajax({
				url:"<c:url value='/page/unitbillingmanualedit.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Billing data......');
					$dialog.dialog('open');
				},
				success : function(json)
				{
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/unitbillingmanualview.htm'/>";
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
	
	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>
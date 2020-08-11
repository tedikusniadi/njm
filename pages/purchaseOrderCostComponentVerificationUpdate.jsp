<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>PO Cost Component Invoice Verification >> Add</title>
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
			<td width="60%">Financial Accounting > Account Payable > PO Cost Component Verification > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">F47 - PO Cost Component Verification </h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/purchaseordercostcomponentverificationview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_edit">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="${verification_edit.code}" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.organization}'>
                                                        <form:option value='${verification_edit.organization.id}' label='${verification_edit.organization.firstName} ${verification_edit.organization.lastName} ${verification_edit.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input value="<fmt:formatDate value='${verification_edit.date}' pattern='dd-MM-yyyy'/>" class="input-disabled" disabled size="15"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Bill From :</td>
                                       	  	<td width="74%">
                                   	  			<form:select id="supplier" path="supplier" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.supplier}'>
                                                        <form:option value='${verification_edit.supplier.id}' label='${verification_edit.supplier.firstName} ${verification_edit.supplier.lastName} ${verification_edit.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                       	  </td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Component :</td>
                                          	<td width="74%">
                                            	<form:select id="component" path="component" cssClass="combobox-ext" disabled='true'>
                                                    <c:if test='${not empty verification_edit.component}'>
                                                        <form:option value='${verification_edit.component.id}' label='${verification_edit.component.code}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Amount :</td>
                                          	<td width="74%"><input disabled value="<fmt:formatNumber value='${verification_edit.amount}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Amount :</td>
                                          	<td width="74%"><input disabled value="<fmt:formatNumber value='${verification_edit.tax}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax :</td>
                                          	<td width="74%">
                                            	<form:select id="tax" path="tax" disabled='true'>
                                                    <form:option value='${verification_edit.taxType.id}' label='${verification_edit.taxType.taxId}'/>
                                                </form:select>
                                                &nbsp;
                                                <input size="8" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.taxType.taxRate}' pattern=',##0.00'/> %"/>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                          	<td width="74%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input name='taxDate' value="<fmt:formatDate value='${verification_edit.taxDate}' pattern='MM/dd/yyyy'/>" size="15" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                           		  		<tr>
                                            <td width="26%" nowrap="nowrap" align="right">Note :</td>
                                       		<td width="74%"><form:textarea path='note' cols='45' rows='5'/></td>
                                        </tr>
                                        </table>
                                    </td>
                                  	<td width="47%" align="left" valign="top">
                                   	  	<table style="border:none" width="100%">
                                        <tr>
                                        	<td width="49%" align="left" valign="top">
    											<fieldset>
                                                	<legend><strong>Payment</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td colspan="2" align="right"><h2><c:out value='${verification_edit.status}'/></h2></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Unpaid Amount :</td>
                                                        <td align="right"><input size="12" style="text-align:right;font-weight:bold;" class="input-disabled" disabled value="<fmt:formatNumber value='${verification_edit.unpaid}' pattern=',##0.00'/>"/></td>
                                                    </tr>
                                                    <tr>
                                                    	<td align="right">Payment :</td>
                                                        <td align="right">
                                                        	<c:forEach items='${verification_edit.applications}' var='application'>
                                                    			<a href="<c:url value='/page/paymentpreedit.htm?id=${application.payment.id}'/>"><c:out value='${application.payment.code}'/></a><br/>
                                                    		</c:forEach>
                                                        </td>
                                                    </tr>
                                                    </table>
                                              	</fieldset>
                                                <fieldset>
                                                	<legend><strong>Journal</strong></legend>
                                                    <table style="border:none" width="100%">
                                                    <tr>
                                                    	<td><a href="<c:url value='/page/journalentrypreedit.htm?id=${verification_edit.journalEntry.id}'/>"><c:out value='${verification_edit.journalEntry.code}'/></a></td>
                                                    </tr>
                                                    </table>
                                              	</fieldset>
                                            </td>
                                		</tr>
                                        <tr>
                                        	<td colspan="2" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Recapitulation</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                        <th width="43%">&nbsp;</th>
                                                        <th width="31%" align="center">Amount (<c:out value='${verification_edit.component.purchaseOrder.currency.symbol}'/>)</th>
                                                        <th width="26%" align="center">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Transaction :</td>
                                                        <td><input id="trx" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Cost Component :</td>
                                                        <td><input id="trx" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax :</td>
                                                        <td><input id="tax" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.tax}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftax" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.tax*verification_edit.component.tax.taxRate*0.01}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Adjustment :</td>
                                                        <td><input id="trx" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.amount-verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="trxdef" style="text-align:right;" value="<fmt:formatNumber value='${verification_edit.amount-verification_edit.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total :</strong></td>
                                                        <td><input id="total" style="text-align:right;font-weight:bold;" value="<fmt:formatNumber value='${verification_edit.amount+verification_edit.tax}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftotal" style="text-align:right;font-weight:bold;" value="<fmt:formatNumber value='${verification_edit.amount+verification_edit.tax}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
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
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

  	<div style="clear:both;height:0px">&nbsp;</div>
	<div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
	<div style="clear:both;height:20px">&nbsp;</div>

</div>
</body>
</html>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery-ui.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'PO Cost Component verification',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){			
			$.ajax({
				url:"<c:url value='/page/purchaseordercostcomponentverificationedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating PO Cost Component verification data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/purchaseordercostcomponentverificationview.htm'/>";							
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
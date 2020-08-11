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
			<td width="60%">Financial Accounting > Account Payable > PO Cost Component Verification > Add</td>
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
							<form:form id="addForm" name="addForm" method="post" modelAttribute="verification_add">
								<table width="100%" style="border:none">
                                <tr>
                                	<td width="53%" align="left" valign="top">
                                   	  	<table width="100%" style="border:none">
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                          <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Company :</td>
                                            <td>
                                                <form:select id="org" path="organization" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification_add.organization}'>
                                                        <form:option value='${verification_add.organization.id}' label='${verification_add.organization.firstName} ${verification_add.organization.lastName} ${verification_add.organization.middleName}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
												<img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupcompanystructurerolebasedview.htm?target=org'/>');" style="CURSOR:pointer;" title="Company Structure" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Date :</td>
                                            <td><input id="date" name="date" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Bill From :</td>
                                       	  	<td width="74%">
                                   	  			<form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification_add.component.supplier}'>
                                                        <form:option value='${verification_add.component.supplier.id}' label='${verification_add.component.supplier.firstName} ${verification_add.component.supplier.lastName} ${verification_add.component.supplier.middleName}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Component :</td>
                                          	<td width="74%">
                                            	<form:select id="component" path="component" cssClass="combobox-ext">
                                                    <c:if test='${not empty verification_add.component}'>
                                                        <form:option value='${verification_add.component.id}' label='${verification_add.component.code} - ${verification_add.component.cost.name}' />
                                                    </c:if>
                                                </form:select>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Cost Amount :</td>
                                          	<td width="74%"><input id='amount' onchange="display()" name="amount" value="<fmt:formatNumber value='${verification_add.amount}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Amount :</td>
                                          	<td width="74%"><input id="__tax__" onchange="display()" name="tax" value="<fmt:formatNumber value='${verification_add.component.amount*verification_add.component.tax.taxRate*0.01}' pattern='##0.00'/>" size="25"></td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax :</td>
                                          	<td width="74%">
                                            	<form:select id="taxType" path="taxType" cssClass="combobox">
                                                    <form:options items='${taxes}' itemValue='id' itemLabel='taxId' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                                </form:select>
                                                &nbsp;
                                                <input size="7" id="taxRate" class="input-disabled" disabled/>
                                       	  	</td>
                                        </tr>
                                        <tr>
                                            <td width="26%" nowrap="nowrap" align="right">Tax Invoice No :</td>
                                          	<td width="74%"><form:input path='taxNo' size='20'/></td>
                                        </tr>
                                        <tr>
                                            <td nowrap="nowrap" align="right">Tax Date :</td>
                                            <td><input id="taxDate" name="taxDate" formatLength="long" dojoType="dropdowndatepicker" lang="en-us" displayFormat="dd-MM-yyyy" saveFormat="dd-MM-yyyy"/></td>
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
                                        	<td colspan="2" valign="top">
                                            	<fieldset>
                                                	<legend><strong>Transaction Recapitulation</strong></legend>
                                                	<table style="border:none" width="100%">
                                                    <tr>
                                                        <th width="43%">&nbsp;</th>
                                                        <th width="31%" align="center">Amount (<c:out value='${verification_add.component.purchaseOrder.currency.symbol}'/>)</th>
                                                        <th width="26%" align="center">Amount (<c:out value='${default.symbol}'/>)</th>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Transaction :</td>
                                                        <td><input id="trx" value="<fmt:formatNumber value='${verification_add.component.amount}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="deftrx" value="<fmt:formatNumber value='${verification_add.component.amount*rate.rate}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Tax :</td>
                                                        <td><input id="tax" value="<fmt:formatNumber value='${verification_add.component.amount*verification_add.component.tax.taxRate*0.01}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="taxdef" value="<fmt:formatNumber value='${verification_add.component.amount*verification_add.component.tax.taxRate*0.01*rate.rate}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Adjutment :</td>
                                                        <td><input id="disc" value="0.0" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="discdef" value="0.0" size="15" class="input-disabled" disabled/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><strong>Total :</strong></td>
                                                        <td><input id="total" value="<fmt:formatNumber value='${verification_add.component.amount+(verification_add.component.amount*verification_add.component.tax.taxRate*0.01)}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
                                                        <td><input id="totaldef" value="<fmt:formatNumber value='${(verification_add.component.amount+(verification_add.component.amount*verification_add.component.tax.taxRate*0.01))*rate.rate}' pattern=',##0.00'/>" size="15" class="input-disabled" disabled/></td>
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
			var date = dojo.widget.byId('date').getValue();
			var taxDate = dojo.widget.byId('taxDate').getValue();
			
			if(!date)
			{
				alert('Date cannot be empty!');
				return;
			}
	
			if(!taxDate)
			{
				alert('Tax Date cannot be empty!');
				return;
			}
			
			$.ajax({
				url:"<c:url value='/page/purchaseordercostcomponentverificationadd.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving PO Cost Component verification data......');
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

	function display()
	{		
		var rate = parseFloat('${rate.rate}');
	
		var amount = parseFloat(document.getElementById('amount').value);
		var __tax__ = parseFloat(document.getElementById('__tax__').value);
	
		var __trx__ = amount-parseFloat('${verification_add.component.amount}');
		var __trxdef__ = (amount-parseFloat('${verification_add.component.amount}'))*rate;
	
		document.getElementById('disc').value = __trx__.numberFormat('#,#.00');
		document.getElementById('discdef').value = __trxdef__.numberFormat('#,#.00');
		
		document.getElementById('tax').value = __tax__.numberFormat('#,#.00');
		document.getElementById('taxdef').value = (__tax__*parseFloat('${rate.rate}')).numberFormat('#,#.00');
		
		document.getElementById('total').value = (amount+__tax__).numberFormat('#,#.00');
		document.getElementById('totaldef').value = (amount+(__tax__*rate)).numberFormat('#,#.00');
		
	}

	function opencomponent()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
		
		var supplier = document.getElementById('supplier');
		if(supplier.value == null || supplier.value == '')
		{
			alert('Please select Supplier first!');
			return;
		}
		
		var date = dojo.widget.byId('date');
		if(date.getValue() == null || date.getValue() == '')
		{
			alert('Please select Date first!');
			return;
		}
					
		openpopup("<c:url value='/page/popuppurchaseordercostcomponentview.htm?target=component&organization='/>"+org.value+"&supplier="+supplier.value+"&date="+date.getValue());
	}
	
	function opensupplier()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select Company first!');
			return;
		}
					
		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization='/>"+org.value);
	}
</script>
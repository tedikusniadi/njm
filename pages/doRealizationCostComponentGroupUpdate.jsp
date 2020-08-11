<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>SO Cost Component Distribution >> Edit</title>
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
			<td width="60%">Sales > Sales Order > Standard Sales Order > Sales Cost Component Distribution > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S100 - Sales Cost Component Distribution</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/dorealizationcostcomponentgroupview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer"><span>Save</span></a>
							<a class="item-button-print" href="<c:url value='/page/dorealizationcostcomponentgroupprint.htm?id=${cost_group_edit.id}'/>"><span>Print</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="cost_group_edit">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="9%" nowrap="nowrap" align="right">ID</td>
                               	  	<td width="1%">:</td>
                           	  	  	<td width="44%"><input value="${cost_group_edit.code}" class='input-disabled' size='25'/></td>
                           	  	  	<td width="46%" rowspan="10" valign="top">
           								<fieldset>
                                        	<legend>Master Cost</legend>
                                            <table width="100%">
                                            <tr>
                                                <td width="20%" align="right" nowrap="nowrap"><strong>Total</strong></td>
                                                <td width="2%">:</td>
                                          		<td width="78%"><input id='grant' size="30" style="text-align:right" disabled class="input-disabled" value="<fmt:formatNumber value='${cost_group_edit.totalAmount}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            <tr>
                                                <td width="20%" align="right" nowrap="nowrap">Cash Account</td>
                                                <td width="2%">:</td>
                                          		<td width="78%">
                               	  					<form:select id="account" path="account" cssClass="combobox-ext" disabled='true'>
                                                    	<option><c:out value='${cost_group_edit.account.account.name}'/></option>
                                                    </form:select>
                                              	</td>
                                            </tr>
                                            </table>
                                            <div class="clears">&nbsp;</div>
                                            <table width="100%" border="0" cellpadding="1">
                                            <c:forEach items='${cost_group_edit.amounts}' var='amt'>
                                            <tr>
                                            	<td>
                                                	<select name="costs" class="combobox" disabled>
                                                    	<option value="${amt.cost.id}"><c:out value='${amt.cost.name}'/></option>
                                                    </select>
                                                </td>
                                                <td><input name="amount" size="25" style="text-align:right" value="<fmt:formatNumber value='${amt.amount}' pattern=',##0.00'/>" disabled class="input-disabled"/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </fieldset>
                                  	</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Date</td>
                                    <td>:</td>
                                    <td><input size="15" class="input-disabled" disabled value="<fmt:formatDate value='${cost_group_edit.date}' pattern='MM/dd/yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Company</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                        	<option><c:out value='${cost_group_edit.organization.firstName}'/></option>
                                    	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Expedition</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="expedition" path="supplier" cssClass="combobox-ext" disabled='true'>
                                        	<option><c:out value='${cost_group_edit.supplier.salutation} ${cost_group_edit.supplier.firstName} ${cost_group_edit.supplier.middleName} ${cost_group_edit.supplier.lastName}'/></option>
                                    	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Vehicle</td>
                                    <td>:</td>
                                    <td>
                                        <form:select id="vehicle" path="vehicle" cssClass="combobox-ext" disabled='true'>
                                        	<option><c:out value='${cost_group_edit.vehicle.name}'/></option>
                                    	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Rit</td>
                                    <td>:</td>
                                    <td><input value="${cost_group_edit.rit}" size="5" /></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">DO Realization Date</td>
                                    <td>:</td>
                                    <td><input size="15" disabled class="input-disabled" value="<fmt:formatDate value='${order_add.realizationDate}' pattern='MM/dd/yyyy'/>"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Receipt By</td>
                                    <td>:</td>
                                    <td><form:input path='receiptby' size="35" disabled='true' cssClass='input-disabled'/></td>
                                </tr>
                                <tr>
                                    <td align="right">Currency</td>
                                  	<td>:</td>
                                    <td>
                                        <form:select id='currency' path='currency' disabled='true'>
                                        	<option><c:out value='${cost_group_edit.currency.symbol}'/></option>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType' disabled='true'>
                                            <form:option value='SPOT' label='SPOT'/>
                                            <form:option value='MIDDLE' label='MIDDLE'/>
                                            <form:option value='TAX' label='TAX'/>
                                        </form:select>
                                  	</td>
                                </tr>
                                <tr>
                                    <td align="right">Tax</td>
                                  	<td>:</td>
                                    <td>
                                        <form:select id='tax' path='tax'>
                                        	<option><c:out value='${cost_group_edit.tax.taxId}'/></option>
                                        </form:select>
                                  	</td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Supplier</td>
                                  	<td>:</td>
                                    <td><input class="input-disabled" disabled size="40" value="${cost_group_edit.supplier.salutation} ${cost_group_edit.supplier.firstName}"/>
                                  	</td>
                                </tr>
                                </table>
                                <div class="clears">&nbsp;</div>
                                <table id='iTable' width="100%" class="table-list" border="0" cellpadding="0" cellspacing="0">
                                <thead>
                                <tr>
                                    <th width="19%">DO Realization</th>
                                    <th width="16%">DO</th>
                                    <th width="17%">Customer</th>
                                    <th width="21%">Address</th>
                                    <th width="10%">Amount</th>
                                    <th width="17%">Journal</th>
                                </tr>
                                </thead>
                                <tbody id="iBody">
                                <c:forEach items='${cost_group_edit.components}' var='com'>
                                <tr>
                                	<td><c:out value='${com.deliveryOrderRealization.code}'/></td>
                                	<td><c:out value='${com.deliveryOrderRealization.deliveryOrder.code}'/></td>
                                    <td><c:out value='${com.deliveryOrderRealization.customer.salutation} ${com.deliveryOrderRealization.customer.firstName}'/></td>
                                    <td><c:out value='${com.deliveryOrderRealization.deliveryOrder.shipping.address}'/></td>
                                    <td><fmt:formatNumber value='${com.amount}' pattern=',##0.00'/></td>
                                    <td><a href="<c:url value='/page/journalentrypreedit.htm?id=${com.journalEntry.id}'/>"><c:out value='${com.journalEntry.code}'/></a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="end-table"><td colspan="6">&nbsp;</td></tr>
                                </tfoot>
                                </table>
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
<script src="<c:url value='/js/currency.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){	
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Sales Cost Component Distribution',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(){
			
			$.ajax({
				url:"<c:url value='/page/dorealizationcostcomponentgroupedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Updating Sales Cost Component Distribution data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/dorealizationcostcomponentgroupview.htm'/>";
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
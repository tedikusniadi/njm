<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>DO Realization Cost Component >> Add</title>
	<%@ include file="/common/sirius-header.jsp" %>
    <%@ include file="/common/popup.jsp"%>
	<style type="text/css" media="screen">
    	@import url("<c:url value='/assets/sirius.css'/>");
		@import url("<c:url value='/css/jquery-ui.css'/>");
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
			<td width="60%">Sales > Delivery Order Realization > Cost Component > Add</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - DO Realization Cost Component</h1>
                        <div class="clears">&nbsp;</div>
                        
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/deliveryorderrealizationpreedit.htm?id=${component_add.deliveryOrderRealization.id}'/>"><span>List</span></a>
                            <c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
                            </c:if>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="component_add">
								<table width="100%" style="border:none">
                                <tr>
                                    <td width="17%" nowrap="nowrap" align="right">ID :</td>
                                  	<td><input value="Auto Number" disabled class='input-disabled' size='25'/></td>
                                	<td valign="top" rowspan="2">
                                    	<fieldset>
                                        	<legend><strong>Total Amount</strong></legend>
                                            <input id="total" size="40" disabled class="input-disabled" value="0.00" style="text-align:right;"/>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Cost Component :</td>
                                  <td width="52%">
<form:select id="cost" path="cost" cssClass="combobox-ext">
                                            <c:if test='${not empty component_add.cost}'>
                                              <form:option value='${component_add.cost.id}' label='${component_add.cost.name}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                    <img src="assets/icons/list_extensions.gif" onclick="javascript:openpopup('<c:url value='/page/popupdorealizationcostcomponentview.htm?target=cost'/>');" style="CURSOR:pointer;" title="Cost Component" />
                                  </td>
                                </tr>
                                <tr>
                                    <td align="right">Currency :</td>
                                  	<td>
                                        <form:select id='currency' path='currency'>
                                        <c:forEach items='${currencys}' var='currency'>
                                          <form:option value='${currency.id}' label='${currency.symbol}'/>
                                        </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <form:select id='type' path='exchangeType'>
                                            <form:option value='SPOT' label='SPOT' onclick='display();'/>
                                            <form:option value='MIDDLE' label='MIDDLE' onclick='display();'/>
                                            <form:option value='TAX' label='TAX' onclick='display();'/>
                                        </form:select>
                                        &nbsp;
                                        <input id="trxrate" class="input-disabled" disabled value="1"/>
                                  </td>
                                    <td width="31%"><form:errors cssClass="error" path="currency"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Tax :</td>
                                  	<td>
                                        <form:select id='tax' path='tax'>
                                          <c:forEach items='${taxes}' var='tax'>
                                                <form:option value='${tax.id}' label='${tax.taxId}' onclick="javascript:document.getElementById('taxRate').value = ${tax.taxRate};display();"/>
                                          </c:forEach>
                                        </form:select>
                                        &nbsp;
                                        <input size="7" id="taxRate" class="input-disabled" disabled/>
                                  	</td>
                                    <td width="31%"><form:errors cssClass="error" path="tax"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Supplier :</td>
                                  	<td>
                                        <form:select id="supplier" path="supplier" cssClass="combobox-ext">
                                            <c:if test='${not empty component_add.supplier}'>
                                                <form:option value='${component_add.supplier.id}' label='${component_add.supplier.firstName} ${component_add.supplier.lastName} ${component_add.supplier.middleName}' />
                                            </c:if>
                                        </form:select>
                                        &nbsp;
                                        <img src="assets/icons/list_extensions.gif" onclick="opensupplier();" style="CURSOR:pointer;" title="Customer" />
                                  	</td>
                                    <td width="31%"><form:errors cssClass="error" path="supplier"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Amount :</td>
                                  <td><input id='amount' name='amount' value="0.00" onchange='display();' size="15" style="text-align:right;"/></td>
                                    <td width="31%"><form:errors cssClass="error" path="amount"/></td>
                                </tr>
                                <tr>
                                    <td nowrap="nowrap" align="right">Tax Amount :</td>
                                    <td><input id='taxAmount' value="0.00" size="15" class="input-disabled" disabled style="text-align:right;"/></td>
                                </tr>
                                <tr>
                                    <td align="right">Note :</td>
                                    <td><form:textarea path='note' cols='45' rows='5'/></td>
                                </tr>
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
<script type="text/javascript" src="<c:url value='/js/number-functions.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Cost Component',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
	
		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/dorealizationcostcomponentadd.htm'/>",
				data:$('#addForm').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Cost Component data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/deliveryorderrealizationpreedit.htm?id='/>"+json.id;
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
		
	function opensupplier()
	{
		openpopup("<c:url value='/page/popupsupplierview.htm?target=supplier&organization=${component_add.deliveryOrderRealization.deliveryOrder.organization.id}'/>");
	}
		
	function display()
	{
		var amt = document.getElementById('amount');
		if(amt.value == '')
		{
			alert('Cost component amount cannot be empty!');
			return;
		}
	
		<c:forEach items='${taxes}' var='tax'>
			if('${tax.id}' == document.getElementById('tax').value)
			{
				var txt = parseFloat(amt.value)*parseFloat('${tax.taxRate}')/100;

				document.getElementById('taxAmount').value = txt.numberFormat('#,#.00');
				document.getElementById('total').value = (txt+parseFloat(amt.value)).numberFormat('#,#.00');
			}
		</c:forEach>
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + 		request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Consignment Order >> Edit</title>
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
			<td width="60%">Sales > Consignment > Consignment Order > Edit</td>
			<td width="40%" align="right"><%@ include file="/common/welcome.jsp"%></td>
		</tr>
		</table>	
	</div>

	<div id="r11">
		<div id="r12">
			<div id="r13">
				<div id="r14">
					<div id="se-contents">
						
						<h1 class="page-title">S12 - Consignment Order</h1>
						
					  	<div class="toolbar">
							<a class="item-button-list" href="<c:url value='/page/consignmentorderview.htm'/>"><span>List</span></a>
							<a class="item-button-save" style="cursor:pointer;"><span>Save</span></a>
					  	</div>
					  
						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="order_edit">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="48%" valign="top">
                               	  <table width="100%" style="border:none">
                                    <tr>
                                      <td width="27%" nowrap="nowrap" align="right">ID :</td>
                                      <td width="73%"><input value="${order_edit.code}" class='input-disabled' size='25'/></td>
                                    </tr>
                                    <tr>
                                      <td width="27%" align="right">Date :</td>
                                      <td width="73%"><input class="input-disabled" size="15" disabled value="<fmt:formatDate value='${order_edit.date}' pattern='dd-MM-yyyy'/>"/></td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Company :</td>
                                        <td>
                                            <form:select id="org" path="organization" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.organization}'>
                                                    <form:option value='${order_edit.organization.id}' label='${order_edit.organization.firstName} ${order_edit.organization.lastName} ${order_edit.organization.middleName}' />
                                                </c:if>
                                            </form:select>
                                      	</td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Sales Person :</td>
                                        <td>
                                            <form:select id="salesPerson" path="salesPerson" cssClass="combobox-ext" disabled='true'>
                                                <c:if test='${not empty order_edit.salesPerson}'>
                                                    <form:option value='${order_edit.salesPerson.id}' label='${order_edit.salesPerson.firstName} ${order_edit.salesPerson.lastName} ${order_edit.salesPerson.middleName}' />
                                                </c:if>
                                            </form:select>
                                      </td>
                                    </tr>
                                    <tr>
                                      	<td width="27%" align="right">Customer : </td>
                                  		<td width="73%">
											<form:select id='customer' path='customer' cssClass='combobox-ext' disabled='true'>
                                                <c:if test='${not empty order_edit.customer}'>
                                                    <form:option value='${order_edit.customer.id}' label='${order_edit.customer.firstName} ${order_edit.customer.middleName} ${order_edit.customer.lastName}' />
                                                </c:if>
                                            </form:select>
                                      	</td>                                            
                                    </tr>
                                    <tr>
                                      	<td width="27%" align="right">Contact Person : </td>
                                  		<td width="73%">
											<form:select id='contact' path='contact' cssClass='combobox-ext' disabled='true'>
                                                <c:if test='${not empty order_edit.contact}'>
                                                    <form:option value='${order_edit.contact.id}' label='${order_edit.contact.firstName} ${order_edit.contact.middleName} ${order_edit.contact.lastName}' />
                                                </c:if>
                                            </form:select>
                                      </td>  
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Currency :</td>
                                        <td>
                                            <form:select path="currency" disabled='true'>
                                                <form:option value='${order_edit.currency.id}' label='${order_edit.currency.symbol}'/>
                                            </form:select>
                                            &nbsp;
                                            <form:select path="exchangeType" disabled='true'>
                                                <form:option value='SPOT'>SPOT</form:option>
                                                <form:option value='MIDDLE'>MIDDLE</form:option>
                                                <form:option value='TAX'>TAX</form:option>
                                            </form:select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path='note' cols='55' rows='6'/></td>
                                    </tr>
                                  	</table>
                              	</td>
                          		<td width="52%" valign="top">
									<fieldset>
                                        <legend><strong>Goods Issue Information</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                            <td width="19%" align="right">Wareouse : </td>
                                            <td width="81%">
                                                <form:select id="issuedFrom" path="issuedFacilityFrom" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.issuedFacilityFrom}'>
                                                        <form:option value='${order_edit.issuedFacilityFrom.id}' label='${order_edit.issuedFacilityFrom.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openfacility('org','issuedFrom');" style="CURSOR:pointer;" title="Address" />
                                          </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                                <form:select id="issuedGrid" path="issuedGrid" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.issuedGrid}'>
                                                        <form:option value='${order_edit.issuedGrid.id}' label='${order_edit.issuedGrid.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('issuedFrom','issuedGrid');" style="CURSOR:pointer;" title="Grid" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                                <form:select id="issuedContainer" path="issuedContainer" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.issuedContainer}'>
                                                        <form:option value='${order_edit.issuedContainer.id}' label='${order_edit.issuedContainer.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('issuedGrid','issuedContainer');" style="CURSOR:pointer;" title="Container" />
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset>
                                        <legend><strong>Goods Receive Information</strong></legend>
                                        <table style="border:none" width="100%">
                                        <tr>
                                            <td width="19%" align="right">Wareouse : </td>
                                            <td width="81%">
                                                <form:select id="receivedFrom" path="receivedFrom" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.receivedFrom}'>
                                                        <form:option value='${order_edit.receivedFrom.id}' label='${order_edit.receivedFrom.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="assets/icons/list_extensions.gif" onclick="openfacility('customer','receivedFrom');" style="CURSOR:pointer;" title="Address" />
                                          </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Grid : </td>
                                            <td>
                                                <form:select id="receivedGrid" path="receivedGrid" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.receivedGrid}'>
                                                        <form:option value='${order_edit.receivedGrid.id}' label='${order_edit.receivedGrid.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('receivedFrom','receivedGrid');" style="CURSOR:pointer;" title="Grid" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">Container : </td>
                                            <td>
                                                <form:select id="receivedContainer" path="receivedContainer" cssClass="combobox-ext">
                                                    <c:if test='${not empty order_edit.receivedContainer}'>
                                                        <form:option value='${order_edit.receivedContainer.id}' label='${order_edit.receivedContainer.name}' />
                                                    </c:if>
                                                </form:select>
                                                &nbsp;
                                                <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opencontainer('receivedGrid','receivedContainer');" style="CURSOR:pointer;" title="Container" />
                                            </td>
                                        </tr>
                                        </table>
                                    </fieldset>
                                    <fieldset>
                                    	<legend><strong>Recapitulation</strong></legend>
                                        <c:if test='${not empty order_edit.registrys}'>
                                            <table style="border:none" width="100%">
                                            <tr>
                                                <th width="54%">&nbsp;</th>
                                       	  	  	<th width="13%">Cons </th>
                                              	<th width="10%">Sales </th>
                                              	<th width="12%">Reversed </th>
                                           	  	<th width="11%">Available </th>
                                            </tr>
                                            <c:forEach items='${order_edit.registrys}' var='registry'>
                                            <tr>
                                                <td align="left"><c:out value='${registry.productPrice.product.code} - ${registry.productPrice.product.name}'/> - <fmt:formatNumber value='${registry.productPrice.money.amount}' pattern=',##0.00'/></td>
                                                <td align="right"><input size="6" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.quantity}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="6" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.used}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="6" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.reversed}' pattern=',##0.00'/>"/></td>
                                                <td align="right"><input size="6" class="input-disabled" disabled style="text-align:right" value="<fmt:formatNumber value='${registry.quantity - registry.used - registry.reversed}' pattern=',##0.00'/>"/></td>
                                            </tr>
                                            </c:forEach>
                                            </table>
                                        </c:if>
                                    </fieldset>
                                </td>
                            </tr>
                            </table>
							</form:form>
                            <br/>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                                <div id="plan" dojoType="ContentPane" label="Consignment Order Plan" class="tab-pages" refreshOnShow="true">
                                	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/consignmentorderplanpreadd.htm?id=${order_edit.id}'/>"><span>New Consignment Order Plan</span></a>
                                            </div>
                                        </td>
                                        <td width="70%" align="right" height="20">&nbsp;</td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <tr>
                                        <th width="5%"><div style="width:40px"></div></th>
                                        <th width="21%">ID</th>
                                        <th width="15%">Date</th>
                                        <th width="59%">Note</th>
                                    </tr>
                                    <c:forEach items='${order_edit.items}' var='item'>
                                    <tr>
                                        <td class="tools">
                                            <c:if test='${access.edit}'>
                                                <a class="item-button-edit" href="<c:url value='/page/consignmentorderplanpreedit.htm?id=${item.id}'/>" title="Edit"><span>Edit</span></a>
                                            </c:if>
                                        </td>
                                        <td><c:out value='${item.code}'/></td>
                                        <td><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${item.note}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                                <div id="reverse" dojoType="ContentPane" label="Consignment Order Reverse" class="tab-pages" refreshOnShow="true">
                                	<table border="0" cellpadding="0" cellspacing="0" width="99%" align="center">
                                    <tr>
                                        <td width="30%" height="30" align="left" valign="middle">															
                                            <div class="toolbar-clean">
                                                <a class="item-button-new" href="<c:url value='/page/consignmentorderreversepreadd.htm?id=${order_edit.id}'/>"><span>New Consignment Order Reverse</span></a>
                                            </div>
                                        </td>
                                        <td width="70%" align="right" height="20">&nbsp;</td>
                                    </tr>
                                    </table>
                                    <table width="100%" cellpadding="0" cellspacing="0" class="table-list">
                                    <tr>
                                        <th width="5%"><div style="width:40px"></div></th>
                                        <th width="21%">ID</th>
                                        <th width="15%">Date</th>
                                        <th width="59%">Note</th>
                                    </tr>
                                    <c:forEach items='${order_edit.reverses}' var='item'>
                                    <tr>
                                        <td class="tools">
                                            <c:if test='${access.edit}'>
                                                <a class="item-button-edit" href="<c:url value='/page/consignmentorderreversepreedit.htm?id=${item.id}'/>" title="Edit"><span>Edit</span></a>
                                            </c:if>
                                        </td>
                                        <td><c:out value='${item.code}'/></td>
                                        <td><fmt:formatDate value='${item.date}' pattern='dd-MM-yyyy'/></td>
                                        <td><c:out value='${item.note}'/></td>
                                    </tr>
                                    </c:forEach>
                                    <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
                                    </table>
                                </div>
                            </div>
						</div>
						<div class="info">Created by : <c:out value='${order_edit.createdBy.firstName} ${order_edit.createdBy.middleName} ${order_edit.createdBy.lastName}'/> (<fmt:formatDate value='${order_edit.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : <c:out value='${order_edit.updatedBy.firstName} ${order_edit.updatedBy.middleName} ${order_edit.updatedBy.lastName}'/> (<fmt:formatDate value='${order_edit.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>	
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Consignment Order',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});		
		$('.item-button-save').click(function(e){
			$.ajax({
				url:"<c:url value='/page/consignmentorderedit.htm'/>",
				data:$('#addForm').serialize(),
				method : 'POST',
				dataType : 'json',
				beforeSend:function()
				{
					$dialog.empty();
					$dialog.html('Saving Consignment Order data......');
					$dialog.dialog('open');
				},
				success : function(json) {
					if(json)
					{
						if(json.status == 'OK')
						{
							$dialog.dialog('close');
							window.location="<c:url value='/page/consignmentorderview.htm'/>";
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
	
	function openfacility(ref,target)
	{
		var org = document.getElementById(ref);
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupfacilityview.htm?target='/>"+target+'&organization='+org.value);
	}
	
	function opengrid(ref,target)
	{
		var warehouse = document.getElementById(ref);
		if(warehouse.value == null || warehouse.value == '')
		{
			alert('Please select Warehouse first!');
			return;
		}
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+warehouse.value);
	}
	
	function opencontainer(ref,target)
	{
		var grid = document.getElementById(ref);
		if(grid.value == null || grid.value == '')
		{
			alert('Please select grid first!');
			return;
		}
		
		openpopup("<c:url value='/page/popupcontainerview.htm?target='/>"+target+'&grid='+grid.value);
	}
</script>
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
	<style type="text/css" media="screen"><!-- @import url("assets/sirius.css"); --></style>
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
							<a class="item-button-list" href="<c:url value='/page/unitsalesordersubdealerview.htm'/>"><span>List</span></a>
							<c:if test='${access.add}'>
								<a class="item-button-save" style="cursor:pointer;"><span><spring:message code="save"/></span></a>
							</c:if>
					  	</div>

						<div class="main-box">
							<form:form id="addForm" name="addForm" method="post" modelAttribute="salesOrder_add">
							<table width="100%" style="border:none">
                            <tr>
                            	<td width="61%" valign="top">
                                	<table width="100%" style="border:none">
                                    <tr>
                                      <td width="26%" nowrap="nowrap" align="right">ID :</td>
                                      <td width="74%"><input value="Auto Generated" class='input-disabled' size='25'/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Company :</td>
                                        <td>
                                            <select id="org" name="organization" class="combobox-ext">
                                                <c:if test='${not empty salesOrder_add.organization}'>
                                                    <option value='${salesOrder_add.organization.id}'>${salesOrder_add.organization.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Sub Dealer :</td>
                                        <td>
                                            <select id="subDealer" name="subDealer" class="combobox-ext">
                                                <c:if test='${not empty salesOrder_add.subDealer}'>
                                                    <option value='${salesOrder_add.subDealer.id}'>${salesOrder_add.subDealer.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Date :</td>
                                        <td><input class="input-disabled" disabled size="10" value="<fmt:formatDate value='${salesOrder_add.date}' pattern='dd-MM-yyyy'/>"/></td>
                                    </tr>
                                    <tr>
                                      <td nowrap="nowrap" align="right">Transfer Source :</td>
                                        <td>
                                            <select id="source" name="source" class="combobox-ext">
                                                <c:if test='${not empty salesOrder_add.source}'>
                                                    <option value='${salesOrder_add.source.id}'>${salesOrder_add.source.name}</option>
                                                </c:if>
                                            </select>
                                      </td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Transfer Destination :</td>
                                        <td>
                                            <select id="destination" name="destination" class="combobox-ext">
                                                <c:if test='${not empty salesOrder_add.destination}'>
                                                    <option value='${salesOrder_add.destination.id}'>${salesOrder_add.destination.name}</option>
                                                </c:if>
                                            </select>
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Grid :</td>
                                        <td>
                                            <select id="grid" name="grid" class="combobox">
                                            </select>
                                            <img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick="opengrid('grid');" style="CURSOR:pointer;" title="Grid" />
                                      	</td>
                                    </tr>
                                    <tr>
                                      	<td nowrap="nowrap" align="right">Note :</td>
                                        <td><form:textarea path="note" cols="55" rows="7"/></td>
                                    </tr>
                                	</table>
                              	</td>
                            </tr>
                            </table>
                            <div class="clears">&nbsp;</div>
                            <div id="mainTab" dojoType="TabContainer" style="width:100% ; height: 300px;">
                            <div id="unit" dojoType="ContentPane" label="Produk" class="tab-pages" refreshOnShow="true">
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="width:100%" align="center">
	                            <thead>
	                            <tr>
	                                <th align="left">Product</th>
	                              	<th width="20%">Tipe</th>
	                              	<th width="20%">Nama Tipe</th>
	                              	<th width="20%">Warna</th>
	                              	<th width="10%">Quantity</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${salesOrder_add.items}' var='item' varStatus="status">
	                            <c:if test="${item.product.productCategory.id == 1}">
	                            <tr>
	                            	<td>${item.product.name}</td>
	                            	<td>${item.product.types}</td>
	                            	<td>${item.product.typeNames}</td>
	                            	<td>${item.product.colors}</td>
	                                <td><fmt:formatNumber value='${item.quantity}' pattern=',##0.00'/></td>
	                            </tr>
	                            <c:if test="${item.product.serial}">
	                            	<c:forEach items="${item.itemDetails}" var="detail" varStatus="detailstatus">
	                            	<tr>
	                                	<td></td>
	                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
	                                    <td colspan="3">
		                                    <input readonly="readonly" size="18" name="items[${status.index}].itemDetails[${detailstatus.index}].serial" value="${detail.serial}" id="serial[${status.index}-${detailstatus.index}]"/>
	                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/onhandquantitypopupserialview.htm?id=${item.product.id}&organization=${org.id}&facility=${salesOrder_add.source.id}&target=serial[${status.index}-${detailstatus.index}]&pdi=true'/>");' style="CURSOR:pointer;" title="Popup Serial" />
	                                    	<input readonly="readonly" size="18" name="items[${status.index}].itemDetails[${detailstatus.index}].serialExt1" value="${detail.serialExt1}" id="serial[${status.index}-${detailstatus.index}]2"/>
	                                    	<input readonly="readonly" size="6" name="items[${status.index}].itemDetails[${detailstatus.index}].year" value="${detail.year}" id="serial[${status.index}-${detailstatus.index}]3"/>
	                                    </td>
	                                </tr>
	                            	</c:forEach>
	                            </c:if>
	                            </c:if>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="5">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            <div id="acc" dojoType="ContentPane" label="Aksesoris" class="tab-pages" refreshOnShow="true">
	                            <table class="table-list" id="lineItemTable" cellspacing="0" cellpadding="0" style="width:100%" align="center">
	                            <thead>
	                            <tr>
	                                <th width="25%">Product</th>
	                              	<th width="15%">Merk</th>
	                              	<th width="15%">Warna</th>
	                              	<th width="10%">Quantity</th>
	                            </tr>
	                            </thead>
	                            <tbody>
	                            <c:forEach items='${salesOrder_add.items}' var='item' varStatus="status">
	                            <c:if test="${item.product.productCategory.id == 3}">
	                            <tr>
	                            	<td>${item.product.name}</td>
	                            	<td>${item.product.brand}</td>
	                            	<td>${item.product.primaryColors}</td>
	                                <td><fmt:formatNumber value='${item.quantity}' pattern='#,###'/></td>
	                            </tr>
	                            <c:if test="${item.product.serial}">
	                            	<c:forEach items="${item.itemDetails}" var="detail" varStatus="detailstatus">
	                            	<tr>
	                                	<td></td>
	                                	<td></td>
	                                    <td><input class="input-disabled" disabled size='4' value="<fmt:formatNumber value='${detail.quantity}' pattern=',##0.00'/>" readonly="readonly"/></td>
	                                    <td colspan="3">
		                                    <input readonly="readonly" size="18" name="items[${status.index}].itemDetails[${detailstatus.index}].serial" value="${detail.serial}" id="serial[${status.index}-${detailstatus.index}]"/>
	                                    	<img src="<c:url value='/assets/icons/list_extensions.gif'/>" onclick='javascript:openpopup("<c:url value='/page/onhandquantitypopupserialview.htm?id=${item.product.id}&organization=${org.id}&facility=${salesOrder_add.source.id}&target=serial[${status.index}-${detailstatus.index}]&pdi=true'/>");' style="CURSOR:pointer;" title="Popup Serial" />
	                                   		<input readonly="readonly" hidden="true" size="18" name="items[${status.index}].itemDetails[${detailstatus.index}].serialExt1" value="${detail.serialExt1}" id="serial[${status.index}-${detailstatus.index}]2"/>
	                                    	<input readonly="readonly" hidden="true" size="6" name="items[${status.index}].itemDetails[${detailstatus.index}].year" value="${detail.year}" id="serial[${status.index}-${detailstatus.index}]3"/>
	                                    </td>
	                                </tr>
	                            	</c:forEach>
	                            </c:if>
	                            </c:if>
	                            </c:forEach>
	                            </tbody>
	                            <tfoot>
	                            <tr class="end-table"><td colspan="4">&nbsp;</td></tr>
	                            </tfoot>
	                            </table>
                            </div>
                            </div>
							</form:form>
						</div>
						<div class="info">Created by : ${salesOrder_add.createdBy.firstName} ${salesOrder_add.createdBy.middleName} ${salesOrder_add.createdBy.lastName} (<fmt:formatDate value='${salesOrder_add.createdDate}' pattern='dd-MM-yyyy HH:mm:ss'/>) | Last update by : ${salesOrder_add.updatedBy.firstName} ${salesOrder_add.updatedBy.middleName} ${salesOrder_add.updatedBy.lastName} (<fmt:formatDate value='${salesOrder_add.updatedDate}' pattern='dd-MM-yyyy HH:mm:ss'/>)</div>
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
		var $dialog = $('<div></div>').dialog({autoOpen: false,title: 'Unit Sales Order Sub Dealer',modal:true,buttons: {Close: function() {$(this).dialog('close');}}});
		$('.item-button-save').click(function(){
			if(validation())
			{
				$.ajax({
					url:"<c:url value='/page/unitsalesordersubdealeradd.htm'/>",
					data:$('#addForm').serialize(),
					type : 'POST',
					dataType : 'json',
					beforeSend:function()
					{
						$dialog.empty();
						$dialog.html('Saving Sales Order data......');
						$dialog.dialog('open');
					},
					success : function(json) {
						if(json)
						{
							if(json.status == 'OK')
							{
								$dialog.dialog('close');
								window.location="<c:url value='/page/unitsalesordersubdealerview.htm'/>";
							}
							else
							{
								$dialog.empty();
								$dialog.html('Proccess fail,reason:<br/>'+json.message);
							}
						}
					}
				});
			}
		});
	});
	
	function validation()
	{
		var grid = document.getElementById('grid');
		if(grid.value == '')
		{
			alert('Please select Grid first !!!');
			return;
		}
		
		return true;
	}
	
	function opengrid(target)
	{
		var fac = document.getElementById('source');
		openpopup("<c:url value='/page/popupgridview.htm?target='/>"+target+"&facility="+fac.value);
	}

	function error()
	{
		<c:if test='${not empty message}'>
			alert('${message}');
		</c:if>
	}
</script>